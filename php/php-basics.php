<?php
exit(0);   // Beende mit Fehlercode 0

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

?>
