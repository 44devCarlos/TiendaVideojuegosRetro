<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TiendaRetro.aspx.vb" Inherits="TiendaRetroDS8.TiendaRetro" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Catálogo - Tienda Retro Donde Macre</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <style>
    body {
        font-family: 'Georgia', serif;
        background-color: #f4f4f4;
    }

    header {
        background-color: #2C3E50;
        color: white;
        padding: 15px;
        text-align: center;
        border-bottom: 4px solid #1A252F;
    }

    header img {
    height: 100px;  /* Aumenta el tamaño del logo */
    margin-right: 10px;
    border-radius: 5px;
}

    header h3 {
        margin: 0;
        font-weight: bold;
        text-align: left;  /* Alinea el texto hacia la izquierda */
    }

    header h1 {
        margin: 0;
        font-weight: bold;
    }

    .navbar {
        margin-bottom: 20px;
    }

    .navbar .nav-link {
        color: #2C3E50 !important;
        font-weight: bold;
    }

    h2 {
        color: #2C3E50;
        font-weight: bold;
        margin-bottom: 20px;
    }

    .card {
        border: 1px solid #ccc;
        border-radius: 10px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        background: white;
    }

    .card-body {
        padding: 15px;
    }

    .btn-primary {
        background-color: #2C3E50;
        border-color: #2C3E50;
        font-weight: bold;
    }

    .btn-primary:hover {
        background-color: #1A252F;
        border-color: #1A252F;
    }

    .card.producto img {
    max-height: 200px;
    object-fit: cover;
    border-radius: 5px;
    transition: transform 0.3s ease-in-out, max-height 0.3s ease-in-out;
    }
    
    .card.producto:hover img {
        transform: scale(1.1);
        max-height: 100%;
        transition: transform 0.3s ease-in-out, max-height 0.3s ease-in-out;
    }

    .text-danger {
        font-weight: bold;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div class="d-flex flex-column flex-md-row align-items-center justify-content-between">
                <!-- Logo -->
                <div class="d-flex align-items-center">
                    <img src="Imagen/logoSalmon.jpg" alt="Donde Macre" />
                    <h1 class="m-0">Donde Macre</h1>
                </div>
                <!-- Títulos -->
                <h3 class="mt-3 mt-md-0">Catálogo de Productos</h3>
            </div>
        </header>

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <button type="button" class="btn btn-link nav-link" onclick="checkLoginStatus('Login.aspx');">
                            <i class="fas fa-sign-in-alt"></i> Iniciar Sesión
                        </button>
                    </li>
                    <li class="nav-item">
                        <button type="button" class="btn btn-link nav-link" onclick="checkLoginStatus('Registro.aspx');">
                            <i class="fas fa-user-plus"></i> Registrarse
                        </button>
                    </li>
                    <li class="nav-item">
                        <button type="button" class="btn btn-link nav-link" onclick="window.location.href='Perfil.aspx';">
                            <i class="fas fa-user"></i> Perfil
                        </button>
                    </li>
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

        <div class="container">
            <h2>Todos los Productos</h2>
            <div class="row">
                <asp:Repeater ID="RepeaterCatalogo" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4 col-sm-6 mb-4">
                            <div class="card producto">
                                <img src='<%# Eval("Imagen") %>' class="card-img-top" alt='<%# Eval("Nombre") %>' />
                                <div class="card-body d-flex flex-column">
                                    <h5 class="card-title"><%# Eval("Nombre") %></h5>
                                    <p class="card-text"><%# Eval("Descripcion") %></p>
                                    <p class="card-text"><strong>Precio: $<%# Eval("Precio") %></strong></p>
                                    <p class="card-text"><strong>Stock: <%# Eval("Stock") %></strong></p>
                                    <button type="button" class="btn btn-primary mt-auto" 
                                        <%# If(Eval("Stock") = 0, "disabled", "") %> 
                                        onclick="agregarAlCarrito('<%# Eval("Id") %>', '<%# Eval("Nombre") %>', '<%# Eval("Precio") %>', '<%# Eval("Imagen") %>');">
                                        <i class="fas fa-cart-plus"></i> Añadir al Carrito
                                    </button>
                                    <p class="text-danger" <%# If(Eval("Stock") = 0, "style='display:block;'", "style='display:none;'") %> >
                                        No hay stock disponible
                                    </p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        window.onload = function () {
            // Verificar si el usuario es administrador
            var isAdmin = "<%= Session("IsAdmin") %>";
            console.log("IsAdmin: ", isAdmin); // Log to check session value

            // Mostrar u ocultar el botón de administrador dependiendo del valor de isAdmin
            if (isAdmin === "1") {
                document.getElementById("adminButton").style.display = "block"; // Mostrar el botón
            } else {
                document.getElementById("adminButton").style.display = "none"; // Ocultar el botón
            }
        };

        function agregarAlCarrito(productId, productName, productPrice, productImage) {
        <% If Session("Id") Is Nothing Then %>
            alert("Por favor, inicie sesión para añadir productos al carrito.");
            window.location.href = "Login.aspx";
        <% Else %>
            var form = document.createElement("form");
            form.method = "post";
            form.action = "AgregarCarrito.aspx";

            var inputs = [
                { name: "Id", value: productId },
                { name: "Nombre", value: productName },
                { name: "Precio", value: productPrice },
                { name: "Imagen", value: productImage }
            ];

            inputs.forEach(function (input) {
                var element = document.createElement("input");
                element.type = "hidden";
                element.name = input.name;
                element.value = input.value;
                form.appendChild(element);
            });

            document.body.appendChild(form);
            form.submit();
        <% End If %>
        }
        function checkLoginStatus(redirectPage) {
            var userId = "<%= Session("Id") %>";
            if (userId) {

                window.location.href = "Perfil.aspx";
            } else {

                window.location.href = redirectPage;
            }
        }
    </script>

</body>
</html>
