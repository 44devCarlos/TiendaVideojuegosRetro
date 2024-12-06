Imports System.Data.SqlClient
Imports System.Configuration
Public Class Admin
    Inherits System.Web.UI.Page
    Private tiendaRetroLogica As New TiendaRetroLogica()

    ' Este método se ejecuta cuando la página se carga por primera vez
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' Cargar los productos solo si la página no se ha vuelto a cargar (evita recargar en cada postback)
            CargarConsolas()
            CargarVideojuegos()
            CargarSelectConsolas()
            CargarConsolasConMayorGanancia()
            CargarConsolasMasVendidas()
            CargarJuegosConMayorGanancia()
            CargarJuegosMasVendidos()
        End If
    End Sub

    ' Método para cargar todas las consolas en el GridView
    Private Sub CargarConsolas()
        ' Asignar los datos al GridView
        gvConsolas.DataSource = tiendaRetroLogica.ObtenerConsolas()
        gvConsolas.DataBind()
    End Sub

    ' Método para cargar todos los videojuegos en el GridView
    Private Sub CargarVideojuegos()
        ' Asignar los datos al GridView
        gvVideojuegos.DataSource = tiendaRetroLogica.ObtenerVideojuegos()
        gvVideojuegos.DataBind()
    End Sub

    ' Método para cargar todos los videojuegos en el GridView
    Private Sub CargarSelectConsolas()
        'cargar el dropdown-list con las consolas
        Dim dt As DataTable = tiendaRetroLogica.ObtenerConsolas()
        ddlConsolas.DataSource = dt
        ddlConsolas.DataTextField = "nombre"
        ddlConsolas.DataValueField = "idConsola"
        ddlConsolas.DataBind()

        ' Agregar una opción predeterminada
        ddlConsolas.Items.Insert(0, New ListItem("Seleccionar consola", "0"))
    End Sub

    ' Método para agregar una nueva consola
    Protected Sub AgregarConsola(sender As Object, e As EventArgs)
        ' Obtener los valores de los campos de texto
        Dim nombre As String = txtNombreConsola.Text
        Dim marca As String = txtMarcaConsola.Text
        Dim precioTexto As String = txtPrecioConsola.Text.Replace(",", ".")
        Dim stock As Integer
        Integer.TryParse(txtStockConsola.Text, stock)
        Dim anioLanzamiento As Integer
        Integer.TryParse(txtAnioLanzamientoConsola.Text, anioLanzamiento)
        Dim informacion As String = txtInformacionConsola.Text
        Dim imagen As String = txtImagenConsola.Text

        ' Validar que el precio esté en el formato correcto (número con decimales)
        Dim precio As Decimal = 0
        If Not String.IsNullOrEmpty(precioTexto) Then
            ' Reemplazar la coma por punto para manejar el decimal en el backend
            precioTexto = precioTexto.Replace(",", ".")

            ' Intentar convertir el texto a un valor decimal
            If Not Decimal.TryParse(precioTexto, precio) Then
                ' Si la conversión falla, mostrar un mensaje de error
                litError.Visible = True
                Return
            End If
        Else
            litError.Visible = False
            Return
        End If

        tiendaRetroLogica.AgregarConsola(nombre, marca, precio, stock, anioLanzamiento, informacion, imagen)
        CargarConsolas()

        ' Limpiar los campos de entrada después de agregar el producto
        txtNombreConsola.Text = ""
        txtMarcaConsola.Text = ""
        txtPrecioConsola.Text = ""
        txtStockConsola.Text = ""
        txtAnioLanzamientoConsola.Text = ""
        txtInformacionConsola.Text = ""
        txtImagenConsola.Text = ""
    End Sub

    ' Método para agregar un videojuego
    Protected Sub AgregarVideojuego(sender As Object, e As EventArgs)
        ' Obtener los valores de los campos de texto
        Dim nombre As String = txtNombreVideojuego.Text
        Dim genero As String = txtGeneroVideojuego.Text
        Dim precio As Decimal
        Decimal.TryParse(txtPrecioVideojuego.Text, precio)
        Dim stock As Integer
        Integer.TryParse(txtStockVideojuego.Text, stock)
        Dim idConsola As Integer = ddlConsolas.SelectedValue
        Dim informacion As String = txtInformacionVideojuego.Text
        Dim imagen As String = txtImagenVideojuego.Text

        tiendaRetroLogica.AgregarVideojuego(nombre, genero, precio, informacion, stock, idConsola, imagen)
        CargarVideojuegos()

        ' Limpiar los campos de entrada después de agregar el producto
        txtNombreVideojuego.Text = ""
        txtInformacionVideojuego.Text = ""
        txtPrecioVideojuego.Text = ""
        txtStockVideojuego.Text = ""
        txtImagenVideojuego.Text = ""
    End Sub

    ' Método para editar un producto, se activa cuando el usuario hace clic en "Editar"
    Protected Sub EditarConsolas(sender As Object, e As GridViewEditEventArgs)
        ' Establecer el índice de edición para la fila seleccionada
        gvConsolas.EditIndex = e.NewEditIndex
        ' Recargar los productos con la fila en modo de edición
        CargarConsolas()
    End Sub

    Protected Sub EditarVideojuegos(sender As Object, e As GridViewEditEventArgs)
        ' Establecer el índice de edición para la fila seleccionada
        gvVideojuegos.EditIndex = e.NewEditIndex
        ' Recargar los productos con la fila en modo de edición
        CargarVideojuegos()
    End Sub

    ' Método para actualizar un producto después de la edición
    Protected Sub ActualizarConsolas(sender As Object, e As GridViewUpdateEventArgs)
        ' Obtener la fila seleccionada para actualizar
        Dim row As GridViewRow = gvConsolas.Rows(e.RowIndex)
        ' Obtener el Id del producto desde la clave primaria en el GridView
        Dim id As Integer = Convert.ToInt32(gvConsolas.DataKeys(e.RowIndex).Value)
        ' Obtener los nuevos valores de los campos de texto
        Dim stock As Integer = Integer.Parse(CType(row.FindControl("txtStock"), TextBox).Text)

        tiendaRetroLogica.ActualizarConsola(stock, id)
        ' Restablecer el índice de edición
        gvConsolas.EditIndex = -1
        ' Recargar los productos con los cambios
        CargarConsolas()
    End Sub

    Protected Sub ActualizarVideojuegos(sender As Object, e As GridViewUpdateEventArgs)
        ' Obtener la fila seleccionada para actualizar
        Dim row As GridViewRow = gvVideojuegos.Rows(e.RowIndex)
        ' Obtener el Id del producto desde la clave primaria en el GridView
        Dim id As Integer = Convert.ToInt32(gvVideojuegos.DataKeys(e.RowIndex).Value)
        ' Obtener los nuevos valores de los campos de texto
        Dim stock As Integer = Integer.Parse(CType(row.FindControl("txtStock"), TextBox).Text)

        tiendaRetroLogica.ActualizarVideojuego(stock, id)
        ' Restablecer el índice de edición
        gvVideojuegos.EditIndex = -1
        ' Recargar los productos con los cambios
        CargarVideojuegos()
    End Sub

    ' Método para cancelar la edición de un producto y restablecer el GridView
    Protected Sub CancelarEditarConsolas(sender As Object, e As GridViewCancelEditEventArgs)
        ' Restablecer el índice de edición para cancelar la edición
        gvConsolas.EditIndex = -1
        ' Recargar los productos con el estado original
        CargarConsolas()
    End Sub

    Protected Sub CancelarEditarVideojuegos(sender As Object, e As GridViewCancelEditEventArgs)
        ' Restablecer el índice de edición para cancelar la edición
        gvVideojuegos.EditIndex = -1
        ' Recargar los productos con el estado original
        CargarVideojuegos()
    End Sub

    Protected Sub CargarConsolasConMayorGanancia()
        GridView1.DataSource = tiendaRetroLogica.ObtenerConsolasConMayorGanancia()
        GridView1.DataBind()
    End Sub

    Protected Sub CargarConsolasMasVendidas()
        GridView2.DataSource = tiendaRetroLogica.ObtenerConsolasMasVendidas()
        GridView2.DataBind()
    End Sub

    Protected Sub CargarJuegosConMayorGanancia()
        GridView3.DataSource = tiendaRetroLogica.ObtenerJuegosConMayorGanancia()
        GridView3.DataBind()
    End Sub

    Protected Sub CargarJuegosMasVendidos()
        GridView4.DataSource = tiendaRetroLogica.ObtenerJuegosMasVendidos()
        GridView4.DataBind()
    End Sub

End Class