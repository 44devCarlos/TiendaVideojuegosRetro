<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Catalogo.aspx.vb" Inherits="TiendaRetroDS8.Catalogo" %>

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
    .tabs {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

    .tab {
        padding: 10px 20px;
        background-color: #ccc;
        cursor: pointer;
        margin-right: 10px;
    }

    .tab.active {
        background-color: #333;
        color: #fff;
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
                    <img src="Imagen/DondeMacreLogo.png" alt="Donde Macre" />
                    <h1 class="m-0">Donde Macre</h1>
                </div>
                <!-- Títulos -->
                <h3 class="mt-3 mt-md-0">Videojuegos Retro</h3>
            </div>
        </header>

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <button type="button" class="btn btn-link nav-link" onclick="CheckLoginStatus('Login.aspx');">
                            <i class="fas fa-sign-in-alt"></i> Iniciar Sesión
                        </button>
                    </li>
                    <li class="nav-item">
                        <button type="button" class="btn btn-link nav-link" onclick="CheckLoginStatus('Registro.aspx');">
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

        <!-- Tabs to toggle between Consolas and Videojuegos -->
        <div class="tabs">
            <div class="tab active" id="tabConsolas" onclick="ShowTab('consolas')">Consolas</div>
            <div class="tab" id="tabVideojuegos" onclick="ShowTab('videojuegos')">Videojuegos</div>
        </div>

        <div id="consolas" class="container">
            <h2>Consolas</h2>
            <div class="row">
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4 col-sm-6 mb-4">
                            <div class="card producto">
                                <img src='<%# Eval("imagen") %>' class="card-img-top" alt='<%# Eval("nombre") %>' />
                                <div class="card-body d-flex flex-column">
                                    <h5 class="card-title"><%# Eval("nombre") %></h5>
                                    <p class="card-text"><%# Eval("informacion") %></p>
                                    <p class="card-text"><strong>Precio: $<%# Eval("precio") %></strong></p>
                                    <p class="card-text"><strong>Stock: <%# Eval("stock") %></strong></p>
                                    <button type="button" class="btn btn-primary mt-auto" 
                                        <%# If(Eval("stock") = 0, "disabled", "") %> 
                                        onclick="AgregarAlCarrito('<%# Eval("id_consola") %>', '<%# Eval("nombre") %>', '<%# Eval("precio") %>', '<%# Eval("imagen") %>');">
                                        <i class="fas fa-cart-plus"></i> Añadir al Carrito
                                    </button>
                                    <p class="text-danger" <%# If(Eval("stock") = 0, "style='display:block;'", "style='display:none;'") %> >
                                        No hay stock disponible
                                    </p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

        <div id="videojuegos" class="container" style="display: none;">
        <h2>Videojuegos</h2>
        <div class="row">
            <asp:Repeater ID="Repeater2" runat="server">
                <ItemTemplate>
                    <div class="col-md-4 col-sm-6 mb-4">
                        <div class="card producto">
                            <img src='<%# Eval("imagen") %>' class="card-img-top" alt='<%# Eval("nombre") %>' />
                            <div class="card-body d-flex flex-column">
                                <h5 class="card-title"><%# Eval("nombre") %></h5>
                                <p class="card-text"><%# Eval("informacion") %></p>
                                <p class="card-text"><strong>Precio: $<%# Eval("precio") %></strong></p>
                                <p class="card-text"><strong>Stock: <%# Eval("stock") %></strong></p>
                                <p class="card-text"><strong>Genero: <%# Eval("genero") %></strong></p>
                                <p class="card-text"><strong>Consola: <%# Eval("consola") %></strong></p>
                                <button type="button" class="btn btn-primary mt-auto" 
                                    <%# If(Eval("stock") = 0, "disabled", "") %> 
                                    onclick="AgregarAlCarrito('<%# Eval("id_videojuego") %>', '<%# Eval("nombre") %>', '<%# Eval("precio") %>', '<%# Eval("imagen") %>');">
                                    <i class="fas fa-cart-plus"></i> Añadir al Carrito
                                </button>
                                <p class="text-danger" <%# If(Eval("stock") = 0, "style='display:block;'", "style='display:none;'") %> >
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
            var rol = "<%= Session("rol") %>";
            console.log("rol: ", rol);

            // Mostrar u ocultar el botón de administrador dependiendo del valor de rol
            if (rol === "Admin") {
                document.getElementById("adminButton").style.display = "block"; // Mostrar el botón
            } else {
                document.getElementById("adminButton").style.display = "none"; // Ocultar el botón
            }
        };

        function ShowTab(tab) {
            // Ocultar todas las secciones
            document.getElementById('consolas').style.display = 'none';
            document.getElementById('videojuegos').style.display = 'none';
            document.getElementById('tabConsolas').classList.remove('active');
            document.getElementById('tabVideojuegos').classList.remove('active');

            // Mostrar la sección seleccionada
            if (tab === 'consolas') {
                document.getElementById('consolas').style.display = 'block';
                document.getElementById('tabConsolas').classList.add('active');
            } else if (tab === 'videojuegos') {
                document.getElementById('videojuegos').style.display = 'block';
                document.getElementById('tabVideojuegos').classList.add('active');
            }
        }

        function AgregarAlCarrito(productId, productName, productPrice, productImage) {
        <% If Session("id_usuario") Is Nothing Then %>
            alert("Por favor, inicie sesión para añadir productos al carrito.");
            window.location.href = "Login.aspx";
        <% Else %>
            var form = document.createElement("form");
            form.method = "post";
            form.action = "AgregarCarrito.aspx";

            var inputs = [
                { name: "ID", value: productId },
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
        function CheckLoginStatus(redirectPage) {
            var userId = "<%= Session("id_usuario") %>"; 
            if (userId) {
                window.location.href = "Perfil.aspx";
            } else {

                window.location.href = redirectPage;
            }
        }
    </script>

</body>
</html>
