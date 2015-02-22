<?php

/*
 * Project :Scape
 * Version 2.0.1 2012
 * Copyright E-Scapes IT Solutions
 * Authors: IMI, AD, AMV
 * 
 */

namespace libs;

require_once($myurl . 'config.php');
require_once('utiles/DBClass.php');
require_once('utiles/utilClass.php');
require_once('utiles/rssClass.php');
require_once('utiles/formsClass.php');
require_once('options/configClass.php');
require_once('options/foldersMap.php');
require_once('options/Messages.php');
require_once('options/variablesClass.php');
require_once('options/DBTables.php');
require_once('admin/adminClass.php');





require_once('engine/adminEngClass.php');

require_once('engine/adminV2EngClass.php');


require_once('engine/colltionsClass.php');
require_once('engine/frontEngClass.php');
require_once('engine/pluginsClass.php');
require_once('engine/usersClass.php');
require_once('engine/userPanelClass.php');
require_once('engine/smsClass.php');

require_once('coms/comsClass.php');

class Libs {

    /**
     * @var utiles\dbClass
     */
    public $db;

    /**
     * @var options\configClass
     */
    public $config;

    /**
     * @var utiles\formsClass
     */
    public $forms;

    /**
     * @var options\foldersMap
     */
    public $foldersMap;

    /**
     * @var options\Messages
     */
    public $Messages;

    /**
     * @var engine\adminEngClass
     */
    public $adminEng;

    /**
     * @var engine\adminV2EngClass
     */
    public $adminv2;

    /**
     * @var admin\adminClass
     */
    public $admin;

    /**
     * @var engine\frontEngClass
     */
    public $front;

    /**
     * @var options\variablesClass
     */
    public $variables;

    /**
     * @var options\DBTables
     */
    public $DBTables;

    /**
     * @var utiles\utilClass
     */
    public $util;

    /**
     * @var engine\pluginsClass
     */
    public $plugins;

    /**
     * @var utiles\rssClass
     */
    public $rss;

    /**
     * @var engine\colltionsClass
     */
    public $colltions;

    /**
     * @var engine\usersClass
     */
    public $users;

    /**
     * @var engine\userPanelClass
     */
    public $userPanel;

    /**
     * @var coms\comsClass
     */
    public $coms;

    /**
     * @var  engine\smsClass
     */
    public $sms;

    function __construct() {
        $this->foldersMap = new options\foldersMap();
        $this->config = new options\configClass();
        $this->variables = new options\variablesClass();
        $this->Messages = new options\Messages();
        $this->DBTables = new options\DBTables();
        $this->db = new utiles\dbClass($this->config->setting['db_host'], $this->config->setting['db_user'], $this->config->setting['db_pass'], $this->config->setting['db_name']);
        $this->util = new utiles\utilClass($this);
        $this->plugins = new engine\pluginsClass($this->config, $this->util, $this->foldersMap);
        $this->forms = new utiles\formsClass($this);
        $this->users = new engine\usersClass($this);
        $this->userPanel = new engine\userPanelClass($this);


        $this->admin = new admin\adminClass($this);
        $this->adminEng = new engine\adminEngClass($this->config, $this->foldersMap, $this->Messages, $this->db, $this->util, $this->admin, $this->variables, $this->users);

        $this->adminv2 = new engine\adminV2EngClass($this);
        $this->colltions = new engine\colltionsClass($this);

        $this->sms = new engine\smsClass($this);




        $this->rss = new utiles\rssClass($this->db, $this->util);
        $this->front = new engine\frontEngClass($this);

        $this->coms = new coms\comsClass($this);
    }

}

/**
 * @var libs\Libs
 */
$lib = new Libs();
$lib->db->connect();
$lib->util->uitlStrat();
?>