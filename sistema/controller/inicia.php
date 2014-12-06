<?php
/**
 * Created by PhpStorm.
 * User: BerEduardo
 * Date: 24/10/14
 * Time: 06:28 PM
 */
error_reporting(0);
if(isset($_REQUEST['ok'])){
    switch($_REQUEST['ok']){
        case "ok":
            include('../db/db.php');
            include('../classes/preguntas.php');
           $cont=0;
            for($y=0; $y<10; $y++){

                $ReUsuario= $_REQUEST["respuesta$y"];
                $sql="SELECT * FROM preguntas";
                $query=mysql_query($sql) or die("error mostrar respuestas");
                $num=mysql_num_rows($query);
                for($y1=0; $y1<$num; $y1++){
                  $respuesta=mysql_result($query,$y1,'ok');
                    if($ReUsuario==$respuesta){
                        $cont ++;


                    }
                }



            }
            $total=$cont;
            $qs= new Preguntas();
            $qs->actualizaInfo($_COOKIE['idu'],$cont);

            break;


    }
}else{
    $titulo='Questionario';
    $contenido='contesta las preguntas ';
    $variables=array('titulo'=>$titulo,'contenido'=>$contenido);
    view('inicia',$variables);
}





?>