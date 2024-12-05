<%@ Page Title="Página de inicio" Language="VB" AutoEventWireup="true" CodeBehind="PaginaPrincipal.aspx.vb" Inherits="TiendaRetroDS8.PaginaPrincipal" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tienda de Videojuegos Retro</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f7fa;
            color: #333;
        }

        .header {
            background-color: #0066cc;
            color: white;
            text-align: center;
            padding: 20px 0;
            font-size: 2.5rem;
        }

        .hero {
            background-image: url('https://via.placeholder.com/1200x400?text=Bienvenidos+a+la+Tienda+Retro');
            background-size: cover;
            background-position: center;
            height: 400px;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            font-size: 2rem;
            font-weight: bold;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
        }

        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .features {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: space-between;
        }

        .feature {
            flex: 1;
            min-width: 250px;
            text-align: center;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .feature img {
            width: 100px;
            margin-bottom: 15px;
        }

        .footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 15px 0;
            margin-top: 20px;
        }

        a {
            color: #0066cc;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="header">
        Bienvenidos a la Tienda de Videojuegos Retro
    </div>

    <div class="hero">
        ¡Revive la magia de los videojuegos clásicos!
    </div>

    <div class="container">
        <!--Boton que redirige a inicio de nuestra tienda-->
        <div class="features">
            <div class="feature">
                <a href="Login.aspx">Ir a Inicio</a>
            </div>
        </div>
    </div>

    <div class="footer">
        © 2024 Tienda de Videojuegos Retro. Todos los derechos reservados.
    </div>
</body>
</html>