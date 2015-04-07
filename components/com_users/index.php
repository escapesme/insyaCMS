

<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/*
  function reqMailt($lang) {


  global $lib;









  $r = <<<EOD

  <html>
  <div  style='background:#2f496e; font-family: tahoma;font-size: 15px; direction: rtl;width:100%;'>

  <table  style='background:#eeeeee;  font-family: tahoma;' align="center" width="580px">
  <tr align="center"><td>


  <div style='height:83px;margin:auto;width:135px; font-family: tahoma;' >

  <img src='@%myimagesurl%@logo_samll_2.png' style='width:100%;margin:0px; float:right'>

  </div>
  </td> </tr>
  </table><table style="background:#eeeeee; " align="center" width="580px" >
  <tr><td width="517" align="right" style="font-family: tahoma;" >




  <div style='font-size: 15px;
  font-weight: bold;
  float: right;
  margin-top: 20px;
  clear: left;
  '>@%regMailTitle%@</div>


  </td>
  <td  align="right">
  <div style=' float: left;
  margin-left: 19px; margin-top: 20px;cursor: pointer;  text-align: center;  float:left;border:1px solid #c1c1c1;width:150px;font-size: 15px; padding:5px;font-family: tahoma;' >

  @%regMailloginTitle%@
  <div style='margin-top:5px;

  '>
  <img src='@%myimagesurl%@mailloginBt.png' style='width:100%;margin:0px; float:right'>
  </div>


  </div>
  </td> </tr>
  </table><table  style="background:#eeeeee; " align="center" width="580px">


  <tr style='padding-top:5px;'><td  style="font-family: tahoma;" colspan="2">

  <div style='clear:both;border-bottom: solid 3px  #d7d7d7; margin-bottom:10px;line-height:30px;'></div>



  <div style='font-size: 13px;font-weight: bold;float: right;margin-top: 0px;clear: left;clear: both;width: 100%;margin-right: 28px; font-family: tahoma;'>@%regMailNote3%@</div>






  </td></tr><tr><td  style='padding-top:15px;' >
  <div style=' width:86px;  float:right ;padding-left: 15px;'>
  <a hraf='@%userurl%@'></a> <img src='@%myimagesurl%@regmail_1.png' style='width:100%;margin:0px; float:right'>
  </div>


  </td><td style="font-family: tahoma;" >
  <div style='font-weight: bold;'>@%regMailuserProject%@</div>
  <div style='margin-top:10px;'>@%regMailuserProjectNot%@</div>

  </td></tr><tr><td  width="90">




  <div style='padding-right:10px; width:86px; float:right ;padding-left: 15px;'>
  <img src='@%myimagesurl%@regemail_2.png' style='width:100%;margin:0px; float:right'>
  </div>
  </td><td style='font-family: tahoma;'>

  <div style='font-weight: bold;'>@%regMailuserNews%@</div>
  <div style='margin-top:10px;'>@%regMailuserNewsNot%@</div>

  </td></tr><tr><td width="90" style="font-family: tahoma;" >




  <div style='padding-right:10px; width:86px; float:right ;padding-left: 15px;'>
  <img src='@%myimagesurl%@regemail_3.png' style='width:100%;margin:0px; float:right'>



  </div>
  </td><td style="font-family: tahoma;" >
  <div style='font-weight: bold;'>@%regMailuserReg%@</div>
  <div style='margin-top:10px;'>@%regMailuserRegNot%@</div>


  c
  <table align="center" width="580px"> <tr> <td style='font-family: tahoma;'>





  <div  style=' padding:10px; width:580px; color:#ffffff;min-height:100px; margin:auto;'>@%regMailNote2%@</div>
  </td></tr></table>
  </div></html>
  EOD;




  $r = $lib->util->data->TextVarUpdate($lang, $r);


  return $r;
  }




 */

function main($pro, $lng) {

    /* @var $lib  \libs\libs */
    global $lib;

    $returnData = "<input type='hidden'  name='settings_id' class='settings_id' value='" . $pro['settings'] . "'/>";

    $returnData .= $lib->users->dologout("/", "id");
    $lib->userPanel->updatePlugins();


    $returnData = $lib->userPanel->getUsrsData();






    /*
      if ((isset($_SESSION['login']) && !empty($_SESSION['login']))) {


      myproject($lng, $_SESSION['login']);

      $returnData .= $lib->userPanel->ursStatus($pro, $lng);
      } else {




      if ($_GET['id'] != "logout") {

      $returnData .="<div class='users gust'>";
      $setting = $lib->userPanel->getsetting($pro);


      $returnData .= $lib->userPanel->gustStatus($pro, $lng, $setting);
      $returnData .= $lib->userPanel->createFaceBookLogin($setting['defgroup'], $lng['titlefb'], $pro['settings'], "/");
      $returnData .="</div>";
      }
      } */

    return $returnData;
}
?>



