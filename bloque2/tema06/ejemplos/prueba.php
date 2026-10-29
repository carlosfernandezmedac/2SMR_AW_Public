<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>¿Funciona PHP?</title>
</head>
<body>
    <h1>Prueba de XAMPP</h1>
    <?php
        echo "<p>Si lees esto, Apache y PHP funcionan.</p>";
        echo "<p>Versión de PHP: " . phpversion() . "</p>";
        echo "<p>Hoy es " . date("d/m/Y") . "</p>";
    ?>
</body>
</html>
