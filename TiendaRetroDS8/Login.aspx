﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="TiendaRetroDS8.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Iniciar Sesión</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <style>
        body {
            min-height: 100vh;
            background-color: #5C3131;
            font-family: 'Arial', sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* Animación de entrada */
        @keyframes slideIn {
            0% {
                transform: translateY(50px);
                opacity: 0;
            }
            100% {
                transform: translateY(0);
                opacity: 1;
            }
        }

        /* Animación del logo */
        @keyframes bounce {
            0%, 100% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-10px);
            }
        }

        .login-card {
            max-width: 400px;
            width: 400px;
            padding: 30px;
            border-radius: 10px;
            background-color: #ffffff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            animation: slideIn 0.6s ease-out;
        }

        .login-card h2 {
            color: #2C3E50;
            font-weight: bold;
            text-align: center;
            margin-bottom: 30px;
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

        .form-group label {
            font-weight: bold;
            color: #2C3E50;
        }

        .register-link {
            text-align: center;
            display: block;
            margin-top: 15px;
            color: #2C3E50;
            transition: color 0.3s ease;
        }

        .register-link:hover {
            text-decoration: underline;
            color: #3698a6;
        }
        .img-logo{
            text-align: center;
        }
        .logo {
            max-width: 150px;
            margin-bottom: 20px;
            animation: bounce 1.5s infinite;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="login-card">
                <div class="img-logo">
                    <img src="Imagen/DondeMacre-sinfondo.png" alt="Logo de la Tienda de Videojuegos Retro" class="logo" />
                </div>
                <h2>Iniciar Sesión</h2>
                <div class="form-group">
                    <label for="txtEmail">Correo</label>
                    <input type="text" id="txtEmail" runat="server" class="form-control" placeholder="Ingrese su correo" required />
                </div>
                <div class="form-group">
                    <label for="txtPassword">Contraseña</label>
                    <input type="password" id="txtPassword" runat="server" class="form-control" placeholder="Ingrese su contraseña" required />
                </div>
                <button type="submit" class="btn btn-primary btn-block">Iniciar Sesión</button>
                <a href="Registro.aspx" class="register-link">¿No tienes cuenta? Regístrate aquí</a>
                <a href="Catalogo.aspx" class="btn btn-secondary btn-block mt-3">Ir al Catálogo</a>
                <asp:Label ID="lblError" runat="server" ForeColor="Red" />
            </div>
        </div>
    </form>
</body>
</html>