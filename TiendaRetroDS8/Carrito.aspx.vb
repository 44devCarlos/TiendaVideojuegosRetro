Imports System.Net.Mail
Imports MySql.Data.MySqlClient
Public Class Carrito
    Inherits System.Web.UI.Page
    Private connectionString As String = ConfigurationManager.ConnectionStrings("TiendaRetroConnectionString").ConnectionString
    Private Shared _productos As New List(Of Producto)()

    ' Método para agregar un producto al carrito
    Public Shared Sub AgregarProducto(producto As Producto)

        ' Verificar si el producto ya está en el carrito
        If Not _productos.Any(Function(p) p.Id = producto.Id) Then
            _productos.Add(producto)
        End If

        ' Actualizar la sesión del carrito
        HttpContext.Current.Session("Carrito") = _productos
    End Sub

    Public Shared Function ObtenerProductos() As List(Of Producto)
        Dim carritoSesion = TryCast(HttpContext.Current.Session("Carrito"), List(Of Producto))
        If carritoSesion IsNot Nothing Then
            _productos = carritoSesion
        End If
        Return _productos
    End Function

    Public Shared Sub VaciarCarrito()
        _productos.Clear()
    End Sub

    Public Shared Function ObtenerTotal() As Decimal
        Return _productos.Sum(Function(p) p.Precio)
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Session("idUsuario") Is Nothing Then
            Response.Redirect("Login.aspx")
            Return
        End If

        If Not IsPostBack Then
            RepeaterCarrito.DataSource = ObtenerProductos()
            RepeaterCarrito.DataBind()
            totalCarrito.InnerText = ObtenerTotal().ToString("F2")
        End If
    End Sub

    Protected Sub btnVolver_Click(sender As Object, e As EventArgs)
        Response.Redirect("Catalogo.aspx")
    End Sub

    Protected Sub btnFinalizar_Click(sender As Object, e As EventArgs)
        Dim carrito As List(Of Producto) = ObtenerProductos()
        If carrito.Count = 0 Then
            lblCarritoVacio.Text = "El carrito está vacío."
            lblCarritoVacio.Visible = True
            Return
        End If

        Using conexion As New MySqlConnection(connectionString)
            conexion.Open()
            Using transaccion As MySqlTransaction = conexion.BeginTransaction()
                Try
                    ' Llamar al procedimiento almacenado para cada producto en el carrito
                    For Each producto As Producto In carrito
                        AgregarProductoAlCarrito(producto, conexion, transaccion)
                    Next

                    transaccion.Commit()
                    EnviarCorreo()
                    VaciarCarrito()
                    Response.Redirect("Carrito.aspx")
                Catch ex As Exception
                    If transaccion.Connection IsNot Nothing Then
                        Try
                            transaccion.Rollback()
                        Catch rollbackEx As Exception
                        End Try
                    End If
                    lblCarritoVacio.Text = "Error al finalizar la compra: " & ex.Message
                    lblCarritoVacio.Visible = True
                End Try
            End Using
        End Using
    End Sub

    Private Sub AgregarProductoAlCarrito(producto As Producto, conexion As MySqlConnection, transaccion As MySqlTransaction)
        Dim query As String = "CALL AgregarProducto(@id, @cantidad, @precio, @nombre)"
        Using cmd As New MySqlCommand(query, conexion, transaccion)
            cmd.Parameters.AddWithValue("@id", producto.Id)
            cmd.Parameters.AddWithValue("@cantidad", 1) ' Asumimos una cantidad por cada producto
            cmd.Parameters.AddWithValue("@precio", producto.Precio)
            cmd.Parameters.AddWithValue("@nombre", producto.Nombre)
            cmd.ExecuteNonQuery()
        End Using
    End Sub



    Private Sub EnviarCorreo()
        Dim emailUsuario As String = Session("email")?.ToString()
        If String.IsNullOrEmpty(emailUsuario) Then
            lblCarritoVacio.Text = "No se pudo enviar el correo, el correo no está disponible."
            lblCarritoVacio.Visible = True
            Return
        End If

        Dim mensaje As String = "<html><body style='font-family: Arial, sans-serif; color: #333;'>"
        mensaje &= "<h2 style='color: #42A4BA; text-align: center;'>Estimado cliente,</h2>"
        mensaje &= "<p style='text-align: center;'>Gracias por confiar en Donde Macre. A continuación, se detalla la información de tu compra:</p>"
        mensaje &= "<table style='width: 100%; border-collapse: collapse; border: 1px solid #ddd;'>"
        mensaje &= "<thead><tr style='background-color: #f2f2f2;'><th style='padding: 10px; border: 1px solid #ddd;'>Producto</th><th style='padding: 10px; border: 1px solid #ddd;'>Precio</th><th style='padding: 10px; border: 1px solid #ddd;'>Imagen</th></tr></thead>"
        mensaje &= "<tbody>"

        ' Recuperar los productos de la lista estática
        Dim carrito As List(Of Producto) = ObtenerProductos()
        If carrito IsNot Nothing AndAlso carrito.Count > 0 Then
            For Each producto In carrito
                mensaje &= $"<tr><td style='padding: 10px; border: 1px solid #ddd;'>{producto.Nombre}</td>"
                mensaje &= $"<td style='padding: 10px; border: 1px solid #ddd;'>${producto.Precio}</td>"
                mensaje &= $"<td style='padding: 10px; border: 1px solid #ddd;'><img src='{producto.Imagen}' alt='{producto.Nombre}' style='width: 100px; height: auto;'/></td></tr>"
            Next
        Else
            mensaje &= "<tr><td colspan='3' style='padding: 10px; text-align: center;'>No hay productos en el carrito.</td></tr>"
        End If

        mensaje &= "</tbody></table>"
        mensaje &= $"<p style='font-weight: bold; color: #42A4BA; font-size: 18px; text-align: center;'>Total: ${ObtenerTotal().ToString("F2")}</p>"
        mensaje &= "<p style='text-align: center;'>Gracias nuevamente por tu compra.</p>"
        mensaje &= "</body></html>"

        Dim correo As New MailMessage()
        correo.From = New MailAddress("salmonclub2116@gmail.com")
        correo.To.Add(emailUsuario)
        correo.Subject = "Confirmación de Compra - SALMON CLUB"
        correo.Body = mensaje
        correo.IsBodyHtml = True

        Dim smtp As New SmtpClient("smtp.gmail.com", 587)
        smtp.Credentials = New System.Net.NetworkCredential("salmonclub2116@gmail.com", "sjxm jqlu iffb efzq") ' Usa un método seguro para manejar la contraseña
        smtp.EnableSsl = True

        Try
            smtp.Send(correo)
            lblCarritoVacio.Text = "Compra finalizada. Revisa tu correo para ver el detalle."
            lblCarritoVacio.Visible = True
            btnFinalizar.Visible = False
            VaciarCarrito() ' Vaciar el carrito
        Catch ex As SmtpException
            lblCarritoVacio.Text = "Error de SMTP al enviar el correo: " & ex.Message
            lblCarritoVacio.Visible = True
        Catch ex As Exception
            lblCarritoVacio.Text = "Hubo un error al enviar el correo: " & ex.Message
            lblCarritoVacio.Visible = True
        End Try
    End Sub

End Class