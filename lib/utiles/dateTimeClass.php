<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace libs\utiles;

class dateTimeClass {
    /* @var $lib  \libs\libs */

    var $lib = "";
    var $gen = "";

    public function __construct($lib, $gen) {

        $this->lib = $lib;
        $this->gen = $gen;
    }

    // <editor-fold defaultstate="collapsed" desc="DataBase">

    function dateTodb($data) {
        $newdate = explode('/', $data);

        if (isset($newdate) && $newdate[0] != "") {

            $dd = $newdate[2] . "-" . $newdate[1] . "-" . $newdate[0];
            $dd = str_replace('--', '', $dd);
        } else {

            $dd = $data;
        }
        return $dd;
    }

    function dateFromdb($data) {
        $newdate = explode('-', $data);
        if (isset($newdate) && $newdate[0] != "") {

            $l = explode(" ", $newdate[2]);

            $dt = $l[0] . "/" . $newdate[1] . "/" . $newdate[0];

            $dt = str_replace('//', '', $dt);
        } else {
            $dt = $data;
        }

        return $dt;
    }

    function dateTimeFromdb($data) {


        $datas = explode(' ', $data);

        $newdate = explode('-', $datas[0]);

        if (isset($newdate) && $newdate[0] != "") {

            $l = explode(" ", $newdate[2]);

            $dt = $l[0] . "/" . $newdate[1] . "/" . $newdate[0];

            $dt = str_replace('//', '', $dt);
        } else {
            $dt = $data;
        }

        return $dt ." ". $datas[1];
    }

    function updateDBDates($r, $type = "") {

        if ($type != "modified") {


            $r['created'] = date("Y-m-d H:i:s");
        }
        if ($type != "created") {

            $r['modified'] = date("Y-m-d H:i:s");
        }
        return $r;
    }

    function getDate($com) {



        $data = $this->db->get_Data($com, "DISTINCT  date", "`enabled`=1 and  `delete`=0");
        $returnData = "";


        foreach ($data as $A) {

            $date = $A['date'];
            $urlTag = $this->createURL($com, "date", $date);
            $returnData .= "<div class='blockitem item date'><a href='" . $urlTag . "'>" . $this->updateDate($date) . "</a></div>";
        }
        return $returnData;
    }

    // </editor-fold>





    function craeteDBDateTime() {
        return date("Y-m-d H:i:s");
    }

    function arabicDate() {
        $daysarabic = array('الأحد', 'الاثنين', 'الثلاثاء', 'الأربعاء', 'الخميس', 'الجمعة', 'السبت');
        $monarabic = array('', 'يناير', 'فبراير', 'مارس', 'أبريل', 'مايو', 'يونيو', 'يوليو', 'أغسطس', 'سبتمبر', 'أكتوبر', 'نوفمبر', 'ديسمبر');

        $time = strtotime("+8 hours");

        $date = getdate($time);
        $h = $date['hours'];
        if ($date['hours'] < 10) {

            $h = "0" . $date['hours'];
        }


        $m = $date['minutes'];
        if ($date['minutes'] < 10) {

            $m = "0" . $date['minutes'];
        }

        return $daysarabic[$date['wday']] . '، ' . $date['mday'] . '   ' . $monarabic[$date['mon']] . '  ' . $date['year'] . 'م -  ' . $h . ':' . $m . " القاهرة";
    }

    function updateDate($data) {
        $date = new DateTime($data);


        return $date->format(' l jS F Y');
    }

    function howManyDays($startDate, $endDate) {

        $date1 = strtotime($startDate . " 0:00:00");
        $date2 = strtotime($endDate . " 23:59:59");
        $res = (int) (($date2 - $date1) / 86400);

        return $res;
    }

    function howManyDaysTime($startDate, $endDate) {

        $date1 = strtotime($startDate);
        $date2 = strtotime($endDate);
        $res = (int) (($date2 - $date1) / 86400);

        return $res;
    }

    function dateStrtotime($startDate, $todb = false) {
        if ($todb) {

            $startDate = $this->dateTodb($startDate);
        }
        return strtotime($startDate . " 0:00:00");
    }

}
