/*
 * To change this template, choose Tools | Templates and open the template in
 * the editor.
 */
package reports;

import lib.Options.MyVariables;

/**
 *
 * @author ismail
 */
/**
 * <b><i>The class that represents the inputs type.</i></b>  <br> Getting
 * the type of input you need by calling getData() method with the correct type
 * as a parameter
 *
 *
 */
public class inputs {

    /**
     * Gets the text input component.
     *
     * @param title the label used for the input, this value will also be used
     * as the style class.
     * @param name the input name
     * @param value the initial value of the element
     * @param width the width percentage of this component
     * @return a string representing the html code for this input
     */
    private String getText(String title, String name, String value, String width) {

        String returndata = "";

        String titleClass = title.replace(" ", "_");

        returndata += "<div class='allRow " + titleClass + "  text " + width + " '>"
                + "<div class='label'>" + title + "</div>"
                + "<div class='input'><input name='" + name + "' class='" + name + " input_text'   value='" + value + "' type='text'     /></div>"
                + "</div>";

        return returndata;


    }

    /**
     * Gets the file upload component.
     *
     * @param title the label used for the input, this value will also be used
     * as the style class.
     * @param name the input name
     * @param value the initial value of the element
     * @param width the width percentage of this component
     * @return a string representing the html code for this input
     */
    private String getFile(String title, String name, String width, String filePath) {



        String returndata = "";

        String titleClass = title.replace(" ", "_");


        String[] fileDate = filePath.split("____");


        returndata += "<div class='allRow " + titleClass + "  text " + width + " '>"
                + "<div class='label'>" + title + "</div>"
                + "<div class='input' >"
                + "<div  id='" + name + "'  class='" + name + " input_text'       >"
                + "</div><div id='ch_" + name + "'></div>"
                + "</div>"
                + "</div>"
                + ""
                + "<script> "
                + "  function createUploader(){     "
                + " new qq.FileUploader({ "
                + "  element: document.getElementById('" + name + "'), "
                + ""
                + " listElement: document.getElementById('ch_" + name + "') "
                + ",onSubmit: function(id, fileName){$('#ch_" + name + "').html('')"
                + ";"
                + "alert ('" + fileDate[0] + "');"
                + "}"
                + " ,action: '" + MyVariables.siteUrl + "ajax/admin/uploadFile.jsp?filePath=" + fileDate[0] + "&name=" + fileDate[1] + "' "
                + " });    "
                + " } "
                + ""
                + "$(function(){  createUploader();}) "
                + "</script> ";














        return returndata;


    }

    /**
     * Gets the date input component. It displays a calendar to select the date
     * from.
     *
     * @param title the label used for the input, this value will also be used
     * as the style class.
     * @param name the input name
     * @param value the initial value of the element
     * @param width the width percentage of this component
     * @return a string representing the html code for this input
     */
    private String getDate(String title, String name, String value, String width) {

        String returndata = "";

        String titleClass = title.replace(" ", "_");

        returndata += "<div class='allRow " + titleClass + "  text " + width + " '>"
                + "<div class='label'>" + title + "</div>"
                + "<div class='input'><input  readonly='readonly' name='" + name + "' class='" + name + " input_date'   value='" + value + "'   type='text'   /></div>"
                + "</div>";

        return returndata;


    }

    private String getReadonly(String title, String name, String value, String width) {

        String returndata = "";

        String titleClass = title.replace(" ", "_");

        returndata += "<div class='allRow " + titleClass + "  text " + width + " '>"
                + "<div class='label'>" + title + "</div>"
                + "<div class='input'><input  readonly='readonly' name='" + name + "' class='" + name + "'   value='" + value + "'   type='text'   /></div>"
                + "</div>";

        return returndata;


    }

    /**
     * Gets the editor input component. This is a ckeditor rich editor
     *
     * @param title the label used for the input, this value will also be used
     * as the style class.
     * @param name the input name
     * @param value the initial value of the element
     * @param width the width percentage of this component
     * @return a string representing the html code for this input
     */
    private String getEditor(String title, String name, String value, String width) {

        String returndata = "";

        String titleClass = title.replace(" ", "_");



        returndata += "<div class='allRow " + titleClass + "  editor " + width + " '>"
                + "<div class='label'>" + title + "</div>"
                + "<div class='input'><textarea name='" + name + "' class='" + name + " editor_text' >"
                + "" + value + ""
                + "</textarea></div>"
                + "</div>";


        String editortoolbr =
                " toolbar :["
                + "{name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl' ] },"
                + "{ name: 'links', items : [ 'Link','Unlink','Anchor' ] }, "
                + "{ name: 'tools', items : [ 'Maximize', 'ShowBlocks'] },"
                + "{ name: 'styles', items : ['FontSize'] },"
                + "{ name: 'styles2', items : ['Font' ] },"
                + "{ name: 'colors', items : ['TextColor','BGColor' ] },"
                + "{name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },"
                + "{ name:'insert', items : ['Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','Iframe' ] }"
                + "],";


        /*
         * if(strstr(product, "wrench")) { print.ln("This is a wrench.")' }
         *
         */
        if (name.indexOf("Data") <= -1) {

            returndata += "<script>  "
                    + ""
                    + ""
                    + ""
                    + ""
                    + "if (CKEDITOR.instances['" + name + "']) {CKEDITOR.instances['" + name + "'].destroy(true);}"
                    + "$(function(){"
                    + "$('.editor_text." + name + "').ckeditor("
                    + " function() {}, {"
                    + editortoolbr
                    + " height:100,"
                    + " width:'90%',"
                    + " uiColor : '#ccc'"
                    + ""
                    + " });"
                    + "})"
                    + "</script>";
        }
        return returndata;



        /*
         * String editortoolbr_all = " toolbar :[" + "{name: 'document', items :
         * [
         * 'Source','-','Save','NewPage','DocProps','Preview','Print','-','Templates'
         * ] }," + "{name: 'paragraph', items : [
         * 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl'
         * ] }," + "{name: 'clipboard', items :
         * ['Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo'
         * ]}, " + "{name: 'editing', items :
         * ['Find','Replace','-','SelectAll','-','SpellChecker', 'Scayt' ] }," +
         * "{name: 'forms', items : [ 'Form', 'Checkbox', 'Radio', 'TextField',
         * 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField' ] }," +
         * "{name: 'basicstyles', items : [
         * 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat'
         * ] }," + "{ name: 'links', items : [ 'Link','Unlink','Anchor' ] }, " +
         * "{ name:'insert', items :
         * ['Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak','Iframe'
         * ] }," + "{ name: 'styles', items :
         * ['Styles','Format','Font','FontSize' ] }," + "{ name: 'colors', items
         * : ['TextColor','BGColor' ] }," + "{ name: 'tools', items : [
         * 'Maximize', 'ShowBlocks','-','About' ] }" + "],";
         *
         */









    }

    /**
     * Gets the editor crop image component. This is a ckeditor rich editor
     *
     * @param title the label used for the input, this value will also be used
     * as the style class.
     * @param name the input name
     * @param value the initial value of the element
     * @param width the width percentage of this component
     * @return a string representing the html code for this input
     */
    private String getCrop(String title, String name, String value, String width) {


        String returndata =
                "<div class='f_bar'>"
                + "<input type='button' class='image_Edit' value='Edit'>"
                + "<input type='button' class='image_past' value='past'>"
                + "<input type='button' class='image_delete' value='Delete'>"
                + "</div>"
                + "<div class='tool_bar'>"
                + "<div  class='myptop' style='margin: auto;width:130px;height:130px;overflow:hidden;'>"
                + "<div class='myprev'><img src='' class='preview' alt='Preview' class='jcrop-preview' />"
                + "</div>"
                + "<div id='coords'>"
                /*
                 * + "<label>X1 <input type='text' size='4' class='x1' name='x1'
                 * /></label>" + "<label>Y1 <input type='text' size='4'
                 * class='y1' name='y1' /></label>" + "<label>X2 <input
                 * type='text' size='4' class='x2' name='x2' /></label>" +
                 * "<label>Y2 <input type='text' size='4' class='y2' name='y2'
                 * /></label>"
                 */
                + "<label>W <input type='text' size='4' class='w_1' name='w' /></label>"
                + "<label>H <input type='text' size='4' class='h_1' name='h' /></label>"
                + "</label>"
                + "</div></div>"
                + "<form target='" + name + "crop_iframe' action='" + MyVariables.siteUrl + "cropimage' class='crop_form' method='post' >"
                + "<input type='hidden' class='x' name='l' />"
                + "<input type='hidden' class='y' name='t' />"
                + "<input type='hidden' class='w' name='w' />"
                + "<input type='hidden' class='h' name='h' />"
                + "<input type='hidden' class='imagestatus' name='imagestatus' value='jpg' />"
                + "<input type='hidden'  class='f' name='f' value='jpg' />"
                + "<input type='hidden'  class='image_name' name='image_name' class='image_name'  value='' />"
                + "<input type='hidden'  class='image_path' name='image_path' value='" + title + "' />"
                + "<input type='hidden' size='20' class='i' name='i' value=''/>"
                + "<div class='t_bar'>"
                + "<input type='submit' class='doselection' value='Crop Selection' />"
                + "<input type='button' class='dodeselect' value='Deselect' />"
                + "<input type='button' class='image_reset' value='Reset' />"
                + "</div>"
                + "</form>"
                + "</div>"
                + "<iframe name='" + name + "crop_iframe'  class='crop_iframe' src=''></iframe>"
                + "<div class='dropFile'></div>"
                + "<div class='dropFilech' style=''></div>"
                + "<div class='update_img'>" + "<img class='target'  src=''/>" + "</div>"
                + "<div class='mytextarea'>"
                + " <textarea cols='10'  class='" + name + "_editorC'   name='" + name + "_editorC' height='100' rows='60'></textarea>"
                + "</div>"
                + "<div class='update_img_1'  /> </div>"
                + "  ";




        return returndata;
    }

    /**
     * This the method that gets called from outside the class as it's the only
     * public method. It calls any of the other functions based on the type
     * argument.
     *
     * @param type the type of input you want the method to return
     * @param title the label used for the input, this value will also be used
     * as the style class.
     * @param name the input name
     * @param value the initial value of the element
     * @param width the width percentage of this component
     * @return a string representing the html code for this input
     */
    public String getInput(String type, String title, String name, String value, String width, String filepath) {
        String returndata = "";
        if (type.equalsIgnoreCase("text")) {
            returndata = this.getText(title, name, value, width);
        } else if (type.equalsIgnoreCase("editor")) {
            returndata = this.getEditor(title, name, value, width);

        } else if (type.equalsIgnoreCase("file")) {
            returndata = this.getFile(title, name, width, filepath);

        } else if (type.equalsIgnoreCase("date")) {
            returndata = this.getDate(title, name, value, width);

        } else if (type.equalsIgnoreCase("crop")) {
            returndata = this.getCrop(title, name, value, width);

        } else if (type.equalsIgnoreCase("readonly")) {
            returndata = this.getReadonly(title, name, value, width);

        }






        return returndata;

    }
}
