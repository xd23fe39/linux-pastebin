<?php

/**
 * PHP Umgebung setzen (Wichtig für Kommandozeilen-Skripte)
 * 
 */
date_default_timezone_set("Europe/Berlin");
ini_set('memory_limit', '-1');
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ERROR | E_WARNING | E_PARSE);

/**
 * Einbinden weiterer wichtiger Bibliotheken und Module.
 * 
 * Beispiel:
 *      require_once 'lib/other-php-lib.php';
 */

/**
 * PHP_MYLIB Klasse mit statischen Methoden.
 * 
 * Aufruf:
 *      require_once 'php-mylib.php';
 *      PHP_MYLIB::printCurrentTime();
 */
class PHP_MYLIB {

    static public $rt_dt_start;

    const DATETIME_FORMAT = 'Y-m-d H:i:s';

    function __construct($dt = NULL) {

        if ( empty($dt) )
            $this->rt_dt_start = microtime();

    }

    public static function printCurrentTime() {

        printf("%s", date(PHP_MYLIB::DATETIME_FORMAT, time()));
    }

    public static function init() {

        PHP_MYLIB::$rt_dt_start = microtime();
    }

    public static function getRuntimeStart() {
        return PHP_MYLIB::$rt_dt_start;
    }
}
