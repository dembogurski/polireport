
<?php

/**
 * Description of Index.php
 * @author Ing.Douglas
 * @date 25/09/2018
 */
require_once("Y_DB_MySQL.class.php");
require_once("Y_Template.class.php");

class Index{

    function __construct() {
        $action = $_REQUEST['action'];
        if (function_exists($action)) {
            call_user_func($action);
        } else {
            $this->main();
        }
    }

    function main() {
        $t = new Y_Template("index.html");
        $t->Show("header");
        $t->Show("body");
        $t->Show("footer");
    }
}
new Index();

?>
