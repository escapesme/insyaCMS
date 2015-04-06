/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */



//<editor-fold defaultstate="collapsed" desc="Done">
function importModel(pro_id, folder) {

    var form = new FormClass("importModel2222");
    form.fields = [
        {
            title: "Model File",
            name: "uploadModel",
            type: "upload",
            "uploadFolder": $.trim(folder),
            "filename": pro_id, filetype: "uploadFile_filename"

        }

    ];
    var fields = form._renderhtml();
    form.fields = [
        {
            "type": "div",
            "class": "do_center _100",
        },
        {
            "title": "Ok",
            "type": "button",
            "name": "importModelok",
            "value": "Ok"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "importModelCancel",
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
            , "eventClass": "importModelCancel"
        },
        {
            "action": "send",
            "url": "ajax/xact/importExportModel.jsp",
            "options": {status: "import", name: pro_id, filePath: folder},
            "event": "click",
            "eventClass": "importModelok",
            "done": function(data) {
                alert(" Model uploaded sucessfully !");
                showMyloading(".main", "end");
                
                                    openCorporate(".get_model:first", "c", "");

                form.closeWindow();
            }
        }



    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": "importModel2222",
        "title": "Import Model",
        "content": fields,
        "footerContent": footer,
        "x": "500",
        "y": "220",
        width: "300", height: "120"
    };
    form._renderWindows();
}
function create_new_module(pro_id) {



    var form = new FormClass("model_properties");
    form.fields = [
        {
            "title": "name",
            "name": "name",
            "class": "creat_project_name",
            type: "text",
            "pClass": "_100 ",
            "required": "required"
        },
        {
            "title": "Description",
            "name": "des",
            "class": "creat_project_desc",
            type: "textarea",
            "pClass": "_100 ",
            "required": "required"
        }


    ];
    var fields = form._renderhtml();
    form.fields = [
        {
            "type": "div",
            "class": "do_center _100",
        },
        {
            "title": "Ok",
            "type": "button",
            "name": "createModelOK",
            "value": "Ok"
        },
        {
            "title": "Import Model",
            "type": "button",
            "name": "importModel",
            "class": "importModel",
            "value": "Import"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "createModelCancel",
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
            , "eventClass": "createModelCancel"
        },
        {
            "action": "send",
            "url": "ajax/project/newProject.jsp",
            "options": {status: "createmodel", pro_id: pro_id},
            "event": "click",
            "eventClass": "createModelOK",
            "done": function(data) {
                alert(" Model created sucessfully !");
                showMyloading(".main", "end");
                form.closeWindow();
                create_Corporate(pro_id, $.trim(data));
            }
        },
        {
            "js": function() {
                getImageLocation("exports", function(imageLocaiton) {
                    form.closeWindow();
                    importModel(pro_id, $.trim(imageLocaiton));
                });
            },
            event: "click",
            eventClass: "importModel"
        }






    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": "model_properties",
        "title": "Create Model",
        "content": fields,
        "footerContent": footer,
        "position": "Center",
        "x": "500",
        "y": "220",
        width: "400", height: "180"
    };
    form._renderWindows();
}
function create_Corporate(pro_id, mod_id) {

    var options = "0__Days;1__Hours;2__Minutes;3__Seconds"

    var form = new FormClass("create_Corporate");
    form.fields = [
        {
            "title": "name",
            "name": "name",
            "class": "creat_corporate_name",
            type: "text",
            "pClass": "_100 ",
            required: "required"
        },
        {
            "title": "Number",
            "name": "Number",
            "class": "creat_corporate_number",
            type: "number",
            "pClass": "_100 ",
            required: "required"
        },
        {
            "title": "Window Duration",
            "name": "wd",
            "class": "creat_project_wd",
            type: "number",
            "pClass": "_100 ",
            min: "0",
            "required": "required"
        },
        {"title": "Window Duration Type"
            , "type": "select",
            "options": options,
            "name": "UnitType",
            "class": "corporateObjects",
            pClass: "_100 "


        },
        {
            "title": "Unit Type",
            "name": "type",
            "class": "creat_project_type",
            type: "text",
            "pClass": "_100 ",
            "required": "required"
        }

    ];
    var fields = form._renderhtml();
    form.fields = [
        {
            "type": "div",
            "class": "do_center _100",
        },
        {
            "title": "Ok",
            "type": "button",
            "name": "createCorporateOK",
            "value": "Ok"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "createCorporateCancel",
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
            , "eventClass": "createCorporateCancel"
        },
        {
            "action": "send",
            "url": "ajax/project/newProject.jsp",
            "options": {status: "creatcorporate", mod_id: mod_id},
            "event": "click",
            "eventClass": "createCorporateOK",
            "done": function(data) {


                alert("Corporate created sucessfully");
                form.closeWindow();
                $.get("ajax/engine/getModel.jsp?alias=xact&pro_is=" + pro_id, function(modelData) {
                    $(".models_list .cont").html(modelData);
                    closeWindows("pro_list_form");
                    showMyloading(".main", "end");
                    openCorporate(".get_model:first", "c", $(".creat_corporate_name").val());
                });
            },
            fail: function(data) {
                alert(data);
            }


        }



    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": "create_Corporate",
        "title": "Create Corporate",
        "content": fields,
        "footerContent": footer,
        "position": "Center",
        "x": "500",
        "y": "190",
        width: "400", height: "230"
    };
    form._renderWindows();
}



function updateProjectsList() {


    $.get("ajax/project/projectesTabelData.jsp", function(data) {
        $("table.projectes tbody").html(data);
    })

}
function scenario_Creat(CLIENT_ID, GROUP_ID, OWNER, id, type, model_id, parent_id, pro_id) {


    var form = new FormClass("scenario_Creat");
    form.fields = [
        {"title": "name",
            "class": "modelName",
            type: "text",
            "name": "NAME",
            "pClass": "_100 ",
            "required": "required"

        },
        {
            "title": "Description",
            "class": "scenarioComment",
            "name": "DESCRIPTION",
            "pClass": "_100 ",
            type: "textarea"
        },
        {
            "class": "MODEL_ID",
            "name": "MODEL_ID",
            "pClass": "_100 ",
            value: model_id,
            type: "hidden"
        },
        {
            "class": "PARENT_ID",
            "name": "PARENT_ID",
            "pClass": "_100 ",
            value: parent_id,
            type: "hidden"
        },
        {
            "class": "SCENARIO_TYPE",
            "name": "SCENARIO_TYPE",
            "pClass": "_100 ",
            value: type,
            type: "hidden"
        },
        {
            "class": "OWNER",
            "name": "OWNER",
            "pClass": "_100 ",
            value: OWNER,
            type: "hidden"
        },
        {
            "class": "GROUP_ID",
            "name": "GROUP_ID",
            "pClass": "_100 ",
            value: GROUP_ID,
            type: "hidden"
        },
        {
            "class": "CLIENT_ID",
            "name": "CLIENT_ID",
            "pClass": "_100 ",
            value: CLIENT_ID,
            type: "hidden"
        },
        {
            "class": "ID",
            "name": "ID",
            "pClass": "_100 ",
            value: id,
            type: "hidden"
        }

    ];
    var fields = form._renderhtml();
    form.fields = [
        {
            "type": "div",
            "class": "do_center _100",
        },
        {
            "title": "Ok",
            "type": "button",
            "name": "createScenarioOK",
            "value": "Ok"
        },
        {
            "title": "cancel",
            "type": "button",
            "name": "createScenarioCancel",
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
            , "eventClass": "createScenarioCancel"
        },
        {
            "action": "save",
            "table": "SCENARIO",
            "event": "click",
            "eventClass": "createScenarioOK",
            "options": {id: modelId},
            "done": function(data) {
                alert(" Scenario created sucessfully !");
                showMyloading(".main", "end");
                updateModleTreeview(pro_id);
                form.closeWindow();
            }

        }




    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": "scenarios_properties",
        "title": "Create Scenario",
        "content": fields,
        "footerContent": footer,
        "position": "Center",
        "x": "100",
        "y": "100",
        width: "400",
        height: "200"
    };
    form._renderWindows();
}
function create_Project() {

    var form = new FormClass("Create_Project");
    form.fields = [
        {
            "title": "name",
            "name": "name",
            "class": "creat_project_name",
            type: "text",
            "pClass": "_100 ", "required": "required"

        },
        {
            "title": "Description",
            "name": "des",
            "class": "creat_project_desc",
            type: "textarea",
            "pClass": "_100 "
        }





    ];
    var fields = form._renderhtml();
    form.fields = [
        {
            "type": "div",
            "class": "do_center _100",
        },
        {
            "type": "button",
            "name": "createProjectOK",
            "value": "Ok"
        },
        {
            "type": "button",
            "name": "createProjectCancel",
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
            , "eventClass": "createProjectCancel"
        },
        {
            "action": "send",
            "url": "ajax/project/newProject.jsp",
            "options": {status: "createprog"},
            "event": "click",
            "eventClass": "createProjectOK",
            "done": function(data) {
                alert(" Project created sucessfully !");
                showMyloading(".main", "end");
                form.closeWindow();
                create_new_module($.trim(data));


                updateProjectsList();
            }

        }




    ];
    var footer = form._renderhtml();
    form.windows = {
        "class": "Create_Project",
        "title": "Create Project",
        "content": fields,
        "footerContent": footer,
        "position": "Center",
        "x": "500",
        /*  
         "y": "220",*/
        width: "400", height: "200"
    };
    form._renderWindows();
}
//</editor-fold>
