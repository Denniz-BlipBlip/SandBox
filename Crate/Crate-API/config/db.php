<?php 

function get_db()
{
  try
  {
    $db=new PDO('mysql:host=localhost;dbname=crate_db','root','');
    $db->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
    return $db;
  }
  catch(PDOException $e)
  {
    die(json_encode(['error'=>$e->getMessage()]));
  }
}

function init_db()
{
  $db=get_db();
  $db->exec("CREATE TABLE IF NOT EXISTS items 
  (
    id AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    price DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT_TIMESTAMP
  )");
}
