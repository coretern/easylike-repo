// script.js
document.getElementById('install-form').addEventListener('submit', function(event) {
    var dbHost = document.getElementById('db_host').value;
    var dbUser = document.getElementById('db_user').value;
    var dbPass = document.getElementById('db_pass').value;
    var dbName = document.getElementById('db_name').value;
    var domain = document.getElementById('domain').value;

    if (!dbHost || !dbUser || !dbPass || !dbName || !domain) {
        alert('Please fill in all fields.');
        event.preventDefault();
    }
});
