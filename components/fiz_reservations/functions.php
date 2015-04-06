<?php
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

session_start();

function fiz_reservations_returnData($p, $l, $oid, $odata) {

    return fiz_razaTypes($p, $l, $oid, $odata);
}

function fiz_reservations_login($p, $l) {

    /* @var $lib  \libs\libs */
    global $lib;

    $r = "";


    $r .= '<h2>' . $l['lgoinmsg'] . '</h2>';

    $filds = array(
        "its_id" => array(
            "type" => "text",
            "pclass" => " _50",
            "title" => "its_id",
            "name" => "its_id"
        ), "" => array(
            "type" => "button",
            "pclass" => " _100",
            "class" => "",
            "title" => $l['lgoinsubmit'], "value" => $l['lgoinsubmit'],
            "name" => "its_id"
            , "moreAttra" => "data-to='/FizReservations/' data-do='login' "
        )
    );
    $lib->forms->filds = $filds;
    $r .= $lib->forms->_render_form();





    return $r;
}

function fiz_reservations_craeteData($p, $l, $oid) {
    /* @var $lib  \libs\libs */
    global $lib;



   // $ds = $lib->db->get_data("fiz_reservation", "*", "booking_owner='" . $oid . "' and Approved='1'");




   // $odata = $lib->db->get_row("com_users", "*", "id='" . $oid . "'");




    $r .= '<h2> Step 1: Update ArrivalDetails</h2>';
         
     $r.= $lib->forms->getFiledsFormStrign("db", "com_form","12", "data", "0");

// 


/*

    $filds = array(
        "mobile" => array(
            "type" => "text",
            "pclass" => " _50",
            "title" => "Contact Number",
            "name" => "mobile", "value" => $odata['mobile']
        ), "email" => array(
            "type" => "text",
            "pclass" => " _50",
            "title" => "email",
            "name" => "Email",
            "value" => $odata['email']
        ), "forall" => array(
            "type" => "button",
            "pclass" => " _100",
            "class" => "forall",
            "value" => $l['forall']
        )
    );
    $lib->forms->filds = $filds;
    $r .= $lib->forms->_render_form();


    foreach ($ds as $d) {

        $uds = $lib->db->get_row("com_users", "*", "id='" . $d['user_id'] . "'");
        $r.= "<div class='razaform'>";
        $r.= "<h2>" . $uds['FullName'] . "</h2>";

        $ex_data = $lib->db->get_row("fiz_extension", "*", "reservation_id='" . $d['id'] . "'");

        if (isset($_SESSION['formraza'][$d['id']])) {
            $olddata = $_SESSION['formraza'][$d['id']];
        } else if (is_array($ex_data)) {


            $olddata = array_merge($ex_data, $d);
            $olddata['ex_checkin'] = $lib->util->dateTime->dateFromdb($olddata['ex_checkin']);
            $olddata['ex_checkout'] = $lib->util->dateTime->dateFromdb($olddata['ex_checkout']);
        }




        $r.= fiz_reservations_addform($p, $l, $d['id'], $olddata);




        $r.= "</div>";
    }



    $filds = array(
        "remarks" => array(
            "type" => "textarea",
            "pclass" => " _100",
            "title" => "remarks",
            "name" => "remarks",
            "value" => $d['remarks']
        )
    );
    $lib->forms->filds = $filds;
    $r .= $lib->forms->_render_form();





    if (getviewmodules($oid, "lawazim")) {
        $n = "pkgs-raza";
    } else {
        $n = "view-raza";
    };

*/
    $r .= "<div class='buts'><input  type='button' value='Back' data-to='/FizReservations/'  class='next_back'/>";


    $r .= "<input  type='button' value='Next'  data-to='/do/$n/FizReservations/' data-do='addtosesstion'  class=''/></div>";






    return $r;
}

function fiz_razaTypes($p, $l, $oid, $odata) {
    /* @var $lib  \libs\libs */
    global $lib;

    $datas = $lib->db->get_data("fiz_raza_types");

    global $ressettings;



    $ds = $lib->db->get_row("fiz_reservation", "*", "booking_owner='" . $odata['id'] . "'   ");



    $a = "";
    $b = "";

  



      $r .= "<input  type='button' value='Next'  data-to='/do/create/FizReservations/' class=''/>";

    $r .=fiz_raza_its_date($p, $l, $oid, $odata);



    return $r;
}

function fiz_raza_its_date($p, $l, $oid, $udata) {
    /* @var $lib  \libs\libs */
    global $lib;
    $r = "<table class = 'itsTable'>";





    $r .= "<thead><tr>"
            . "<th>" . $l['Reservation_ID'] . "</th>"
            . "<th>" . $l['No_of_Persons'] . "</th>"
            . "<th>" . $l['Arrival_Date'] . "</th>"
            . "<th>" . $l['Departure_Date'] . "</th>"
            . "</tr></thead>"
            . "<tbody>";


    $resids = array();
    $myxrefData = $lib->db->get_data("fiz_reservation_users_xref", "*", "reservation_id = '" . $d['id'] . "' ");

    $i = 0;
    foreach ($myxrefData as $d) {
        getreRows($d['reservation_id']);
        $resids[$i] = $d['reservation_id'];
        $i++;
    }





    $r .= getreRows($udata['user_id'], $ids);



    $r .= "<tr><td colspan = \"4\" >" . $l['additsmsg'] . "<input type='text' class='addits' ><input type='button'  value='" . $l['add_button'] . "' class='add_button' /></td></tr>"
            . "</tbody>";

    $r .= "</table>";



    return $r;
}

function getreRows($user_id, $ids) {
    /* @var $lib  \libs\libs */
    global $lib;
    $ds = $lib->db->get_data("fiz_reservation", "*", "booking_owner = '" . $user_id . "' ");

    foreach ($ds as $d) {


        if (!in_array($d['id'], (array) $ids)) {



            if ($d['approved'] == "1") {
                $status = "Approved";
            } else {
                $status = "Not Approved";
            }
            $myxref = $lib->db->get_data("fiz_reservation_users_xref", "*", "reservation_id = '" . $d['id'] . "' ");




            $r .= "<tr>" . "<td>" . $d['id'] . "</td>" . "<td>" . count($myxref) . "</td>"
                    . "<td>" . $myxref[0]['arrival_date'] . "</td>"
                    . "<td>" . $myxref[0]['departure_date'] . "</td>"
                    . "<td><input data-rid = '" . $d['id'] . "' type = 'button' value = 'delete' class = 'delete_its'/></td></tr>";
        }
    }




    return $r;
}



function fiz_reservations_addform($p, $l, $id, $data) {
    $r = "";
    /* @var $lib  \libs\libs */
    global $lib;

    $filds = array(
        "id" => array(
            "type" => "hidden",
            "id" => "addlinkDVlaues",
            "name" => "id"
            , "value" => $id
        ), "ex_checkin" => array(
            "type" => "date",
            "id" => "ex_checkin",
            "pclass" => " _30",
            "title" => "Check in Date",
            "name" => "ex_checkin",
            "value" => $data['ex_checkin']
        ), "ex_checkout" => array(
            "type" => "date",
            "id" => "ex_checkin",
            "pclass" => " _30",
            "title" => "Check out Date",
            "name" => "ex_checkout",
            "value" => $data['ex_checkout']
        ), "ex_nights" => array(
            "type" => "text",
            "pclass" => " _30",
            "title" => "No of Nights",
            "name" => "ex_nights",
            "value" => $data['ex_nights']
        ), "airline" => array(
            "type" => "text",
            "pclass" => " _50",
            "title" => "Airline",
            "name" => "airline",
            "value" => $data['airline']
        ), "airline_code" => array(
            "type" => "text",
            "pclass" => " _50",
            "title" => "Airline	Code",
            "name" => "airline_code",
            "value" => $data['airline_code']
        ), "arriving_from" => array(
            "type" => "text",
            "pclass" => " _50",
            "title" => "arriving from",
            "name" => "arriving_from",
            "value" => $data['arriving_from']
        ), "arrival_time" => array(
            "type" => "time",
            "pclass" => " _50",
            "title" => "arrived",
            "name" => "arrival time",
            "datamin" => "0", "datamax" => "12",
            "value" => $data['arrived']
        )
    );
    $lib->forms->filds = $filds;
    $r = $lib->forms->_render_form() . "<div class='clearfix'></div>";




    return $r;
}

function fiz_reservations_pkgs($p, $l, $oid) {
    $r .= "";
    /* @var $lib  \libs\libs */
    global $lib;




    $ds = $lib->db->get_row("fiz_reservation", "*", "booking_owner='" . $oid . "' ");
    $oldraza = $lib->db->get_row("fiz_raza_types", "*", "id=" . $ds['raza_type']);


    $ps = explode(",", $oldraza['pkgs']);

    foreach ($ps as $p) {


        $data = $lib->db->get_row("fiz_lawazim_packages_cat", "*", "id='" . $p . "'");


        if (isset($data['id'])) {
            $r .= "<li><input name='raza_pkg'  type='radio'  data-title='" . $data['title'] . "' class='raza_pkg' value='" . $data['id'] . "' />" . $data['title'] . "<spen>" . $data['des'] . "</spen><div class='safartext'></div></li>";
        }
    }



    $r .= "<div class='buts'><input  type='button' value='Back' data-to='/do/create-raza/FizReservations/'  class='next_back'/>";
    $r .= "<input  type='button' value='Next'  data-to='/do/view-raza/FizReservations/' data-do='updatePkg'  class=''/>";

    return $r;
}

function fiz_reservations_viewData($p, $l, $oid) {

    /* @var $lib  \libs\libs */
    global $lib;
    $r = "";



    $rdatas = $_SESSION['formraza'];
    $r .= '<h2> Step 2: Update ArrivalDetails</h2>';


    $t = 0;
    foreach ($rdatas as $data) {


        if (isset($data['id'])) {

            $rdata = $lib->db->get_row("fiz_reservation", "*", "id=" . $data['id']);
            $udata = $lib->db->get_row("com_users", "*", "id='" . $rdata['user_id'] . "'");

            $r .= "<div class='raza_viewData'>"
                    . "<h2>" . $udata['FullName'] . "</h2>"
                    . "<ul>"
                    . "<li class='_50' ><label>" . $l['ex_checkin'] . "</label>" . $data['ex_checkin'] . "</li>"
                    . "<li class='_50' ><label>" . $l['ex_checkout'] . "</label>" . $data['ex_checkout'] . "</li>"
                    . "<li class='_50' ><label>" . $l['ex_nights'] . "</label>" . $data['ex_nights'] . "</li>"
                    . "<li class='_50' ><label>" . $l['airline'] . "</label>" . $data['airline'] . "</li>"
                    . "<li class='_50' ><label>" . $l['airline_code'] . "</label>" . $data['airline_code'] . "</li>"
                    . "<li class='_50' ><label>" . $l['arrival_time'] . "</label>" . $data['arrival_time'] . "</li>"
                    . "<li class='_50' ><label> " . $l['arriving_from'] . "</label>" . $data['arriving_from'] . "</li>";



            $r .="</ul>"
                    . ""
                    . "</div>";

            if (getviewmodules($oid, "lawazim")) {
                $r .= "<div class=' ex_lawazim' ><div class='data'><label> " . $l['ex_lawazim'] . "</label>" . $data['ex_lawazim'] . "</div></div>";
            }



            $t+=$data['ex_lawazim'];
        }
    } if (getviewmodules($oid, "lawazim")) {
        $r .= "<div class=' total_lawazim' ><div class='data'><label> " . $l['total_lawazim'] . "</label>" . $t . "</div></div>";
    }



    if (getviewmodules($oid, "lawazim")) {
        $n = "pkgs-raza";
    } else {
        $n = "create-raza";
    };

    $r .= "<div class='buts'><input  type='button' value='Back' data-to='/do/$n/FizReservations/'  class='next_back'/>";





    $r .= "<input  type='button' value='Next' data-to='/do/end-raza/FizReservations/' data-do='save'   class=''/></div>";

    return $r;
}

//create-raza
function fiz_reservations_endData($p, $l, $oid) {

    $razaData = getrazaData($oid);
    $r = $razaData['save_text'];
    $_SESSION['formraza'] = "";
    return $r;
}

function getrazaData($oid, $id = "") {
    /* @var $lib  \libs\libs */
    global $lib;
    $r = "";

    if ($id == "") {

        $ds = $lib->db->get_row("fiz_reservation", "*", "booking_owner='" . $oid . "' ");
        $id = $ds['raza_type'];
    }

    $oldraza = $lib->db->get_row("fiz_raza_types", "*", "id=" . $id);


    return $oldraza;
}

function getviewmodules($oid, $type, $id = "") {

    $os = explode(",", getrazaData($oid, $id)['views_modules']);

    return in_array($type, $os);
}
?>

<script>
    $(function() {





    })

</script>
<style>
    .razaform,.raza_viewData,.ex_lawazim,.total_lawazim{
        clear: both;
        width: 80%;
        background: rgba(0,0,0,0.1);
        margin: auto; 


    }
    h2 ,.ex_lawazim,.total_lawazim{
        border: 1px saddlebrown solid;
    }

    .ex_lawazim .data,.total_lawazim .data{
        float:right

    }
    .ex_lawazim,.total_lawazim{
        height:20px;
        line-height: 20px;
    }
    .total_lawazim{
        height:30px; line-height: 30px;
        clear: both;
        margin-top: 20px;
    }
    .buts{
        clear: both
    }
</style>