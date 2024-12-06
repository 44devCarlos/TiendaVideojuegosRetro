Imports System
Imports System.Collections.Generic

Public Class AgregarCarrito
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' Obtén o crea la lista de productos en el carrito
            Dim carrito As List(Of Object) = If(TryCast(Session("carrito"), List(Of Object)), New List(Of Object)())

            ' Recoge los datos del producto desde los campos de formulario
            Dim producto = New With {
                .Id = Request.Form("Id"),
                .Nombre = Request.Form("Nombre"),
                .Precio = Convert.ToDecimal(Request.Form("Precio")),
                .Imagen = Request.Form("Imagen")
            }

            ' Añade el producto al carrito
            carrito.Add(producto)
            Session("carrito") = carrito

            ' Redirige al carrito
            Response.Redirect("Carrito.aspx")
        End If
    End Sub

End Class