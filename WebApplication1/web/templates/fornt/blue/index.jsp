<%@page import="java.util.StringTokenizer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include  file="/includes/getFiles.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>X-Act Web Tool</title>
        <%@taglib uri="/WEB-INF/tlds/tagslib" prefix="acr"%>
        <%@taglib uri="/WEB-INF/tlds/ui" prefix="ui"%>

        <LINK REL="SHORTCUT ICON" HREF="favicon.ico">
        <script type="text/javascript">

            $(function() {
                $(".tree").treeview({
                    collapsed: true,
                    animated: "fast",
                    control: "#sidetreecontrol",
                    prerendered: true,
                    persist: "location"
                });
            })


        </script>
        <acr:importCss />
        <acr:importjs />
        <link rel="stylesheet" href="templates/css/style.css" type="text/css"  />
        <!--[if IE 8]><link rel="stylesheet" type="text/css" href="templates/fornt/blue/css/ie8.css" /><![endif]-->
        <!--[if IE 7]><link rel="stylesheet" type="text/css" href="templates/fornt/blue/ie7.css" /><![endif]-->


    </head>
    <body>
        <div class='mymassges'></div>

        <div class='lightBoxBG'><div class='lightBoxBody'></div><div class='close_bt'></div></div>

        <div class="mycontlogin left">

            <acr:module position="loginTop"/>
            <acr:module position="left"/>

        </div>

    </body>

    
    <script>



        function createLodyiong() {

            $("body").append("<div class='lodyiong'></div>");


        }


        function removeLodyiong() {

            $(".lodyiong").remove();


        }



        $(function() {


            $(".UpdatePassWord").click(function() {
                createLodyiong();

                $.get("modules/mod_updatePassword/index.jsp", function(Data) {
                    removeLodyiong();
                    $(".lightBoxBody").html(Data);


                    $(".lightBoxBG").show("slow");

                })


            })

            $(".close_bt").click(function() {

                $(".lightBoxBG").hide("slow");
            })

        })





    </script>

    <style>


        .ver{
            background: none repeat scroll 0 0 transparent;
            font-size: 7pt;
            font-weight: bold;
            position: absolute;
            right: 88px;
            top: 253px;
        }
        .lightBoxBG{
            display: none;
            position: fixed;
            width:100%;
            height:100%;
            background: rgba(0,0,0,0.5);
            top:0px;
            left:0px;
            overflow: hidden;
            z-index: 111111111111;
        }


        .lightBoxBody{
            position: absolute;
            background: #eee;
            height:80%;
            width:80%;
            top:10%;
            left:10%;
            background: url("templates/fornt/blue/css/images/login_bg.png");
            background-size: 100% 100%; 
        }



        .UpdatePassWord{

            cursor: pointer;
        }

        .form_row label{
            float:left;
        }


        .form_row{
            float:left;margin: 5px;
        }
        .mymain {
            clear: both;
            margin-top: 0px;
            width: 80%;
            margin-left: 10%;
            background: white;

            height: 600px;




            background:transparent;

        }


        .body p {
            font: normal 12px Arial, Helvetica, sans-serif;
            color: #605F5F;
            line-height: 1.8em;
            padding: 5px 10px;
            margin: 0;
        }
        .submenu{
            position: absolute;
            top:20px;
            width: 152px;
            z-index: 1000;
            background: #DFE8F6;
            border: 1px #8DB2E3 solid;
            margin-top: 3px;
            display: none;



        }

        .submenu li{
            border: none;
            border-bottom: 1px #8DB2E3 solid;
            width: 100%;
            height: 30px;
            clear: both;
            margin:0px
        }

        .submenu li:hover{
            border: 1px #8DB2E3 solid;
            margin:0px;
            height: 30px;
        }
        .submenu ul{
            width: 100%;
            margin: 0px;
            float: left;
            margin-left: -40px;
        }
        .left2 {
            width: 224px;
            float: left;
            padding: 5px 0;
            margin: 5px 13px 5px 13px;
            background: #F6F6F6;
        }
        .body h3 {
            font: normal 26px Arial, Helvetica, sans-serif;
            color: #212121;
            margin: 0 0 20px 0;
            padding: 15px 5px;
            border-bottom: 1px solid #D7D7D7;
        }.body h3 span {
            font: normal 14px Arial, Helvetica, sans-serif;
            color: #898989;
        }
        .body h2 span {
            font: normal 11px Arial, Helvetica, sans-serif;
            color: #ABABAB;
        }

        .body h2 {
            font: normal 18px Arial, Helvetica, sans-serif;
            color: #171717;
            margin: 0;
            padding: 10px 10px;
        }
        .pgtitle{
            display: none
        }
    </style></html>

<!--[if lt IE 9]>


  <style>


#dta{
display:none;
}

  .left.mycontlogin{


width:770px;
left:18%;
top:15%;
height:380px;

}
.loginTile{

margin-left:30px;
margin-top:20px;
width:115px;


}

.logindes{
height:300px;
width:710px;
margin-left:30px;
}
</style>
  <![endif]-->