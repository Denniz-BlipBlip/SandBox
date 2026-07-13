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
  $db->exec("CREATE TABLE IF NOT EXISTS users 
  (
    id INT  AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  )");
}
