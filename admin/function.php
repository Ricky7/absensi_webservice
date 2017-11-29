<?php

function get_total_all_records()
{
 include('../class/DBConnect.php');
 $statement = $db->prepare("SELECT * FROM tbdosen");
 $statement->execute();
 $result = $statement->fetchAll();
 return $statement->rowCount();
}

?>