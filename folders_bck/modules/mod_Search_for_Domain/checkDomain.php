<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function mod_searchFordomain_domainAv($domainName) {
    $domain = $domainName;
    $username = "amrmo_sho";
    $password = "3mrmosho";
    $contents = file_get_contents("http://www.whoisxmlapi.com//whoisserver/WhoisService?domainName=$domain&cmd=GET_DN_AVAILABILITY&username=$username&password=$password&outputFormat=JSON");
    $res = json_decode($contents);
    $domainInfo = $res->DomainInfo;
    if ($domainInfo) {
        if ($domainInfo->domainAvailability == 'AVAILABLE')
            return true;
        else
            return false;
    }
}

if (mod_searchFordomain_domainAv($_GET['domain']) == true) {

    echo "النطاق متاح";
} else {
    echo "النطاق غير متاح";
}

?>
