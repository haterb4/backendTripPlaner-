> ## architecture de du repo-
> - nodes_modules.<br>
>    - liste des modules installe.<br>
> - puplic.<br>
> - src.<br>
> - - config.<br>
> - - - .env fichier contenant les variables d'environement.<br>
> - - constants.<br>
> - - - index.js fichier qui exporte les variables d'environement.<br>
> - - controllers.<br>
> - - - authController.js le controlleur d'authentification.<br>
> - - - ***---autres contollers.js---***.<br>
> - - middlewares.<br>
> - - models.<br>
> - - routes.<br>
> - - - authRoutes.js definit toutes les routes pour l'authentification.<br>
> - - - ***---autres routes.js---***.<br>
> - - app.js fichier de configuration du server.<br>
> - - server.js server.<br>
> - test.<br>


> ## lancement du server-
> -npm start

> ## installation d'un module-
> npm install --save nom_du_module

> ## effectuer une requete-
> utilisez le navigateur ou postman pour lancer votre requette
> http://localhost:5080/api/users
