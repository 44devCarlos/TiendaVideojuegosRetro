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
                    userData("idUsuario") = reader("idUsuario") ' Guardar el id del usuario
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

    Public Function ObtenerProductos() As DataTable
        Dim dt As New DataTable()
        Try
            Using connection As New MySqlConnection(connectionString)
                ' Crear el comando para ejecutar el procedimiento almacenado
                Dim command As New MySqlCommand("ObtenerProductos", connection)
                command.CommandType = CommandType.StoredProcedure

                ' Usar MySqlDataAdapter para llenar el DataTable con los resultados
                Dim adapter As New MySqlDataAdapter(command)

                connection.Open()
                adapter.Fill(dt)
            End Using
        Catch ex As Exception
            Throw New Exception("Error al obtener los productos: " & ex.Message)
        End Try
        Return dt
    End Function

    Public Sub AgregarConsola(nombre As String, marca As String, precio As String, stock As Integer, anioLanzamiento As Integer, informacion As String, imagen As String)
        Using conn As New MySqlConnection(connectionString)
            conn.Open()
            ' Consulta para obtener Id, email e IsAdmin si el usuario y contraseña coinciden
            Dim cmd As New MySqlCommand("AgregarConsola", conn)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("_nombre", nombre)
            cmd.Parameters.AddWithValue("_marca", marca)
            cmd.Parameters.AddWithValue("_precio", precio)
            cmd.Parameters.AddWithValue("_stock", stock)
            cmd.Parameters.AddWithValue("_anioLanzamiento", anioLanzamiento)
            cmd.Parameters.AddWithValue("_informacion", informacion)
            cmd.Parameters.AddWithValue("_imagen", imagen)

            cmd.ExecuteNonQuery()
        End Using
    End Sub

    Public Sub AgregarVideojuego(nombre As String, genero As String, precio As String, informacion As String, stock As Integer, idConsola As Integer, imagen As String)
        Using conn As New MySqlConnection(connectionString)
            conn.Open()
            ' Consulta para obtener Id, email e IsAdmin si el usuario y contraseña coinciden
            Dim cmd As New MySqlCommand("AgregarVideojuego", conn)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("_nombre", nombre)
            cmd.Parameters.AddWithValue("_genero", genero)
            cmd.Parameters.AddWithValue("_precio", precio)
            cmd.Parameters.AddWithValue("_informacion", informacion)
            cmd.Parameters.AddWithValue("_stock", stock)
            cmd.Parameters.AddWithValue("_idConsola", idConsola)
            cmd.Parameters.AddWithValue("_imagen", imagen)

            cmd.ExecuteNonQuery()
        End Using
    End Sub

    Public Sub ActualizarConsola(stock As Integer, idConsola As Integer)
        Using conn As New MySqlConnection(connectionString)
            conn.Open()
            ' Consulta para obtener Id, email e IsAdmin si el usuario y contraseña coinciden
            Dim cmd As New MySqlCommand("ActualizarConsola", conn)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("_stock", stock)
            cmd.Parameters.AddWithValue("_idConsola", idConsola)

            cmd.ExecuteNonQuery()
        End Using
    End Sub

    Public Sub ActualizarVideojuego(stock As Integer, idVideojuego As Integer)
        Using conn As New MySqlConnection(connectionString)
            conn.Open()
            ' Consulta para obtener Id, email e IsAdmin si el usuario y contraseña coinciden
            Dim cmd As New MySqlCommand("ActualizarVideojuego", conn)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("_stock", stock)
            cmd.Parameters.AddWithValue("_idVideojuego", idVideojuego)

            cmd.ExecuteNonQuery()
        End Using
    End Sub

    Public Function ObtenerConsolas() As DataTable
        Dim dt As New DataTable()
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
    Public Function ObtenerVideojuegos() As DataTable
        Dim dt As New DataTable()
        Try
            Using connection As New MySqlConnection(connectionString)
                ' Crear el comando para ejecutar el procedimiento almacenado
                Dim command As New MySqlCommand("VerVideojuegos", connection)
                command.CommandType = CommandType.StoredProcedure

                ' Usar MySqlDataAdapter para llenar el DataTable con los resultados
                Dim adapter As New MySqlDataAdapter(command)

                connection.Open()
                adapter.Fill(dt)
            End Using
        Catch ex As Exception
            Throw New Exception("Error al obtener los videojuegos: " & ex.Message)
        End Try
        Return dt
    End Function

    Public Function ObtenerVideojuegosPorConsola(idConsola As Integer) As DataTable
        Dim dt As New DataTable()
        Try
            Using connection As New MySqlConnection(connectionString)
                ' Crear el comando para ejecutar el procedimiento almacenado
                Dim command As New MySqlCommand("BuscarJuegoPorConsola", connection)
                command.CommandType = CommandType.StoredProcedure
                command.Parameters.AddWithValue("_idConsola", idConsola)
                ' Usar MySqlDataAdapter para llenar el DataTable con los resultados
                Dim adapter As New MySqlDataAdapter(command)

                connection.Open()
                adapter.Fill(dt)
            End Using
        Catch ex As Exception
            Throw New Exception("Error al obtener los videojuegos por consola: " & ex.Message)
        End Try
        Return dt
    End Function

    Public Function ObtenerConsolasConMayorGanancia() As DataTable
        Dim dt As New DataTable()
        Try
            Using connection As New MySqlConnection(connectionString)
                ' Crear el comando para ejecutar el procedimiento almacenado
                Dim command As New MySqlCommand("ObtenerConsolasConMayorGanancia", connection)
                command.CommandType = CommandType.StoredProcedure
                ' Usar MySqlDataAdapter para llenar el DataTable con los resultados
                Dim adapter As New MySqlDataAdapter(command)

                connection.Open()
                adapter.Fill(dt)
            End Using
        Catch ex As Exception
            Throw New Exception("Error al obtener las consolas con mayor ganancia: " & ex.Message)
        End Try
        Return dt
    End Function

    Public Function ObtenerConsolasMasVendidas() As DataTable
        Dim dt As New DataTable()
        Try
            Using connection As New MySqlConnection(connectionString)
                ' Crear el comando para ejecutar el procedimiento almacenado
                Dim command As New MySqlCommand("ObtenerConsolasMasVendidas", connection)
                command.CommandType = CommandType.StoredProcedure
                ' Usar MySqlDataAdapter para llenar el DataTable con los resultados
                Dim adapter As New MySqlDataAdapter(command)

                connection.Open()
                adapter.Fill(dt)
            End Using
        Catch ex As Exception
            Throw New Exception("Error al obtener las consolas más vendidas: " & ex.Message)
        End Try
        Return dt
    End Function

    Public Function ObtenerJuegosConMayorGanancia() As DataTable
        Dim dt As New DataTable()
        Try
            Using connection As New MySqlConnection(connectionString)
                ' Crear el comando para ejecutar el procedimiento almacenado
                Dim command As New MySqlCommand("ObtenerJuegosConMayorGanancia", connection)
                command.CommandType = CommandType.StoredProcedure
                ' Usar MySqlDataAdapter para llenar el DataTable con los resultados
                Dim adapter As New MySqlDataAdapter(command)

                connection.Open()
                adapter.Fill(dt)
            End Using
        Catch ex As Exception
            Throw New Exception("Error al obtener las consolas con mayor ganancia: " & ex.Message)
        End Try
        Return dt
    End Function

    Public Function ObtenerJuegosMasVendidos() As DataTable
        Dim dt As New DataTable()
        Try
            Using connection As New MySqlConnection(connectionString)
                ' Crear el comando para ejecutar el procedimiento almacenado
                Dim command As New MySqlCommand("ObtenerJuegosMasVendidos", connection)
                command.CommandType = CommandType.StoredProcedure
                ' Usar MySqlDataAdapter para llenar el DataTable con los resultados
                Dim adapter As New MySqlDataAdapter(command)

                connection.Open()
                adapter.Fill(dt)
            End Using
        Catch ex As Exception
            Throw New Exception("Error al obtener las consolas con mayor ganancia: " & ex.Message)
        End Try
        Return dt
    End Function
End Class
