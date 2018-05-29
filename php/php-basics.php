<?php
exit(0);   // Beende mit Fehlercode 0

// PHP Umgebung setzen (Wichtig für Kommandozeilen-Skripte)
date_default_timezone_set("Europe/Berlin");
ini_set('memory_limit', '-1');
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ERROR | E_WARNING | E_PARSE);

// In das Verzeichnis des aktuellen Scriptes wechseln
define("BASEDIR", dirname(__FILE__));
chdir(BASEDIR);

// Importieren von Modulen oder Konfigurationsdateien
require_once _BASE."/conf/myconf.conf";

// Einfache Datentypen
$num = 5                       // Ganzzahl int
$float = 3.1415                // Fließkommazahl (float, double)
$str = "This is $name\n";      // Zeichenkette
$lit = 'This is text';         // Zeichenliteral 

// IF-Bedingungen ==, !=, >, <, <=, >=, &&, ||
if ($a == $b) echo "equal"; else echo "not-equal";

// Arrays
$arr = array(1, 2, 3, 4);       // einfaches Datenfeld (Liste) von Zahlenwerten
$list = array(                  // Hash-Array mit Name => Werte - Paaren
    'name' => "Joe", 
    'mail' => "joe@mail.com");
print_r($arr);                  // Ausgabe des Array-Inhalts
$c = count($arr);               // Anzahl Elemente des Arrays

// for and foreach
for ($i = 0; $i < $cnt; $i++) echo "$i\n";
foreach ($arr as $num) { echo "$num\n"; }
foreach ($argv as $opt) { echo "$opt\n"; }

// Switch
switch ($in) {
    case "a":
        echo "first";
        break;
    case "b": case "c":
        echo "other";
        break;
  default:
        break;
}

// Funktionen

function get_item($name = "name") { return $list[$name] };

// MySQL Beispiel

$mysql_server = "mysql_server";
$mysql_database = "mysql_database";
$mysql_user = "mysql_user";
$mysql_password = "mysql_password";   			

$mysql_link = mysql_connect(
	$mysql_server, 
	$mysql_user,
	$mysql_password );

if ( !$mysql_link )
	die("HRSync: Datenbankverbindung konnte nicht hergestellt werden!");

if ( !mysql_select_db($mysql_database, $mysql_link) )
	die("HRSync: Datenbank konnte nicht selektiert werden!");

if ( !$res = mysql_query($sql, $mysql_link))
	die("Fehler bei SQL-Query $stmt_date (".mysql_errno()."): " . mysql_error());

while ($row = mysql_fetch_assoc($res)) {
	echo $row["fieldname"] . "\n";
}

mysql_close($mysql_link);

?>
