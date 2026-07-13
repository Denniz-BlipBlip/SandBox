<?php

function get_db()
{
  try 
  {
    $db=new PDO('mysql:host=localhost;db_name=crate_db','root','');
    $db->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
    return $db;
  }
  catch(PDOException $e)
  {
    die(json_encode(['error'=>$e->getMessage()]));
  }
}
