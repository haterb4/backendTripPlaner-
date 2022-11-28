## architecture de du repo-
-nodes_modules
    -liste des modules installe
-puplic
-src
    -config
        -.env fichier contenant les variables d'environement
    -constants
        -index.js fichier qui exporte les variables d'environement
    -controllers
        -authController.js le controlleur d'authentification
        ----autres contollers---
    -middlewares
    -models
    -routes
        -authRoutes.js definit toutes les routes pour l'authentification
    -app.js fichier de configuration du server
    -server.js server
-test


## lancement du server-
-npm start

## installation d'un module-
npm install --save nom_du_module

## effectuer une requete-
utilisez le navigateur ou postman pour lancer votre requette
http://localhost:5080/api/users
