Imports MySql.Data.MySqlClient

Public Class Registro
    Inherits System.Web.UI.Page
    Private tiendaRetroL As New TiendaRetroLogica()
    Protected Sub btnRegister_Click(ByVal sender As Object, ByVal e As EventArgs)
        Try
            tiendaRetroL.RegistrarUsuario(txtUsername.Text, txtEmail.Text, txtPassword.Text)
            Response.Redirect("Login.aspx")
        Catch ex As MySqlException
            ' Manejamos errores específicos de SQL
            ' Por ejemplo, errores de conexión, restricciones de unicidad, etc.
            lblError.Text = "Error al registrar el usuario. Por favor, intenta de nuevo más tarde. (Usuario o Correo en uso)"
        Catch ex As Exception
            ' Manejamos cualquier otro error general
            lblError.Text = "Ha ocurrido un error " & txtUsername.Text & " " & txtEmail.Text & " " & txtPassword.Text
        End Try
    End Sub

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs)
        Response.Redirect("Login.aspx")
    End Sub

    Protected Sub btnCatalogo_Click(sender As Object, e As EventArgs)
        Response.Redirect("Catalogo.aspx")
    End Sub
End Class