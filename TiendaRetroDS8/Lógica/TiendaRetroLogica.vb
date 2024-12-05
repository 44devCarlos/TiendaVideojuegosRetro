Public Class TiendaRetroLogica
    Private tiendaRetroQuery As New TiendaRetroDB()

    Public Function ValidarUsuario(email As String, password As String) As Dictionary(Of String, Object)
        Return tiendaRetroQuery.VerificarUsuario(email, password)
    End Function

    Public Sub RegistrarUsuario(username As String, email As String, password As String)
        tiendaRetroQuery.RegistrarUsuario(username, email, password)
    End Sub

    Public Function ObtenerConsolas() As DataTable
        Return tiendaRetroQuery.ObtenerConsolas()
    End Function
    Public Function ObtenerVideojuegos() As DataTable
        Return tiendaRetroQuery.ObtenerVideojuegos()
    End Function

End Class
