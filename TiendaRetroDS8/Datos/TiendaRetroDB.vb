Imports MySql.Data.MySqlClient
Public Class TiendaRetroDB
    Private connectionString As String = ConfigurationManager.ConnectionStrings("TiendaRetroConnectionString").ConnectionString

    Public Function VerificarUsuario(email As String, password As String) As Dictionary(Of String, Object)
        Using conn As New MySqlConnection(connectionString)
            conn.Open()
            ' Consulta para obtener Id, email e IsAdmin si el usuario y contraseña coinciden
            Dim cmd As New MySqlCommand("VerificarUsuario", conn)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("_email", email)
            cmd.Parameters.AddWithValue("_contrasena", password)

            ' Ejecutar la consulta y leer los datos
            Using reader As MySqlDataReader = cmd.ExecuteReader()
                If reader.Read() Then
                    Dim userData As New Dictionary(Of String, Object)()
                    userData("id_usuario") = reader("id_usuario") ' Guardar el id del usuario
                    userData("email") = reader("email").ToString() ' Guardar el email
                    userData("rol") = reader("rol") ' Guardar el estado del rol
                    Return userData
                End If
            End Using
        End Using
        Return Nothing ' Retornar Nothing si el login falla
    End Function

    Public Sub RegistrarUsuario(username As String, email As String, password As String)
        Using conn As New MySqlConnection(connectionString)
            conn.Open()
            ' Consulta para obtener Id, email e IsAdmin si el usuario y contraseña coinciden
            Dim cmd As New MySqlCommand("RegistrarUsuario", conn)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("_nombre", username)
            cmd.Parameters.AddWithValue("_email", email)
            cmd.Parameters.AddWithValue("_contrasena", password)

            cmd.ExecuteNonQuery()
        End Using
    End Sub

    Public Function ObtenerConsolas() As DataSet
        Dim dt As New DataSet()
        Try
            Using connection As New MySqlConnection(connectionString)
                ' Crear el comando para ejecutar el procedimiento almacenado
                Dim command As New MySqlCommand("VerConsolas", connection)
                command.CommandType = CommandType.StoredProcedure

                ' Usar MySqlDataAdapter para llenar el DataTable con los resultados
                Dim adapter As New MySqlDataAdapter(command)

                connection.Open()
                adapter.Fill(dt)
            End Using
        Catch ex As Exception
            Throw New Exception("Error al obtener las consolas: " & ex.Message)
        End Try
        Return dt
    End Function
End Class
