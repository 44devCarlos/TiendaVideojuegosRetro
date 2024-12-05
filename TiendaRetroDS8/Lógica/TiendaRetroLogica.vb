Public Class TiendaRetroLogica
    Private tiendaRetroQuery As New TiendaRetroDB()

    Public Function ValidarUsuario(username As String, password As String) As Dictionary(Of String, Object)
        Return tiendaRetroQuery.ValidateUser(username, password)
    End Function

End Class
