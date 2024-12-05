Imports MySql.Data.MySqlClient

Public Class Catalogo
    Inherits System.Web.UI.Page
    Private tiendaRetroLogica As New TiendaRetroLogica()
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            CargarCatalogoProductos() ' Cargar productos 
        End If
    End Sub
    ' metodo para obtener todos los productos
    Private Sub CargarCatalogoProductos()
        Dim consolas As DataTable = tiendaRetroLogica.ObtenerConsolas()
        Dim videojuegos As DataTable = tiendaRetroLogica.ObtenerVideojuegos()
        Repeater1.DataSource = consolas
        Repeater1.DataBind()
        Repeater2.DataSource = videojuegos
        Repeater2.DataBind()
    End Sub
End Class