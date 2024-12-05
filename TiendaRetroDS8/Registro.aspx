<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Registro.aspx.vb" Inherits="TiendaRetroDS8.Registro" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registro</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <style>
        body {
            background-color: #f4f4f4;
            font-family: 'Arial', sans-serif;
        }

        .register-card {
            max-width: 400px;
            margin: 50px auto;
            padding: 30px;
            border-radius: 10px;
            background-color: #ffffff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .register-card h2 {
            color: #2C3E50;
            font-weight: bold;
            text-align: center;
            margin-bottom: 30px;
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

        .form-group label {
            font-weight: bold;
            color: #2C3E50;
        }

        .login-link {
            text-align: center;
            display: block;
            margin-top: 15px;
            color: #2C3E50;
        }

        .login-link:hover {
            text-decoration: underline;
        }
        .btn-secondary {
            background-color: #42A4BA;
            border-color: #42A4BA;
            font-weight: bold;
        }

        .btn-secondary:hover {
            background-color: #3698a6;
            border-color: #3698a6;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="register-card">
                <h2>Registro</h2>
                <div class="form-group">
                    <label for="txtUsername">Usuario</label>
                    <asp:TextBox ID="txtUsername" runat="server" class="form-control" placeholder="Ingrese su usuario" required />
                </div>
                <div class="form-group">
                    <label for="txtEmail">Correo Electrónico</label>
                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Ingrese su correo electrónico" required />
                </div>
                <div class="form-group">
                    <label for="txtPassword">Contraseña</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" class="form-control" placeholder="Ingrese su contraseña" required />
                </div>
                <asp:Button ID="btnRegister" runat="server" Text="Registrar" CssClass="btn btn-primary btn-block" OnClick="btnRegister_Click" />
                <a href="Login.aspx" class="login-link">¿Ya tienes cuenta? Inicia sesión aquí</a>
                <a href="Catalogo.aspx" class="btn btn-secondary btn-block mt-3">Ir al Catálogo</a>
                <asp:Label ID="lblError" runat="server" ForeColor="Red" />
            </div>
        </div>
    </form>
</body>
</html>
