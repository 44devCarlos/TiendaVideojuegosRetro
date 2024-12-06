<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Admin.aspx.vb" Inherits="TiendaRetroDS8.Admin" MaintainScrollPositionOnPostBack="true" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gestión de Productos - Donde Macre</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
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

        .btn-secondary {
            background-color: #C06463;
            font-weight: bold;
            border-color: #C06463;
            transition: all 0.3s ease;
        }

        .btn-secondary:hover {
            background-color: #5C3131;
            border-color: #5C3131;
            transform: scale(1.05);
        }

        .table {
            background-color: #ffffff;
            border-radius: 5px;
            border: 1px solid #ced4da;
        }

        .table th {
            background-color: #5C3131;
            color: #ffffff;
        }

        .table td, .table th {
            text-align: center;
            vertical-align: middle;
        }

        .table-bordered {
            border: 1px solid #dee2e6;
        }

        .table-bordered td, .table-bordered th {
            border: 1px solid #dee2e6;
        }

        .table img {
            width: 80px;
            height: 80px;
            object-fit: cover;
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
                <h3 class="mt-3 mt-md-0">Administrador</h3>
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
        <div class="container">
            <h2 class="text-center">Gestión de Productos</h2>

            <!-- Formulario para agregar consolas -->
            <div class="card">
                <h4>Agregar una nueva Consola</h4>
                <div class="form-group">
                    <label for="txtNombreConsola">Nombre</label>
                    <asp:TextBox ID="txtNombreConsola" runat="server" CssClass="form-control" placeholder="Ingrese el nombre de la consola" />
                </div>
                <div class="form-group">
                    <label for="txtMarcaConsola">Marca</label>
                    <asp:TextBox ID="txtMarcaConsola" runat="server" CssClass="form-control" placeholder="Ingrese el nombre de una marca" />
                </div>
                <div class="form-group">
                    <label for="txtPrecioConsola">Precio</label>
                    <asp:TextBox ID="txtPrecioConsola" runat="server" CssClass="form-control" placeholder="Ingrese el precio de la consola" />
                    <asp:Literal ID="litError" runat="server"></asp:Literal>
                </div>
                <div class="form-group">
                    <label for="txtStockConsola">Stock</label>
                    <asp:TextBox ID="txtStockConsola" TextMode="Number" runat="server" CssClass="form-control" placeholder="Ingrese el stock disponible" />
                </div>
                <div class="form-group">
                    <label for="txtAnioLanzamientoConsola">Año Lanzamiento</label>
                    <asp:TextBox ID="txtAnioLanzamientoConsola" TextMode="Number" runat="server" CssClass="form-control" placeholder="Ingrese el año de lanzamiento" />
                </div>
                <div class="form-group">
                    <label for="txtInformacionConsola">Informacion</label>
                    <asp:TextBox ID="txtInformacionConsola" runat="server" CssClass="form-control" placeholder="Ingrese el stock disponible" />
                </div>
                <div class="form-group">
                    <label for="txtImagenConsola">Imagen (URL)</label>
                    <asp:TextBox ID="txtImagenConsola" runat="server" CssClass="form-conttxtNombreConsolarol" placeholder="Ingrese la URL de la imagen de la consola" />
                </div>
                <asp:Button ID="btnAgregarConsola" runat="server" Text="Agregar Consola" CssClass="btn btn-primary mt-3" OnClick="AgregarConsola" />
            </div>

            <!-- Formulario para agregar consolas -->
            <div class="card">
                <h4>Agregar un nuevo videojuego</h4>
                <div class="form-group">
                    <label for="txtNombreVideojuego">Nombre</label>
                    <asp:TextBox ID="txtNombreVideojuego" runat="server" CssClass="form-control" placeholder="Ingrese el nombre de la Videojuego" />
                </div>
                <div class="form-group">
                    <label for="txtGeneroVideojuego">Genero</label>
                    <asp:TextBox ID="txtGeneroVideojuego" runat="server" CssClass="form-control" placeholder="Ingrese el genero" />
                </div>
                <div class="form-group">
                    <label for="txtPrecioVideojuego">Precio</label>
                    <asp:TextBox ID="txtPrecioVideojuego" runat="server" CssClass="form-control" placeholder="Ingrese el precio de la Videojuego" />
                </div>
                <div class="form-group">
                    <label for="txtInformacionVideojuego">Informacion</label>
                    <asp:TextBox ID="txtInformacionVideojuego" runat="server" CssClass="form-control" placeholder="Ingrese informacion" />
                </div>
                <div class="form-group">
                    <label for="txtStockoVideojuego">Stock</label>
                    <asp:TextBox ID="txtStockVideojuego" TextMode="Number" runat="server" CssClass="form-control" placeholder="Ingrese la cantidad disponible" />
                </div>
                <div class="form-group">
                    <label for="ddlConsolas">Consola</label>
                    <asp:DropDownList ID="ddlConsolas" runat="server" CssClass="form-select">
                        <asp:ListItem Value="0" Disabled Selected="True">Seleccionar consola</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="txtImagenVideojuego">Imagen (URL)</label>
                    <asp:TextBox ID="txtImagenVideojuego" runat="server" CssClass="form-control" placeholder="Ingrese la URL de la imagen de la Videojuego" />
                </div>
                <asp:Button ID="btnAgregarVideojuego" runat="server" Text="Agregar Videojuego" CssClass="btn btn-primary mt-3" OnClick="AgregarVideojuego" />

                <!-- Botón para ir al catálogo -->
                <asp:Button ID="btnGoToCatalog" runat="server" Text="Ir al Catálogo" CssClass="btn btn-secondary mt-3 ml-2" PostBackUrl="Catalogo.aspx" />
            </div>

            <!-- GridView para mostrar consolas -->
            <div class="card">
                <h4>Listado de Consolas</h4>
                <asp:GridView ID="gvConsolas" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered"
                              OnRowEditing="EditarConsolas" OnRowCancelingEdit="CancelarEditarConsolas" OnRowUpdating="ActualizarConsolas" DataKeyNames="idConsola">
                     <Columns>
                    <asp:BoundField DataField="idConsola" HeaderText="idConsola" ReadOnly="True" />
                    <asp:TemplateField HeaderText="nombre">
                        <ItemTemplate>
                            <%# Eval("nombre") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Marca">
                        <ItemTemplate>
                            <%# Eval("marca") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Precio">
                        <ItemTemplate>
                            <%# String.Format(System.Globalization.CultureInfo.GetCultureInfo("en-US"), "{0:C}", Eval("precio")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Stock">
                        <ItemTemplate>
                            <%# Eval("Stock") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtStock" runat="server" Text='<%# Eval("Stock") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Año Lanzamiento">
                        <ItemTemplate>
                            <%# Eval("anioLanzamiento") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Información">
                        <ItemTemplate>
                            <%# Eval("informacion") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Imagen">
                        <ItemTemplate>
                            <img src='<%# Eval("Imagen") %>' alt="Producto" />
                        </ItemTemplate>
                    </asp:TemplateField>
                         <asp:CommandField ShowEditButton="True" ShowCancelButton="True" CancelText="Cancelar" />

                </Columns>
                </asp:GridView>
            </div>

            <!-- GridView para mostrar videojuegos -->
            <div class="card">
                <h4>Listado de Videojuegos</h4>
                <asp:GridView ID="gvVideojuegos" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered"
                              OnRowEditing="EditarVideojuegos" OnRowCancelingEdit="CancelarEditarVideojuegos" OnRowUpdating="ActualizarVideojuegos" DataKeyNames="idVideojuego">
                    <Columns>
                    <asp:BoundField DataField="idVideojuego" HeaderText="ID Videojuego" ReadOnly="True" />
                    <asp:TemplateField HeaderText="Nombre">
                        <ItemTemplate>
                            <%# Eval("nombre") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Género">
                        <ItemTemplate>
                            <%# Eval("genero") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Precio">
                        <ItemTemplate>
                            <%# String.Format(System.Globalization.CultureInfo.GetCultureInfo("en-US"), "{0:C}", Eval("precio")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Información">
                        <ItemTemplate>
                            <%# Eval("informacion") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Stock">
                        <ItemTemplate>
                            <%# Eval("stock") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtStock" runat="server" Text='<%# Eval("stock") %>' CssClass="form-control" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Consola">
                        <ItemTemplate>
                            <%# Eval("consola") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Imagen">
                        <ItemTemplate>
                            <img src='<%# Eval("imagen") %>' alt="Producto" style="width: 50px; height: auto;" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" ShowCancelButton="True" CancelText="Cancelar" />
                </Columns>
                </asp:GridView>
            </div>

            <!-- GridView para mostrar consola con más ganancia -->
            <div class="card">
                <h4>Consolas con mayor ganancia</h4>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" DataKeyNames="idConsola">
                    <Columns>
                    <asp:BoundField DataField="idConsola" HeaderText="ID Consolas" ReadOnly="True" />
                    <asp:TemplateField HeaderText="Consola">
                        <ItemTemplate>
                            <%# Eval("consola") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ganancia Total">
                        <ItemTemplate>
                            <%# String.Format(System.Globalization.CultureInfo.GetCultureInfo("en-US"), "{0:C}", Eval("ganancia_total")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <!-- GridView para mostrar consola más vendida -->
            <div class="card">
                <h4>Consolas más vendidas</h4>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" DataKeyNames="idConsola">
                    <Columns>
                    <asp:BoundField DataField="idConsola" HeaderText="ID Consolas" ReadOnly="True" />
                    <asp:TemplateField HeaderText="Consola">
                        <ItemTemplate>
                            <%# Eval("consola") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Total Vendido">
                        <ItemTemplate>
                            <%# Eval("total_vendido") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <!-- GridView para mostrar juegos con más ganancia -->
            <div class="card">
                <h4>Videojuegos con mayor ganancia</h4>
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" DataKeyNames="idVideojuego">
                    <Columns>
                    <asp:BoundField DataField="idVideojuego" HeaderText="ID Videojuegos" ReadOnly="True" />
                    <asp:TemplateField HeaderText="Consola">
                        <ItemTemplate>
                            <%# Eval("videojuego") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ganancia Total">
                        <ItemTemplate>
                            <%# String.Format(System.Globalization.CultureInfo.GetCultureInfo("en-US"), "{0:C}", Eval("ganancia_total")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <!-- GridView para mostrar juegos más vendida -->
            <div class="card">
                <h4>Videojuegos más vendidas</h4>
                <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" DataKeyNames="idVideojuego">
                    <Columns>
                    <asp:BoundField DataField="idVideojuego" HeaderText="ID Videojuegos" ReadOnly="True" />
                    <asp:TemplateField HeaderText="Consola">
                        <ItemTemplate>
                            <%# Eval("videojuego") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Total Vendido">
                        <ItemTemplate>
                            <%# Eval("total_vendido") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
