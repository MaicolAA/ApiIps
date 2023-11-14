<?php
require_once 'db.php';

$db = new DB();
$conn = $db->connect();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id_medico = $_POST['id_medico'];

    $sql = "SELECT  *
    FROM horario
    WHERE CONCAT(dia, ' ', hora_inicio) NOT IN (
        SELECT DATE_FORMAT(fecha_hora_cita, '%Y-%m-%d %H:%i:%s') 
        FROM citas where id_medico = '$id_medico'
    );
    ";

    $result = $conn->query($sql);

    
    

    if ($result->num_rows > 0) {
        $horarios = array();

        while ($row = $result->fetch_assoc()) {
            $horario = array(
                'id_horario' => $row['id_horario'],
                'id_medico' => $row['id_medico'],
                'dia' => $row['dia'],
                'hora_inicio' => $row['hora_inicio'],
                'hora_fin' => $row['hora_fin']
            );
    
            $horarios[] = $horario;
        }

        http_response_code(200);
        echo json_encode(array("horarios" => $horarios));
    } else {
        http_response_code(500);
        echo "Error";
    }

}
?>
