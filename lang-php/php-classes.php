<?php

abstract class pflanze {
    public function __construct()
    {
      print("Own: "); var_dump(get_class());         // ruft get_class() von pflanze auf
      print("This: "); var_dump(get_class($this));   // ruft get_class($o) mit object auf 
      printf("ID: %s\n", $this->getId());            // ruft getId() von object auf
    }                                                // object ist abgeleitet von pflanze

    public abstract function getId();                // abstracte Methode 
}

/**
 * Class fuchsia implementiert class pflanze
 */
class fuchsia extends pflanze {

  public function getId() {
    return "FUCHSIA_" . random_int(1000000, 9999999);
  }
}
     
new fuchsia;

// Cannot instantiate abstract class pflanze
// new pflanze;