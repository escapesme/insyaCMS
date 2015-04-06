/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */




function removeChart(clas) {
    var removed = clas.attr('id');
    $("." + removed).remove();
}

function groupMove(groupid, locationid, sid) {

    var link = "ajax/implementation/groupData.jsp?groupid=" + groupid + "&locationid=" + locationid + "&sid=" + sid;
    $.get(link, function(data) {

        $(".Confirm_Group_Move").parent().parent().parent().parent().parent().parent().remove();
        makeWinDows(" Confirm Group Move", "Confirm_Group_Move", "<script>groupMoveData_do('" + groupid + "','" + locationid + "','" + sid + "');</script>" + data, 150, 150, 670, 350);
    });


}
function index_windows_data(data2) {


    var data = "<script>";
    data += " index_windows_data_do();</script>\n\"<div class=\"mydata\"><div class='windowstitle'></div>\n\
<div class='indexdata'>" + data2 + "</div>\n\
</div> <input type=\"button\" class=\"index_windows_data_Close_bt\"  value=\"Close\">";
    return data;
}
function table_windows_data(data2) {


    var data = "<script>";
    data += " table_windows_data_do();</script>\n\"<div class=\"mydata\"><div class='windowstitle'></div>\n\
<div class='tabledata'>" + data2 + "</div>\n\
</div> <input type=\"button\" class=\"table_windows_data_Close_bt\"  value=\"Close\">";
    return data;
}






function index_windows_data_do() {

    $(".index_windows_data_Close_bt").click(function() {


        $(".index_windows_data").parent().parent().parent().parent().parent().parent().remove();
    })

}
function table_windows_data_do() {

    $(".table_windows_data_Close_bt").click(function() {


        $(".table_windows_data").parent().parent().parent().parent().parent().parent().remove();
    })

}


function groupMoveData() {



    /*
     return "<script>groupMoveData_do();</script>\n\
     <div class=\"view_pre mydata\">\n\
     <div class=\"frm_row do_left\" >\n\
     <div class=\"frm_label\">Description</div> \n\
     <textarea></textarea></div>\
     \n\
     <table class=\"data_gris  table_viewparamters\">\n\
     </table>\n\
     </div><input type=\"button\" class=\"do_right do_Close \"  value=\"Confirm\">\n\
     <input type=\"button\" class=\"do_right do_Close \"  value=\"Close\"> ";
     
     
     */

}

function groupMoveData_do(groupid, locationid, sid) {

    $(function() {



        $(".groupMove_Confirm").click(function() {
            var mydata = "";
            $(".movegroupid").each(function() {

                mydata += ";" + $(this).val() + "__" + $(this).next(".movelinelength").val();
            })


            $.get("ajax/implementation/tarnsGroup.jsp?sid=" + sid + "&groupid=" + groupid + "&loactionid=" + locationid + "&data=" + mydata, function(data) {

                openCorporate(".get_model.myact", "s");
                $("#div_imp").click();
                $(".mxWindow").remove();
            })



            closeWindows("Confirm_Group_Move");
        })



        $(".groupMove_do_Close").click(function() {


            closeWindows("Confirm_Group_Move");
        })
    })
}








function Create_ops_compute_doajax(pro_id, mid, Group_Name, ffr, print_id_a, print_id_b, nop, des) {


    if ($.trim(Group_Name) != "" && nop >= 2) {




        $.get("ajax/compute/createOpsParameter.jsp?pro_id=" + pro_id + "&mod_id=" + mid + "&Group_Name=" + Group_Name + "&winnum=" + ffr + "&print_id_a=" + print_id_a + "&print_id_b=" + print_id_b + "&defnum=" + nop + "&des=" + des, function(data) {

            $(".tabelTop").html(data);
        })


    }


}

function Create_ops_compute_do_ajax(pro_id, mid, Group_Name, ffr, print_id_a, print_id_b, nop, des) {


    if ($.trim(Group_Name) != "" && nop >= 2) {




        $.get("ajax/compute/createOpsParameter.jsp?pro_id=" + pro_id + "&mod_id=" + mid + "&Group_Name=" + Group_Name + "&winnum=" + ffr + "&print_id_a=" + print_id_a + "&print_id_b=" + print_id_b + "&defnum=" + nop + "&des=" + des, function(data) {

            $(".tabelTop").html(data);
        })


    }


}

function acdetail(id) {



// $.get("ajax/getacdetail.jsp?id="+id ,function(data){


    $(".mxWindow").remove();
    return "<div class=\"mydata\"><table><thead><th>Server</th><th>Machine</th><th>Partition</th><th>Disk Name</th><th>Activity</th><th>RT</th><th>QT</th><th>Elongation</th><th>Contribution</th></thead></table></div>";
//}
//)

}

function Create_ops_compute2(pro_id, mid, Group_Name, eb, print_id_a, print_id_b, nop, des) {

    return "<script>Create_ops_compute_do_ajax(\"" + pro_id + "\",\"" + mid + "\",\"" + Group_Name + "\",\"" + eb + "\",\"" + print_id_a + "\",\"" + print_id_b + "\",\"" + nop + "\",\"" + des + "\");</script>    <div class=\"mydata\"><div class=\"tabelTop\"><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/></div></div>";
}

function Create_ops_compute_do_edit_ajax(pro_id, mid, id, type) {

    $.get("ajax/compute/editOpsParameter.jsp?pro_id=" + pro_id + "&mod_id=" + mid + "&sid=" + id + "&type=" + type, function(data) {

        $(".tabelTopedit").html(data);
    })





}

function computemsg_do(pro_id, mod_id, sid, type, bedata, be2, benum) {


    $(".ops_Finish").click(function() {


        $(".mxWindow").remove();
        var att = "allrow=" + bedata + "&be=" + be2 + "&benum=" + benum + "&modelID=" + mod_id + "&scenarioid=" + sid + "&type=" + type + "&ppoint=0&";
        comblog_Status(pro_id + "__" + mod_id + "__" + sid, "", "");
        $(".comblog").slideDown();
        $.get("ajax/compute/compute3.jsp?" + att, function(data) {
            //var myaata=data+" <input type=\"button\" value=\"next\" />";



        })







    })



    $(".do_cancel").click(function() {


        xactWindowsClose(this);
    })
}

function computemsg(type, data, pro_id, mod_id, sid, be2, benum) {

    var msg = "";
    var stype = "0";
    if (type == "cs") {

        msg = "Computing Selected Ops Model ";
        stype = "4";
    } else if (type == "csr") {

        msg = "Computing Operational Series ";
        stype = "3";
    } else if (type == "ca") {

        msg = "Computing Selected Model";
        stype = "4";
    } else if (type == "tsr") {

        msg = "Computing Selected Model";
        stype = "5";
    }
//pro_id,mod_id ,sid ,type,bedata


    return    "<script>computemsg_do('" + pro_id + "','" + mod_id + "','" + sid + "','" + stype + "','" + data + "','" + be2 + "','" + benum + "');</script><div class=\"mydata\">" + msg + "</div><div class=\"do_center\"><input type=\"button\" class=\" ops_Finish\"  value=\"Start\">      <input type=\"button\" class=\"do_cancel\"  value=\"Cancel\">";
}

function forgotPasswordActions() {

    $(".forgotPasswordCancel").click(function() {

        closeWindows("forgotPassword");
    });
    $(".forgotPasswordOk").click(function() {
        var name = $(".forgotPasswordusreName").val();
        closeWindows("forgotPassword");
        showMyloading(".main", "start");
        $.ajax({
            type: "POST",
            url: "ajax/users/forgot.jsp",
            data: {
                usreName: name
            }

        }).done(function(data) {

            showMyloading(".main", "end");
            showMessage("info", "", data, "", function() {
            });
        });
    });
}

function forgotPassword() {
    var data = "";
    data = "<script>forgotPasswordActions();</script><div class='view_pre mydata'>";
    data += CreateFiled("User Name", "text", "forgotPasswordusreName", "", "_50");
    data += " </div><div class=\"do_center\">";
    data += CreateFiled("OK", "button", "forgotPasswordOk");
    data += CreateFiled("Cancel", "button", "forgotPasswordCancel", "", "_50");
    data += "</div>";
    return data;
}

function isEmail(email)
{
    var re = /\S+@\S+\.\S+/;
    return re.test(email);
}

function updateEmailActions() {


    $("div.mxWindow").hide();
    showWindows("updateEmail");
    indexWindows("updateEmail", "10001");
    $(".updateEmailCancel").click(function() {

        closeWindows("updateEmail");
    })

    $(".updateEmailOk").click(function() {

        var myemail = $(".updateEmailemail").val();
        var rmail = $(".updateEmailremail").val();

        if (myemail != rmail || isEmail(myemail) == "false") {
            alert("Incorrect Email");
        } else {

            $.ajax({
                type: "POST",
                url: "ajax/users/updateMeil.jsp",
                data: {
                    email: myemail
                }
            }).done(function(data) {

                showMessage("info", "", data, "", function() {

                });
                $(".err").remove();
                closeWindows("updateEmail");
                $("div.mxWindow").show();
            })

        }

    })



}


function updateEmail() {
    var data = "";
    data = "<script>updateEmailActions();</script><div class='view_pre mydata'>";
    data += CreateFiled("Email", "text", "updateEmailemail", "");
    data += CreateFiled("Repeat Email", "text", "updateEmailremail", "");
    data += " </div><div class=\"do_center\">";
    data += CreateFiled("OK", "button", "updateEmailOk");
    data += CreateFiled("Cancel", "button", "updateEmailCancel", "", "_50");
    data += "</div>";
    return data;
}



function Create_ops_compute_eidt(pro_id, mid, thiid, type) {




    return "<script>Create_ops_compute_do_edit_ajax(\"" + pro_id + "\",\"" + mid + "\",\"" + thiid + "\",\"" + type + "\");</script><div class=\"mydata\"><div class=\"tabelTopedit\"><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/></div></div>";
}
var maxPoints = "";




function Create_ops_compute_do(pro_id, mid, sid) {








    $(".Create_ops_compute_do_next").click(function() {
        var Group_Name = $(".Group_Name").val();
        if ($.trim(Group_Name) != "") {



            var nop = $(".Number_of_Periods").val();
            var des = $(".ops_compute_dis").val();
            var print_id_a = "";
            var print_id_b = "";
            $(".mxWindow").remove();
            makeWinDows("Create Ops Compute2", "CreateOpsCompute2", Create_ops_compute2(pro_id, mid, Group_Name, nop, print_id_a, print_id_b, nop, des), 450, 80, 400, null);
        } else {
            alert("Group Name cannot be empty!")


        }


    })
    $(".do_cancel").click(function() {

        $(".mxWindow").remove();
    })

}
//<editor-fold defaultstate="collapsed" desc="database import operations">

//</editor-fold>

function CreateTimeBoxWindows(pro_id, mid, sid) {
    timeBoxP = 0;
    timeBoxnum = 1;
    var data = "<script>CreateTimeBoxWindowsActions(\"" + pro_id + "\",\"" + mid + "\",\"" + sid + "\");</script>\n\
<div class='view_pre mydata'>";
    data += CreateFiled("Number of Periods", "text", "Number_of_Periods", "", "");
    data += "   </div><div class=\"do_center\">";
    data += CreateFiled("Next", "button", "CreateTimeBoxWindowsActions_next");
    data += CreateFiled("Cancel", "button", "updateScenarioCancel", "", "_50");
    return data;
}
function IsNumeric(input)
{
    return (input - 0) == input && input.length > 0;
}



var timeBoxP = 0;
var timeBoxnum = 1;
var spreID = 0;
var fristsID = "";
;
//<editor-fold defaultstate="collapsed" desc="time box">

function EditTimeBoxWindowsActions(pro_id, mid, sid) {


    $(".incheck").click(function() {

        if ($(this).is(':checked')) {

            $(this).parent("li").find(".incheck").attr("checked", "checked");
        } else {

            $(this).parent("li").find(".incheck").removeAttr("checked");
        }

    });
    $(".tabs li.tabheader").click(function() {

        var c = $(this).attr("id");
        $(".intabbody").hide();
        $("." + c).show();
    })
    $(".editTimeBoxDataWindowsActions_next").click(function() {



        if (isValid(".TimeBoxData_name", "")) {
            showMyloading(".main", "start");
            var resu = confirm("The results for this scenario will be invalidated. Proceed?");
            if (resu) {


                $.get("ajax/compute/clearRecords.jsp?results_id=0" + "__" + mid + "__" + sid, function() {



                })




                var bbData = "";
                $(".bb_id").each(function() {

                    bbData += ";" + $(this).val() + "__" + $(this).next(".Override").val() + "__" + $(this).next(".Override").attr("id");
                });
                var inchecks = "";


                $(".incheck").each(function() {

                    var att = "0";
                    if ($(this).is(':checked')) {

                        att = "1";
                    }


                    inchecks += ";" + $(this).val() + "__" + att;
                });

                $.ajax({
                    type: "POST",
                    url: "ajax/scenario/updateScenario.jsp",
                    data: {
                        status: "timebox",
                        incheck: inchecks,
                        uid: sid,
                        MODEL_ID: mid,
                        SCENARIO_ID: sid,
                        name: $(".TimeBoxData_name").val(),
                        duration: $(".TimeBoxData_duration").val(),
                        type: $(".TimeBoxData_type").val(),
                        corporate_Number: $(".corporate_Number").val(),
                        bbData: bbData,
                        DESCRIPTION: $(".TimeBoxData_DESCRIPTION").val()


                    }
                }).done(function(data) {

                    if ($.trim(data) != "") {

                    }
                    updateModleTreeview(pro_id);
                    openScenario(pro_id, mid, sid, "6");
                    closeWindows("eidteTimeBoxDataWindows");
                    showMyloading(".main", "end");
                });
            }
        }

    });
    $(".editeScenario_Cancel").click(function() {

        closeWindows("eidteTimeBoxDataWindows");
    });
}


function EditTimeBoxWindows(pro_id, mid, sid, edata, corData, treeData) {

    var corData = corData.split(",");
    var oldName = corData[0];
    var oldNumber = corData[1];
    var oldwindow_duration = corData[2];
    var oldDec = corData[3];
    var oldype = corData[4];
    var data = "<script> EditTimeBoxWindowsActions(\"" + pro_id + "\",\"" + mid + "\",\"" + sid + "\");</script>\n\
<div class='view_pre mydata'>";
    var Options = "0__Days;1__Hours;2__Minutes;3__Seconds";
    data += "<div class='tabs'><ul style='clear: both; padding:10px; ' >\n\
    <li id='timboxtabe1  ' class='tabheader'>Time Box Properties</li>\n\
<li  id='timboxtabe2  ' class='tabheader'>Trajectory Tree</li>\n\
</ul>";
    data += "<div class='intabbody timboxtabe1'>";
    data += CreateFiled("Name", "text", "TimeBoxData_name", oldName, "");
    data += CreateFiled("Corporate Number", "text", "corporate_Number", oldNumber, "");
    data += CreateFiled("Window Duration", "text", "TimeBoxData_duration", oldwindow_duration, "");
    data += CreateFiled("Description", "textarea", "TimeBoxData_DESCRIPTION", oldDec, "");
    data += CreateFiled("Type", "select", "TimeBoxData_type", oldype, "", Options);
    data += CreateFiled('Business Entity', 'borderOpen', "", "", "fieldset");
    data += edata;
    data += CreateFiled('Line', 'borderClose');
    data += "</div>";
    data += "<div style='display:none; max-height:340px; overflow:auto; clear:both' class='intabbody timboxtabe2'>";
    data += treeData;
    data += "</div></div>";
    data += "   </div><div class=\"do_center\">";
    data += CreateFiled("OK", "button", "editTimeBoxDataWindowsActions_next");
    data += CreateFiled("Cancel", "button", "editeScenario_Cancel", "", "_50");
    return data;
}

function CreateTimeBoxDataWindows(pro_id, mid, sid, edata, corData, treeData) {

    var corData = corData.split(",");
    var oldNumber = corData[3];
    var oldwindow_duration = corData[5];
    var oldype = corData[6];
    var data = "<script> CreateTimeBoxDataWindowsActions(\"" + pro_id + "\",\"" + mid + "\",\"" + sid + "\");</script>\n\
<div class='view_pre mydata'>";
    var Options = "0__Days;1__Hours;2__Minutes;3__Seconds";
    data += "<div class='tabs'><ul style='clear: both; padding:10px; ' >\n\
    <li id='timboxtab1  ' class='tabheader'>Time Box Properties</li>\n\
<li  id='timboxtab2  ' class='tabheader'>Trajectory Tree</li>\n\
</ul>";
    data += "<div class='intabbody timboxtab1'>";
    data += CreateFiled("Name", "text", "TimeBoxData_name", "", "");
    data += CreateFiled("Corporate Number", "text", "corporate_Number", oldNumber, "");
    data += CreateFiled("Window Duration", "text", "TimeBoxData_duration", oldwindow_duration, "");
    data += CreateFiled("Description", "textarea", "TimeBoxData_DESCRIPTION", "", "");
    data += CreateFiled("Type", "select", "TimeBoxData_type", oldype, "", Options);
    data += CreateFiled('Business Entity', 'borderOpen', "", "", "fieldset");
    data += edata;
    //data += "</table>";
    data += CreateFiled('Line', 'borderClose');
    data += "</div>";
    data += "<div style='display:none; max-height:340px; overflow:auto; clear:both' class='intabbody timboxtab2'>";
    data += treeData;
    data += "</div></div>";
    data += "   </div><div class=\"do_center\">";
    data += CreateFiled("Next", "button", "CreateTimeBoxDataWindowsActions_next");
    data += CreateFiled("Cancel", "button", "updateScenario_Cancel", "", "_50");
    return data;
}







function CreateTimeBoxDataWindowsActions(pro_id, mid, sid) {


    $(".incheck").click(function() {

        if ($(this).is(':checked')) {

            $(this).parent("li").find(".incheck").attr("checked", "checked");
        } else {

            $(this).parent("li").find(".incheck").removeAttr("checked");
        }

    });
    $(".tabs li.tabheader").click(function() {

        var c = $(this).attr("id");
        $(".intabbody").hide();
        $("." + c).show();
    })
    $(".CreateTimeBoxDataWindowsActions_next").click(function() {








        if (isValid(".TimeBoxData_name", "")) {
            showMyloading(".main", "start");
            var bbData = "";
            $(".bb_id").each(function() {

                bbData += ";" + $(this).val() + "__" + $(this).next(".Override").val() + "__" + $(this).next(".Override").attr("id");
            });
            var inchecks = "";



            $(".incheck").each(function() {

                var att = "0";
                if ($(this).is(':checked')) {

                    att = "1";
                }




                inchecks += ";" + $(this).val() + "__" + att;
            });


            PARENT_ID = "";
            if (spreID == 0) {

                if (sid == 0) {

                    PARENT_ID = mid;
                } else {

                    PARENT_ID = sid;
                }



            } else {

                PARENT_ID = spreID;
                if (fristsID == "") {
                    fristsID = spreID;
                }
            }




            $.ajax({
                type: "POST",
                url: "ajax/scenario/saveScenario.jsp",
                data: {
                    status: "timebox",
                    incheck: inchecks,
                    PARENT_ID: PARENT_ID,
                    MODEL_ID: mid,
                    SCENARIO_ID: sid,
                    name: $(".TimeBoxData_name").val(),
                    duration: $(".TimeBoxData_duration").val(),
                    type: $(".TimeBoxData_type").val(),
                    corporate_Number: $(".corporate_Number").val(),
                    bbData: bbData,
                    DESCRIPTION: $(".TimeBoxData_DESCRIPTION").val()

                }
            }).done(function(data) {
                var dataArray = data.split(";")
                if ($.trim(dataArray[0]) != "") {
                    showMessage("wor", "", dataArray[0], "", function() {
                    });
                }


                closeWindows("CreateTimeBoxDataWindows");
                if (timeBoxP > 0) {


                    spreID = $.trim(dataArray[1]);
                    closeWindows("Time_Box_windows");
                    $.get("ajax/compute/opsTable.jsp?pro_id=" + pro_id + "&mod_id=" + mid + "&sid=" + sid, function(data) {

                        $.get("ajax/scenario/corporateData.jsp?mod_id=" + mid, function(cordata) {
                            $.get("ajax/scenario/getTrajectoryTree.jsp?mod_id=" + mid + "&sid=" + sid, function(treedata) {
                                showMyloading(".main", "end");
                                makeWinDows("Create TimeBox Period No." + (timeBoxnum - 1), "CreateTimeBoxDataWindows", CreateTimeBoxDataWindows(pro_id, mid, sid, data, cordata, treedata), 500, 80, 400, 400);
                            });
                        });
                    });
                    timeBoxP--;
                    timeBoxnum++;
                } else {

                    openScenario(pro_id, mid, fristsID, "6");
                }

                updateModleTreeview(pro_id);



            });

        }

    });
    // $.get("ajax/scenario/saveScenario.jsp?status=timebox&" + link, function(data) {



    // });





    $(".updateScenario_Cancel").click(function() {

        closeWindows("CreateTimeBoxDataWindows");
    })


}





function CreateTimeBoxWindowsActions(pro_id, mid, sid) {

    $(".incheck").click(function() {

        if ($(this).is(':checked')) {

            $(this).parent("li").find(".incheck").attr("checked", "checked");
        } else {

            $(this).parent("li").find(".incheck").removeAttr("checked");
        }

    });
    $(".CreateTimeBoxWindowsActions_next").click(function() {

        var pdata = $(".Number_of_Periods").val();
        if (IsNumeric(pdata)) {
            showMyloading(".main", "start");
            spreID = 0;
            timeBoxP = pdata;
            $.get("ajax/compute/opsTable.jsp?pro_id=" + pro_id + "&mod_id=" + mid + "&sid=" + sid, function(data) {

                $.get("ajax/scenario/corporateData.jsp?mod_id=" + mid, function(cordata) {
                    $.get("ajax/scenario/getTrajectoryTree.jsp?mod_id=" + mid + "&sid=" + sid, function(treedata) {
                        showMyloading(".main", "end");
                        makeWinDows("Create TimeBox Period No." + (timeBoxnum - 1), "CreateTimeBoxDataWindows", CreateTimeBoxDataWindows(pro_id, mid, sid, data, cordata, treedata), 500, 80, 400, 400);
                    })
                })
            })
            timeBoxP--;
            timeBoxnum++;
            closeWindows("Time_Box_windows");
        } else {

            alert("Not  Numeric");
        }




    })

    $(".updateScenarioCancel").click(function() {



        closeWindows("Time_Box_windows");
    })



    //  

}
//</editor-fold>


function Create_ops_compute(pro_id, mid, sid) {



    return "<script>Create_ops_compute_do(\"" + pro_id + "\",\"" + mid + "\",\"" + sid + "\");</script>\n\
\n\
\n\
\n\
<div class=\"mydata\"> \n\
 <div class=\"frm_row do_left\" ><div class=\"frm_label\">Group Name</div><div  class=\"frm_input\">\n\
<input type=\"text\" class=\"Group_Name\" value=\"\" /></div></div> \n\
 <div class=\"frm_row do_left\" ><div class=\"frm_label\">Number of Periods:</div><div  class=\"frm_input\">\n\
<input type=\"text\" class=\"Number_of_Periods\" value=\"2\" /></div></div> \n\
 <div class=\"frm_row do_left\" ><div class=\"frm_label\">  Description</div> \n\
<textarea class=\"ops_compute_dis\" ></textarea></div></div>\n\
</div><div class=\"do_center\"><input type=\"button\" class=\"Create_ops_compute_do_next\"  value=\"Next\">      \n\
<input type=\"button\" class=\"do_cancel\"  value=\"Cancel\"> ";
}



function updateModleTreeview(pro_id) {


    var link = '?alias=xact&pro_is=' + pro_id;
    $.get("ajax/engine/getModel.jsp" + link, function(r_data) {



        $(".models_list .cont").html(r_data);
        /*$(".tree").treeview({
         collapsed: true,
         animated: "fast",
         control:"#sidetreecontrol",
         prerendered: true,
         persist: "location"
         });*/


        $.get("ajax/engine/returnValue.jsp?table=scenario&filde=max(id)", function(data) {


            data = $.trim(data);
            $("." + data).click();
        })

        // cdo(pro_id , "link")




        closeAllWindows();
    })

}


function uodatemodels(pro_id) {


    var link = '?alias=xact&pro_is=' + pro_id;
    $.get("ajax/engine/getModel.jsp" + link, function(r_data) {



        $(".models_list .cont").html(r_data);
        $.get("ajax/engine/returnValue.jsp?table=scenario&filde=max(id)", function(data) {


            data = $.trim(data);
            $("." + data).click();
        })

        // cdo(pro_id , "link")




        $(".mxWindow").remove();
        $(".mxWindow").remove();
        $(".mxWindow").remove();
    })

}

function updateMarkerImage(id) {

    var image23 = new google.maps.MarkerImage(MarkerImage_a,
            new google.maps.Size(parseFloat(MarkerImage_width), parseFloat(MarkerImage_height)),
            new google.maps.Point(0, 0),
            new google.maps.Point(parseFloat(MarkerImage_x), parseFloat(MarkerImage_y)));
    if ($.browser.msie && $.browser.version == 8.0) {
    } else {


        if (markerList[id] != null) {
            markerList[id].setIcon(image23);
        }
    }


}

function resetMarkerImage() {

    var image23 = new google.maps.MarkerImage(MarkerImage_d,
            new google.maps.Size(parseFloat(MarkerImage_width), parseFloat(MarkerImage_height)),
            new google.maps.Point(0, 0),
            new google.maps.Point(parseFloat(MarkerImage_x), parseFloat(MarkerImage_y)));
    if ($.browser.msie && $.browser.version == 8.0) {
    } else {
        if (markersArray) {
            for (i in markersArray) {
                if (markersArray[i] != null) {
                    markersArray[i].setIcon(image23);
                }
            }

        }

    }


}

function windowsCancelDo(me, id) {

    $(".getgroup").dblclick(function() {
        resetMarkerImage();
        updateMarkerImage(id);
    })




    $(me).click(function() {

        closeWindows("view_paramters_windows");
    })



}
function openConmputWindows__7(ids) {

    $.get("ajax/scenario/businessVolumeScenario.jsp?ids=" + ids, function(treedata) {


        makeWinDows("Compute Business Volume Scenario", "businessVolume", businessVolume(treedata), 150, 150, 700, 200);
    })


}




function Database_Resources_windows_fun(ids) {

    var data = "<script>";
    data += "Database_Resources_do('" + ids + "');</script>\n\
 <div style=' max-height:150px; overflow: auto;' class=\"mydata\">\n\
<div class=\"frm_row do_left _50\" ><div class=\"frm_label\">Resource Type</div><div class=\"class=\"frm_input\"\">\n\
<select class=\"Resource_Type\">\n\
<option value='Database_Namespaces'>Database Namespaces</option>\n\
<option value='Database_Cache'>Database Cache</option>\n\
<option value='Log_Buffers'>Log Buffers</option>\n\
</select></div></div> \n\
<div class=\"frm_row do_left _50 NameSpaes_p\" ><div class=\"frm_label\">NameSpaes</div><div class=\"class=\"frm_input\"\"><select class=\"NameSpaes\"  ></select></div></div> \n\
\n\<div class=\"frm_row do_left _100\" ><table class='Resource_Type_table data_grid'><thead>\n\
<th>Name</th><th>Cache</th><th>RowLength</th><th>UsefulSize</th><th>IndexType</th><th>Detu</th>\n\
</thead><tbody class=''><tbody></table></div>\n\
</div> <div class=\"do_center\">\n\
 <!--<input type=\"button\" class=\"Database_Resources_add_bt\"  value=\"Add\">\n\
\n\<input type=\"button\" class=\"Database_Import_add_bt\"  value=\"Import\">-->\n\
\n\
<input type=\"button\" class=\"Database_Resources_Close_bt\"  value=\"Close\"></div> ";
    return data;
}



function datado(This, pro_id) {


    var descId = $(This).val();
    var x = new Array(defajax);
    ajaxAbort(x);
    defajax = loadAjax("ajax/get_Resource_Type.jsp?type=Namespace&pro_id=" + pro_id + "&desc_id=" + descId, ".Resource_Type_table", "all,main");
    $(".NameSpaes_p").show();
}

function database_do(type, myids) {




    $.get("ajax/get_Resource_Type.jsp?type=" + type + "&pro_id=" + myids, function(data) {



        if (type != "Database_Namespaces") {
            $(".NameSpaes_p").hide();
            $(".Resource_Type_table").html($.trim(data));
        } else {

            $(".NameSpaes_p").show();
            $(".NameSpaes").html($.trim(data));
            datado(".NameSpaes", myids);
        }




    })



}
function Database_Resources_do(ids) {








    var myids = ids.split("__");
    database_do($(".Resource_Type").val(), myids[0]);
    $(".Resource_Type").change(function() {




        var type = $(this).val();
        database_do(type, myids[0]);
    })


    $(".Database_Resources_Close_bt").click(function() {
        $(".mxWindow").remove();
    })

}



function nodeExtension_windows_data(data2) {


    var data = "<script>";
    data += " nodeExtension_windows_do();</script><div class='view_pre mydata'>";
    data += data2;
    data += "</div><div class=\"do_center\">";
    data += CreateFiled("Update", "button", "nodeExtension_Ok_bt");
    data += CreateFiled("Cancel", "button", "nodeExtension_Close_bt", "", "_50");
    data += "</div>";
    return data;
}
function addServer(complexId, modelId, complexName, maxxProcessors, nod_id) {


    var data = "<script> addServerActions('" + complexId + "','" + modelId + "','" + maxxProcessors + "','" + nod_id + "');";
    data += "</script><div class='view_pre mydata'>";
    data += "<div class='datacol'><div class='subTitle'> Available Server Instances</div>\n\
<select class='logicalServers' multiple='multiple'></select></div>";
    data += "<div class='datacol'><input type='button' class='addServerToComplex' value='>>'/>";
    data += "<input type='button' class='removeServerFromComplex' value='<<'/></div>";
    data += "<div class='datacol'><div class='subTitle'>Server Instances on " + complexName + "</div>\n\
 <select class='logicalServersCompelx' multiple='multiple'></select></div>";
    data += "</div><div class=\"do_center\">";
    data += CreateFiled("Create New", "button", "addServerNew");
    data += CreateFiled("Edit ", "button", "editServerNew");
    data += CreateFiled("Delete ", "button", "delServerNew");
    data += CreateFiled("Close", "button", "addServerCancel", "", "_50");
    data += "</div>";
    return data;
}


function updatecomplex(complex, modelId) {




    refreshDeployedServers(complex, modelId);
}
function refreshServers(complex, modelId) {
    $.get("ajax/createServer.jsp?complexId=" + complex + "&modelId=" + modelId + "&status=logicalServers", function(mdata) {

        $(".logicalServers").html(mdata);
        refreshComboServers(complex, modelId);
    })

}
function refreshComboServers(complex, modelId) {
    $.get("ajax/createServer.jsp?complexId=" + complex + "&modelId=" + modelId + "&status=COMPLEX_INST_ID", function(mdata) {

        $(".log_servers").html($.trim(mdata));
        refreshInstancesInServers(complex, modelId);
    })

}
function refreshDeployedServers(complex, modelId) {
    $.get("ajax/createServer.jsp?complexId=" + complex + "&modelId=" + modelId + "&status=logicalServersCompelx", function(mdata) {

        $(".logicalServersCompelx").html(mdata);
        refreshServers(complex, modelId);
    });
}
function refreshInstancesInServers(complex, modelId) {
    if ($(".log_servers option").eq(1).attr("value") != null) {
        $.get("ajax/createServer.jsp?complexId=" + complex + "&modelId=" + modelId + "&status=LOGICAL_SERVER_INST_ID&firstAciId=" + $(".log_servers option").eq(1).attr("value"), function(mdata) {

            //     $(".serComponent").html(mdata);
        })

    }
}


function addServerActions(complex, modelId, maxProcessors, nod_id) {

    refreshDeployedServers(complex, modelId);
    // updatecomplex(complex, modelId);
    ;
    $(".addServerCancel").click(function() {
        closeWindows("addServer");
    });
    $(".addServerToComplex").click(function() {

        var added = "";
        $(".logicalServers  option:selected").map(function() {

            added += $(this).val() + ",";
            // $(this).remove();
        });
        $.get("ajax/createServer.jsp?complexId=" + complex + "&modelId=" + modelId + "&status=save&serversData=" + added, function(mdata) {

            //  updatecomplex(complex, modelId);
            //   
            updateComlpex("", "", nod_id, "");
//addServerToComplex
        })



    });
    $(".editServerNew").click(function() {





        $.get("ajax/createServer.jsp?status=getserverdata&complexId=" + complex + "&modelId=" + modelId + "&serversData=" + $(".logicalServersCompelx").val(), function(mdata) {

            makeWinDows("edit server instance", "editServer", editServer(mdata, $(".logicalServersCompelx").val(), maxProcessors), 350, 120, 500, null);
        });
    })




    $(".delServerNew").click(function() {
        var removed = "";
        $(".logicalServers  option:selected").map(function() {

            removed += $(this).val() + ",";
        });
        var remove = confirm("Are you sure you want to delete the selected server(s)?")
        if (remove) {
            $.get("ajax/createServer.jsp?complexId=" + complex + "&modelId=" + modelId + "&status=deleteimage&removed=" + removed, function(mdata) {

                updateComlpex("", "", nod_id, "");
                $(".logicalServersCompelx  option:selected").map(function() {
                    $(this).remove();
                });
            })
        }
    })




    $(".addServerNew").click(function() {

        $.get("ajax/getAcds.jsp?complexId=" + complex + "&modelId=" + modelId + "&serversData=" + $(".logicalServers").val(), function(mdata) {

            makeWinDows("New Server image", "newServer", newServer(mdata, modelId, complex, maxProcessors), 350, 120, 500, 350);
        });
    });
    $(".removeServerFromComplex").click(function() {
        var deleteServers = confirm("Remove selected server instances from complex?");
        if (deleteServers) {
            var removed = "";
            $(".logicalServersCompelx  option:selected").map(function() {

                removed += $(this).val() + ",";
            });
            $.get("ajax/createServer.jsp?complexId=" + complex + "&modelId=" + modelId + "&status=delete&serversData=" + removed, function(mdata) {

                updatecomplex(complex, modelId);
                $(".logicalServersCompelx  option:selected").map(function() {
                    $(this).remove();
                });
            })




        }
    })

}






$(function() {
    $(document).on("click", ".newAcdOk", function() {




        allPriorities = 0;
        var tdata = "";
        $(".ACDpriority tr.rowData").each(function(i) {


            allPriorities += parseFloat($(this).find(".newAcdpTimeInput").val());
            tdata += $(this).find(".newAcdpInitialInput").val() + "__" + $(this).find(".newAcdpTimeInput").val() + ";";
        })



        var link = "?tdata=" + tdata + "&modelId=" + pModel + "&serverId=" + pServer;
        var newAcdVertual = "0";
        var added = "";
        $(".serversList  option:selected").map(function() {

            added += $(this).val() + ",";
        });
        if ($.trim(added) == "" && pStatus === "create") {
            alert("Select at least one server");
        } else if (!IsNumeric($(".newAcdFactor").val())) {
            alert("CPU FActor Must be a number");
        } else if ($(".newAcdName").val() === "") {
            alert("ACD Name is Required");
            $(".newAcdName").addClass("require");
        } else if (TablenumberRows < 1) {
            alert("Priorities can't be empty");
        } else if (allPriorities !== 1) {

            alert("Priorities time in all levels must be equal to 1");
        } else {
// 

            $.get("ajax/createAcd.jsp" + link + "&acdId=" + pAcd + "&complexID=" + $(".complexID").val() + "&status=" + pStatus + "&name=" + $(".newAcdName").val() + "&newAcdFactor=" + $(".newAcdFactor").val() + "&newAcdIo=" + $(".newAcdIo").val() + "&newAcdLoad=" + $(".newAcdLoad").val() + "&newAcdTerminals=" + $(".newAcdTerminals").val() + "&newAcdVertual=" + newAcdVertual + "&servers=" + added, function(mdata) {

                $(".newACD").off("click", ".newAcdpOk");
                updateAcd(pModel, pServer);
                closeWindows("newACD");
            })
        }
    })









    $(document).on("click", ".tabs li.tabheader", function() {
        var cont = $(this).parent().parent();
        var c = $(this).attr("id");
        cont.find("li.tabheader").removeClass("act");
        $(this).addClass("act");
        cont.find(".tabbody").hide();
        cont.find("." + c).show();
    });



    $(document).on("click", ".newAcdpOk", function() {
        var add = true;
        var name = "";
        if ($(".newAcdpInitial").val() != undefined) {
            name = $(".newAcdpInitial").val();
            initial = $(".newAcdpInitial").val();
        }
        name += $(".newAcdpName").val();
        if (TablenumberRows < 9) {

            if (initial == "F") {
                if (!IsNumeric($(".newAcdpName").val()) || $(".newAcdpName").val() > 99 || $(".newAcdpName").val() < 0) {
                    alert("Priority name must be a number between 0-99");
                    add = false;
                }
            } else if (initial == "M") {
                if (!IsNumeric($(".newAcdpName").val()) || $(".newAcdpName").val() > 9 || $(".newAcdpName").val() < 0) {
                    alert("Priority name must be a number between 0-9");
                    add = false;
                }

            } else if (!IsNumeric($(".newAcdpName").val())) {
                alert("Priority name must be a number");
                add = false;
            }
            if (!IsNumeric($(".newAcdpTime").val()) || $(".newAcdpTime").val() > 1 || $(".newAcdpTime").val() < 0) {
                alert("Priority time must be a decimal number between 0-1");
                add = false;
            }

            if (add) {
                var html = "<tr class='rowData' ><td><input class='newAcdpInitialInput'  value='" + name + "' readonly/></td><td><input class='newAcdpTimeInput'  value='" + $(".newAcdpTime").val() + "' /></td></tr>";
                $(".ACDpriority").append(html);
                TablenumberRows++;
                $(".newAcdpInitial").val("");
                $(".newAcdpName").val("");
                $(".newAcdpTime").val("");
            }
        }

    });
});
var initial = "none";
var TablenumberRows = 0;
var allPriorities = 0;
var pModel = "";
var pServer = "";
var pStatus = "";
var pAcd = "";
var pInitial = "";
// newAcd(mdata, complex, nod_id, modelId, server)
function newAcd(data2, modelId, server, sdata, data, id) {
    var name = "";
    var prios = ""
    var status = "create";
    pModel = modelId;
    pServer = server;
    pAcd = id;
    if (data != null) {
        var allData = data.split(";");
        name = allData[0];
        for (var rows = 1; rows < allData.length - 1; rows++) {
            var priosData = allData[rows].split("__");
            TablenumberRows++;
            prios += "<tr class='rowData' ><td><input class='newAcdpInitialInput'  value='" + priosData[0] + "' readonly/></td><td><input class='newAcdpTimeInput'  value='" + priosData[1] + "' /></td></tr>";
        }
        status = "edit";
    }

    pStatus = status;
    $(document).on("click", ".newAcdCancel", function() {
        $(".newACD").off("click", ".newAcdpOk");
        closeWindows("newACD");
    });
    $(document).on("click", ".ACDpriority tr", function() {
        $('.ACDpriority tr').removeClass("selected");
        $(this).addClass("selected");
    });
    $(document).on("click", ".newAcdpremove", function() {
        TablenumberRows--;
        if (TablenumberRows < 0) {

            TablenumberRows = 0;
        }

        $('.ACDpriority tr.selected').remove();
    });
    var r_data = "F__F;M__M";

    var Types = "1__Transactional;2__Batch";
    var data = "";
    data += "<div class='view_pre mydata'>";
    data += "<div class='tabs'><ul>\n\
 \n\
<li id='tabproperties' class='act tabheader'>Properties</li>\n\
<li id='tabpriorties' class=' tabheader'>priorties</li>\n\
</ul>\n\
<div class='tabproperties tabbody'>"
    data += CreateFiled("Name", "text", "newAcdName", name, "");
    data += CreateFiled("CPU Factor", "hidden", "newAcdFactor", "0", "");
    data += CreateFiled("IO Factor", "hidden", "newAcdIo", "0", "");

    data += CreateFiled("Workload Type", "select", "newAcdLoad", "", "", Types);
    data += CreateFiled("complexName", "hidden", "complexName", data2, "");






    data += CreateFiled("Number Of Terminals", "hidden", "newAcdTerminals", "100", "");
    // data += CreateFiled("Virtual", "checkbox", "newAcdVertual", "1", "");
    if (status == "create") {
        data += CreateFiled("Deploy to Servers", "list", "serversList", "", "", data2);
    }

    data += "</div>\n\
<div style='display:none' class='tabpriorties tabbody'>";
    if (sdata == 0) {
        data += CreateFiled("Initial", "select", "newAcdpInitial", "", "", r_data);
    }



    data += CreateFiled("Name", "text", "newAcdpName", "", "");
    data += CreateFiled("Time", "text", "newAcdpTime", "", "");
    data += CreateFiled("add", "button", "newAcdpOk");
    data += CreateFiled("remove", "button", "newAcdpremove");
    data += CreateFiled('priority', 'borderOpen', "", "", "fieldset");
    data += "\
        <table class='ACDpriority data_grid'>\n\
                    <thead><tr><th>priority Name</th><th>priority Time</th></tr></thead>\n\
                    <tbody>" + prios + "</tbody>\n\
        </table>";
    data += CreateFiled('Line', 'borderClose');
    data += "</div></div></div><div class=\"do_center\">";
    data += CreateFiled("OK", "button", "newAcdOk");
    data += CreateFiled("Cancel", "button", "newAcdCancel", "", "_50");
    data += "</div>";
    return data;
    /* var rows = [];
     var table = {
     name: "messageEdit",
     class: "data_grid",
     type: "table",
     rows: rows
     ,
     columns: [
     {title: "Messageid", type: "hidden", name: "rowId"},
     {title: "Message Name", type: "text", name: "rowName"},
     {title: "Producer Activity", type: "text", name: "messagePA"},
     {title: "Consumer activity", type: "text", name: "messageCA"},
     {title: "utilization frequency", type: "text", name: "messageUF"}]
     };
     var form=new FormClass("newACD");
     form.fields=[{
     "type": "tabs"
     },
     
     {
     "type": "tab",
     "title": "ACD Properties",
     "name": "props"
     },
     {
     "title": "name",
     "name": "acdName",         
     type: "text",
     "pClass": "_100 "
     },
     {
     "title": "Deploy to servers",
     "name": "serversList",           
     type: "list",
     "pClass": "_100 ",
     options:data2
     }
     ,
     {
     "type": "endtab"
     },
     
     
     {
     "type": "tab",
     "title": "priorities",
     "name": "prios"
     },
     {
     "title": "name",
     "name": "prioName",            
     type: "text"
     },
     {
     "title": "time",
     "name": "priotime",            
     type: "text"
     },
     {
     "value": "add",
     "name": "prioadd",            
     type: "button"
     },
     {
     "value": "remove",
     "name": "prioremove",            
     type: "button"
     }
     ,table,{
     
     },
     {
     "type": "endtab"
     }
     
     ,
     {
     "type": "endtabs"
     }];
     var fields = form._renderhtml();
     form.fields = [
     {
     "type": "div",
     "class": "do_center _100"           
     },
     {
     
     "type": "button",
     "name": "newACDOK",
     "value": "Ok"
     },
     {
     
     "type": "button",
     "name": "newACDCancel",
     "value": "cancel"
     },
     {
     "type": "enddiv"
     }
     
     
     ];
     form.events = [
     {
     "action": "close"
     , "event": "click"
     , "eventClass": "newACDCancel"
     },
     {
     "action": "send",
     "url": "ajax/project/newProject.jsp",
     "options": {status: "createprog"},
     "event": "click",
     "eventClass": "createProjectOK",
     "done": function(data) {
     alert(" Project created sucessfully !" + $.trim(data));
     form.closeWindow();
     create_new_module($.trim(data));
     }
     
     }
     
     
     
     
     ];
     var footer = form._renderhtml();
     form.windows = {
     "class": "newACD",
     "title": "New ACD",
     "content": fields,
     "footerContent": footer,
     "x": "500",
     "y": "220",
     width: "400", height: "280"
     };
     form._renderWindows();*/
}

//prio inst edit
function prioInstEdit(sdata, data, id, modelId) {

    var prios = ""
    var allPriorities = 0;
    var TablenumberRows = 0;
    var allData = data.split(";");
    for (var rows = 0; rows < allData.length - 1; rows++) {
        TablenumberRows++;
        var priosData = allData[rows].split("__");
        allPriorities++;
        prios += "<tr class='rowData' ><td><input class='newAcdpInitialInput'  value='" + priosData[0] + "' /></td><td><input class='newAcdpTimeInput'  value='" + priosData[1] + "' /></td></tr>";
    }



    var initial = "none";
    $(document).on("click", ".editprioCancel", function() {
        closeWindows("editprio");
    });
    $(document).on("click", ".editprioOk", function() {

        allPriorities = 0;
        var tdata = "";
        $(".ACDpriority tr.rowData").each(function(i) {


            allPriorities += parseFloat($(this).find(".newAcdpTimeInput").val());
            tdata += $(this).find(".newAcdpInitialInput").val() + "__" + $(this).find(".newAcdpTimeInput").val() + ";";
        })



        var link = "?tdata=" + tdata + "&status=editInst";
        if (TablenumberRows < 1) {
            alert("Priorities can't be empty");
        } else if (allPriorities !== 1) {

            alert("Priorities time in all levels must be equal to 1");
        } else {
// 

            $.get("ajax/createAcd.jsp" + link + "&acdId=" + id + "&modelId=" + modelId, function(mdata) {
                $.get("ajax/aciPrios.jsp" + link + "&aci=" + id + "&modelId=" + modelId, function(prios) {
                    $(".aci_Priorities").html(prios);
                    closeWindows("editprio");
                })
            })
        }
    })








    $(document).on("click", ".ACDpriority tr", function() {
        $('.ACDpriority tr').removeClass("selected");
        $(this).addClass("selected");
    });
    $(document).on("click", ".newAcdpremove", function() {
        TablenumberRows--;
        if (TablenumberRows < 0) {

            TablenumberRows = 0;
        }

        $('.ACDpriority tr.selected').remove();
    });
    var r_data = "F__F;M__M";
    var data = "";
    data += "<div class='view_pre mydata'>";
    if (sdata == 0) {
        data += CreateFiled("Initial", "select", "newAcdpInitial", "", "", r_data);
    }



    data += CreateFiled("Name", "text", "newAcdpName", "", "");
    data += CreateFiled("Time", "text", "newAcdpTime", "", "");
    data += CreateFiled("add", "button", "newAcdpOk");
    data += CreateFiled("remove", "button", "newAcdpremove");
    data += CreateFiled('priority', 'borderOpen', "", "", "fieldset");
    data += "\
        <table class='ACDpriority data_grid'>\n\
                    <thead><tr><th>priority Name</th><th>priority Time</th></tr></thead>\n\
                    <tbody>" + prios + "</tbody>\n\
        </table>";
    data += CreateFiled('Line', 'borderClose');
    data += "</div><div class=\"do_center\">";
    data += CreateFiled("OK", "button", "editprioOk");
    data += CreateFiled("Cancel", "button", "editprioCancel", "", "_50");
    data += "</div>";
    return data;
}/*
 function server_windows_data(data2) {
 
 
 var data = "<script>";
 data += " server_windows_data_do();</script>\n\
 <div class=\"mydata\">" + data2 + "</div><div class='do_center'><input type=\"button\" class=\"server_windows_data_Close_bt\"  value=\"Update\"></div>\n\
 ";
 return data;
 }
 */


function hostdialogue_windows_do(pid, ids) {

    $(document).off("click", ".DBinst");
    $(document).on("click", ".DBinst", function() {



        $.get("ajax/views/groupView/dbinst.jsp?status=DBinstances&id=" + $(".log_servers").val(), function(DBinstances) {
            $.get("ajax/views/groupView/dbinst.jsp?status=DBinstancesName&id=" + $(".log_servers").val(), function(DBinstancesName) {
                $.get("ajax/views/groupView/dbinst.jsp?status=DBinstancestype&id=" + $(".log_servers").val(), function(type) {
                    dbinst(pid, ids, $(".log_servers").val(), $(".complex").val(), $(".SERVER_INST_ID").val(), DBinstances, DBinstancesName, type, $(".DBinststatus").val());
                })
            })
        })

    });
    $(document).on("click", ".host_Resources_Close_bt", function() {

        closeWindows("hostdialogue_show_windows");
    })

}

function nodeExtension_windows_do() {

    $(".nodeExtension_Close_bt").click(function() {

        closeWindows("nodeExtensionWindow");
    })

}

function handleRow(selector) {
    var cl = selector.attr('class');
    $(".sqlTr").removeClass("act");
    selector.addClass('act');
}
function handleTable(id, selector) {
    var cl = selector.parent().parent().children(".indextd").children("select");
    cl.html('<option>Loading...</option>');
    $.get("ajax/indexList.jsp?table=" + id, function(mdata) {

        var indexes = getmyOptions(mdata);
        cl.html(indexes);
    });
}

/*
 function server_windows_data_do() {
 $(".baseSqlTable").change(function() {
 
 alert($(this).val());
 });
 $(".server_windows_data_Close_bt").click(function() {
 
 var streams = 20;
 var batch = 1;
 var active = 0;
 if ($(".batchWork").is(':checked')) {
 streams = $(".applicationStreams").val();
 batch = 2;
 }
 if ($(".sqlActivated").is(':checked')) {
 active = 1;
 }
 
 $.get("ajax/updateServerData.jsp?aciId=" + $(".applicationID").val() + "&acId=" + $(".acID").val() + "&mpl=" + $(".mpl").val() + "&sqlId=" + $(".sqlID").val() + "&batch=" + batch +
 "&appCpu=" + $(".applicationCpu").val() + "&appIo=" + $(".applicationIo").val() + "&appDelay=" + $(".applicationDelay").val() + "&appStreams=" + streams +
 "&sqlCpu=" + $(".sqlCpu").val() + "&sqlIo=" + $(".sqlIo").val() + "&sqlActive=" + active + "&MEAN_AUX_DELAY=" + $(".MEAN_AUX_DELAY").val()
 , function(mdata) {
 
 //
 
 });
 //table save
 var myLink = "";
 var myupdateLink = "";
 $(".addedSqlRow").each(function() {
 
 myLink += $.trim($(this).children("td").children(".baseSqlName").val()) + ","
 + $.trim($(this).children("td").children(".baseSqlVerb").val()) + ","
 + $.trim($(this).children("td").children(".baseSqlVolume").val()) + ","
 + $.trim($(this).children("td").children(".baseSqlFraction").val()) + "," +
 +$.trim($(this).children("td").children(".baseSqlTable").val()) + "," +
 +$.trim($(this).children("td").children(".baseSqlIndex").val()) + "," +
 +$.trim($(this).children("td").children(".baseSqlCluster").val()) + "," +
 ";";
 });
 if (myLink != "") {
 $.ajax({
 type: "POST",
 url: "ajax/xact/insertSql.jsp",
 data: {
 values: myLink,
 id: $.trim($(".sqlInstance").attr("id")) + "," + $.trim($(".sqlDesc").attr("id")) + "," + $.trim($(".modelId").attr("id"))
 }
 
 }).done(function(data) {
 
 
 $(".sqlRow").each(function() {
 
 
 
 
 myupdateLink += $.trim($(this).children("td").children(".baseSqlVerb").val()) + ","
 + $.trim($(this).children("td").children(".baseSqlVolume").val()) + ","
 + $.trim($(this).children("td").children(".baseSqlFraction").val()) + "," +
 +$.trim($(this).children("td").children(".baseSqlCluster").val()) + "," +
 +$.trim($(this).children(".basesqlInstance").attr("id")) + "," +
 +$.trim($(this).children(".basesqlDesc").attr("id")) +
 ";";
 });
 $.ajax({
 type: "POST",
 url: "ajax/xact/updateSql.jsp",
 data: {
 values: myupdateLink,
 id: $.trim($(".sqlInstance").attr("id")) + "," + $.trim($(".sqlDesc").attr("id")) + "," + $.trim($(".modelId").attr("id"))
 }
 
 }).done(function(data) {
 
 
 }
 
 );
 }
 
 );
 }
 
 
 closeWindows("server_windows_data");
 })
 
 }*/


//




function scenario_par(MODEL_ID, SCENARIO_ID, OBJECT_ID, OBJECT_CLASS, S_PARAMETER, OLD_VALUE, Table) {
    if (S_PARAMETER == "UTILIZATION_FREQUENCY") {
        OLD_VALUE = OLD_VALUE * 100;
    }
    return "<script>scenario_par_do(\"" + Table + "\",'" + OBJECT_ID + "','" + SCENARIO_ID + "','" + MODEL_ID + "');</script><div class=\"mi view_pre mydata\"> \n\
 <div class=\"frm_row do_left\" >\n\
<div class=\"frm_label\">default value</div><div class=\"frm_input\">\n\
<input readonly=\"readonly\" class=\"scenario_par_OLD_VALUE\"  value=\"" + OLD_VALUE + "\"></div></div> \n\
<input type=\"hidden\" class=\"scenario_par_MODEL_ID\"   value=\"" + MODEL_ID + "\">\n\
<input type=\"hidden\" class=\"scenario_par_SCENARIO_ID\"   value=\"" + SCENARIO_ID + "\">\n\
<input type=\"hidden\" class=\"scenario_par_OBJECT_ID\"   value=\"" + OBJECT_ID + "\">\n\
<input type=\"hidden\" class=\"scenario_par_OBJECT_CLASS\"   value=\"" + OBJECT_CLASS + "\">\n\
<input type=\"hidden\" class=\"scenario_par_S_PARAMETER\"   value=\"" + S_PARAMETER + "\">\n\
<div class=\"frm_row do_left\" >\n\
<div class=\"frm_label\">adjusted value</div><div class=\"frm_input\" >\n\
<input class=\"scenario_par_NEW_VALUE\" value=\"\"></div></div></div>\n\
<div class=\"do_center\"> <input type=\"button\" class=\"scenario_par_next_bt\"  value=\"Next\"> <input type=\"button\" class=\"scenarioEditCancel\"  value=\"Cancel\"> </div>";
}

function uodatEnodePro(tabel, id, sid, mid) {


    var link = tabel + "/" + id + "/" + sid + "/" + mid;
    $.get("modules/mod_nodeproperties/index.jsp?pro_id=" + link, function(r_data) {



        $("#Properties_con").html(r_data);
        $(".mxWindow").remove();
    })




}

function scenario_par_do(tabel, id, sid, mid) {


    $(".scenario_par_next_bt").click(function() {
//$(".view_crest_do_des").val() + $(".view_crest_do_name").val()
        var newValue = $(".scenario_par_NEW_VALUE").val();
        if ($(".scenario_par_S_PARAMETER").val() == "UTILIZATION_FREQUENCY") {
            newValue = newValue / 100;
        }
        var fildes = "MODEL_ID;SCENARIO_ID;OBJECT_ID;OBJECT_CLASS;S_PARAMETER;OLD_VALUE;NEW_VALUE";
        var values = $(".scenario_par_MODEL_ID").val() + ";" + $(".scenario_par_SCENARIO_ID").val()
                + ";" + $(".scenario_par_OBJECT_ID").val() + ";" + $(".scenario_par_OBJECT_CLASS").val() + ";" +
                $(".scenario_par_S_PARAMETER").val() + ";" + $(".scenario_par_OLD_VALUE").val() + ";" +
                newValue;
        var table = "scenario_parameters";
        var table_capacity_plan = "capacity_plan";
        var table_paramsystem = "paramsystem";
        var deletevalues_capacity_plan = $(".scenario_par_SCENARIO_ID").val() + ";" + $(".scenario_par_OBJECT_ID").val();
        var deletefildes_capacity_plan = "ID;BE_ID";
        var deletevalues_paramsystem = $(".scenario_par_MODEL_ID").val() + ";" + $(".scenario_par_SCENARIO_ID").val() + $(".scenario_par_OBJECT_ID").val();
        var deletefildes_paramsystem = "MODEL_ID;M_ID;BE_ID";
        var deletefildes = "MODEL_ID;SCENARIO_ID;OBJECT_ID;OBJECT_CLASS;S_PARAMETER";
        var deletevalues = $(".scenario_par_MODEL_ID").val() + ";" + $(".scenario_par_SCENARIO_ID").val()
                + ";" + $(".scenario_par_OBJECT_ID").val() + ";" + $(".scenario_par_OBJECT_CLASS").val() + ";" +
                $(".scenario_par_S_PARAMETER").val();
        $.get("ajax/engine/DBDeletValue.jsp?fildes=" + deletefildes + "&values=" + deletevalues + "&table=" + table + "", function(data) {
            $.get("ajax/engine/DBInsert.jsp?fildes=" + fildes + "&values=" + values + "&table=" + table + "", function(data) {
                if ($(".scenario_par_OBJECT_CLASS").val() == "com.acrtek.xact.data.bo.BoBusinessEntity" && $(".scenario_par_S_PARAMETER").val() == "number") {
                    $.get("ajax/engine/DBDeletValue.jsp?fildes=" + deletefildes_capacity_plan + "&values=" + deletevalues_capacity_plan + "&table=" + table_capacity_plan + "", function(data) {
                    });
                    $.get("ajax/engine/DBDeletValue.jsp?fildes=" + deletefildes_paramsystem + "&values=" + deletevalues_paramsystem + "&table=" + table_paramsystem + "", function(data) {
                    });
                }

                uodatEnodePro(tabel, id, sid, mid);
                var dtt = $(".scenario_par_NEW_VALUE").val() * 100;
                $("." + $(".scenario_par_OBJECT_ID").val()).html(dtt + "%");
            })
            closeWindows("_scenarios_properties");
        })



    })
    $(".scenarioEditCancel").click(function() {
        closeWindows("_scenarios_properties");
    });
}
var modelId;
function nodeListActions(id) {
    $(".nodeListCancel").click(function() {
        closeWindows("nodeList");
    })
    $(".goToServer").click(function() {
        var selectedNode = $(".nodeNoMdlList").val();
        if (selectedNode != null) {

            selectedNode = "" + selectedNode;
            var ids = selectedNode.split("^");
            //id.split


            var sendid = "location/" + ids[1] + "/null/" + id;
            //    var link2 = "?alias=xact&module=groupview&pro_id=" + sendid + "&heighlight=" + id[1];
            var cloudID = "view_imglobal";
            var cloudName = "Global";
            $(".im_divs .group" + cloudID + "").remove();
            $(".im_tabs ul #group" + cloudID).remove();

            addCloude(sendid, cloudName, null, cloudID);
            /*
             $(".im_divs").append("<div class='formoer imps_vids do_group  actgroup group" + cloudID + "'  >\n\
             <ul class=\"group_tabs\"></ul><div class='data'></div></div>");
             $(".im_tabs ul #" + cloudID).after(" <li onClick=\"thActions('group" + cloudID + "');\" id='group" + cloudID + "'  style=\"border-bottom:4px solid #000\"  class=\"formoer im_tabs_li act \"><span>" + cloudName + " Group View </span></li>");
             */




            //  afetraGroup(sendid, "groupview_imglobal", ids[0]);
            $(".show_d").remove();
            $(".show_d").remove();
            $(".spreview").hide();
            $(".cpreview").hide();
            $(".gpreview").show();
            $("#div_group").click();
        }
        closeWindows("nodeList");
    })
}
function openNodeInGroup(id) {
    var selectedNode = $(".nodeNoMdlList").val();
    if (selectedNode != null) {

        selectedNode = "" + selectedNode;
        var ids = selectedNode.split("^");
        var sendid = "location/" + ids[1] + "/null/" + id;
        //    var link2 = "?alias=xact&module=groupview&pro_id=" + sendid + "&heighlight=" + id[1];
        var cloudID = "view_imglobal";
        var cloudName = "Global";
        $(".im_divs .group" + cloudID + "").remove();
        $(".im_tabs ul #group" + cloudID).remove();

        /*
         $(".im_divs").append("<div class='formoer imps_vids do_group  actgroup group" + cloudID + "'  >\n\
         <ul class=\"group_tabs\"></ul><div class='data'></div></div>");
         $(".im_tabs ul #" + cloudID).after(" <li onClick=\"thActions('group" + cloudID + "');\" id='group" + cloudID + "'  style=\"border-bottom:4px solid #000\"  class=\"formoer im_tabs_li act \"><span>" + cloudName + " Group View </span></li>");
         */
        addCloude(sendid, cloudName, null, cloudID);


        // afetraGroup(sendid, "groupview_imglobal", ids[0]);
        $(".show_d").remove();
        $(".show_d").remove();
        $(".spreview").hide();
        $(".cpreview").hide();
        $(".gpreview").show();
        $("#div_group").click();
    }
}





$(function() {

    $(document).on("click", ".ComputeBok", function() {
        var data = "";
        $(".BVCol").each(function() {
            data += $(this).find(".BVIID").val() + "__" + $(this).find(".BVInput").val() + ";";
        });
        
        
        
            
               var ids= $(".BVIID").attr("id");
               
        
           if (showMyloadingCompute(ids.split("__")[2]) == "0") {
               
           

        $(".comblog .data").html("");
        $(".comblog_title").text("");
        getlog($(".BVIID").attr("id"), "", "");
        $(".comblog").slideDown();
        
           }
        $.get("ajax/scenario/businessVolumeScenario.jsp?data=" + data + "&status=compute&ids=" + $(".BVIID").attr("id"), function(treedata) {

            closeWindows("businessVolume");
            showMyloading(".main", "end");
        })






    });
    $(document).on("click", ".ComputeBokCancel", function() {
        closeWindows("businessVolume");
    });
})

function businessVolume(Data) {



//id



    var data = "<div class='view_pre mydata'>" + Data + "</div>";
    data += " <div class=\"do_center\">";
    data += CreateFiled("Compute", "button", "ComputeBok");
    data += CreateFiled("Cancel", "button", "ComputeBokCancel", "", "_50");
    data += "   </div>";
    return data;
}


$(document).on("click", ".view_model_properties", function() {




    $.get("ajax/engine/returnrow.jsp?table=model&id=" + $(this).attr("id").split("_")[1], function(data) {
        model_propreties(data);
    })


})






////////////////////////////////////// move procet
function models_project(data, pro_id) {


//  id=id.split(",");
    return "<script>view_models_project_do('" + pro_id + "');</script>\n\
    <div class='mydata'>" + data + "</div>" +
            "<div class=\"do_center\">\n\
<input type=\"button\" value=\"Cancel\" class=\"model_list_form_Cancel\">\n\
<input type=\"button\" value=\"Next\" class=\"model_list_form_next\">\n\
</div>";
}

function view_models_project_do(pro_id) {

    $(".model_list_form_Cancel").click(function() {
        closeWindows("move_Project");
    })

    $(".model_list_form_next").click(function() {


        $(".addCID_Project").parent().parent().parent().parent().parent().parent().remove();
        $(".usres_Project").parent().parent().parent().parent().parent().parent().remove();
        //   $(".addCID_Project").parent().parent().parent().parent().parent().parent().remove();

        makeWinDows("move Project : addCID", "addCID_Project", addCID_project(pro_id), 440, 240, 400, null);
    })


}

function addCID_project(pro_id) {


//  id=id.split(",");
    return "<script>addCID_project_do('" + pro_id + "');</script>\n\
<div class='mydata'>\n\
" + makeFromRow("CID:", "", "text", "CID_input", "left", "left", "65%", "32%", "65%") + "</div>" +
            "<div class=\"do_center\">\n\
<input type=\"button\" value=\"Cancel\" class=\"addCID_list_form_Cancel\">\n\
<input type=\"button\" value=\"Next\" class=\"addCID_list_form_next\"></div>";
}

function addCID_project_do(pro_id) {

    $(".addCID_list_form_Cancel").click(function() {
        $(".usres_Project").parent().parent().parent().parent().parent().parent().remove();
        $(this).parent().parent().parent().parent().parent().parent().parent().parent().remove();
        xactWindowsClose(this);
    })

    $(".addCID_list_form_next").click(function() {

        var link = $(".CID_input").val();
        if (link == 0) {
            alert("The Project will be Visible to all user. Move Anyway?")
        }
        $(".usres_Project").parent().parent().parent().parent().parent().parent().remove();
        $.get("ajax/project/get_usres.jsp?&cid=" + link, function(data) {

            makeWinDows("move Project :usres", "usres_Project", usres_project(data, pro_id), 460, 260, 400, null);
        })


    })

}

function user_project_do(pro_id) {
    $(".data_grid.users tr").click(function() {
        $(".data_grid.users tr").removeClass("act");
        $(this).addClass("act");
    });
    $(".usres_list_form_Cancel").click(function() {

        $(this).parent().parent().parent().parent().parent().parent().parent().parent().remove();
        xactWindowsClose(this);
    });
    $(".usres_list_form_next").click(function() {

        var username = $(".data_grid.users tr.act").attr("id");
        if (username != null && pro_id != null) {


            $.get("ajax/project/set_project_move.jsp?&username=" + username + "&pro_id=" + pro_id, function(data) {



                alert('the project has been moved successfuly.');
                window.location = "?alias=home";
            });
        }



    });
}

function usres_project(data, pro_id) {
    return "<script>user_project_do('" + pro_id + "');</script><style></style><div class='mydata'>" + data + "</div>" +
            "<div class=\"do_right\">\n\
<input type=\"button\" value=\"Cancel\" class=\"usres_list_form_Cancel\">\n\
<input type=\"button\" value=\"Next\" class=\"usres_list_form_next\"></div>";
}

//////////////////////////////////////

function Node_Extended_Properties() {


    return "<script>view_paramters_do();</script><style></style>" +
            makeFromRow("Cancel", "Imp", "button", "name", "top", "bottom", "32%", "0", "100%", "float:right;text-align:center", "", "width:80%") +
            makeFromRow("Cancel", "Imp", "button", "name", "top", "bottom", "32%", "0", "100%", "float:right;text-align:center", "", "width:80%");
}

function return_value(table, filde, id) {

    var return_data = "";
    $.get("ajax/engine/returnValue.jsp?table=" + table + "&filde=" + filde + "&id=" + id, function(data) {
        return_data = data;
    })


    return return_data;
}

function makeFromRow(label, value, type, name,
        labelPostion, inputPostion, width, labelwidth, inputwidth, more_css, label_more_css, input_more_css, readonly) {

    var labelclass = "";
    var inputclass = "";
    if (labelPostion == "top") {
        labelclass = "do_top";
    } else if (labelPostion == "right") {
        labelclass = "do_right";
    }
    else if (labelPostion == "left") {
        labelclass = "do_left";
    } else if (labelPostion == "bottom") {
        labelclass = "do_bottom";
    }





    if (inputPostion == "top") {
        inputclass = "do_top";
    } else if (inputPostion == "right") {
        inputclass = "do_right";
    }
    else if (inputPostion == "left") {
        inputclass = "do_left";
    } else if (inputPostion == "bottom") {
        inputclass = "do_bottom";
    }




    if (inputwidth == null) {
        inputwidth = "70%";
    }

    if (more_css == null) {
        more_css = "clear:both; width:100%;";
    }

    if (labelwidth == null) {
        labelwidth = "30%";
    }


    if (labelwidth == "0") {
        label_more_css += ";display:none;"
    }

    var retund = "<div style=\"" + more_css + ";width:" + width + ";\" class=\"frm_row\">";
    if (type == "text") {
        retund += "<div style=\"line-height: 25px; width:" + labelwidth + ";" + label_more_css + "\" class=\"frm_label " + labelclass + "\">" + label + "</div>";
        retund += " <div style=\"width:" + inputwidth + ";\"   class=\"frm_input   " + inputclass + "\"><input value=\"" + value + "\" style=\" width:98%;" + input_more_css + ";\"  " + readonly + "   type=\"text\" name=\"" + name + "\" class=\"" + name + "\"  />";
    } else if (type == "textarea") {
        retund += "<fieldset><legend>" + label + "</legend>";
        retund += "<textarea style=\"width:" + inputwidth + ";" + input_more_css + "\"   " + readonly + "  type=\"text\"  name=\"" + name + "\" >" + value + "</textarea>";
    } else if (type == "checkbox") {
        retund += "<div style=\"line-height: 25px; width:" + labelwidth + ";" + label_more_css + "\" class=\"frm_label " + labelclass + "\">" + label + "</div></fieldset>";
        var st = "checked";
        if (value == null || value == "" || value == "0") {
            st = ""
        }
        ;
        retund += " <div style=\"width:" + inputwidth + ";\"   class=\"frm_input\"><input v " + readonly + "  style=\"" + input_more_css + ";\" " + st + " type=\"checkbox\" name=\"" + name + "\" />";
    }
    else if (type == "button") {

        retund += " <div style=\"width:" + inputwidth + ";\"    class=\"frm_input\"><input  " + readonly + " value=\"" + label + "\" style=\"" + input_more_css + ";\"  type=\"button\" name=\"" + name + "\" />";
    }
    else if (type == "select") {
        retund += "<div style=\"line-height: 25px; width:" + labelwidth + ";" + label_more_css + "\" class=\"frm_label " + labelclass + "\">" + label + "</div>";
        retund += " <div style=\"width:" + inputwidth + ";\"   class=\"frm_input   " + inputclass + "\"><select value=\"" + value + "\" style=\" width:98%;" + input_more_css + ";\"  " + readonly + "   type=\"text\" name=\"" + name + "\" /></select>";
    } else if (type == "lable") {
        retund += "<div style=\"line-height: 25px; width:" + labelwidth + ";" + label_more_css + "\" class=\"frm_label " + labelclass + "\">" + label + "</div>";
        if (value != "") {
            retund += " <div style=\"display:none; width:" + inputwidth + ";\"    class=\"frm_input\">";
            retund += "<div  style=\"" + input_more_css + ";\">\"" + value + "\"</div>";
        } else {


            retund += " <div style=\"width:" + inputwidth + ";\"    class=\"frm_input\">";
        }
    }
    retund += "</div></div>";
    return retund;
}

















