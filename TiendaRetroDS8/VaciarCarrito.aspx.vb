Public Class VaciarCarrito
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        Carrito.VaciarCarrito()
        Response.Redirect("Carrito.aspx") ' Redirige al carrito
    End Sub
End Class