<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wynik</title>
    <link rel="stylesheet" href="style.css">
</head>
<body style="text-align: center;">
    <?php
        $suma = 0;
        foreach($_POST as $key => $value)
        {
            $suma=$suma+$value;
        }
        echo "Suma punktów które zdobyles=$suma"
    ?>
</body>
</html>