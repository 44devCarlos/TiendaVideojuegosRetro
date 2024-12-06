Imports Org.BouncyCastle.Crypto

Public Class TiendaRetroLogica
    Private tiendaRetroQuery As New TiendaRetroDB()

    Public Function ValidarUsuario(email As String, password As String) As Dictionary(Of String, Object)
        Return tiendaRetroQuery.VerificarUsuario(email, password)
    End Function

    Public Sub RegistrarUsuario(username As String, email As String, password As String)
        tiendaRetroQuery.RegistrarUsuario(username, email, password)
    End Sub
    Public Sub AgregarConsola(nombre As String, marca As String, precio As Decimal, stock As Integer, anioLanzamiento As Integer, informacion As String, imagen As String)
        If String.IsNullOrWhiteSpace(nombre) OrElse String.IsNullOrWhiteSpace(marca) OrElse precio <= 0 OrElse stock < 0 OrElse anioLanzamiento < 1970 OrElse anioLanzamiento > Now.Year OrElse
       String.IsNullOrWhiteSpace(informacion) OrElse String.IsNullOrWhiteSpace(imagen) Then
            Throw New Exception("Los campos deben estar llenos")
        End If
        tiendaRetroQuery.AgregarConsola(nombre, marca, precio, stock, anioLanzamiento, informacion, imagen)
    End Sub
    Public Sub ActualizarConsola(stock As Integer, idConsola As Integer)
        If stock < 0 OrElse idConsola < 0 Then
            Throw New Exception("Los campos deben estar llenos")
        End If
        tiendaRetroQuery.ActualizarConsola(stock, idConsola)
    End Sub
    Public Sub ActualizarVideojuego(stock As Integer, idVideojuego As Integer)
        If stock < 0 OrElse idVideojuego < 0 Then
            Throw New Exception("Los campos deben estar llenos")
        End If
        tiendaRetroQuery.ActualizarVideojuego(stock, idVideojuego)
    End Sub
    Public Sub AgregarVideojuego(nombre As String, genero As String, precio As String, informacion As String, stock As Integer, idConsola As Integer, imagen As String)
        If String.IsNullOrWhiteSpace(nombre) OrElse String.IsNullOrWhiteSpace(genero) OrElse precio <= 0 OrElse stock < 0 OrElse idConsola < 0 OrElse
       String.IsNullOrWhiteSpace(informacion) OrElse String.IsNullOrWhiteSpace(imagen) Then
            Throw New Exception("Los campos deben estar llenos")
        End If
        tiendaRetroQuery.AgregarVideojuego(nombre, genero, precio, informacion, stock, idConsola, imagen)
    End Sub
    Public Function ObtenerProductos() As DataTable
        Return tiendaRetroQuery.ObtenerProductos()
    End Function

    Public Function ObtenerConsolas() As DataTable
        Return tiendaRetroQuery.ObtenerConsolas()
    End Function
    Public Function ObtenerVideojuegos() As DataTable
        Return tiendaRetroQuery.ObtenerVideojuegos()
    End Function

    Public Function ObtenerConsolasConMayorGanancia() As DataTable
        Return tiendaRetroQuery.ObtenerConsolasConMayorGanancia()
    End Function
    Public Function ObtenerJuegosConMayorGanancia() As DataTable
        Return tiendaRetroQuery.ObtenerJuegosConMayorGanancia()
    End Function

    Public Function ObtenerConsolasMasVendidas() As DataTable
        Return tiendaRetroQuery.ObtenerConsolasMasVendidas()
    End Function
    Public Function ObtenerJuegosMasVendidos() As DataTable
        Return tiendaRetroQuery.ObtenerJuegosMasVendidos()
    End Function

    Public Function MostrarVideojuegos(idConsola As Integer) As DataTable
        Dim videojuegos As DataTable
        If idConsola = 0 Then
            ' Obtener todos los videojuegos
            videojuegos = tiendaRetroQuery.ObtenerVideojuegos()
        Else
            ' Obtener videojuegos filtrados por consola
            videojuegos = tiendaRetroQuery.ObtenerVideojuegosPorConsola(idConsola)
        End If

        ' Devuelve videojuegos como datatable
        Return videojuegos
    End Function

End Class
