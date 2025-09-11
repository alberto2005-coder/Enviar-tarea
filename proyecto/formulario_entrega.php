<?php
$conn = new mysqli("127.0.0.1", "root", "password", "tareas_db", 3306);

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Recibir datos del formulario
$usuario = $_POST['usuario'];
$cargo = $_POST['cargo'];
$estado = $_POST['estado'];
$fecha_inicio = $_POST['fechaInicio'];
$fecha_fin = $_POST['fechaFin'];
$dentro_tiempo = $_POST['dentroTiempo'];
$descripcion = $_POST['descripcion'];
$tarea_padre = isset($_POST['tareaPadre']) && $_POST['tareaPadre'] !== "Ninguna" ? $_POST['tareaPadre'] : NULL;
$tipos_tarea = isset($_POST['tipoTarea']) ? $_POST['tipoTarea'] : [];

// Evitar comas en los datos
$usuario = str_replace(',', '', $usuario);
$descripcion = str_replace(',', '', $descripcion);

// Verificar si el usuario ya existe
$sql = "SELECT id FROM usuarios WHERE nombre = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $usuario);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $usuario_id = $row['id'];
} else {
    $sql = "INSERT INTO usuarios (nombre, cargo) VALUES (?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $usuario, $cargo);
    $stmt->execute();
    $usuario_id = $stmt->insert_id;
}

// Insertar la tarea
$sql = "INSERT INTO tareas (usuario_id, estado, fecha_inicio, fecha_fin, dentro_tiempo, descripcion) 
        VALUES (?, ?, ?, ?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("iissss", $usuario_id, $estado, $fecha_inicio, $fecha_fin, $dentro_tiempo, $descripcion);
$stmt->execute();
$tarea_id = $stmt->insert_id;

// Insertar los tipos de tarea seleccionados
if (!empty($tipos_tarea)) {
    foreach ($tipos_tarea as $tipo) {
        $sql = "INSERT INTO tarea_tipos (tarea_id, tipo_id) 
                SELECT ?, id FROM tipos_tarea WHERE nombre = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("is", $tarea_id, $tipo);
        $stmt->execute();
    }
}
// Insertar la tarea padre seleccionada
if (!empty($tarea_padre) && $tarea_padre !== "Ninguna") {
    
    $sql = "SELECT id FROM tareas_padre WHERE nombre = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $tarea_padre);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $tarea_padre_id = $row['id'];
    } else {
        $sql = "INSERT INTO tareas_padre (nombre) VALUES (?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s", $tarea_padre);
        $stmt->execute();
        $tarea_padre_id = $stmt->insert_id;
    }

    $sql = "INSERT INTO tarea_padre (tarea_id, padre_id) VALUES (?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ii", $tarea_id, $tarea_padre_id);
    $stmt->execute();
} 


$conn->close();
echo "Tarea registrada correctamente.";
?>
