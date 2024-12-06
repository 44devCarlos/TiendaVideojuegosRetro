Imports MySql.Data.MySqlClient

Public Class Login
    Inherits System.Web.UI.Page
    Private tiendaRetroL As New TiendaRetroLogica()
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If IsPostBack Then
            Dim email As String = Request.Form("txtEmail")
            Dim password As String = Request.Form("txtPassword")

            ' Validar usuario y obtener email, Id e IsAdmin
            Dim userData As Dictionary(Of String, Object) = Nothing

            Try
                userData = tiendaRetroL.ValidarUsuario(email, password)
                If userData IsNot Nothing Then
                    ' Guardar el Id de usuario, email e IsAdmin
                    Session("idUsuario") = userData("idUsuario") ' Guardar el Id en la sesión
                    Session("email") = userData("email") ' Guardar el email en la sesión
                    Session("rol") = userData("rol") ' Guardar el estado de IsAdmin en la sesión

                    ' Redirigir basado en si es Admin
                    If userData("rol") = "Admin" Then
                        Response.Redirect("Admin.aspx") ' Redirige a Admin si es administrador
                    Else
                        Response.Redirect("Catalogo.aspx") ' Redirige a Catalogo si no es administrador
                    End If
                Else
                    lblError.Text = "Usuario o contraseña incorrectos."
                End If
            Catch ex As MySqlException
                ' Manejamos errores específicos de SQL
                lblError.Text = "Error al conectar a la base de datos. Intenta de nuevo más tarde. " & ex.Message
            Catch ex As Exception
                ' Manejamos otros errores generales
                lblError.Text = "Ha ocurrido un error inesperado. " & ex.Message
            End Try
        End If
    End Sub

End Class