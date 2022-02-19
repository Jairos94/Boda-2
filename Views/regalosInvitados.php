<?php
include_once('conexion.php');
$database = new ConectarBD();
$db = $database->open();

?>

<div class="modal fade" id="regalosinvitados_<?php echo $row['lspId']; ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Lista de regalos </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="actualizarRegalo.php?id=<?php $row['lspId'] ?>" method="POST">



                    <?php
                    try {
                        //code...
                        $Consulta = $row['evnId'];

                        $Busqueda = "SELECT LR.lsrID,LR.lsrNumLista,LR.lsrRegalo,LR.lsrEstado,LR.lsrListaPersonas,R.rglDescripcion FROM `listaregalos` LR
                        INNER JOIN regalos R ON R.rglId=LR.lsrRegalo
                        INNER JOIN numlista NL ON NL.lsnID=LR.lsrNumLista
                        INNER JOIN evento E ON E.evnNumLista=NL.lsnID
                        WHERE E.evnId=$Consulta";
                        foreach ($db->query($Busqueda) as $regalo) {
                            if ($regalo['lsrListaPersonas'] == $row['lspId']) { ?>

                                <div class="form-check">
                                 
                                    <input class="form-check-input" type="checkbox" value="<?php echo $regalo['lsrEstado']; ?>" id="flexCheckChecked" checked name="Opcion[]">
                                    <label class="form-check-label" for="flexCheckChecked">
                                        <?php echo $regalo['rglDescripcion']; ?>
                                    </label>
                                </div>

                                <?php } else {
                                if ($regalo['lsrEstado'] == 1) { ?>
                                    <div class="form-check">
                                        
                                        <input class="form-check-input" type="checkbox" value="<?php echo $regalo['lsrEstado']; ?>" id="flexCheckDefault" name="Opcion[]">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            <?php echo $regalo['rglDescripcion']; ?>
                                        </label>
                                    </div>
                                <?php } else { ?>

                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckCheckedDisabled" checked disabled>
                                        <label class="form-check-label" for="flexCheckCheckedDisabled">
                                            <?php echo $regalo['rglDescripcion']; ?>
                                        </label>
                                    </div>
                    <?php }
                            }
                        }
                    } catch (\Throwable $th) {
                        //throw $th;
                    }
                    ?>


                    <div class="conteiner mb-3">

                        <h4>¿Deseas agregar Dinero?</h4>
                        <?php if ($row['lspEfectivo'] == 1) {
                            echo '<p> Actualmente si dará dinero</p>';
                        } else {
                            echo '<p> Actualmente no dará efectivo</p>';
                        } ?>
                        <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="SeleccionarOpcionDinero">
                            <option selected disabled>Seleccionar una opcion</option>
                            <option value="1">Si</option>
                            <option value="2">No</option>
                        </select>
                    </div>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary" name="ActualizarRegalo"><i class="fas fa-save"> Guardar</i></button>
                </form>
            </div>
        </div>
    </div>
</div>