<?php
require_once 'DB.php'; 

$db = new DB();
$conn = $db->connect();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id_usuario = $_POST['id_usuario'];
    $nombre = $_POST['nombre'];
    $apellido = $_POST['apellido'];
    $telefono = $_POST['telefono'];
    $correo_electronico = $_POST['correo_electronico'];
    $contrasena = $_POST['contrasena'];
    $id_rol = $_POST['id_rol'];


    $hashed_password = password_hash($contrasena, PASSWORD_DEFAULT);

    $sql = "INSERT INTO usuario (id_usuario, nombre, apellido, telefono, correo_electronico, contrasena, id_rol) 
            VALUES ('$id_usuario', '$nombre', '$apellido', '$telefono', '$correo_electronico', '$hashed_password', '$id_rol')";

    if ($conn->query($sql) === TRUE) {
        echo "Registro exitoso";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}
?>
