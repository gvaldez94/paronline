/* 
    Created on : 10-may-2016, 15:13:53
    Author     : Gabriel
*/

function dropdownMenu() {
    document.getElementById("dropdown").classList.toggle("show");
}

function abmDropdownMenu() {
    document.getElementById("abmDropdown").classList.toggle("show");
}

window.onclick = function(event) {
    if (!event.target.matches('.dropbtn')) {
        var dropdowns = document.getElementsByClassName("dropdown-content");
        var i;
        for (i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('show')) {
                openDropdown.classList.remove('show');
            }
        }
    }
}