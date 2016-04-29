var formProducto;

document.addEventListener('DOMContentLoaded', function() {
    formProducto = document.forms['formProducto'];
    activarRegistro();
});

function validarDescripcion() {
    var descripcion = formProducto['descripcion'].value;
    document.getElementById('descMsg').innerHTML = (descripcion == ''
        ? 'Debe ingresar una descripción del producto.'
        : '');
}

function validarPrecioUnit() {
    var precioUnit = formProducto['precio_unit'].value;
    
    document.getElementById('precioUnitMsg').innerHTML = (precioUnit == ''
            ? 'Debe ingresar un precio.'
                    : '');
}

function activarProducto() {
    var campos = ['descripcion','precio_unit','unidad_medida','categoria'],
        lleno = true;

    for (var i = 0; i < campos.length; ++i) {
        if (formProducto[campos[i]].value == '') {
            lleno = false;
            break;
        }
    }

    document.getElementById('submitProducto').disabled = !lleno;
}