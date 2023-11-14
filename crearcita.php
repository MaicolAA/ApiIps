<?php
require_once 'db.php';

$db = new DB();
$conn = $db->connect();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id_cita = $_POST['id_cita'];
    $id_usuario = $_POST['id_usuario'];
    $especialidad = $_POST['especialidad'];
    $id_medico = $_POST['id_medico'];
    $fecha_hora_cita = $_POST['fecha_hora_cita'];

    $sql = "INSERT INTO citas (id_cita, id_usuario, id_medico, especialidad, fecha_hora_cita, estado_cita) 
    VALUES
    (10, 101, 201, 'Cardiología', '2023-11-15 10:00:00', 'Confirmada');";

    $result = $conn->query($sql);

    if ($result->num_rows > 0) {

        http_response_code(200);
        echo json_encode("cita mela");
    } else {
        http_response_code(500);
        echo "Error";
    }
}
?>
