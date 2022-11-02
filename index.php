<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz</title>
</head>
<body>
<?php
            $con = new mysqli("127.0.0.1","root","","mydb");
            $pytania = $con -> query("SELECT id,content FROM questions");
            $odpowiedzi = $con -> query("SELECT content,questions_id,is_right FROM answers");
 
            echo '<form method="POST" action="wynik.php">';
            $tabelapytan = $pytania->fetch_all(MYSQLI_ASSOC);
            $tabelaodpowiedzi = $odpowiedzi->fetch_all(MYSQLI_ASSOC);
 
            for($z=0;$z<count($tabelapytan);$z++)
            {
            echo '<div class="styl"><b>pytanie '.$z.': '.$tabelapytan[$z]["content"].'</b><br>';
                for($i=0;$i<count($tabelaodpowiedzi);$i++)
                {
                    if($tabelaodpowiedzi[$i]["questions_id"]==$tabelapytan[$z]["id"])
                    {
                        echo ''. $tabelaodpowiedzi[$i]["content"].'<input type="checkbox" name="q'.$z.'a'.$i.'" value="'.$tabelaodpowiedzi[$i]["is_right"].'"><br>';
                    }
                }
            }
            echo '<input type="submit"></form><br>';
        ?>
</body>
</html>