<?php
require_once '../config/db.php';
initDB();
$db = getDB();
$users = $db->query('SELECT * FROM users')->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Crate</title>
  <link rel="stylesheet" href="../public/css/style.css">
</head>
<body>
  <h1>Hello from Crate!</h1>
  <ul>
    <?php foreach($users as $user): ?>
      <li><?= htmlspecialchars($user['name']) ?></li>
    <?php endforeach; ?>
  </ul>
  <script src="../public/js/main.js"></script>
</body>
</html>
