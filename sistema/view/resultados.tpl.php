<?php
/**
 * Created by PhpStorm.
 * User: BerEduardo
 * Date: 29/10/14
 * Time: 02:00 PM
 */
?>
<html>
<head></head>
<body>

<h1><?php echo $titulo ?></h1>
<p><?php echo $contenido ?></p>
<?php
    require_once('./classes/preguntas.php');
    $pr= new preguntas();
    $pr->muestraCalif($_COOKIE['idu']);
 ?>