var formLogin,
    formRegistro;

document.addEventListener('DOMContentLoaded', function() {
    formLogin = document.forms['formLogin'];
    formRegistro = document.forms['formRegistro'];
});

/* formLogin */
function validarUserLogin() {
    var usuario = formLogin['user'].value;
    document.getElementById('userLoginMsg').innerHTML = (usuario == ''
        ? 'Debe identificarse con un nombre de usuario.'
        : '');
}

function validarPassLogin() {
    var contrasenya = formLogin['pass'].value;
    document.getElementById('passLoginMsg').innerHTML = (contrasenya == ''
        ? 'Ingrese su contraseña.'
        : '');
}

function activarLogIn() {
    var campos = ['user','pass'],
        lleno = true;

    for (var i = 0; i < campos.length; ++i) {
        if (formLogin[campos[i]].value == null || formLogin[campos[i]].value == '') {
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

function validarUser() {
    var user = formRegistro['user'].value;
    document.getElementById('userMsg').innerHTML = (user == ''
        ? 'Debe ingresar un nombre de usuario.'
        : '');
}

function validarEmail() {
    var email = formRegistro['email'].value;
    document.getElementById('emailMsg').innerHTML = (email == ''
            ? 'Debe ingresar su dirección de correo.'
            : '');
}

function validarPass() {
    var pass_ver = formRegistro['pass_ver'].value;
    if (pass_ver != '') {
        var pass = formRegistro['pass'].value;
        document.getElementById('pass_verMsg').innerHTML = (pass !== pass_ver
            ? 'Las contraseñas no coinciden.'
            : '');
    } else {
        document.getElementById('passMsg').innerHTML = (formRegistro['pass'].value == ''
            ? 'Debe proporcionar una contraseña.'
            : '');
    }
}

function validarPass_ver() {
    var pass = formRegistro['pass'].value,
        pass_ver = formRegistro['pass_ver'].value;
    document.getElementById('pass_verMsg').innerHTML = (pass !== pass_ver
        ? 'Las contraseñas no coinciden.'
        : '');
}

function activarRegistro() {
    var campos = ['nombre','apellido','user','email','pass','pass_ver'],
        lleno = true;

    for (var i = 0; i < campos.length; ++i) {
        if (formRegistro[campos[i]].value == null || formRegistro[campos[i]].value == '') {
            lleno = false;
            break;
        }
    }

    document.getElementById('submitRegistro').disabled = !lleno;
}