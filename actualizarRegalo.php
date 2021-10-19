<?php
var_dump($_POST);
session_start();
//echo $regalo['lsrEstado'];
include_once('conexion.php');
if(isset($_POST['ActualizarRegalo']))
{
    
    foreach($_POST['Opcion'] as $Valor)
    {
echo $Valor;

    }
 
}