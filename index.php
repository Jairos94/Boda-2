<!doctype html>
<html lang="es">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
  <meta name="generator" content="Hugo 0.88.1">
  <title>evento</title>

  <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/navbar-fixed/">


  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">

  <!-- Bootstrap core CSS -->
  <link href="bootstrap/bootstrap-5.1.1-dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

  <!-- Favicons -->
  <link href="/your-path-to-fontawesome/css/all.css" rel="stylesheet"> <!--load all styles -->
  <link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
  <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
  <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
  <link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
  <link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
  <link href="/your-path-to-fontawesome/css/fontawesome.css" rel="stylesheet">
  <link href="/your-path-to-fontawesome/css/brands.css" rel="stylesheet">
  <link href="/your-path-to-fontawesome/css/solid.css" rel="stylesheet">
  <meta name="theme-color" content="#7952b3">


  <style>
    .bd-placeholder-img {
      font-size: 1.125rem;
      text-anchor: middle;
      -webkit-user-select: none;
      -moz-user-select: none;
      user-select: none;
    }

    @media (min-width: 768px) {
      .bd-placeholder-img-lg {
        font-size: 3.5rem;
      }
    }
  </style>


  <!-- Custom styles for this template -->
  <link href="navbar-top-fixed.css" rel="stylesheet">
</head>

<body>

  <nav class="nav justify-content-end navbar-dark bg-dark">
    <ul class="nav justify-content-end">
      <li class="nav-item">

      <li class="nav-item">
        <a class="nav-link" href="login.php">Login</a>
      </li>

    </ul>
  </nav>

  <div class="vr"></div>

  <div class="container" m-2>
    <!-- Content here -->
    <form action="index.php" method="POST" >
      <input class="form-control me-auto" type="text" placeholder="Ingrese su número de telefono 88888888" aria-label="Add your item here..." name="numero" >
      <div class="container" mb-3>
      <button type="submit" class="btn btn-secondary" name="num">Buscar</button>

      <div class="vr"></div>
      <button type="button" class="btn btn-outline-danger m2">Limpiar pantalla</button>
      </div>
    </form>
  </div>
  <div class="vr"></div>


  <?php session_start(); ?>

  <table class="table table-hover">
    <thead>
      <tr>


        <th scope="col">Fecha</th>
        <th scope="col">Hora inicio</th>
        <th scope="col">Hora final</th>
        <th scope="col">Evento</th>
        <th scope="col">Asistencia</th>

      </tr>
    </thead>
    <tbody>
      <?php

      include_once('conexion.php');
      $database = new ConectarBD();
      $db = $database->open();
     

      try {
        //code...
        $num = $_POST['numero'];

        $sql = "SELECT E.evnId,LP.lspId,p.psrId,LP.lspEfectivo,CONCAT(p.psrNombre,' ',p.psrApellido1,' ',p.psrApellido2) AS Nombre,E.evnFecha,E.evrHoraInicio,E.evrHoraFinal,E.evnDescripcion,c.cfrDescripcion,E.evnUbicacion FROM evento E 
        INNER JOIN listapersonas LP ON lp.lpsEventp=E.evnId 
        INNER JOIN persona p ON p.psrId=LP.lspPersona 
        INNER JOIN confirmacion c ON C.cfrId=lp.lpsConfirmacion 
        WHERE P.psrTelNum ='$num'";
        if (isset($_POST['num'])) {
        
         
        }
        foreach ($db->query($sql) as $row) {
      ?>
          <h1><?php echo $row['Nombre']; ?> </h1>
          <tr>


            <th scope="row"><?php echo $row['evnFecha']; ?></th>
            <th scope="row"><?php echo $row['evrHoraInicio']; ?></th>
            <th scope="row"><?php echo $row['evrHoraFinal']; ?></th>
            <th scope="row"><?php echo $row['evnDescripcion']; ?></th>
            <th scope="row"><?php echo $row['cfrDescripcion']; ?></th>
            <th scope="row">
              <a href="<?php echo $row['evnUbicacion']; ?>" class="btn btn-info" target="_blank">
              <i class="fas fa-map-marker-alt"> Ubicacion</i>
              </a>
              <a href="#invitado_<?php echo $row['lspId']; ?>" class="btn btn-primary" data-bs-toggle="modal">
              <i class="fas fa-edit"> Editar</i> 
              </a>

              <a href="#regalosinvitados_<?php echo $row['lspId']; ?>" class="btn btn-success" data-bs-toggle="modal">
              <i class="fas fa-gift"> Regalos</i>
              </a>

            </th>
            <?php
            include('regalosInvitados.php');
            include('editarinvitado.php');
            
            ?>
          </tr>
      <?php

        }
      } catch (PDOException $e) {
        //throw $th;
        // echo 'Hay un problema con la conexion ' . $e->getmessage();
      }
      $database->close();
      ?>


    </tbody>
  </table>


  <script src="https://kit.fontawesome.com/d05ffc26f7.js" crossorigin="anonymous"></script>

  <script src="/bootstrap/5.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
  <!-- Optional JavaScript; choose one of the two! -->

  <!-- Option 1: Bootstrap Bundle with Popper -->

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-kQtW33rZJAHjgefvhyyzcGF3C5TFyBQBA13V1RKPf4uH+bwyzQxZ6CmMZHmNBEfJ" crossorigin="anonymous"></script>
  <!-- Sin este scrip no funcional el modal-->
  <script src="app.js"></script>
  <!-- Option 2: Separate Popper and Bootstrap JS -->
  <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.min.js" integrity="sha384-PsUw7Xwds7x08Ew3exXhqzbhuEYmA2xnwc8BuD6SEr+UmEHlX8/MCltYEodzWA4u" crossorigin="anonymous"></script>
    -->

</body>

</html>