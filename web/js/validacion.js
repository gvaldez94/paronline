var formLogin,
    formRegistro,
    formEditarRegistro,
    formCategoria,
    formUnidad;

document.addEventListener('DOMContentLoaded', function() {
    formLogin = document.forms['formLogin'];
    formRegistro = document.forms['formRegistro'];
    formEditarRegistro = document.forms['formEditarRegistro'];
    formCategoria = document.forms['formCategoria'];
    formUnidad = document.forms['formUnidad'];
    activarRegistro();
});

/* formLogin */
function validarLogin_nameLogin() {
    var usuario = formLogin['login_name'].value;
    document.getElementById('login_nameLogin').innerHTML = (usuario == ''
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

function login_nameValido()
{
    var login_name = formRegistro['login_name'].value;
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            return (xmlhttp.responseText == 'valido' ? true : false);
        }
    };
    xmlhttp.open("GET", "../ValidarLoginName?login_name=" + login_name, true);
    xmlhttp.send();
}

function validarLogin_name() {
    var login_name = formRegistro['login_name'].value;
    if (login_name == '')
        document.getElementById('login_nameMsg').innerHTML = 'Debe ingresar un nombre de usuario.'
    else {
        /* var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                if (xmlhttp.responseText != 'valido') {
                    document.getElementById('login_nameMsg').innerHTML =
                        'Nombre de usuario ya existente.';
                } else {
                    document.getElementById('login_nameMsg').innerHTML =
                            '';
                }
            }
        };
        xmlhttp.open("GET", "../ValidarLoginName?login_name=" + login_name, true);
        xmlhttp.send(); */
        login_nameUnico();
        // document.getElementById('login_nameMsg').innerHTML = '';
    }
}

function login_nameUnico() {
    var login_name = formRegistro['login_name'].value;
    if (login_name != '') {
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                if (xmlhttp.responseText != 'valido') {
                    document.getElementById('login_nameMsg').innerHTML =
                        'Nombre de usuario ya existente.';
                } else {
                    document.getElementById('login_nameMsg').innerHTML =
                            '';
                }
            }
        };
        xmlhttp.open("GET", "../ValidarLoginName?login_name=" + login_name, true);
        xmlhttp.send();
    }
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
        if (passwd !== passwd_ver) {
            document.getElementById('passwd_verMsg').innerHTML = 'Las contraseñas no coinciden.';
            document.getElementById('submitRegistro').disabled = true;
        } else {
            document.getElementById('passwd_verMsg').innerHTML = '';
        }
    } else {
        document.getElementById('passwdMsg').innerHTML = (formRegistro['passwd'].value == ''
            ? 'Debe proporcionar una contraseña.'
            : '');
    }
}

function validarPasswd_ver() {
    var passwd = formRegistro['passwd'].value,
        passwd_ver = formRegistro['passwd_ver'].value;
    if (passwd !== passwd_ver) {
        document.getElementById('passwd_verMsg').innerHTML = 'Las contraseñas no coinciden.';
        document.getElementById('submitRegistro').disabled = true;
    } else {
        document.getElementById('passwd_verMsg').innerHTML = '';
    }
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

    if (formRegistro['passwd'].value === formRegistro['passwd_ver'].value) {
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

/* formEditarRegistro */
function validarNombreE() {
    var nombre = formEditarRegistro['nombre'].value;
    document.getElementById('nombreMsg').innerHTML = (nombre == ''
        ? 'Debe ingresar su nombre.'
        : '');
}

function validarApellidoE() {
    var apellido = formEditarRegistro['apellido'].value;
    document.getElementById('apellidoMsg').innerHTML = (apellido == ''
        ? 'Debe ingresar su apellido.'
        : '');
}

function validarEmailE() {
    var email = formEditarRegistro['email'].value;
    document.getElementById('emailMsg').innerHTML = (email == ''
            ? 'Debe ingresar su dirección de correo.'
            : '');
}


function activarEditarRegistro() {
    var campos = ['nombre','apellido','email'],
        lleno = true;

    for (var i = 0; i < campos.length; ++i) {
        if (formEditarRegistro[campos[i]].value == '') {
            lleno = false;
            break;
        }
    }

    document.getElementById('submitEditarRegistro').disabled = !lleno;
}
