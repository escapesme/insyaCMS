<?php

/* @var $lib  libs\libs */
global $lib;

$newcheckIn = $_GET['checkin'];
$newcheckOut = $_GET['checkout'];
$package_Cat_id = $_GET['package_id'];
$ids = explode(",", $_GET['ids']);

$type = $_GET['type'];





$isPaid = FALSE;
$isPaidTransfer = FALSE;

foreach ($ids as $id) {

    if ($id != "") {

        if ($type == "extend") {
            $fiz_reservation = $lib->db->get_row("fiz_reservation", "*", "id='" . $id . "'");
            $isPaid = $lib->coms->faiz->isPaid($id, $fiz_reservation['user_id']);
            if (!$isPaid) {
                break;
            }
        }
        
         if ($type == "booking") {
            $fiz_reservation = $lib->db->get_row("fiz_reservation", "*", "id='" . $id . "'");
            $isPaid = $lib->coms->faiz->isPaid($id, $fiz_reservation['user_id']);
            if ($isPaid) {

                break;
            }
        
    }
}
}



foreach ($ids as $id) {

 if ($id != "") {
    if ($type == "transfer") {
        $fiz_reservation = $lib->db->get_row("fiz_reservation", "*", "id='" . $id . "'");

        $isPaidTransfer = $lib->coms->faiz->isPaid($id, $fiz_reservation['user_id']);

        if (!$isPaidTransfer) {

            break;
        }
    }
    }
}







foreach ($ids as $id) {



    if ($id != "") {
        $fiz_reservation = $lib->db->get_row("fiz_reservation", "*", "id='" . $id . "'");


        if ($type == "extend") {

            // <editor-fold defaultstate="collapsed" desc="extend">

            if ($isPaid) {
                $exLast = $lib->coms->faiz->getLastEX($id, $fiz_reservation['user_id']);
                $exfrist = $lib->coms->faiz->getFristEX($id, $fiz_reservation['user_id']);

                print_r($exfrist);



                $FristcheckIn = $exfrist['ex_checkin'];
                $LadtcheckOut = $exLast['ex_checkout'];


                $oldnights = $lib->util->dateTime->howManyDays($FristcheckIn, $LadtcheckOut);
                $oldpkgData = $lib->plugins->importPlugin("fiz_lawazim_packages", "nights__" . $oldnights . ";type__" . $fiz_reservation['user_type']);






                $nights = $lib->util->dateTime->howManyDays($FristcheckIn, $lib->util->dateTodb($newcheckOut));
                $pkgData = $lib->plugins->importPlugin("fiz_lawazim_packages", "nights__" . $nights . ";type__" . $fiz_reservation['user_type']);

                $newl = $pkgData[0] - $oldpkgData[0];




                $exLast['ex_checkin'] = $LadtcheckOut;
                $exLast['ex_checkout'] = $lib->util->dateTodb($newcheckOut);
                $exLast['ex_lawazim'] = $newl;
                $exLast['package_id'] = $pkgData[4];
                $exLast['ex_paid'] = "0";
                $exLast['created'] = $lib->util->dateTime->craeteDBDateTime();
                $exLast['id'] = "NULL";
                $out = $exLast;

                $nightsdiff = $lib->util->dateTime->howManyDays($FristcheckIn, $exLast['ex_checkout']);

                if ($nightsdiff > 0) {
                    echo $lib->db->insert_row("fiz_extension", $exLast);
                }
            } else {


                echo "Error: Cannot process this request. Some user(s) selected do not have a paid extension. Please use Make new booking (Cancel Old) option for those without a paid extension.";
                break;
            }


// </editor-fold>
        } else if ($type == "booking") {
            // <editor-fold defaultstate="collapsed" desc="booking">


            if (!$isPaid) {
                $exLast = $lib->coms->faiz->getLastEX($id, $fiz_reservation['user_id']);

                echo $fiz_reservation['user_id'];


                $lib->coms->faiz->deleteEX($id, $fiz_reservation['user_id']);



                $nights = $lib->util->dateTime->howManyDays($lib->util->dateTodb($newcheckIn), $lib->util->dateTodb($newcheckOut));
                $pkgData = $lib->plugins->importPlugin("fiz_lawazim_packages", "nights__" . $nights . ";type__" . $fiz_reservation['user_type'] . ";p_cat_id__" . $package_Cat_id);


                print_R($pkgData);

                $exLast['ex_checkin'] = $lib->util->dateTodb($newcheckIn);
                $exLast['ex_checkout'] = $lib->util->dateTodb($newcheckOut);
                $exLast['ex_lawazim'] = $pkgData[0];

                $exLast['ex_paid'] = "0";
                $exLast['created'] = $lib->util->dateTime->craeteDBDateTime();
                $exLast['id'] = "NULL";
                $exLast['package_id'] = $pkgData[4];


                $exLast['ex_lawazim'] = $pkgData[0];

                $out = $exLast;
                echo $lib->db->insert_row("fiz_extension", $exLast);
            } else {

                echo "Error: Cannot process this request. Some user(s) selected have a paid extension. This option is only for those bookings that are not paid.";
                break;
                
            }

            // </editor-fold>
        } else if ($type == "transfer") {



            if ($isPaidTransfer) {

                $exLast = $lib->coms->faiz->getLastEX($id, $fiz_reservation['user_id']);
$newstring=$lib->util->dateTime->dateStrtotime($exLast['ex_checkout']);

                if ($lib->util->dateTime->dateStrtotime($exLast['ex_checkout']) ==
                        $lib->util->dateTime->dateStrtotime($newcheckIn, true)
                ) {









                    $exfrist = $lib->coms->faiz->getFristEX($id, $fiz_reservation['user_id']);

                    $FristcheckIn = $exfrist['ex_checkin'];
                    $LadtcheckOut = $exLast['ex_checkout'];






                    $oldnights = $lib->util->dateTime->howManyDays($FristcheckIn, $LadtcheckOut);
                    $oldpkgData = $lib->plugins->importPlugin("fiz_lawazim_packages", "nights__" . $oldnights . ";type__" . $fiz_reservation['user_type'] . ";p_cat_id__" . $package_Cat_id);
                    print_r($oldpkgData);



                    $nights = $lib->util->dateTime->howManyDays($FristcheckIn, $lib->util->dateTodb($newcheckOut));
                    $pkgData = $lib->plugins->importPlugin("fiz_lawazim_packages", "nights__" . $nights . ";type__" . $fiz_reservation['user_type'] . ";p_cat_id__" . $package_Cat_id);
                    print_r($pkgData);

                    $newl = $pkgData[0] - $oldpkgData[0];

                    $exLast['ex_checkin'] = $LadtcheckOut;
                    $exLast['ex_checkout'] = $lib->util->dateTodb($newcheckOut);
                    $exLast['ex_lawazim'] = $newl;
                    $exLast['package_id'] = $pkgData[4];

                    $exLast['ex_paid'] = "0";
                    $exLast['created'] = $lib->util->dateTime->craeteDBDateTime();
                    $exLast['id'] = "NULL";

                    echo $lib->db->insert_row("fiz_extension", $exLast);



                    $out = $exLast;





                    //$package_Cat_id
                } else if ($lib->util->dateTime->dateStrtotime($exLast['ex_checkout']) >
                        $lib->util->dateTime->dateStrtotime($newcheckIn, true) &&
                        $lib->util->dateTime->dateStrtotime($exLast['ex_checkin']) <
                        $lib->util->dateTime->dateStrtotime($newcheckIn, true)
                ) {


                    $exfrist = $lib->coms->faiz->getFristEX($id, $fiz_reservation['user_id']);

                    $FristcheckIn = $exfrist['ex_checkin'];
                    $LadtcheckOut = $exLast['ex_checkout'];



                    $pcat_id = $lib->coms->faiz->getPkgCategory($exLast['package_id']);



                    $oldnights = $lib->util->dateTime->howManyDays($FristcheckIn, $LadtcheckOut);
                    $oldpkgData = $lib->plugins->importPlugin("fiz_lawazim_packages", "nights__" . $oldnights . ";type__" . $fiz_reservation['user_type'] . ";p_cat_id__" . $pcat_id);


                    print_r($oldpkgData);


                    $nights = $lib->util->dateTime->howManyDays($FristcheckIn, $lib->util->dateTodb($newcheckIn));
                    $pkgData = $lib->plugins->importPlugin("fiz_lawazim_packages", "nights__" . $nights . ";type__" . $fiz_reservation['user_type'] . ";p_cat_id__" . $pcat_id);

                    print_r($pkgData);

                    $newl = $pkgData[0] - $oldpkgData[0];


                    $exLast['ex_checkout'] = $lib->util->dateTodb($newcheckIn);
                    $exLast['ex_lawazim'] = $newl;
                    $exLast['package_id'] = $pkgData[4];

                    $exLast['ex_paid'] = "0";
                    $exLast['created'] = $lib->util->dateTime->craeteDBDateTime();
                    $exLast['id'] = "NULL";

                    echo $lib->db->insert_row("fiz_extension", $exLast);



                    $out = $exLast;


                    print_r($exLast);












                    $pcat_id = $lib->coms->faiz->getPkgData($exLast['package_id']);

                    $oldnights = $lib->util->dateTime->howManyDays($FristcheckIn, $lib->util->dateTodb($newcheckIn));
                    $oldpkgData = $lib->plugins->importPlugin("fiz_lawazim_packages", "nights__" . $oldnights . ";type__" . $fiz_reservation['user_type'] . ";p_cat_id__" . $package_Cat_id);







                    $nights = $lib->util->dateTime->howManyDays($FristcheckIn, $lib->util->dateTodb($newcheckOut));
                    $pkgData = $lib->plugins->importPlugin("fiz_lawazim_packages", "nights__" . $nights . ";type__" . $fiz_reservation['user_type'] . ";p_cat_id__" . $package_Cat_id);



                    $newl = $pkgData[0] - $oldpkgData[0];

                    $exLast['ex_checkin'] = $lib->util->dateTodb($newcheckIn);
                    $exLast['ex_checkout'] = $lib->util->dateTodb($newcheckOut);


                    $exLast['ex_lawazim'] = $newl;
                    $exLast['package_id'] = $pkgData[4];

                    $exLast['ex_paid'] = "0";
                    $exLast['created'] = $lib->util->dateTime->craeteDBDateTime();
                    $exLast['id'] = "NULL";

                    echo $lib->db->insert_row("fiz_extension", $exLast);





                    print_r($exLast);
                }
            } else {

                echo "Error: Cannot process this request. Some user(s) selected has an unpaid extension. This option is only for those bookings that are paid.";
            break;
                
            }
        }
    }
}

print_R($out);
