<?php 
if(isset($_SESSION["connection"])&&($_SESSION["connection"]===True)&&(isset($_SESSION["token"]["pass"]))&&(isset($_SESSION["token"]["name"]))){
    include "../command.php";
    $bdd=bdd_connection();
    $rep=$bdd->query("select name from staff where password = '".$_SESSION["token"]["pass"]."'");
    if($rep["name"]===$_SESSION["token"]["name"]){
        header("Location: dashboard.php");
    } else {
        session_destroy();
        header("Location: ../index.php");
    }
} else {
    session_destroy();
    header("Location: ../index.php");
}
?>
