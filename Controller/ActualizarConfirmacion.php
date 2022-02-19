<?php

session_start();
/*
var_dump($_POST);
$id = $_GET['id'];
echo $id;
$dato = $_REQUEST['Asistencia'];
echo $dato;*/
include_once('conexion.php');

if (isset($_POST['ConfirmarAsistencia'])) {
    # code...
    $database = new ConectarBD();
    $db = $database->open();
    try {
        //code...
        $id = $_GET['id'];
        $idConfirmacion= $_POST['Asistencia'];
        
        //echo $id;
        //echo $idConfirmacion;
        //$stmt = $db->prepare("INSERT INTO personas(Nombre,Telefono,Correo,Direccion) VALUES(:nombrecontacto,:celular,:email,:direccion)");

       $sql = " UPDATE listapersonas SET `lpsConfirmacion`=$idConfirmacion WHERE lspId=$id";
        $_SESSION['message'] = ($db->exec($sql)) ? 'Datos actualizados correctamente' : 'Algo salio mal, no se pudo actualizar correcctamente';
    } catch (PDOException $e) {
        throw $e;
        $_SESSION['message'] = $e->getMessage();
    }
    $database->close();
} else {
    # code...
    $_SESSION['message'] = 'Rellene el formulario';
}
header('location:index.php');
