<%@ Page Title="Página de inicio" Language="VB" AutoEventWireup="true" CodeBehind="PaginaPrincipal.aspx.vb" Inherits="TiendaRetroDS8.PaginaPrincipal" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tienda de Videojuegos Retro</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f7fa;
            color: #333;
        }

        .header {
            background-color: #5C3131;
            color: white;
            text-align: center;
            padding: 20px 0;
            font-size: 2.5rem;
        }
        .container {
            flex: 1;
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
            width: 250px;
            gap: 20px;
            justify-content: center;
            align-items: center;
            margin: auto;
        }

        .feature {
            flex: 1;
            background-color: #5C3131;
            width: 30px;
            text-align: center;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .feature:hover {
            background-color: #C06463;
            border-color: #C06463;
            transform: scale(1.05);
        }
        .info{
            display: flex;
            text-align: center;
            padding: auto;
            display: flex;
        }
        .info .img-logos {
            justify-content: flex-start;
            margin: 0 20px /* Espacio entre la imagen y el texto */
        }
        .info p{
            margin-bottom: 90px;
        }

        .feature img {
            width: 100px;
            margin-bottom: 15px;
        }

        .footer {
            background-color: #5C3131;
            color: white;
            text-align: center;
            padding: 15px 0;
            margin-top: 20px;
        }

        a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

    </style>
</head>
<body>
    <div class="header">
        Bienvenidos a la Tienda de Videojuegos Retro
    </div>
    <div class="container">
        <!-- Información de la universidad -->
        <div class="info">
            <div class="img-logos">
            <img src="./Imagen/LogoUTP.png" alt="Logo Izquierda">
            </div>
            <div>
                <h1>UNIVERSIDAD TECNOLÓGICA DE PANAMÁ</h1>
                <h2>FACULTAD DE INGENIERÍA DE SISTEMAS COMPUTACIONALES</h2>
                <h3>LIC. EN DESARROLLO DE SOFTWARE</h3>
                <p><strong>DESARROLLO DE SOFTWARE VIII</strong></p>
                <p>
                    <strong>Estudiantes:</strong><br><br>
                    JOSÉ MACRE<br>
                    CARLOS RODRÍGUEZ<br>
                    JAIDER RICO<br>
                    DIDIER VILLALAZ
                </p>
                <p>
                    <strong>Profesor:</strong><br><br>
                    RODRIGO YANGÜEZ
                </p>
                <p><strong>6 DE DICIEMBRE DE 2024</strong></p>
                <p><strong>II SEMESTRE 2024</strong></p>
            </div>
            <div class="img-logos">
                <img src="./Imagen/LogoFISC.png" alt="Logo Derecha">
            </div>
        </div>
        <!-- Botón que redirige a inicio de nuestra tienda -->
        <div class="features">
            <div class="feature">
                <a href="Login.aspx">Ir a Inicio</a>
            </div>
        </div>
    </div>

    <div class="footer">
        Examen Semestral de Desarollo de Software VIII.
    </div>
</body>
</html>