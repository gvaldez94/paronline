var formLogin,
    formRegistro,
    formCategoria,
    formUnidad;

document.addEventListener('DOMContentLoaded', function() {
    formLogin = document.forms['formLogin'];
    formRegistro = document.forms['formRegistro'];
    formCategoria = document.forms['formCategoria'];
    formUnidad = document.forms['formUnidad'];
    activarRegistro();
});

/* formLogin */
function validarLogin_nameLogin() {
    var usuario = formLogin['login_name'].value;
    document.getElementById('userLoginMsg').innerHTML = (usuario == ''
        ? 'Debe identificarse con un nombre de usuario.'
        : '');
}

function validarPasswdLogin() {
    var contrasenya = formLogin['passwd'].value;
    document.getElementById('passwdLoginMsg').innerHTML = (contrasenya == ''
        ? 'Ingrese su contraseña.'
        : '');
}

function activarLogIn() {
    var campos = ['login_name','passwd'],
        lleno = true;

    for (var i = 0; i < campos.length; ++i) {
        if (formLogin[campos[i]].value == '') {
            lleno = false;
            break;
        }
    }

    document.getElementById('submitLogin').disabled = !lleno;
}

/* formRegistro */
function validarNombre() {
    var nombre = formRegistro['nombre'].value;
    document.getElementById('nombreMsg').innerHTML = (nombre == ''
        ? 'Debe ingresar su nombre.'
        : '');
}

function validarApellido() {
    var apellido = formRegistro['apellido'].value;
    document.getElementById('apellidoMsg').innerHTML = (apellido == ''
        ? 'Debe ingresar su apellido.'
        : '');
}

function validarLogin_name() {
    var login_name = formRegistro['login_name'].value;
    document.getElementById('login_nameMsg').innerHTML = (login_name == ''
        ? 'Debe ingresar un nombre de usuario.'
        : '');
}

function validarEmail() {
    var email = formRegistro['email'].value;
    document.getElementById('emailMsg').innerHTML = (email == ''
            ? 'Debe ingresar su dirección de correo.'
            : '');
}

function validarPasswd() {
    var passwd_ver = formRegistro['passwd_ver'].value;
    if (passwd_ver != '') {
        var passwd = formRegistro['passwd'].value;
        document.getElementById('passwd_verMsg').innerHTML = (passwd !== passwd_ver
            ? 'Las contraseñas no coinciden.'
            : '');
    } else {
        document.getElementById('passwdMsg').innerHTML = (formRegistro['passwd'].value == ''
            ? 'Debe proporcionar una contraseña.'
            : '');
    }
}

function validarPasswd_ver() {
    var passwd = formRegistro['passwd'].value,
        passwd_ver = formRegistro['passwd_ver'].value;
    document.getElementById('passwd_verMsg').innerHTML = (passwd !== passwd_ver
        ? 'Las contraseñas no coinciden.'
        : '');
}

function activarRegistro() {
    var campos = ['nombre','apellido','login_name','email','passwd','passwd_ver'],
        lleno = true;

    for (var i = 0; i < campos.length; ++i) {
        if (formRegistro[campos[i]].value == '') {
            lleno = false;
            break;
        }
    }

    if (formRegistro['passwd'].value == formRegistro['passwd_ver'].value) {
        document.getElementById('submitRegistro').disabled = !lleno;
    }
}


function activarCambio() {
    var campos = ['actual','nueva'],
        lleno = true;

    for (var i = 0; i < campos.length; ++i) {
        if (changePasswd[campos[i]].value == null || changePasswd[campos[i]].value == '') {
            lleno = false;
            break;
        }
    }

    document.getElementById('submitChangePasswd').disabled = !lleno;
}


/* formCategoria */
function validarCategoria() {
    var descripcion = formCategoria['descripcion'].value;
    document.getElementById('categoriaDescMsg').innerHTML = (descripcion == ''
        ? 'Debe introducir un nombre para la categoría.'
        : '');
}

function activarCatGuardar() {
    var campos = ['descripcion'],
        lleno = true;

    for (var i = 0; i < campos.length; ++i) {
        if (formCategoria[campos[i]].value == null || formCategoria[campos[i]].value == '') {
            lleno = false;
            break;
        }
    }

    document.getElementById('submitCategoria').disabled = !lleno;
}


/* formUnidad */
function validarUnidad() {
    var descripcion = formUnidad['descripcion'].value;
    document.getElementById('unidadDescMsg').innerHTML = (descripcion == ''
        ? 'Debe introducir un nombre para la unidad.'
        : '');
}

function activarUniGuardar() {
    var campos = ['descripcion'],
        lleno = true;

    for (var i = 0; i < campos.length; ++i) {
        if (formUnidad[campos[i]].value == null || formUnidad[campos[i]].value == '') {
            lleno = false;
            break;
        }
    }

    document.getElementById('submitUnidad').disabled = !lleno;
}
