/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * 
 * @param {type} WindowTitle
 * @param {type} WindowClass
 * @param {type} WindowsContent
 * @param {type} WindowX
 * @param {type} WindowY
 * @param {type} WindowWidth
 * @param {type} WindowHeight
 * @param {type} resize
 * @returns {undefined}
 */







function  xactWindowsClose(obj) {
    $("." + obj).parent(".xactWindows").remove();
}
$(function() {











    $(".xactWindows").draggable({scroll: true});
    $(document).on("click", ".xactWindowsClose", function() {

        $(this).parent().parent(".xactWindows").remove();
    });
});
function xactWindows(WindowTitle, WindowClass, WindowsContent, WindowX, WindowY, WindowWidth, WindowHeight, resize) {

    if (WindowHeight == null) {


        WindowHeight = "180";
    }

    var style = "left:" + WindowX + "px;";
    style += "top:" + WindowY + "px;";
    style += "width:" + WindowWidth + "px;";
    if (WindowHeight != null) {
        style += "height:" + WindowHeight + "px;";
    } else {
        style += "height:auto;";
    }
    style += "position:fixed;";
    return "<div style='" + style + "' class='xactWindows'>\n\
    <div class='" + WindowClass + " inner'><div class='xactWindowsClose' ></div>\n\
            <div class='xactWindowsTitle'>" + WindowTitle + "</div>\n\
            <div class='xactWindowsBody'>" + WindowsContent + "</div>\n\
</div></div>";
}
function makeWinDows(WindowTitle, WindowClass, WindowsContent, WindowX, WindowY, WindowWidth, WindowHeight, resize) {


    var content = document.createElement('div');
    content.setAttribute("style", "  height: 100%;margin: 0;position: relative; display:block;")
    content.className = WindowClass + " windowsDataBody";
    if (!$("." + WindowClass).is(":visible")) {
        var h = xactWindows(WindowTitle, WindowClass, WindowsContent, WindowX, WindowY, WindowWidth, WindowHeight, resize);
        $("html").append(h);
        $("html").trigger("moveWindows", ["Custom", "Event"]);
    }


}


function requireFields(Fields) {

    var returnData = true;
    for (var i = 0; i < Fields.length; i++) {

        if ($.trim($(Fields[i]).val()) == "") {
            $(Fields[i]).addClass("require");
            $(Fields[i]).focus();
            returnData = false;
        } else {

            $(Fields[i]).removeClass("require");
        }
    }




    if (returnData == false) {

        alert("Some Fields are Require!");
    }

    return returnData;
}



String.prototype.toCamel = function() {
    return this.replace(/(\-[a-z])/g, function($1) {
        return $1.toUpperCase().replace('-', '');
    });
};
function getWindowsObj(WindowClass) {

    return   $("." + WindowClass).parent().parent().parent().parent().parent().parent();
}


function showWindows(WindowClass) {

    $("." + WindowClass).parent().parent().parent().parent().parent().parent().show();
}

function indexWindows(WindowClass, index) {

    $("." + WindowClass).parent().parent().parent().parent().parent().parent().css("z-index", index);
}



function closeWindows(WindowClass) {
    xactWindowsClose(WindowClass);
}


function closeAllWindows() {
    $(".xactWindows").remove();
}


function createInput(type, name, Value, inputStyle, options, filename, uploadFolder) {
    var data = "";
    if (type == 'textarea') {
        data += "<textarea  name=\"" + name + "\" style=\"" + inputStyle + "\"  class=\"" + name + " \" >" + Value + "</textarea>";
    } else if (type == 'select') {



        data += " <select  name=\"" + name + "\"  style=\"" + inputStyle + "\"   class=\"" + name + "\" >" + getmyOptions(options, Value) + "</select>";
    } else if (type == 'list') {
        data += " <select multiple name=\"" + name + "\"   style=\"" + inputStyle + "\"   class=\"" + name + "\" >" + getmyOptions(options, Value) + "</select>";
    } else if (type == 'radio') {
        data += "<input type=\"radio\" name=\"" + name + "\"  style=\"" + inputStyle + "\"   class=\"" + name + "\" value='" + Value + "' />";
    } else if (type == 'checkbox') {
        data += "<input type=\"checkbox\" name=\"" + name + "\"  style=\"" + inputStyle + "\"   class=\"" + name + "\"  value='" + Value + "' />";
    } else if (type == 'color') {
        data += "<input type=\"text\" name=\"" + name + "\"  style=\"" + inputStyle + "\"   class=\"" + name + "\" value='" + Value + "' />\n\
                 <script>createColor('." + name + "');</script>";
    } else if (type == 'upload' || type == 'image') {
        data += " <input type='hidden'  style=\"" + inputStyle + "\"  class=\"" + name + "\" value='" + filename + ".jpg' /> <script>createUploader('" + name + "','" + uploadFolder + "' ,'" + filename + "');</script>";
    } else if (type == 'hidden') {
        data += "<input type=\"hidden\" name=\"" + name + "\"  style=\"" + inputStyle + "\"   class=\"" + name + "\" value='" + Value + "' />";
    } else if (type == 'button') {
        data += "<input type=\"button\" name=\"" + name + "\"  style=\"" + inputStyle + "\"   class=\"" + name + "\" value='" + Title + "' />";
    } else if (type == 'import') {

        data += "<input type='hidden' class=\"" + name + "\"  style=\"" + inputStyle + "\"   value='" + filename + "' /> <div name=\"" + name + "\"  id=\"" + name + "\" ></div>\n\
                </div></div><script>createModelUploader('" + name + "','" + uploadFolder + "' ,'" + filename + "');</script>";
    }
    else {
        data += "<input type=\"text\"  style=\"" + inputStyle + "\"  name=\"" + name + "\"  class=\"" + name + "\" value='" + Value + "' />";
    }

    return data;
}

function CreateFiled(Title, type, name, Value, ClassStyle, options, filename, uploadFolder) {
    var data = "";
    if (type == 'borderOpen') {
        data += '<fieldset style="text-align:left;" class="' + ClassStyle + '"><legend><b>' + Title + '</b></legend>';
    } else if (type == 'borderClose') {
        data += '</fieldset>';
    } else if (type == 'textarea') {
        data += " <div class=\"frm_row do_left " + ClassStyle + "\" ><div class=\"frm_label\">" + Title + ":</div>\n\
                <div class=\"frm_input\">\n\
                <textarea  name=\"" + name + "\"  class=\"" + name + "\" >" + Value + "</textarea>\n\
                </div></div>";
    } else if (type == 'select') {
        data += " <div class=\"frm_row do_left " + ClassStyle + "\" ><div class=\"frm_label\">" + Title + ":</div>\n\
                <div class=\"frm_input\">\n\
                <select class=\"" + name + "\"   name=\"" + name + "\"   >" + getmyOptions(options, Value) + "</select>\n\
                </div></div>";
    } else if (type == 'list') {
        data += " <div class=\"frm_row do_left " + ClassStyle + "\" ><div class=\"frm_label\">" + Title + ":</div>\n\
                <div class=\"frm_input\">\n\
                <select multiple name=\"" + name + "\"  class=\"" + name + "\" >" + getmyOptions(options) + "</select>\n\
                </div></div>";
    } else if (type == 'radio') {
        data += " <div class=\"frm_row do_left " + ClassStyle + " \" >\n\
                <div class=\"frm_label\">" + Title + ":</div>\n\
                <div class=\"frm_input\">\n\
                <input type=\"radio\" " + options + " name=\"" + name + "\"  class=\"" + name + "\" value='" + Value + "' />\n\
                </div></div>";
    } else if (type == 'checkbox') {
        data += " <div class=\"frm_row do_left " + ClassStyle + " \" >\n\
                <div class=\"frm_label\">" + Title + ":</div>\n\
                <div class=\"frm_input\">\n\
                <input type=\"checkbox\" " + options + " name=\"" + name + "\"  class=\"" + name + "\" value='" + Value + "' />\n\
                </div></div>";
    } else if (type == 'color') {
        data += " <div class=\"frm_row do_left " + ClassStyle + " \" >\n\
                <div class=\"frm_label\">" + Title + ":</div>\n\
                <div class=\"frm_input\">\n\
                <input type=\"text\" name=\"" + name + "\"  class=\"" + name + "\" value='" + Value + "' />\n\
                </div></div><script>createColor('." + name + "');</script>";
    } else if (type == 'upload' || type == 'image') {

        data += " <div class=\"frm_row do_left " + ClassStyle + " \" >\n\
                <div class=\"frm_label\">" + Title + ":</div>\n\
                <div class=\"frm_input\">\n\
               <input type='hidden' class=\"" + name + "\" value='" + filename + ".jpg' /> <div name=\"" + name + "\"  id=\"" + name + "\" ></div>\n\
                </div></div><script>createUploader('" + name + "','" + uploadFolder + "' ,'" + filename + "');</script>";
    } else if (type == 'hidden') {
        data += "<input type=\"hidden\" name=\"" + name + "\"  class=\"" + name + "\" value='" + Value + "' />";
    } else if (type == 'button') {
        data += "<input type=\"button\" name=\"" + name + "\"  class=\"" + name + "\" value='" + Title + "' />";
    } else if (type == 'import') {

        data += " <div class=\"frm_row do_left " + ClassStyle + " \" >\n\
                <div class=\"frm_label\">" + Title + ":</div>\n\
                <div class=\"frm_input\">\n\
               <input type='hidden' class=\"" + name + "\" value='" + filename + "' /> <div name=\"" + name + "\"  id=\"" + name + "\" ></div>\n\
                </div></div><script>createModelUploader('" + name + "','" + uploadFolder + "' ,'" + filename + "');</script>";
    }
    else {

        data += " <div class=\"frm_row do_left " + ClassStyle + " \" >\n\
                <div class=\"frm_label\">" + Title + ":</div>\n\
                <div class=\"frm_input\">\n\
                <input type=\"text\" name=\"" + name + "\"  class=\"" + name + "\" value='" + Value + "' />\n\
                </div></div>";
    }

    return data;
}


function getmyOptions(options, value) {




    var returnData = "";
    if (options != null) {



        var mop = options.split(";");
        for (var i = 0; i < mop.length; i++) {

            if ($.trim(mop[i]) != "") {
                var thop = mop[i].split("__");
                var seleted = "";
                if (value != null && $.trim(value) == $.trim(thop[0])) {
                    seleted = "selected='selected'";
                }
                returnData += "<option " + seleted + " value='" + thop[0] + "' title='" + thop[1] + "'>" + thop[1] + " </option>";
            }

        }
    }
    return returnData;
}



function createColor(selector) {
    $(selector).ColorPicker({
        onSubmit: function(hsb, hex, rgb, el) {
            var color = "#" + hex;
            $(el).val(hex);
            $(el).ColorPickerHide();
            $(el).css("background-color", color);
        },
        onBeforeShow: function() {
            $(selector).ColorPickerSetColor(this.value);
        }
    })
            .bind('keyup', function() {
                $(this).ColorPickerSetColor(this.value);
            });
}



function createUploader(id, filePath, filename, type) {
    if (type == null || type == "undefined") {

        type = "uploadFile_g";

    }
filename=getLegalFileName(filename);

    var uploader = new qq.FileUploader({
// pass the dom node (ex. $(selector)[0] for jQuery users)
        element: document.getElementById(id),
        action: "ajax/admin/" + type + ".jsp?filePath=" + filePath + "&name=" + filename

        , onComplete: function(ids, fileName, responseJSON) {
            
            $(".mdlHolder").val(fileName);

            $("#" + id + " .qq-upload-button").hide();
            $("#" + id + " .qq-upload-button").hide();
            if (responseJSON.success) {
                $("#" + id + " .qq-upload-list").append("Uploaded Successfully");
            }
            else
            {
                $("#" + id + " .qq-upload-list").append("Upload Successful");
            }



        }
    });
}
var maxFilenameLength=40;
var illegalCharacters = ["#", "%", "&", "{", "}", "\\", "<", ">", "*", "?", "/", " ", "$", "!", "'", "\"", ":", "@", "+", "`", "|", "="];
function  getLegalFileName( filename) {
var extesnion=filename.substring(filename.lastIndexOf("."));
if(filename.length>maxFilenameLength){
    filename=filename.substring(0,maxFilenameLength)+extesnion;
}
        var data = filename;

        for (var i = 0; i < illegalCharacters.length; i++) {
            data = data.replace(illegalCharacters[i], "");
        }
        return data;

    }
function createModelUploader(id, filePath, filename) {

filename=getLegalFileName(filename);

    var uploader = new qq.FileUploader({
// pass the dom node (ex. $(selector)[0] for jQuery users)
        element: document.getElementById(id),
        // path to server-side upload script
        action: "ajax/xact/importExportModel.jsp?filePath=" + filePath + "&name=" + filename + "&status=upload"

        , onComplete: function(ids, fileName, responseJSON) {


            $("#" + id + " .qq-upload-button").hide();
            $("#" + id + " .qq-upload-button").hide();
            if (responseJSON.success) {
                $("#" + id + ".qq-upload-list").append("Uploaded Successfully");
            }
            else
            {
                $("#" + id + ".qq-upload-list").append("Upload Successful");
            }



        }


    });
}












function ArrayJP2JS(r_data) {

    r_data = r_data.replace("]", "");
    r_data = r_data.replace("[", "");
    return  Values = r_data.split(",");
}

