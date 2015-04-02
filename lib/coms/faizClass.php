<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of faizClass
 *
 * @author empcl_000
 */

namespace libs\coms;

class faizClass {
    /* @var $lib  \libs\libs */

    var $lib;
    var $userId;

    public function __construct($lib) {
        $this->lib = $lib;
    }

    // <editor-fold defaultstate="collapsed" desc="fiz_extension">


    function getLastEX($RESID, $user_id) {
        /* @var $lib  libs\libs */
        global $lib;
        $where = "reservation_id='" . $RESID . "' and user_id='" . $user_id . "' and   `delete`=0  and enabled='1'  ORDER BY id DESC";
        return $lib->db->get_row("fiz_extension", "*", $where);
    }

    function getFristEX($RESID, $user_id) {
        /* @var $lib  libs\libs */
        global $lib;
        $where = "reservation_id='" . $RESID . "' and user_id='" . $user_id . "' and   `delete`=0  and enabled='1'  ORDER BY id ASC";
        return $lib->db->get_row("fiz_extension", "*", $where);
    }

    function deleteEX($RESID, $user_id) {
        /* @var $lib  libs\libs */
        global $lib;
        $where = "reservation_id='" . $RESID . "' and user_id='" . $user_id . "'";
        $deldata = array("delete" => "1");
        return $lib->db->update_data("fiz_extension", $deldata, $where);
    }

    function isPaid($RESID, $user_id) {
        /* @var $lib  libs\libs */
        global $lib;
        $where = "reservation_id='" . $RESID . "' and user_id='" . $user_id . "'";
        $data = $lib->db->get_data("fiz_extension", "*", $where);
        $r = false;
        foreach ($data as $d) {
            if ($d['ex_paid'] == "1") {

                $r = true;
                break;
            }
        }
        return $r;
    }

    function exPaid($ex_id, $status = "1") {
        /* @var $lib  libs\libs */
        global $lib;
        $idata = array(
            "ex_paid" => $status
        );
        return $lib->db->update_row("fiz_extension", $idata, $ex_id);
    }

    // 
    // </editor-fold>





    function saveUser($data) {
        /* @var $lib  \libs\libs */
        global $lib;
        $u = $lib->db->get_row("com_fiz_users", "*", "Mumin_id='" . $data['Mumin_id'] . "'");




        if (is_array($u)) {
            $lib->db->update_row("com_fiz_users", $data, $u['user_id']);
            $id = $u['user_id'];
        } else {
            $u = $lib->db->insert_row("com_users", $data);
            $rdata = $lib->db->get_row("com_users", "max(id) as id");
            $data['user_id'] = $rdata['id'];
            $u = $lib->db->insert_row("com_fiz_users", $data);
            $id = $rdata['id'];
        }


        print_r($id);
        return $id;
    }

    function getUserDataByMumin_id($uid) {
        $r = FALSE;
        /* @var $lib  \libs\libs */
        global $lib;
        $u = $lib->db->get_row("com_fiz_users", "*", "Mumin_id='" . $uid . "'");
        if (is_array($u)) {
            $o = $lib->db->get_row("com_users", "*", "id='" . $u['user_id'] . "'");
            $r = array_merge($u, $o);
        }

        return $r;
    }

    function getUserDataByID($uid) {
        $r = FALSE;
        /* @var $lib  \libs\libs */
        global $lib;


        $u = $lib->db->get_row("com_users", "*", "id='" . $uid . "'");

        if (is_array($u)) {
            $o = $lib->db->get_row("com_fiz_users", "*", "user_id='" . $u['id'] . "'");
            $r = array_merge($u, $o);
        }

        
             //   print_r($r);

        return $r;
    }

    function createReservationID() {
        /* @var $lib  \libs\libs */
        global $lib;
        $mdata = $lib->db->get_maxrow("fiz_reservation");


        $d = $mdata['reservation_id'];
        $d++;



        return sprintf("%04s", $d);
    }

    function serach($name = "mumin_id", $field = "Mumin_id") {
        /* @var $lib  \libs\libs */
        global $lib;

        $where_user = $this->returns($name, $field);



        $where = "";
        if (trim($where_user) != "") {

            $userDatas = $lib->db->get_data("com_users", '*', $where_user);

            foreach ($userDatas as $d) {


                $mor = "";
                $rdata = $lib->db->get_row("fiz_reservation", '', "user_id=" . $d['id']);



                if (isset($rdata['reservation_id'])) {
                    if ($i > 0) {
                        $mor = " or ";
                    }



                    $where .= $mor . " reservation_id=" . $rdata['reservation_id'];
                    $i++;
                }
            }




            $where = " (" . $where . ") ";
        }
        return $where;
    }

    function getGoustType($ejdata) {


        if ($ejdata['Age'] > 12) {
            $type = "Adult";
            $types = "a";
        } else if ($ejdata['Age'] < 2) {
            $types = "f";
            $type = "Infant";
        } else if ($ejdata['Age'] < 12) {
            $types = "c";
            $type = "Child";
        }

        return $type;
    }

    function hasVoucher($reservation_id) {
        /* @var $lib  libs\libs */
        global $lib;
        $where = "reservation_id='" . $reservation_id . "'";


        $data = $lib->db->get_row("fiz_voucher_xref", "*", $where);
        $r = false;

        if (is_array($data)) {
            $r = true;
        }
        return $r;
    }

    function getVoucher($reservation_id) {
        /* @var $lib  libs\libs */
        global $lib;
        $where = "reservation_id='" . $reservation_id . "'";

        $data = $lib->db->get_row("fiz_voucher_xref", "*", $where);

        return $lib->db->get_row("fiz_voucher", "*", "id=" . $data['voucher_id']);
    }

    function addVoutcher($id, $vid, $rooms_data, $remarks, $hotel_id, $v_checkin, $v_checkout, $status) {

        /* @var $lib  libs\libs */
        global $lib;

        if ($vid == "") {

            $idata = array(
                "v_checkin" => $v_checkin,
                "v_checkout" => $v_checkout,
                "hotel_id" => $hotel_id,
                "remarks" => $remarks,
                "rooms_data" => $rooms_data
            );

            $lib->db->insert_row("fiz_voucher", $idata);
            $max = $lib->db->get_maxrow("fiz_voucher");
            $vid = $max['id'];
        }


        $xdata = array(
            "reservation_id" => $id,
            "voucher_id" => $vid, "status" => $status
        );

        $lib->db->insert_row("fiz_voucher_xref", $xdata);


        return $vid;
    }

    function minDateFromIDS($ids, $type = "ex_checkout", $row = "last") {
        /* @var $lib  libs\libs */
        global $lib;

        $returnData = "";
        foreach ($ids as $id) {
            $fiz_reservation = $lib->db->get_row("fiz_reservation", "*", "id='" . $id . "'");
            if ($row == "last") {

                $ex = $this->getLastEX($id, $fiz_reservation['user_id']);
            } else {

                $ex = $this->getFristEX($id, $fiz_reservation['user_id']);
            }


            if ($lib->util->dateTime->dateStrtotime($ex[$type]) < $lib->util->dateTime->dateStrtotime($returnData) || $returnData == "") {

                $returnData = $ex[$type];
            }
        }

        return $returnData;
    }

    function maxDateFromIDS($ids, $type = "ex_checkout", $row = "last") {
        /* @var $lib  libs\libs */
        global $lib;

        $returnData = "";


        foreach ($ids as $id) {
            $fiz_reservation = $lib->db->get_row("fiz_reservation", "*", "id='" . $id . "'");
            if ($row == "last") {

                $ex = $this->getLastEX($id, $fiz_reservation['user_id']);
            } else {

                $ex = $this->getFristEX($id, $fiz_reservation['user_id']);
            }





            if ($lib->util->dateTime->dateStrtotime($ex[$type]) > $lib->util->dateTime->dateStrtotime($returnData) || $returnData == "") {


                $returnData = $ex[$type];
            }
        }

        return $returnData;
    }

    function returns($name, $field) {


        if (isset($_GET[$name])) {

            $vs = explode(",", $_GET[$name]);
            $i = 0;

            $dm = " ( ";
            foreach ($vs as $v) {
                $mor = "";

                if ($i > 0) {
                    $mor = " or ";
                }

                $dm .= $mor . " " . $field . "='" . $v . "'";

                $i++;
            }

            $dm .= " ) ";
        }

        return $dm;
    }

// <editor-fold defaultstate="collapsed" desc="fiz_lawazim_packages">

    function getPkgData($id = "", $where = "") {
        if ($id != "") {
            $where = "id='" . $id . "'";
        }
        return $this->lib->db->get_row("fiz_lawazim_packages", "*", $where);
    }

    function getPkgCategory($id = "", $where = "") {


        $data = $this->getPkgData($id, $where);
        return $data['cat_id'];
    }

// </editor-fold>
}
