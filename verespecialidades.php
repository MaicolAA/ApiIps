<?php
require_once 'db.php';

$db = new DB();
$conn = $db->connect();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $sql = "SELECT * FROM especialidades";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $especialidades = array();

        
        $row = $result->fetch_assoc();

        $especialidad = array(
            'id_especialidad' => $row['id_especialidad'],
            'nombre_especialidad' => $row['nombre_especialidad']
        );

        $especialidades[] = $especialidad;

        
        while ($row = $result->fetch_assoc()) {
            $especialidad = array(
                'id_especialidad' => $row['id_especialidad'],
                'nombre_especialidad' => $row['nombre_especialidad']
            );
            $especialidades[] = $especialidad;
        }

        http_response_code(200);
        echo json_encode(array("especialidades" => $especialidades));
    } else {
        http_response_code(500);
        echo "Error";
    }
}
?>
