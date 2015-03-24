<?php

/* @var $lib  \libs\libs */
global $lib;

$status = $_GET['status'];




ini_set("display_errors", 1);
error_reporting(E_ERROR | E_PARSE | E_COMPILE_ERROR);




$EX_ids = explode(",", $_GET['ex_ids']);

$extension_amounts = explode(",", $_GET['extension_amount']);

$remarks = $_GET['remarks'];
$received_by = $_GET['received_by'];

$authorised_by = $_GET['authorised_by'];

$authorize_reason = $_GET['authorize_reason'];


session_start();



if ($status == "refund") {




    $receipt_id = "";


    $i = 0;


    $totle = 0;


    foreach ($EX_ids as $e_id) {

        if ($e_id != "") {
            $cahDaa = $lib->db->get_row("fiz_cashier_receipt_items", "*", "id=" . $e_id);
            //   $cahDaa = $lib->db->get_row("fiz_extension", "*", "id=" . $cahDaa['extension_id']);
            //   echo $cahDaa['extension_id'];
            $allcahs = $lib->db->get_data("fiz_cashier_receipt_items", "*", "status='refund' and  extension_id=" . $cahDaa['extension_id']);

            //  print_r($allcahs);
            $llref = 0;

            $allamount = 0;

            foreach ($allcahs as $allcah) {

                $llref+= $allcah['paid_amount'];
            }

            $allamountDatas = $lib->db->get_data("fiz_cashier_receipt_items", "*", " status<>'refund' and  extension_id=" . $cahDaa['extension_id']);


            foreach ($allamountDatas as $allamountData) {


                $allamount+= $allamountData['paid_amount'];
            }
        }
    }



    foreach ($EX_ids as $e_id) {


        if ($e_id != "") {





            /*    $allcah = $lib->db->get_data("fiz_cashier_receipt_items", "*", "status='refund' and  extension_id=" . $cahDaa['extension_id']);

              foreach ($allcah as $a) {

              $llref+= $a['paid_amount'];
              } */

            $cahDaa = $lib->db->get_row("fiz_cashier_receipt_items", "*", "id=" . $e_id);

            $exdata = $lib->db->get_row("fiz_extension", "*", "id=" . $cahDaa['extension_id']);




            if ($allamount >= ($llref + $extension_amounts[$i])) {



                $data = $lib->users->getUser("");


                $reservation_data = $lib->db->get_row("fiz_reservation", "*", "id=" . $exdata['reservation_id']);

                $user_data = $lib->db->get_row("com_users", "*", "id=" . $exdata['user_id']);

                if ($receipt_id == "") {


                    $data_array = array(
                        "total" => $totle,
                        "remarks" => $remarks,
                        "received_by" => $data['email'],
                        "status" => $status
                    );


                    $lib->db->insert_row("fiz_cashier_receipt", $data_array);

                    $receipt_id = $lib->db->get_maxrow("fiz_cashier_receipt")["id"];
                }



                $data_array = array(
                    "receipt_id" => $receipt_id,
                    "remarks" => $remarks,
                    "extension_id" => $cahDaa['extension_id'],
                    "extension_amount" => $exdata['ex_lawazim'],
                    "remarks" => $remarks,
                    "paid_amount" => $extension_amounts[$i],
                    "authorised_by" => $_SESSION['auto_email'],
                    "authorize_reason" => $authorize_reason, "status" => $status
                );


                $lib->db->insert_row("fiz_cashier_receipt_items", $data_array);


                if ($llref <= $extension_amounts[$i]) {
                    $lib->coms->faiz->exPaid($e_id, "0");
                }
            } else {


                $cahDaa = $lib->db->get_row("fiz_cashier_receipt_items", "*", "id=" . $e_id);

                $exdata = $lib->db->get_row("fiz_extension", "*", "id=" . $cahDaa['extension_id']);

                //   $reservation_data = $lib->db->get_row("fiz_reservation", "*", "id=" . $exdata['reservation_id']);

                $user_data = $lib->db->get_row("com_users", "*", "id=" . $exdata['user_id']);



                $x = $allamount - ($llref);
                if ($x == 0) {
                    echo "Cannot complete this operation for " . $user_data['FullName'] . ". The amount has been fully refunded";
                } else {
                    echo "Cannot complete this operation for " . $user_data['FullName'] . ". The amount entered is greater than the paid amount ($x) ";
                };
            }
            $i++;
        }
    }
} else {




    $receipt_id = "";


    $i = 0;


    $totle = 0;


    foreach ($EX_ids as $e_id) {

        if ($e_id != "") {
            $exdata = $lib->db->get_row("fiz_extension", "*", "id=" . $e_id);
            $totle+= $exdata['ex_lawazim'];
        }
    }


    foreach ($EX_ids as $e_id) {


        if ($e_id != "") {
            $exdata = $lib->db->get_row("fiz_extension", "*", "id=" . $e_id);




            $data = $lib->users->getUser("");


            $reservation_data = $lib->db->get_row("fiz_reservation", "*", "id=" . $exdata['reservation_id']);

            $user_data = $lib->db->get_row("com_users", "*", "id=" . $exdata['user_id']);

            if ($receipt_id == "") {


                $data_array = array(
                    "total" => $totle,
                    "remarks" => $remarks,
                    "received_by" => $data['email']
                );

              //  print_R($data_array);
                $lib->db->insert_row("fiz_cashier_receipt", $data_array);

                $receipt_id = $lib->db->get_maxrow("fiz_cashier_receipt")["id"];
            }



            $data_array = array(
                "receipt_id" => $receipt_id,
                "user_id" => $exdata['user_id'],
                "remarks" => $remarks,
                "extension_id" => $e_id,
                "extension_amount" => $exdata['ex_lawazim'],
                "remarks" => $remarks,
                "paid_amount" => $extension_amounts[$i],
                "authorised_by" => $_SESSION['auto_email'],
                "authorize_reason" => $authorize_reason,
            );


            $lib->db->insert_row("fiz_cashier_receipt_items", $data_array);

            $i++;
        }
    }
}