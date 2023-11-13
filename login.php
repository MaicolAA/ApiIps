<?php
require_once 'db.php';

$db = new DB();

$conn = $db->connect();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $correo_electronico = $_POST['correo_electronico'];
    $contrasena = $_POST['contrasena'];

    
    $sql = "SELECT * FROM usuario WHERE correo_electronico = '$correo_electronico'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();

            
        if (password_verify($contrasena, $row['contrasena'])) 
        {
            $idrol = $row["id_rol"];

            $sql2 = "SELECT name_rol from rol where id_rol = '$idrol'";
            $result2 = $conn->query($sql2);

            if($result2->num_rows > 0) 
            {
                $row2 = $result2->fetch_assoc();
                $name_rol = $row2["name_rol"];

            }


            $usuario = array(
                'id_usuario' => $row['id_usuario'],
                'nombre' => $row['nombre'],
                'apellido'=> $row['apellido'],
                'telefono'=> $row['telefono'],
                'correo_electronico'=> $row['correo_electronico'],
                'contrasena'=> $row['contrasena'],
                'name_rol'=> $name_rol

                
            );
            http_response_code(200); 
            echo json_encode(array("usuario" => $usuario));
        } 
        else 
        {
            http_response_code(500);
            echo "Contraseña incorrecta";
        }
    } else {

        http_response_code(500);
        echo "Usuario no encontrado";
    }
}
?>
