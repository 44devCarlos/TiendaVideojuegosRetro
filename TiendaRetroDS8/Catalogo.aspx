<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Catalogo.aspx.vb" Inherits="TiendaRetroDS8.Catalogo" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Catálogo - Tienda Retro Donde Macre</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <style>
    body {
        display: flex;
        min-height: 100vh;
        font-family: 'Roboto', sans-serif;
        background-color: #f4f4f4;
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
    color: #5C3131 !important; /* Color inicial */
    font-weight: bold;
    transition: color 0.3s ease, transform 0.3s ease; /* Transición suave para color y transformación */
    }

    .navbar .nav-link:hover {
        color: #C06463 !important; /* Cambia el color al pasar el cursor */
        transform: scale(1.1); /* Aumenta ligeramente el tamaño */
    }
    .tabs {
        display: flex;
        justify-content: center;
        margin-top: 20px;
        margin-bottom: 35px;
    }
    #form1{
        width: 100%;
    }
    .tab {
    padding: 10px 20px;
    background-color: #ccc;
    cursor: pointer;
    margin-right: 10px;
    border-radius: 5px; /* Opcional: bordes redondeados */
    transition: background-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease; /* Suaviza cambios */
    }

    .tab:hover {
        background-color: #C06463; /* Cambia el fondo al pasar el cursor */
        color: #fff; /* Cambia el color del texto */
        transform: scale(1.1); /* Amplía ligeramente la pestaña */
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2); /* Añade una sombra */
    }

    .tab.active {
        background-color: #C06463;
        color: #fff;
    }

    h2 {
        color: black;
        font-weight: bold;
        margin-bottom: 20px;
    }

    .card {
        display: flex;
        flex-direction: column;
        border: 1px solid #ccc;
        border-radius: 10px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        background: white;
        height: 650px;
        min-height: 550px;
        max-height: auto;
        overflow: hidden;
        transition: all 0.3s ease-in-out;
    }

    .card:hover {
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Sombra mayor al hacer hover */
        transform: scale(1.05); /* Expande la tarjeta ligeramente */
    }

    .card:active {
        transform: scale(0.98); /* Reduce la tarjeta al hacer clic */
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.3); /* Sombra más marcada al estar activa */
    }

    .card .card-body {
        flex-grow: 1;
        padding: 15px;
        overflow: hidden;
    }

    .card img {
        transition: transform 0.3s ease-in-out; /* Transición de la imagen */
        object-fit: cover;
        width: 100%;
        height: auto;
        max-height: 100%;
    }

    .card.producto:hover img {
        transform: scale(1.1); /* Solo escala la imagen, no el contenedor */
    }

    .card h5{
        font-weight: bold;
    }

    .btn-primary {
        background-color: #5C3131;
        font-weight: bold;
        border-color: #5C3131;
        transition: all 0.3s ease;
    }

    .btn-primary:hover {
        background-color: #C06463;
        border-color: #C06463;
        transform: scale(1.05);
    }
    .btn-primary:focus,
    .btn-primary:active {
        background-color: #5C3131!important;
        font-weight: bold;
        border-color: #5C3131!important;
        transition: all 0.3s ease;
        outline: none !important; /* Elimina el borde por defecto */
        box-shadow: none !important;
        transform: scale(1.00);
    }

    .card.producto img {
        max-height: 200px;
        object-fit: cover;
        border-radius: 5px;
        margin-bottom: 15px;
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

        <!--Contenedor de consolas-->
        <div id="consolas" class="container">
            <div class="row">
                <!--Plantilla de cada producto-->
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4 col-sm-6 mb-4">
                            <div class="card producto">
                                <img src='<%# Eval("imagen") %>' class="card-img-top" alt='<%# Eval("nombre") %>' />
                                <div class="card-body d-flex flex-column">
                                    <h5 class="card-title"><%# Eval("nombre") %></h5>
                                    <p class="card-text"><%# Eval("informacion") %></p>
                                    <p class="card-text"><strong>Precio: $<%# String.Format("{0:F2}", Eval("precio")) %></strong></p>
                                    <p class="card-text"><strong>Stock: <%# Eval("stock") %></strong></p>
                                    <button type="button" class="btn btn-primary mt-auto" 
                                        <%# If(Eval("stock") = 0, "disabled", "") %> 
                                        onclick="AgregarAlCarrito('<%# Eval("idConsola") %>', '<%# Eval("nombre") %>', '<%# Eval("precio") %>', '<%# Eval("imagen") %>');">
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

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        
        <!--Contenedor de videojuegos-->
        <div id="videojuegos" class="container" style="display: none;">
            <div id="filtro-consolas" class="container">
                <h2>Filtrar por Consola</h2>
                <asp:DropDownList ID="ddlConsolas" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="ddlConsolas_SelectedIndexChanged">
                    <asp:ListItem Value="0" Selected="True">Seleccionar consola</asp:ListItem>
                </asp:DropDownList>
            </div>
        <div id="videojuegos-lista" class="row">
            <asp:UpdatePanel ID="UpdatePanelVideojuegos" class="row" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <!--Plantilla de cada producto-->
                    <asp:Repeater ID="Repeater2" runat="server">
                        <ItemTemplate>
                            <div class="col-md-4 col-sm-6 mb-4">
                                <div class="card producto">
                                    <img src='<%# Eval("imagen") %>' class="card-img-top" alt='<%# Eval("nombre") %>' />
                                    <div class="card-body d-flex flex-column">
                                        <h5 class="card-title"><%# Eval("nombre") %></h5>
                                        <p class="card-text"><%# Eval("informacion") %></p>
                                        <p class="card-text"><strong>Precio: $<%# String.Format("{0:F2}", Eval("precio")) %></strong></p>
                                        <p class="card-text"><strong>Stock: <%# Eval("stock") %></strong></p>
                                        <p class="card-text"><strong>Genero: <%# Eval("genero") %></strong></p>
                                        <p class="card-text"><strong>Consola: <%# Eval("consola") %></strong></p>
                                        <button type="button" class="btn btn-primary mt-auto" 
                                            <%# If(Eval("stock") = 0, "disabled", "") %> 
                                            onclick="AgregarAlCarrito('<%# Eval("idVideojuego") %>', '<%# Eval("nombre") %>', '<%# Eval("precio") %>', '<%# Eval("imagen") %>');">
                                            <i class="fas fa-cart-plus"></i> Añadir al Carrito
                                        </button>
<asp:Label ID="lblMensaje" runat="server" ForeColor="Red" Visible="False"></asp:Label>

                                        <p class="text-danger" <%# If(Eval("stock") = 0, "style='display:block;'", "style='display:none;'") %> >
                                            No hay stock disponible
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ddlConsolas" EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        window.onload = function () {
            //Recordar las pestaña que tenia seleccionada anteriormente
            const activeTab = localStorage.getItem('activeTab') || 'consolas';
            ShowTab(activeTab);

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

        document.getElementById("<%= ddlConsolas.ClientID %>").addEventListener("change", function () {
            let idConsola = this.value

            // Llamar al backend para actualizar los videojuegos
            __doPostBack("FiltroConsola", idConsola);
        })

        function ShowTab(tab) {
            // Guardar la pestaña activa en el almacenamiento local
            localStorage.setItem('activeTab', tab);

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

        let carrito = []; // Array para almacenar los IDs de los productos en el carrito

        function AgregarAlCarrito(id, nombre, precio, imagen) {

            // Verificar si el producto ya está en el carrito
            if (carrito.some(product => product.id === id)) {
                alert("Este producto ya está en el carrito.");
                return; // No agregar el producto si ya está en el carrito
            }

            // Agregar el producto al carrito
            carrito.push({ id, nombre, precio, imagen });
            // Llamar a la función para actualizar el backend
            __doPostBack('<%= Repeater1.UniqueID %>', id + '|' + nombre + '|' + precio + '|' + imagen);
        }


        function CheckLoginStatus(redirectPage) {
            var userId = "<%= Session("idUsuario") %>";
            if (userId) {
                window.location.href = "Login.aspx";
            } else {

                window.location.href = redirectPage;
            }
        }
    </script>

</body>
</html>