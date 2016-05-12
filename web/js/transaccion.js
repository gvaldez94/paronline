var formTransaccion;

document.addEventListener('DOMContentLoaded', function() {
    formTransaccion = document.forms['formTransaccion'];
});

function validarDireccion() {
    var direccion = formTransaccion['direccion'].value;
    document.getElementById('direccionMsg').innerHTML = (direccion == ''
        ? 'Debe ingresar una dirección.'
        : '');
}

function activarRegistro() {
    var campos = ['direccion'],
        lleno = true;

    for (var i = 0; i < campos.length; ++i) {
        if (formTransaccion[campos[i]].value == '') {
            lleno = false;
            break;
        }
    }
    
    if(formTransaccion['tipo'].value == '0' || 
            (formTransaccion['tipo'].value == '1' && formTransaccion['nroTarjeta'].value != '')) {
        document.getElementById('submitRegistro').disabled = !lleno;
    } else {
        document.getElementById('submitRegistro').disabled = true;
    }
}