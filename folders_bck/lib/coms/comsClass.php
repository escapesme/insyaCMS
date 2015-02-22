<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of com_projects
 *
 * @author empcl_000
 */

namespace libs\coms;

require_once('projectClass.php');

class comsClass {

    /**
     *
     * @var projectClass 
     */
    public $project = "";

    /**
     *
     * @var utillibsClass 
     */
    public $lib = "";

    public function __construct($lib) {
        $this->lib = $lib;
        $this->project = new projectClass($this->lib);
    }

}
