<%@page import="javax.naming.NamingException"%>
<%@page import="javax.swing.text.html.Option"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Arrays"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="lib.Options.MyVariables"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.awt.datatransfer.Clipboard"%>
<%@page import="java.awt.datatransfer.DataFlavor"%>
<%@page import="java.awt.Toolkit"%>
<%@page import="java.awt.Image"%>
<%@page import="lib.tools.Utils"%>
<%@page import="reports.wizard_steps"%>



<%!    /*String files = "test";*/
    String jsurl = MyVariables.siteUrl + "includes/js/";
    String ajaxurl = MyVariables.siteUrl + "ajax/results/reports";
    String myllink = MyVariables.siteUrl + "site/report_wizard/";
    String grnajaxxurl = MyVariables.siteUrl + "ajax/";
    //  String filesurl = MyVariables.siteUrl + files;

    String returnImageDIR() {
        String filesurl = "";
        try {
            filesurl = MyVariables.imagesURL+ "/reporting/";
        } catch (Exception ex) {
        }

        return filesurl;
    }

%>




<link type="text/css" href="<%=jsurl%>jqueryui/css/cupertino/jquery-ui-1.8.13.custom.css" rel="stylesheet" />
<link type="text/css" href="<%=myllink%>wizarsstyle.css" rel="stylesheet" />
<script src="<%=jsurl%>jquery.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=jsurl%>ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="<%=jsurl%>ckeditor//adapters/jquery.js"></script>
<script src="<%=jsurl%>jquery.Jcrop.js" type="text/javascript"></script>
<script src="<%=jsurl%>jqueryui/js/jquery-ui-1.8.13.custom.min.js" type="text/javascript"></script>
<script src="<%=jsurl%>jquery.client.js" type="text/javascript"></script>
<script src="<%=jsurl%>upload/fileuploader.js" type="text/javascript"></script>




<%
    xact.users.users us = new xact.users.users();


    if (us.userlogout(request).equals("logout") || us.userReturn(request, "username").equals("")) {


        out.print("<script type=\"text/javascript\"> window.location = \"" + lib.Options.MyVariables.siteUrl + "?alias=home\"</script>");

    }







    String pro_id = request.getParameter("pro_id");


    if (request.getParameter("do") != null && request.getParameter("do").equalsIgnoreCase("edit")) {
        rp_id = request.getParameter("id");
    } else {
        rp_id = Utils.getNewID();

    }









%>
<script>

    var mystep = 0;
    var allstep = 12;
    var imagetoedit = "0";
    var addstataus = "0";
    var jcrop_api;



    /////////////////////////////////////////Show And Hide More -Strat
    function rept(isRepet, id) {

        if (isRepet == true) {
            $(".me_More").show();

        } else {


            $(".me_More").hide();

        }

    }

    /////////////////////////////////////////Show And Hide More -End


    function  updateEditor(name) {



        if (CKEDITOR.instances[name + '_editorC']) {

            CKEDITOR.instances[name + '_editorC'].destroy(true);
        }





        if (CKEDITOR.instances[name + '_Data']) {

            CKEDITOR.instances[name + '_Data'].destroy(true);
        }






        $("#" + name + ' .' + name + '_editorC').ckeditor(function() {
        }, {
            toolbar: [],
            height: 600,
            width: '100%',
            uiColor: '#fff'

        });








        $('.editor_text.' + name + '_Data').ckeditor(
                function() {
                }, {
            toolbar: [
                {name: 'paragraph', items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl']},
                {name: 'links', items: ['Link', 'Unlink', 'Anchor']},
                {name: 'tools', items: ['Maximize', 'ShowBlocks']},
                {name: 'styles', items: ['FontSize']},
                {name: 'styles2', items: ['Font']},
                {name: 'colors', items: ['TextColor', 'BGColor']},
                {name: 'basicstyles', items: ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat']},
                {name: 'insert', items: ['Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'Iframe']}
            ],
            height: 100,
            width: '90%',
            uiColor: '#ccc'
        });
    }






    function returnSubTapsName(name) {

        var retuenName = "";



        if (name == "group") {

            retuenName = "Group View";

        } else if (name == "Dr") {
            retuenName = "D & R";
        } else if (name == "smv") {

            retuenName = "SMV";

        } else if (name == "rmv") {

            retuenName = "RMV";

        } else if (name == "ad") {
            retuenName = "Advanced Projection";


        }



        return retuenName;


    }





    /////////////////////////////////////////Creat post  url -Strat
    function   geturl(url, inputs, setpe) {


        var mynames_v = "";
        var values_v = "";

        for (i = 0; i < inputs.length; i++) {
            //  returnData={inputs[i] : escape( $("."+inputs[i]).val()) };

            mynames_v += inputs[i] + "[!split!]";


            var nyv = $("." + inputs[i]).val();

            values_v += nyv + "[!split!]";


        }





        var returnData = {step: setpe, pro_id: "<%=pro_id%>", rp_id: "<%=rp_id%>", title: $(".rep_title").val(), send_image: $(".send_image").val(), mynames: mynames_v, values: values_v, mydo: '<%=request.getParameter("do")%>'};


        return returnData;
    }
    /////////////////////////////////////////Creat post  url -End

    /////////////////////////////////////////js After ajax -Strat
    function afertcreat(name) {

        $(".crop_tap").addClass("act");

        $(".crop_tap").click(function() {


            var ob = $(this).parent().parent(".step");
            ob.children(".data_div").hide();
            ob.children(".crop_div").show();
            $(".data_tap").removeClass("act");
            $(this).addClass("act");


        })



        $(".data_tap").click(function() {
            var ob = $(this).parent().parent(".step");
            ob.children(".data_div").show();
            ob.children(".crop_div").hide();
            $(".crop_tap").removeClass("act");
            $(this).addClass("act");


        })


        $(".meniit .retp li").click(function() {

            addstataus = "0";


            var v = $(this).parent(".retp").parent(".meniit").attr("id").replace("ms", "");
            var morenum = $(this).parent(".retp").children("li").size();

            mystep = v - 1;
            imagetoedit = $(this).attr("id").replace("rli_", "");



            mySteps(mystep, morenum, "skip");






        })

    }
    /////////////////////////////////////////js After ajax -End



    //////////////////////////////////////setpes Funcrions -Strat
    function showStep(mystep, isRepet, more, type) {



        $(".meniit").removeClass("act");
        $(".meniit").eq(mystep).addClass("act");



        var ths = $(".step_" + mystep);
        var myid = ths.attr("id");

        $(".step").hide("slow");




        var imageName = myid + "_" + imagetoedit;



        if (addstataus == "1") {

            imageName = myid + "_" + more;



        } else {

            imageName = myid + "_" + imagetoedit;


        }
        var url = "<%=ajaxurl%>/get_step.jsp?id=<%=rp_id%>&step=" + mystep + "&name=" + myid + "&imagename=" + imageName + "&pro_id=<%=pro_id%>";
        $.get(url, function(data) {

            ths.remove(".mysetpAllData");
            ths.html(data);
            ths.show("slow");


            $("#" + myid + " .image_name").val(imageName);

            $(".send_image").val(imageName);



            // alert (mystep);
            $(".meniit").removeClass("act");
            $(".meniit").eq(mystep).addClass("act");

            rept(isRepet, myid);


            updateEditor(myid);

            clearcop(myid);
            cropscript(myid);

            var lis = "";


            for (var i = 0; i < more; i++) {
                var d = i + 1;





                lis += "<li id='rli_" + d + "'>" + returnSubTapsName(myid) + "[" + d + "]</li>";


            }

            $(".menu li.act .retp").html(lis);

            afertcreat(myid);
            if ($.browser.safari) {

                $(".mytextarea").hide();

                $(".f_bar").hide();
            }


        })

    }

    function goTosetp(num, inputs, isrept, more, type) {
        var url = "<%=ajaxurl%>/data.jsp";
        var st = num;
        var stm = num + 1;
        if (type == "more") {

            st++;


        }
        if (type != "skip") {

            var myre = geturl(url, inputs, st);
            $.ajax({
                url: url,
                data: myre,
                cache: false,
                /* contentType: 'multipart/form-data',*/
                type: 'post',
                success: function(data) {
                    // alert(data);
                    showStep(num, isrept, more);
                }
            });

        } else {

            showStep(num, isrept, more);


        }




    }

    function returninputes(mystep) {

        var inputs = "";

        if (mystep == "1") {
            var inputs = new Array("Organiztion_Name", "rep_title", "Date_of_Issue", "Program", "Owner"
                    , "Date_Of_Creation", "Executive_Summary"
                    , "Findings", "Introduction", "title", "Purpose", "Scope", "Frequency_of_Update", "Author");


        } else if (mystep == "2") {
            inputs = new Array("corporate_data");

        } else if (mystep == "3") {
            inputs = new Array("service_Data");

        } else if (mystep == "4") {
            inputs = new Array("implementation_data");

        } else if (mystep == "5") {
            inputs = new Array("group_Data");

        } else if (mystep == "6") {
            inputs = new Array("Dr_Data");

        } else if (mystep == "7") {
            inputs = new Array("ad_Data");

        } else if (mystep == "8") {
            inputs = new Array("smv_Data");

        } else if (mystep == "9") {
            inputs = new Array("rmv_Data");
        }
        else if (mystep == "11") {
            inputs = new Array("Critical_Analysis", "Which_risk", "What_areas", "How_addressed", "Conclusion");
        }


        else if (mystep == "10") {
            inputs = new Array("financial_Data");
        }






        return inputs



    }

    function mySteps(mystep, morenum, type) {

        $(".me_skip").show();

        $(".crop_tap").show();
        $(".data_tap").show();
        $(".me_next").show();
        $(".me_cancel").show();




        var inptunum = mystep;

        if (type == "more") {

            inptunum = inptunum + 1;


        }


        var inputs = returninputes(inptunum);


        var de = false;

        if (mystep >= allstep) {

            $(".me_skip").hide();

            $(".crop_tap").hide();
            $(".data_tap").hide();

            showStep(mystep, false, 0);
        } else if (mystep == "1") {
            goTosetp(mystep, inputs, false, 0, type);
        } else if (mystep == "2") {

            goTosetp(mystep, inputs, false, morenum, type);
        } else if (mystep == "3") {

            goTosetp(mystep, inputs, false, morenum, type);
        } else if (mystep == "4") {

            goTosetp(mystep, inputs, true, morenum, type);
        } else if (mystep == "5") {

            goTosetp(mystep, inputs, true, morenum, type)
        } else if (mystep == "6") {

            goTosetp(mystep, inputs, true, morenum, type)
        } else if (mystep == "7") {

            goTosetp(mystep, inputs, true, morenum, type)
        } else if (mystep == "8") {

            goTosetp(mystep, inputs, true, morenum, type);


        } else if (mystep == "9") {

            goTosetp(mystep, inputs, true, morenum, type);






        } else if (mystep == "10") {


            goTosetp(mystep, inputs, false, morenum, type);
        } else if (mystep == "11") {

            goTosetp(mystep, inputs, false, morenum, type);
            $(".me_skip").hide();
            $(".me_More").hide();

            $(".me_next").hide();
            $(".me_cancel").hide();
            $(".me_More").hide();
            $(".crop_tap").hide();
            $(".data_tap").hide();
        } else if (mystep == "0") {

            $(".me_skip").hide();
            $(".me_More").hide();

            $(".crop_tap").hide();
            $(".data_tap").hide();

            goTosetp(mystep, inputs, false, morenum, type);

        }






    }
    //////////////////////////////////////setpes Funcrions -End


    //////////////////////////////////////CropDataFuncrions -Strat

    function clearcop(pid) {

        var mypid = "#" + pid;
        $(mypid + ' .' + pid + "_editorC").val("");
        $(mypid + " .target").attr("scr", "");
        $(mypid + " .crop_iframe").hide();
        $(mypid + " .docrop").hide();
        $(mypid + " .update_img").hide();
        $(mypid + " .preview").hide();
        $(mypid + " .mytextarea").show();
        $(mypid + " .mytextarea").show();
        $(mypid + " .dropFile").show();

        if (jcrop_api) {
            jcrop_api.destroy();


        }



    }

    function cropscript(pid) {
        if (jcrop_api) {
            jcrop_api.destroy();
        }










        var mypid = "#" + pid;


        function updatePreview(c)
        {


            $(mypid + ' .x').val(c.x);
            $(mypid + ' .y').val(c.y);

            $(mypid + ' .w').val(c.w);
            $(mypid + ' .h').val(c.h);


            if (parseInt(c.w) > 0)
            {
                var rx = 130 / c.w;
                var ry = 130 / c.h;

                $(mypid + ' .preview').css({
                    width: Math.round(rx * boundx) + 'px',
                    height: Math.round(ry * boundy) + 'px',
                    marginLeft: '-' + Math.round(rx * c.x) + 'px',
                    marginTop: '-' + Math.round(ry * c.y) + 'px'
                });
            }
        }
        ;









        function doeditImage(mypid, mysrc, imagesrc, type) {

            if (jcrop_api) {
                jcrop_api.release();
                jcrop_api.destroy();


            }



            if (type == 'url') {
                $(mypid + " .target").attr("src", mysrc + "?timestamp=" + new Date().getTime());
                $(mypid + " .preview").attr("src", mysrc + "?timestamp=" + new Date().getTime());


            } else {



                $(mypid + " .target").attr("src", mysrc);
                $(mypid + " .preview").attr("src", mysrc);
            }

            $(".f_bar").hide("slow");
            $(".tool_bar").show("slow");

            $(mypid + " .i").val(imagesrc);


            $(mypid + " .crop_iframe").hide();
            $(mypid + " .docrop").show();
            $(mypid + " .update_img").show();
            $(mypid + " .preview").show();
            $(mypid + " .mytextarea").hide();
            $(mypid + " .dropFile").hide();



            $(mypid + " .target").Jcrop({
                onChange: updatePreview,
                onSelect: updatePreview
                        // aspectRatio: 1
            }, function() {
                // Use the API to get the real image size
                var bounds = this.getBounds();
                boundx = bounds[0];
                boundy = bounds[1];
                // Store the API in the jcrop_api variable
                jcrop_api = this;
            });


        }



        function createUploader(mypid, element, listElement) {
            new qq.FileUploader({
                element: element,
                listElement: listElement,
                action: '<%=grnajaxxurl%>admin/uploadFile.jsp?type=crop&filePath=<%=returnImageDIR()%>/<%=rp_id%>/&name=' + $(".send_image").val()
                        , onSubmit: function(id, fileName) {

                },
                onProgress: function(id, fileName, loaded, total) {

                },
                onComplete: function(id, fileName, responseJSON) {

                    var mysrc2 = "<%=returnImageDIR()%>/<%=rp_id%>/" + $(".send_image").val() + ".jpg";


                    doeditImage(mypid, mysrc2, mysrc2, "url");



                    $(".imagestatus").val("image");





                },
                onCancel: function(id, fileName) {

                }

            });
        }





        $(function() {


            $(".image_reset").click(function() {


                $(".f_bar").show("slow");
                $(".tool_bar").hide("slow");


                clearcop(pid)




            })





            $(".dodeselect").click(function() {


                jcrop_api.release();

                $(".x").val("");
                $(".y").val("");
                $(".w").val("");
                $(".h").val("");


            })






            createUploader(mypid,
                    $(mypid + " .dropFile")[0],
                    $(mypid + " .dropFilech2")[0]);


            $(mypid + ' .' + pid + "_editorC").ckeditor(function() {
            }, {
                toolbar: [],
                height: 600,
                width: '100%',
                uiColor: '#fff'

            });


            $(mypid + " .image_past").hide();

            $(mypid + " .image_past").click(function() {


                $(".testtext").bind('paste', function(e) {
                    alert('pasting!')
                })

            })

            $(mypid + " .image_delete").click(function() {

                $(mypid + ' .' + pid + "_editorC").val("")


            })


            function msgs(type) {

                var returnData = "";
                var returnDataMac = "";


                if (type == "editImage") {

                    returnData = " Please paste an image first from the clipboard by pressing CTRL + V";

                    returnDataMac = " Please paste an image first from the clipboard by pressing CMD + V";


                } else if (type == "crop") {

                    returnData = " To crop, make a selection first by clicking and dragging on the preview picture.";

                    returnDataMac = " To crop, make a selection first by clicking and dragging on the preview picture.";


                }






                if ($.client.os == "Windows") {
                    return returnData;
                } else {

                    return  returnDataMac;


                }
                // $.client.os


            }



            $(mypid + " .image_Edit").click(function() {



                $(mypid + " .update_img_1").html($(mypid + ' .' + pid + "_editorC").val());
                var mysrc = $(mypid + ' .update_img_1 img').attr("src");





                if (!mysrc) {


                    alert(msgs("editImage"));


                } else {




                    var imagesrc = mysrc.replace("data:image/png;base64,", "");


                    doeditImage(mypid, mysrc, imagesrc);

                    $(".imagestatus").val("code");


                }

            })


            function clearCoords()
            {
                $('#coords input').val('');
            }
            ;

            function checkCoords(mypid)
            {

                var xval = $(mypid + " .x").val();
                var yval = $(mypid + " .y").val();

                var wval = $(mypid + " .w").val();
                var hval = $(mypid + " .h").val();



                if (xval == "" || yval == "" || hval == "" || wval == "") {

                    alert(msgs("crop"));
                    return false;

                }




                $(mypid + " .crop_iframe").show();
                $(mypid + " .update_img").hide();

                if (parseInt($(mypid + ' .w').val())) {
                    return true;
                } else {

                    alert('Please select a crop region then press submit.');
                    return false;

                }






            }
            ;


            $(mypid + " .crop_form").submit(function() {

                checkCoords(mypid);

            })
        })


    }
    //////////////////////////////////////CropData  Funcrions -End



    $(function() {


        if ($.browser.safari) {

            $(".mytextarea").hide();
        }


        $(".me_skip").hide();


        $(".crop_tap").hide();
        $(".data_tap").hide();




        var mystem = 0;

        /* $(".meniit .retp li").click(function(){
         
         $(".meniit .retp li").removeClass("myact");
         $(this).addClass("myact")   ;
         
         })
         */


        $(".me_More").click(function() {
            mystem = $(".menu li.act .retp li").size() + 1;
            addstataus = 1;



            mySteps(mystep, mystem, "more");


        })




        $(".me_skip").click(function() {
            mystep++;
            mySteps(mystep, mystem, "skip");
            mystem = 0;

        })


        $(".meniit .label").click(function() {

            var mdo = "<%= request.getParameter("do")%>";


            if (mystep != "0" || mdo == "edit") {



                var thSetp = $(this).parent(".meniit").attr("id").replace("ms", "");
                var morenum = $(this).parent(".meniit").children(".retp").children("li").size();
                mystep = thSetp - 1;
                imagetoedit = "0";
                addstataus = "0";

                mySteps(mystep, morenum, "skip");
            } else {



                alert("You may not skip to this step prior to saving the preamble step. \n  Please enter the preamble data and click Next.")
            }

        })




        $(".me_next").click(function() {
            mystep++;
            mySteps(mystep, 0);
            mystem = 0;
        })

    })


</script>



<%!    String rp_id = "";
    wizard_steps w = new wizard_steps();
    lib.engine.db.operations db = new lib.engine.db.operations();
    //String myFolder = "test";

    String craetSetp(String name, String title, String mypath, String num) throws  NamingException {
        String returndata = "";
        
        
        w.folderName =  Utils.getImageFolder() + "/reporting/";
         w.myfloderPath =  Utils.getImageFolder() + "/reporting/";
        
        
        w.ThisID = rp_id;
        returndata += "<div id ='" + name + "' class='step step_" + num + " '" + name + "'_step'>";
        returndata += "</div >";
        return returndata;

    }


%>

<%

    w.creatFloder(request, rp_id);
    String mypath = rp_id;


%>

<%


    String[] dataedit = db.getRow(XMLDataModel.REPORT_TABLENAME, " r_id='" + rp_id + "' and p_status=1 ");

    String[] dataedit2 = db.getRow(XMLDataModel.REPORT_TABLENAME, " r_id='" + rp_id + "'  ");



    if ((dataedit[0] == null || dataedit[0].equalsIgnoreCase("null"))
            && (request.getParameter("do") != null
            && (request.getParameter("do").equalsIgnoreCase("new")
            || (request.getParameter("do").equalsIgnoreCase("edit") && us.userReturn(request, "cid").equalsIgnoreCase(dataedit2[10]))))) {


%>



<%!    String returnSubTapsName(String name) {

        String retuenName = "";
        if (name.equalsIgnoreCase("Group")) {

            retuenName = "Group View";
        } else if (name.equalsIgnoreCase("Dr")) {
            retuenName = "D & R";
        } else if (name.equalsIgnoreCase("smv")) {

            retuenName = "SMV";

        } else if (name.equalsIgnoreCase("rmv")) {

            retuenName = "RMV";

        } else if (name.equalsIgnoreCase("ad")) {
            retuenName = "Advanced Projection";


        } else if (name.equalsIgnoreCase("Dr")) {
            retuenName = "D & R";
        } else if (name.equalsIgnoreCase("financial")) {
            retuenName = "Financial View";
        }




        return retuenName;


    }

    String returnSubStep(String name, String id, String setp) throws Exception {
        String returnData = "";
        db.openCon();
        ResultSet rs = db.getData(XMLDataModel.REPORT_IMAGES_TABLENAME, "*", "report_id='" + id + "' and data_type='" + setp + "' and name like'%" + name + "%'");
        int d = 0;


        while (rs.next()) {
            String myname = rs.getString("name");
            if (!myname.equalsIgnoreCase(name + "_0")) {
                d++;




                returnData += " <li id='rli_" + d + "' > " + returnSubTapsName(name)
                        + "[" + d + "] </li>";
            }
        }
        db.closeCon();
        return returnData;
    }

%>


<div class="all">

    <div class='top'> <div class='tabs'><ul></ul> </div></div>

    <div class='left'>

        <div class="menu">
            <ul>
                <li id="ms1" class='meniit act '><div class='label'>Preamble </div>
                    <ul class="retp"></ul>
                </li>
                <li id="ms2" class='meniit '><div class='label'>Corporate View</div>
                    <ul class="retp"><%= returnSubStep("corporate", rp_id, "2")%></ul>
                </li>
                <li id="ms3" class='meniit '><div class='label'>Service View</div>
                    <ul class="retp"><%= returnSubStep("Service", rp_id, "3")%></ul></li>
                <li id="ms4" class='meniit ' ><div class='label'>Implementation View</div><ul class="retp"><%= returnSubStep("implementation", rp_id, "4")%></ul></li>
                <li id="ms5" class='meniit '><div class='label'>Group View</div><ul class="retp"><%= returnSubStep("Group", rp_id, "5")%></ul></li>
                <li id="ms6" class='meniit '><div class='label'>Diagnosis & Repair</div><ul class="retp"><%= returnSubStep("Dr", rp_id, "6")%></ul></li>
                <li id="ms7" class='meniit '>
                    <div class='label'>Advanced Projection</div>
                    <ul class="retp"><%= returnSubStep("ad", rp_id, "7")%></ul>
                </li>
                <li id="ms8" class='meniit '><div class='label'>Service Management View</div><ul class="retp"><%= returnSubStep("smv", rp_id, "8")%></ul></li>
                <li id="ms9" class='meniit '><div class='label'>Resource Management View</div><ul class="retp"><%= returnSubStep("rmv", rp_id, "9")%></ul></li>
                <li id="ms10" class='meniit '><div class='label'>Financial View</div><ul class="retp"><%= returnSubStep("financial", rp_id, "10")%></ul></li>
                <li id="ms11" class='meniit '><div class='label'>Analysis</div><ul class="retp"><%= returnSubStep("analysis", rp_id, "11")%></ul></li>


                <li id="ms12" class='meniit '><div class='label'>Finish</div><ul class="retp"></ul></li>
            </ul>

        </div>
    </div>
    <div class="main">

        <div class="steps">


            <div id ='intro' class='step step_0 intro_step'>
                <div class ='tap_body'>

                    <%= w.returnSteps("intro", mypath, "", "0")%>
                </div>
            </div>

            <%= craetSetp("corporate", "Corporate", mypath, "1")%>
            <%= craetSetp("service", "Service", mypath, "2")%>
            <%= craetSetp("implementation", "Implementation", mypath, "3")%>
            <%= craetSetp("group", "Group", mypath, "4")%>
            <%= craetSetp("Dr", "Dr", mypath, "5")%>
            <%= craetSetp("ad", "ad", mypath, "6")%>
            <%= craetSetp("smv", "smv", mypath, "7")%>
            <%= craetSetp("rmv", "smv", mypath, "8")%>
            <%= craetSetp("financial", "financial", mypath, "9")%>
            <%= craetSetp("analysis", "analysis", mypath, "10")%>

            <div id ='end' class='step step_11 end_step'>

                <%= w.end_step(mypath, request)%>
            </div>

        </div>





    </div>

    <div class='fotter'>
        <input type="hidden" class='fbutton send_image'  value="" name="send_image"/>
        <input type="button" class='fbutton me_More' style="display:none" value="+ Add More"/>
        <input type="button" class='fbutton me_cancel' value="Cancel"/>
        <input type="button" class='fbutton me_skip' value="Skip"/>
        <input type="button" class='fbutton me_next'  value="Next"/>
    </div>

</div>

<%

} else if (!us.userReturn(request, "cid").equalsIgnoreCase(dataedit2[10])) {
    out.print("Access Denied!");


} else {
%>

<div class='msg'>
    <a class='view_rep' href="<%=myllink%>viewreport.jsp?id=<%=rp_id%>">This report cannot be edited as it has been published. Click here to View Report. </a>
</div>
<%            }
%>

