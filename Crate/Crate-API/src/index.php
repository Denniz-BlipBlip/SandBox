<?php
require_once '../config/db.php';
init_db();
$db=get_db();
$items=$db->query('SELECT * FROM items')->fetchAll(PDO::FETCH_ASSOC);

header('Content-Type: application/json');
echo json_encode($items);
?>
