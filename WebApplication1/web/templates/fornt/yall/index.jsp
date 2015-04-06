<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head> <%@include  file="/includes/getFiles.jsp" %>

        <title>X-Act Web Tool</title>
        <%@taglib uri="/WEB-INF/tlds/tagslib" prefix="acr"%>
        <%@taglib uri="/WEB-INF/tlds/ui" prefix="ui"%>
        <acr:importCss />
        <acr:importjs />

        <link rel="stylesheet" href="templates/css/style.css" type="text/css"  />
        <!--[if IE 8]><link rel="stylesheet" type="text/css" href="templates/fornt/yall/css/ie8.css" /><![endif]-->
        <!--[if IE 7]><link rel="stylesheet" type="text/css" href="templates/fornt/yall/ie7.css" /><![endif]-->

        <LINK REL="SHORTCUT ICON" HREF="favicon.ico">
        <script type="text/javascript">












            $(function() {
                $(".gpreview").hide();
                ;



                $(".th_close").click(function() {





                    $(this).parent().hide("slow");

                })

                $(".tree").treeview({
                    collapsed: true,
                    animated: "fast",
                    control: "#sidetreecontrol",
                    prerendered: true,
                    persist: "location"
                });
            })

            $(document).ready(function() {

                $(".loading").fadeOut(2000);
                $('.page_effect').fadeIn(2000);

            });

        </script>

        <!--[if IE 8]><link rel="stylesheet" type="text/css" href="templates/admin/blue/css/ie8.css" /><![endif]-->
        <!--[if IE 7]><link rel="stylesheet" type="text/css" href="templates/admin/blue/ie7.css" /><![endif]-->


    </head>






    <body onkeyup="deleteButonAction(event);"  onunload="GUnload">

<div class="mymassges"> 


        </div>
        
   <div class="computwindows"> 


        </div>
        <div class="activityDetail"> 


        </div>
        <div class="messageDetail"> 


        </div>
        

        <%

            xact.users.users us = new xact.users.users();


            if (us.userlogout(request).equals("logout") || us.userReturn(request, "username").equals("")) {


                out.print("<script type=\"text/javascript\"> window.location = \"?alias=home\"</script>");

            }



        %>
        <script>

            $(function() {

    

                $.get("modules/mod_prolist/index.jsp", function(daya) {

                    makeWinDows("Project History", "pro_list_form", daya, 400, 200, 600,null,true);


          

            })    
})



        </script>




        <div class="loading"><div class="img"></div></div>


        <div class="page_effect" style="display: none">

            <div class="logo" width="14%" ></div>

            <div class="hearder">


                <acr:module position="menu" />



                <div class="alloptions">

                    <div class="optins"> </div>
                    <div class="options_data">
                        <ul class="options_data_ul">
                            <li class="changepassword">Change Password</li>
                            <li class="changeEmail">Change Email</li>
                        </ul>

                    </div>

                </div>


            </div>







            <div class="left" >   <!--<div class="label_left label"> <div class="close_left tools_bt"></div>
                </div>-->
                <div class="modls">
                    <ui:panel  position="leftbar"  module="p10" add="true" myClass="models_list"  height="120px" width="150px" title="Models" />
                </div>
                <ui:panel position="leftbar" height="120px"   module="" content='<div id="Properties_con"></div>'   width="200px"  title="Properties" />

                <ui:panel position="leftbar" height="120px" content='<div id="outlineContainer_con"></div>'   myClass="cpreview"  width="200px"  title="Preview" />
                <ui:panel position="leftbar" height="120px" content='<div id="myseoutlineContainer_con"></div>'   myClass="spreview"  width="200px" title="Preview" />
                <ui:panel position="leftbar" height="120px" content='<div id="groupoutline_con"></div>'   myClass="gpreview"  width="200px"  title="Preview" />


            </div>


            <div class="main"><div class='maindata' style=" height: 100%;position: relative;width: 100%;"/>
                <div class="tabs dark_bg"> <ul>
                        <ui:tabs type="head" content="Corporate View"myclass="act" name="div_c"  />
                        <ui:tabs type="head" content="Implementation View" myclass="" name="div_imp" />

                        <ui:tabs type="head" content="Service View" myclass="" name="div_serves" />
                        <ui:tabs type="head" content="Implementation Group View" myclass="" name="div_group" />

                        <ui:tabs type="head" content="Diagnosis & Repair" myclass="" name="div_result" />

                    </ul></div>
                        
                        
                        
                        
                <div class="tabs_divs">
                    <div class="tabbody div_c">
                        <span class="tbar" > </span>

                        <div class="get_cu">
                        </div>

                    </div>
                    
                    
                    
                    <div class="tabbody div_imp">

                        <div class="im_tabs">
                            <ul> 
                                <li  id="view_imglobal" style="border-bottom: 4px solid #000000; display: none" class="  view_imglobal act im_tabs_li"><span>Global View</span></li>

                            </ul>
                        </div>



                        <div class="im_divs">
                            <div class="tabbody div_group">
                            </div>


                            <div class="imps_vids imp_viewData">



                                <div class="modem"> </div>

                            </div>

                        </div>


                    </div>

                  
                    <div class="tabbody div_serves">
                        <span class="tbar" >
                            <ul>                         </ul>
                        </span>

                        <div class="serves" style=""> </div>
                    </div>

                    <div class="tabbody div_result getresuiltp">
                    </div>

                    <div class="min_left">


                    </div>


                    <div class="top">

                    </div>

                    <div class="bottom">

                    </div>

                    <div class="right">


                    </div>
                    <!-- <div class="div_pro"><input /></div>-->

                </div>


            </div>
        </div>

        <div class="showtool"> </div>   
        <div class="show_advanced_projection"> 

            <div class="mybtclos"></div>

            <div class="data"></div>

        </div>



        <div class="comblog">

            <div class="comblog_title" ></div>
            <div class="bt_close" ></div>
            <div class="bt_min"></div>
            <div class="data">



            </div>  

        </div>   




        <div style=""> 
            <img src="/images/marker_selected.png" alt="+" /> 
            <img src="/images/dit_marker.png" alt="+" /> 
            <img src="/images/marker.png" alt="+" /> 

        </div>

     
    </body>

</html>




<style>






    .comblog_title {
        position: absolute;
        left:3px;
        height:3px;
        color:#fff;

        font-size: 9pt;
        top: 3px;
        font-family: Arial;

    }


    .comblog{
        display: none;

        position :fixed;
        bottom: 0px;
        width: 85.3%;
        height:100px;
        background: #1E1E1E;
        -moz-border-radius:  5px 5px 0px 0px;
        border-radius: 5px 5px 0px 0px;
        right:0px;
        z-index: 100000;
        padding:25px 5px 0px 5px;

    }

    .comblog .data{
        height:100px;

        width:100%;
        background: #fff;
        -moz-border-radius:  5px 5px 0px 0px;
        border-radius: 5px 5px 0px 0px;
        overflow: auto;
    }


    .im_tabs{
        position: fixed;
        right: 40px;
        width:100px;
        height:100%;
        z-index: 10000;
    }

    .im_tabs li{
        width:103px;

        height: 32px;

        overflow: hidden

    }


    .imp_viewData ,.div_group{

        position: absolute;
        width:100%;

        height:100%;
        top:0px;
    }




    .imps_vids {

        position: absolute;
        height:100%;
        width:100%;


    }
    .imps_vids {

        position: absolute;
        height:100%;


    }



    .imps_vids tbar{

        top: 1px;

    }




    .advanced_projection{
        cursor: pointer
    }

    .showtool{

    }
    .spreview{
        display: none
    }/*.getresuiltp{
        
        position: absolute;
      
        background: #eee;
        top:7%;
        bottom: 7%;
        left:7%;
        right:7%;
        border:4px #204066 solid;
        z-index: 1000000000;
        display: none
         
    }
    
    .getresuiltp .th_close{
         position: absolute;
            top:5px;
              right:5px;
              width:30px;
              height:30px;
              text-align: center;
              line-height: 30px;
              background: #204066;
              color:#fff;
                border:1px #fff solid;
        
    }
    */


    .getresuiltp .data{


        background:#fff;
        width:80%;
        margin-top:20px; 
        margin: auto;
    }
    .loading{
        position: absolute;
        top:0px;
        bottom:0px;
        right:0px;
        left:0px;
        /*   background: #000;
           opacity:0.4;*/


    }

    .loading img{
        position: absolute;
        left:46%;
        top:20%;



    }

    .view_imgroup{
        display: none
    }

    .logindes {
        background-attachment: scroll;
        background-clip: border-box;
        background-color: transparent;
        background-image: url("images/lgoin_dis.png");
        background-origin: padding-box;
        background-position: 0 0;
        background-repeat: no-repeat;
        background-size: 100% 100%;
        height: 228px;
        margin-left: 10px;
        width: 500px;
    }



</style>

<style>

    .ver{
        background: none repeat scroll 0 0 #FFFFFF;
        font-size: 7pt;
        font-weight: bold;
        position: absolute;
        right: 69px;
        top: 186px;
    }
    .rbuild{
        color: #888888;
        font-size: 5pt;
        position: absolute;
        right: 50px;
        top: 203px;
        z-index: 1000;
    }

</style>

<script>





$(function() {






        $(".div_result_tabs li").click(function() {



            var my_id = $(this).attr("id");

            my_id = my_id.replace("show_", "");

            $(".show_dvs .divdata").hide();

            $("." + my_id).show();

            $(".div_result_tabs li").removeClass("act");


            $(".div_result_tabs li .th_close").removeClass("act");
            $(this).children(".th_close").addClass("act");

            $(this).addClass("act");




        })


        $(".optins").toggle(function() {

            $(".options_data").show("slow");

        },
                function() {

                    $(".options_data").hide("slow");

                }
        )




        $(".main").mouseover(function() {

            $(".options_data").hide("slow");

        })






        $(".changepassword").click(function() {

            $.get("modules/mod_userOptions/index.jsp", function(rdata) {


                makeWinDows("User Options", "changpass", "<div class=\"user_pass mydata\">" + rdata + "</div>", 550, 200, 530);

            })



        })



        $(".changeEmail").click(function() {

            // $.get("modules/mod_userOptions/index.jsp", function(rdata) {
            makeWinDows("Update Email", "updateEmail", updateEmail(), 450, 150, 400, null);
            // })



        })









        $(".about-x-act").click(function() {

            makeWinDows("About X-Act", "pro_list_form2", "\
             <div class=\"ver\">Version: <%=lib.Options.MyVariables.relesVersion%></div>\n\
    <div class=\"rbuild\"> Release Build :${releaseManager.formattedDate}</div>\n\
    <div class=\"logindes\">\n\
</div>", 550, 200, 530,225);

            return false;

        })

    })







</script>




