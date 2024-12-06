Imports MySql.Data.MySqlClient

Public Class Catalogo
    Inherits System.Web.UI.Page
    Private tiendaRetroLogica As New TiendaRetroLogica()
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            CargarCatalogoProductos() ' Cargar productos 
        End If
        If IsPostBack Then
            Dim evento As String = Request("__EVENTTARGET")
            If evento = Repeater1.UniqueID Then
                Dim args As String() = Request("__EVENTARGUMENT").Split("|")
                Dim id As Integer = Integer.Parse(args(0))
                Dim nombre As String = args(1)
                Dim precio As Decimal = Decimal.Parse(args(2))
                Dim imagen As String = args(3)

                Dim producto As New Producto With {
                .Id = id,
                .Nombre = nombre,
                .Precio = precio,
                .Imagen = imagen
            }

                Carrito.AgregarProducto(producto)
            End If
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

        'cargar el dropdown-list con las consolas
        ddlConsolas.DataSource = consolas
        ddlConsolas.DataTextField = "nombre"
        ddlConsolas.DataValueField = "idConsola"
        ddlConsolas.DataBind()

        ' Agregar una opciÃ³n predeterminada
        ddlConsolas.Items.Insert(0, New ListItem("Seleccionar consola", "0"))
    End Sub

    Protected Sub ddlConsolas_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
        Dim idConsola As Integer = Convert.ToInt32(ddlConsolas.SelectedValue)
        Repeater2.DataSource = tiendaRetroLogica.MostrarVideojuegos(idConsola)
        Repeater2.DataBind()
        UpdatePanelVideojuegos.Update()
    End Sub

End Class