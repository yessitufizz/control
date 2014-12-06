<?php
/**
 * Created by PhpStorm.
 * User: BerEduardo
 * Date: 29/10/14
 * Time: 12:01 PM
 */
include("./db/db.php");
class Preguntas{
    private $id;
    private $pregunta;
    private $respuesta;
    private $f1;
    private $f2;
    public function muestraCalif($idu){
        $sql="SELECT calif FROM juegodetalle WHERE id=$idu ORDER BY calif DESC LIMIT 1";
        $query=mysql_query($sql);
        $peor="SELECT calif FROM juegodetalle WHERE id=$idu ORDER BY calif ASC LIMIT 1";
        $Qpeor=mysql_query($peor);
        $total="SELECT COUNT(*) AS total FROM juegodetalle WHERE id=$idu ";
        $totalQ=mysql_query($total);

        echo"
        <div class='row'>
                <div class=\"col-sm-4\">
          <div class='panel panel-success'>
            <div class=\"panel-heading\">
              <h3 class=\"panel-title\">Mejor Calificación</h3>
            </div>
            <div class=\"panel-body\">";
       echo mysql_result($query,0,'calif');
        echo"
            </div>
          </div>
          <div class='panel panel-danger'>
            <div class=\"panel-heading\">
              <h3 class=\"panel-title\">Peor Calificación</h3>
            </div>
            <div class=\"panel-body\">";
              echo mysql_result($Qpeor,0,'calif');
           echo "</div>
          </div>
          <div class=\"panel panel-primary\">
            <div class=\"panel-heading\">
              <h3 class=\"panel-title\">Total de intentos</h3>
            </div>
            <div class=\"panel-body\">";
              echo mysql_result($totalQ,0,'total');
           echo" </div>
          </div>
        </div><!-- /.col-sm-4 -->
        </div>";


    }
    public function actualizaInfo($id1,$calif){
        $sql="insert into juegodetalle(id,calif) values($id1,$calif)  ";
        mysql_query($sql)or die();
        print "<meta http-equiv='refresh' content='0;
		url=../index.php?url=resultados'>";

    }
    public function mostrarPreguntas(){
        echo "<div class='container theme-showcase' role='main'>
        <div class=table-responsive>
        <form action='./controller/inicia.php' method='GET'>
            <table class='table table-striped'>
                <tr><td colspan=3 align=Center><strong>Questionario</strong> </td> </tr>";
        echo" <tr> <th>No.</th><th>Pregunta</th><th>Opciones</th>   </tr>";

        $sql="SELECT * FROM preguntas	ORDER BY RAND() LIMIT 10";
        $query=mysql_query($sql) or die("error mostrar preguntas");
        for($y=0; $y<10; $y++){
            $pregunta=mysql_result($query,$y,'pregunta');
            $r1=mysql_result($query,$y,'respuesta');
            $r2=mysql_result($query,$y,'f1');
            $r3=mysql_result($query,$y,'f2');
           echo" <tr> <th>$y</th><th>$pregunta</th><th>
           <select name='respuesta$y' id='respuesta$y' required=''>
           <option value='$r1'>$r1</option>
           <option value='$r2'>$r2</option>
           <option value='$r3'>$r3</option>
           </select>
           </th>   </tr>
           ";
        }
       echo"
    <tr><td colspan=3 align=Center><input type='submit' name='ok' id='ok' class='btn btn-lg btn-success' value='ok'> </td> </tr>
 </table>
 </form>
        </div>
        </div>";

    }

}
?>