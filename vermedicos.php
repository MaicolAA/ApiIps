<?php
require_once 'db.php';

$db = new DB();
$conn = $db->connect();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id_especialidad = $_POST['id_especialidad'];

    $sql = "SELECT * FROM medico WHERE id_especialidad = '$id_especialidad'";

    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $medicos = array();


        $row = $result->fetch_assoc();
        $medico = array(
            'id_medico' => $row['id_medico'],
            'id_espacio' => $row['id_espacio'],
            'nombre' => $row['nombre'],
            'apellido' => $row['apellido'],
            'id_especialidad' => $row['id_especialidad'],
            'correo_electronico' => $row['correo_electronico']
        );
        $medicos[] = $medico;

        
        while ($row = $result->fetch_assoc()) {
            $medico = array(
                'id_medico' => $row['id_medico'],
                'id_espacio' => $row['id_espacio'],
                'nombre' => $row['nombre'],
                'apellido' => $row['apellido'],
                'id_especialidad' => $row['id_especialidad'],
                'correo_electronico' => $row['correo_electronico']
            );
            $medicos[] = $medico;
        }

        http_response_code(200);
        echo json_encode(array("medicos" => $medicos));
    } else {
        http_response_code(500);
        echo "Error";
    }
}
?>
