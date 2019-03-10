<?php 

// PHP Umgebung setzen (Kommandozeile)
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ERROR | E_WARNING | E_PARSE);

// Verzeichnis des Scriptes als aktuelles Verzeichnis setzen
define("BASEDIR", dirname(__FILE__));
chdir(BASEDIR);

// Vollständiger Dateiname
$tempfile = BASEDIR . "/tempfile.dat";

// Pfad ausgeben
printf("Basedir: %s\n", BASEDIR);

// Prüfe, ob Datei existiert
if (file_exists($tempfile)) {
    printf("Fehler: Datei %s bereits vorhanden!\n", $tempfile);
    exit(2);
}

// Erzeuge Datei und schreibe Datensätze
if ($filehandle = fopen($tempfile, 'w+')) {
    for ($i=0; $i < 100; $i++) { 
        fwrite($filehandle, "Write a new Line $i into the file.\n");
    }
    fclose($filehandle);
}
else
    printf("Fehler beim Anlegen der Datei!\n");

// Datei zeilenweise ausgeben
if ($filehandle = fopen($tempfile, 'r')) {
    $n = 1;
    while ( $line = fgets($filehandle) ) {
        printf("%5d: %s", $n++, $line);
    }
    fclose($filehandle);
}

// See also: fgetscsv, fputscsv

// PHP-END