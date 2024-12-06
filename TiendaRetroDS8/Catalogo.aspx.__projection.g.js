
/* BEGIN EXTERNAL SOURCE */

        window.onload = function () {
            //Recordar las pestaña que tenia seleccionada anteriormente/***********************/***************ocalStorage('activeTab') 'consolas';
            ShowTab(activeTab);

            // Verificar si el usuario es administrador
            var **********/*******************/          document.getElementById("adminButton").style.display g("rol: ", rol);

            // Mostrar u ocultar el botón de administrador dependiendo del valor de rol
            if (rol === "Admin") {
                document.getElementById("adminButton").style.display = "block"; // Mostrar el botón
          /************************************// Ocultar el botón
            ***************************************************************").a/*************************/**/t/********/**********************/la = this.value

            // Llamar al backend para actualizar los videojuegos
            __doPostBack("FiltroConsola", id= [
            {       function ShowTab(tab) {
            // Guardar la pestaña activa en el almacenamiento local
            localStorage.setItem('activeTab', tab);

            // Ocultar todas las secciones
            document.getElementById('consolas').style.display = 'none';
            document.getElementById('videojuegos').style.display = 'none';
            document.getElementById('tabConsolas').classList.remove('active');
            document.getElementById('tabVideojuegos').classList.remove('active');

            // Mostrar la sección seleccio/**********/      if (tab === 'consolas') {
                document.getElemen            ******************e'tabConsolas').classList.add('active');
 g******************ocument.getEleme******************le.display = 'block';
                document.getElementById('tabVideojuegos').classList.add('active');
            }
        }

        function AgregarAlCarrito(productId, productName, productPrice, productImage) {
        /***************************************************************************************************************************** al carrito.");
   *******************************************in.aspx";
        /********/
            var form = document.createElement("form");
            form.method = "post";
            form.action = "AgregarCarrito.aspx";

            var inputs = [
                { name: "Id", value: productId },
                { name: "Nombre", value: productName },
                { name: "Precio", value: parseFloat(productPrice).toFixed(2) },
                { name: "Imagen", value: productImage }
            ];

            inputs.forEach(function (input) {
                var element = document.createElement("input");
                element.type = "hidden";      element.name = input.name;
                element.value = input.("input");
                element.type =     form.appendChild(element);
            });

            document.body.appendChild(form);
            form.submit();//aqui se mandan
        /**********/
        }
        function CheckLoginStatus(redirectPage) {
            var userI/*******        } %>
***/*************************************       if*************************           window.l/*************************/";
            } else {

                window.location.href = redirectPage;
            }
        }
    
/* END EXTERNAL SOURCE */

/* BEGIN EXTERNAL SOURCE */

        window.onload = function () {
            //Recordar las pestaña que tenia seleccionada anteriormente
            const activeTab = localStorage.getItem('activeTab') || 'consolas';
            ShowTab(activeTab);

            // Verificar si el usuario es administrador
            var rol = "/*******************/";
            console.log("rol: ", rol);

            // Mostrar u ocultar el botón de administrador dependiendo del valor de rol
            if (rol === "Admin") {
                document.getElementById("adminButton").style.display = "block"; // Mostrar el botón
            } else {
                document.getElementById("adminButton").style.display = "none"; // Ocultar el botón
            }
        };

        document.getElementById("/*************************/").addEventListener("change", function () {
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

        function AgregarAlCarrito(productId, productName, productPrice, productImage) {
        /*******************************************/
            alert("Por favor, inicie sesión para añadir productos al carrito.");
            window.location.href = "Login.aspx";
        /********/
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
        /**********/
        }
        function CheckLoginStatus(redirectPage) {
            var userId = "/*************************/"; 
            if (userId) {
                window.location.href = "Perfil.aspx";
            } else {

                window.location.href = redirectPage;
            }
        }
    
/* END EXTERNAL SOURCE */

/* BEGIN EXTERNAL SOURCE */

        window.onload = function () {
            //Recordar las pestaña que tenia seleccionada anteriormente
            const activeTab = localStorage.getItem('activeTab') || 'consolas';
            ShowTab(activeTab);

            // Verificar si el usuario es administrador
            var rol = "/*******************/";
            console.log("rol: ", rol);

            // Mostrar u ocultar el botón de administrador dependiendo del valor de rol
            if (rol === "Admin") {
                document.getElementById("adminButton").style.display = "block"; // Mostrar el botón
            } else {
                document.getElementById("adminButton").style.display = "none"; // Ocultar el botón
            }
        };

        document.getElementById("/*************************/").addEventListener("change", function () {
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

        function AgregarAlCarrito(productId, productName, productPrice, productImage) {
        /*******************************************/
            alert("Por favor, inicie sesión para añadir productos al carrito.");
            window.location.href = "Login.aspx";
        /********/
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
        /**********/
        }
        function CheckLoginStatus(redirectPage) {
            var userId = "/*************************/"; 
            if (userId) {
                window.location.href = "Perfil.aspx";
            } else {

                window.location.href = redirectPage;
            }
        }
    
/* END EXTERNAL SOURCE */
