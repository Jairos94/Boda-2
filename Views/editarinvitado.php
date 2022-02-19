<!-- Modal -->
<div class="modal fade" id="invitado_<?php echo $row['lspId']; ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Asistencia </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="ActualizarConfirmacion.php?id=<?php echo $row['lspId']; ?>" method="POST">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label class="input-group-text" for="inputGroupSelect01">Options</label>
                        </div>
                        <select class="custom-select" id="inputGroupSelect01" name="Asistencia">
                            <option selected disabled>Confirmar asistencia</option>
                            <option value="1">Asitir al evento</option>
                            <option value="2">No asisitir</option>
                     
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        <button type="submit" name="ConfirmarAsistencia" class="btn btn-primary">Guardar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
