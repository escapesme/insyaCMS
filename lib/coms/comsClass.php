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
require_once('faizClass.php');
require_once('getData.php');
require_once('getMobileData.php');

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

    /**
     *
     * @var faizClass 
     */
    public $faiz = "";

    /**
     *
     * @var getData 
     */
    public $getData = "";

    /**
     *
     * @var getmobileData 
     */
    public $getMobileData = "";

    public function __construct($lib) {
        $this->lib = $lib;
        $this->project = new projectClass($this->lib);
        $this->faiz = new faizClass($this->lib);
        $this->getData = new getData($this->lib);
      //  $this->getMobileData = new getMobileData($this->lib);
    }

    function getExtensionLastDate($ids) {

        $r;



        return $r;
    }

}
