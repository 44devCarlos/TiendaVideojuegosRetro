<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Carrito.aspx.vb" Inherits="TiendaRetroDS8.Carrito" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Carrito de Compras</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <style>
    body {
        background-color: #f8f9fa;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        color: #343a40;
    }

    h2, h4 {
        color: #343a40;
        font-weight: bold;
    }

    header {
        background-color: #5C3131;
        color: white;
        padding: 15px;
        width: 100%;
        text-align: center;
        margin: 0;
        border-bottom: 4px solid #5C3131;
    }

    header img {
        height: 100px;  /* Aumenta el tamaño del logo */
        margin-right: 10px;
        border-radius: 5px;
    }
    .navbar {
        margin-bottom: 20px;
    }

    .navbar .nav-link {
    color: #5C3131 !important; /* Color inicial */
    font-weight: bold;
    transition: color 0.3s ease, transform 0.3s ease; /* Transición suave para color y transformación */
    }

    .navbar .nav-link:hover {
        color: #C06463 !important; /* Cambia el color al pasar el cursor */
        transform: scale(1.1); /* Aumenta ligeramente el tamaño */
    }
    .container {
        margin-top: 30px;
    }

    .card {
        background-color: #ffffff;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        padding: 30px;
        margin-bottom: 30px;
    }

    .form-group label {
        font-weight: bold;
        color: #495057;
    }

    .form-control {
        border-radius: 5px;
        border: 1px solid #ced4da;
        box-shadow: none;
    }

    .form-control:focus {
        border-color: #5C3131;
        box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
    }
    .btn-succes,
    .btn-primary {
        background-color: #5C3131;
        font-weight: bold;
        border-color: #5C3131;
        transition: all 0.3s ease;
    }
    .btn-succes,
    .btn-primary:hover {
        background-color: #C06463;
        border-color: #C06463;
        transform: scale(1.05);
    }

    .btn-danger {
        background-color: #E30032;
        font-weight: bold;
        border-color: #E30032;
        transition: all 0.3s ease;
    }

    .btn-danger:hover {
        background-color: #DF110E;
        border-color: #DF110E;
        transform: scale(1.05);
    }
    .card img{
        width: 150px;
        height: 150px;
        border-radius: 10px;
    }
    .card-body {
        display: grid;
        grid-template-columns: 1fr auto; /* Dos columnas: contenido y espacio para la imagen */
        grid-template-rows: auto auto; /* Dos filas: primera para Nombre/Imagen, segunda para Precio/Cantidad */
        gap: 10px; /* Espaciado entre filas y columnas */
        align-items: center; /* Centra los elementos verticalmente */
    }

    .card-body .card-title {
        grid-column: 1; /* Ocupa la primera columna */
        grid-row: 1; /* Primera fila */
        font-size: 1.2em;
        font-weight: bold;
    }

    .card-body .card-img-top {
        grid-column: 2; /* Ocupa la segunda columna */
        grid-row: 1 / span 3; /* Ocupa ambas filas (Nombre y Precio) */
        justify-self: center; /* Centra horizontalmente la imagen */
        width: 250px;
        height: 350px;
        border-radius: 10px;
    }

    .card-body .card-text {
        grid-column: 1; /* Primera columna */
        grid-row: 2; /* Segunda fila */
        font-size: 1em;
        font-weight: bold;
    }

    .form-group {
        grid-column: 1; /* Segunda columna */
        grid-row: 3; /* Segunda fila */
        justify-self: center; /* Centra el input horizontalmente */
        width: 100%; /* Ancho del campo de cantidad */
    }

</style>
</head>
<body>
    <header>
            <div class="d-flex flex-column flex-md-row align-items-center justify-content-between">
                <!-- Logo -->
                <div class="d-flex align-items-center">
                    <img src="Imagen/DondeMacreLogo.png" alt="Donde Macre" />
                    <h1 class="m-0">Donde Macre</h1>
                </div>
                <!-- Títulos -->
                <h3 class="mt-3 mt-md-0">Tienda de Videojuegos Retro</h3>
            </div>
        </header>

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <button type="button" class="btn btn-link nav-link" onclick="window.location.href='Carrito.aspx';">
                            <i class="fas fa-shopping-cart"></i> Ver Carrito
                        </button>
                    </li>
                    <li class="nav-item" id="adminButton" style="display:none;">
                        <button type="button" class="btn btn-link nav-link" onclick="window.location.href='Admin.aspx';">
                            <i class="fas fa-cogs"></i> Administrador
                        </button>
                    </li>
                </ul>
            </div>
        </nav>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h1>Carrito de Compras</h1>
            <asp:Repeater ID="RepeaterCarrito" runat="server">
                <ItemTemplate>
                    <div class="card mb-3">
                        <div class="card-body">
                            <h5 class="card-title"><%# Eval("Nombre") %></h5>
                            <p class="card-text">Precio: <%# String.Format(System.Globalization.CultureInfo.GetCultureInfo("en-US"), "{0:C}", Eval("Precio")) %></p>
                            <img src='<%# Eval("Imagen") %>' class="card-img-top" alt='<%# Eval("Nombre") %>' style="max-height: 200px;"/>

                        </div>

                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater><asp:Label ID="lblMensaje" runat="server" ForeColor="Red" Visible="False"></asp:Label>

            <h4>Total: $<span id="totalCarrito" runat="server"><%# ViewState("Total") %></span></h4>
            <button type="button" class="btn btn-danger" onclick="VaciarCarrito()">Vaciar Carrito</button>
            <asp:Button ID="btnVolver" runat="server" Text="Volver a Catálogo" CssClass="btn btn-primary" OnClick="btnVolver_Click" />
            <asp:Button ID="btnFinalizar" runat="server" Text="Finalizar Compra" CssClass="btn btn-success" OnClick="btnFinalizar_Click" />
            <asp:Label ID="lblCarritoVacio" runat="server" CssClass="text-success" Visible="False"></asp:Label>
        </div>
    </form>
    <script>
        function VaciarCarrito() {
            window.location.href = 'VaciarCarrito.aspx'; // Cambia la URL según tu implementación
        }
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            // Permitir solo números y la tecla de retroceso
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }
    </script>
</body>
</html>