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

    function dateFormFormatToFormat($date, $From, $tow) {

        //$date = date_create_from_format("d/m/Y", $date);
        //return ($date);
    }

    // <editor-fold defaultstate="collapsed" desc="DataBase">






    function dataFormat($date, $format = 'Y-m-d') {

        $date = str_replace('/', '-', $date);
        $dd = date($format, strtotime($date));
        return $dd;
    }

    function dateTodb($date) {

        return $this->dataFormt($date);
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

    function dateFromdbnew($data) {
        $date = date_create_from_format("d/m/Y", $data);
        return ($date);
    }

    function dateTimeFromdb($data) {

        /*
          $datas = explode(' ', $data);

          $newdate = explode('-', $datas[0]);

          if (isset($newdate) && $newdate[0] != "") {

          $l = explode(" ", $newdate[2]);

          $dt = $l[0] . "/" . $newdate[1] . "/" . $newdate[0];

          $dt = str_replace('//', '', $dt);
          } else {
          $dt = $data;
          }

         */



        return $dt . " " . $datas[1];
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

    function createDateRangeArray($strDateFrom, $strDateTo, $Backformat = "Y-m-d") {
        // takes two dates formatted as Y-m-d and creates an
        // inclusive array of the dates between the from and to dates.
        // could test validity of dates here but I'm already doing
        // that in the main script

        $aryRange = array();

        $iDateFrom = mktime(1, 0, 0, substr($strDateFrom, 5, 2), substr($strDateFrom, 8, 2), substr($strDateFrom, 0, 4));
        $iDateTo = mktime(1, 0, 0, substr($strDateTo, 5, 2), substr($strDateTo, 8, 2), substr($strDateTo, 0, 4));


        echo $strDateFrom;

        if ($iDateTo >= $iDateFrom) {
            array_push($aryRange, date($Backformat, $iDateFrom)); // first entry
            while ($iDateFrom < $iDateTo) {
                $iDateFrom+=86400; // add 24 hours
                array_push($aryRange, date($Backformat, $iDateFrom));
            }
        }
        return $aryRange;
    }

}
