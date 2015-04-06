/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */




$(function() {



    $("html").on("moveWindows", function(event, param1, param2) {

        $(".xactWindows").draggable({handle: ".xactWindowsTitle"});
        $(".xactWindows").resizable();
        $(".toCenter").center();

        var postions = new postionsClass();
        postions._updatePostions();

    });
})




function maxLengthCheck(t) {



}
FormClass = function(fromName)
{


    var h = new helperClass();
    this.WidowsID = h.generateId();
    /**
     *  
     <ul><li> <b>"title"</b>: Title of the field, it will be used as its label<br></li>
     <li><b>"type"</b>: type of the field to be created. the following are the available types:<br>
     <ol style="color:blue">
     <li><i>Text</i>:represents text field</li>
     <li><i>Textarea</i>:represents text area</li>
     <li><i>select</i>:represents drop down list</li>
     <li><i>list</i>:represents list</li>
     <li><i>radio</i>:represents radio group</li>
     <li><i>upload,image</i>:represents file upload</li>
     <li><i>colr</i>:represents color chooser</li>
     <li><i>number</i>:represents text field taht accepts only number</li>
     <li><i>checkbox</i>:represents boolean select checkbox</li>
     <li><i>line</i>:represents line seperator</li>
     <li><i>border</i>:represents the openening of field set, needs to be paired with endBorder</li>
     <li><i>endBorder</i>:represents the closing of field set, needs to be paired with border</li>
     <li><i>div</i>:represents the openening of div container, needs to be paired with endDiv</li>
     <li><i>endDiv</i>:represents the closing of div container, needs to be paired with div</li>
     <li><i>label</i>:represents text label not biound to specific component</li>
     <li><i>button</i>:represents button</li>
     </ol></li>
     <br>
     <li> <b>"name"</b>: name attribute<br></li>
     <li><b> "Value"</b>: initial value of the filed<br></li>
     <li><b> "class"</b>: class attribute<br></li>
     <li><b>"options"</b>: options for multi value fields, like select or radio<br></li>
     <li><b>"uploadFolder"</b>: folder to be used for the file uploads<br></li>
     <li><b> "filename"</b>: ""</li></ul>
     */
    this.fields = "";
    /**
     <ul><li> <b>"title"</b>: window title<br></li>
     <li> <b>"class"</b>: class attribute for the window, this attribute is what used to close the window<br></li>
     <li><b>"content"</b>: html content to put inside the window<br></li>
     <li><b>"footerContent"</b>: html content to put inside the window footer. usually the ok and cancel buttons<br></li>
     <li><b>"x"</b>:  x coordinate used to position the window<br></li>
     <li><b>"y"</b>:  y coordinate<br></li>
     <li><b>"width"</b>:  width for the window<br></li>
     <li><b>"height"</b>:  height for the window<br></li>
     <li><b>"resize"</b>:  window is resizable or not<br></li></ul>
     
     */
    this.windows = "";
    /**
     *   
     <ul><li><b>"event"</b>: name of the java script event to invoke this action. the follwoing are the available events:<br>
     <ol style="color:blue">
     <li><i>click</i>:triggers on mouse clicks</li>
     <li><i>dblClick</i>:triggers on mouse double clicks</li>
     <li><i>change</i>:triggers on value change</li>
     <li><i>blur</i>:triggers when component loses focus</li>
     <li><i>focus</i>:triggers when component gains focus</li>
     <li><i>focusin</i>:triggers when component gains focus or any of its children</li>
     <li><i>focusout</i>:triggers when component or any of its children loses focus</li>
     <li><i>focusout</i>:triggers when mouse hovers or a component</li>
     <li><i>keyDown</i>:triggers when the user first presses a key on the keyboard.</li>
     <li><i>keyPressed</i>:triggers when the user first presses a key on the keyboard.</li>
     <li><i>mUp</i>:triggers the user releases a key on the keyboard.</li>
     <li><i>mouseUp</i>:triggers when the mouse pointer is over the element, and the mouse button is released.</li>
     <li><i>mouseDown</i>:when the mouse pointer is over the element, and the mouse button is pressed.</li>
     <li><i>mouseEnter</i>:triggers when the mouse pointer enters the component area.</li>
     <li><i>mouseLeave</i>:triggers when the mouse pointer leaves the component area.</li>
     <li><i>scroll</i>:triggers when the user scrolls to a different place in the element.</li>
     <li><i>Select</i>:triggers when the user makes a text selection inside it. This event is limited to text fields and text areas.</li>
     </ol></li>
     <li> <b>"action"</b>: type of the action to take after the event been fired. the follwoing are the available types:<br>
     <ol style="color:blue">
     <li><i>send</i>:sends form data to server script to execute. ajax type action</li>
     <li><i>save</i>:sends the form data to database save script. ajax type action</li>
     <li><i>delete</i>:sends the form data to database delete script. ajax type action</li>
     <li><i>update</i>:sends the form data to database update script. ajax type action</li>
     <li><i>toggelShow</i>:toggle visiblity of some elements</li>
     <li><i>recieved</i>:updates content of an element with the recieved data. ajax type action</li>
     <li><i>close</i>:closes the window</li> 
     </ol></li>
     <br>
     <li><b>"eventClass"</b>: class of the elment to listen for the event on it<br></li>
     <li><b>"js"</b>: java script code to execute on the invocation of the event<br></li>
     <li> <b>"table"</b>: table name to execute database operation on it, usable with: save, delete and update actions<br></li>
     <li><b>"id"</b>: id of row to update its data. usable with update action<br></li>
     <li> <b>"wfields"</b>: list of fields to construct where clause by them. usable with delete action in conjuction with wvalues<br></li>
     <li><b>"wvalues"</b>: list of values to construct where clause by them. usable with delete action in conjuction with wfields<br></li>
     <li><b>"to"</b>: selector of the element to update its content. usable with recieved action<br></li>
     <li> <b>"show"</b>: selector of element to show. usable with toggleShow action<br></li>
     <li> <b>"hide"</b>: selector of element to hide. usable with toggleShow action<br></li>
     <li><b>"done"</b>: java script code to invoce upon sucessfull completion of ajax request. usable with ajax type actions<br></li>
     <li><b>"fail"</b>: java script code to invoce upon failed completion of ajax request. usable ajax type actions<br></li>
     <li> <b> "url"</b>: url of the file that will execute ajax requests, usable with ajax type actions<br></li>
     * 
     */
    this.events = "";



    this._addTofields = function(obj) {


        this.fields = this.fields.concat(obj);


    }

    this._addToEvents = function(obj) {
        this.events = this.events.concat(obj);

    }




//<editor-fold defaultstate="collapsed" desc="Windows">
    this.getWindowsObj = function() {
        return   $("." + this.windows['class']).parent();
    };
    this.showWindows = function() {
        $("." + this.windows['class']).parent().show();
    };
    this.indexWindows = function(index) {
        $("." + this.windows['class']).parent().css("z-index", index);
    };
    this.closeWindow = function() {
        var pw = "." + fromName + "widows";


        $(pw).parent().remove();
    };
    this.createWinDows = function() {

        var content = document.createElement('div');
        content.setAttribute("style", "  height: 100%;margin: 0;position: relative; display:block;");
        content.className = this.windows['class'] + " windowsDataBody";


        var cl = "." + this.windows['class'];



        if (!$(cl).is(":visible")) {


            var jscLoad = $.Callbacks();

            jscLoad.add(this.windows ['load']);

            var h = this.windowsHtml();


            $("html").append(h);


            $("html").trigger("moveWindows", ["Custom", "Event"]);
            $("html").trigger(this.WidowsID + "load", ["Custom", "Event"]);

            jscLoad.fireWith(window, ["." + this.WidowsID]);
        }
    };
    this.windowsAction = function() {
        var r = "";
        for (var i = 0; i < this.events.length; i++) {



            if (this.events[i]['action'] === "" || this.events[i]['action'] == null) {





                $(document).off(this.events[i]['event'], "." + this.events[i]['event'], null);


                $(document).on(this.events[i]['event'], "  ." + this.WidowsID + "  ." + this.events[i]['eventClass'] + "", this.events[i]['js']);







            } else {

                r += this.creatEvnt(this.events[i], this.windows);
            }


        }
        return r;
    }



    this.checkreq = function(chClasss) {

        var r = true;
        var empttyMsg = "";
        var Titles = "";
        $(chClasss + " .required").each(function() {

            if ($.trim($(this).val()) === "" && $.trim($(this).val()) === empttyMsg) {


                $(this).val(empttyMsg);
                r = false;
                $(this).css("border", "1px solid red");
                $(this).click(function() {

                    $(this).val("");
                })


                Titles += $(this).data("title") + ", ";


            }

        })

        if (Titles != "") {
            alert(Titles + " can not be empty ");
        }
        Titles = "";
        $(chClasss + " .number").each(function() {

            if (!$.isNumeric($(this).val())) {
                $(this).css("border", "1px solid red");


                r = false;
                Titles += $(this).data("title") + ", ";

            }

        });
        if (Titles != "") {
            alert(Titles + " must be number ");
        }








        if (Titles != "") {
            alert(Titles + "  must be number ");
        }







        return r;
    }
    this.creatEvnt = function(date, w) {

        /*
         eventclass
         
         this.windows['title']
         */
        var c = $.Callbacks();
        c.add(date['Callback']);


        console.log(date)

        var from = this;
        var pf = "." + fromName + "fields";
        var pw = "." + fromName + "widows";




        $(document).on("click", "  ." + this.WidowsID + " .xactWindowsClose", function() {
            if (date['action'] === "close") {



                c.fireWith(window, [$(this)]);
            }


        });




        if (date['action'] === "toggelShow") {

            $(document).off(date['event'], " ." + this.WidowsID + " ." + date['eventClass'], null);
            $(document).on(date['event'], "  ." + this.WidowsID + "  ." + date['eventClass'] + "", function() {



                var show = date['show'];
                var hide = date['hide'];
                var s = show.split("__");
                if (s[0] === "val") {

                    show = "." + $("." + s[1]).val().replace(new RegExp(" ", "g"), "_");
                }

                var h = hide.split("__");
                if (h[0] === "val") {
                    hide = "." + $("." + h[1]).val().replace(new RegExp(" ", "g"), "_");
                }

                if (s[0] === "checked") {

                    show = "." + $("." + s[1] + ":checked").val().replace(new RegExp(" ", "g"), "_");
                }

                var h = hide.split("__");
                if (h[0] === "checked") {


                    hide = "." + $("." + h[1] + ":checked").val().replace(new RegExp(" ", "g"), "_");
                }



                $(hide).hide();
                $(show).show();
            })



        } else
            var c = $.Callbacks();
        c.add(date['Callback']);










        if (date['action'] === "recieved") {
            $(document).off(date['event'], "." + date['eventClass'], null);
            $(document).on(date['event'], "." + date['eventClass'] + "", function() {
                setajax(date['url'], date['options'], function(data) {
                    $(date['to']).html(data);
                });
            })



        } else {

            $(document).off(date['event'], "." + date['eventClass'], null);






            $(document).on(date['event'], "." + date['eventClass'] + "", function() {



                var options = new Object();
                var myfildes = "";
                var myvalues = "";
                $.each($(pf + " input:not(:button) " + "," + pf + " select ," + pf + " textarea "), function(index, ele) {

                    if ($(this).prop("type") !== "button") {
                        myfildes += $(this).prop("name") + ";";
                        myvalues += $(this).val() + ";";
                    }
                });
                if (date['fail'] == null) {


                    date['fail'] = function(a, b, c) {

                        alert(b + " :: " + c + " ![" + date['url'] + "]");
                        showMyloading(".main", "end");
                    };
                }

                if (date['done'] == null) {


                    date['done'] = function() {

                        alert(" Operation done sucessfully !");
                        showMyloading(".main", "end");
                    };
                }





                if (date['action'] === "close") {


                    $(pw).parent().remove();
                } else if (date['action'] === "remove") {


                    $(date['target']).remove();
                } else if (date['action'] === "add") {


                    $(date['target']).append(date['html']);
                } else if (date['action'] === "classTothis") {



                    $("." + date['eventClass']).removeClass(date['target']);
                    $(this).addClass(date['target']);
                } else if (date['action'] === "change") {


                    $(date['target']).html(date['html']);
                } else if (date['action'] === "send") {

                    if (from.checkreq(pf)) {



                        var options = date['options'];
                        $.each($(pf + " input:not(:button) " + "," + pf + " select " + " , " + pf + " textarea "), function(index, ele) {





                            if ($(this).prop("type") === "checkbox") {

                                var a = "0";
                                if ($(this).prop('checked')) {
                                    a = "1";
                                } else {

                                    a = "0";
                                }

                                options[$(this).prop("name")] = a;


                            } else if ($(this).prop("type") === "radio") {



                                options[$.trim($(this).prop("name"))] = $("input:radio[name='" + $(this).prop("name") + "']:checked").val();




                            } else {


                                options[$(this).prop("name")] = $(this).val();
                            }


                        });


                        $.each($(pf + " table "), function(index, ele) {


                            var d = "";
                            $.each($(this).children("tr"), function(index2, ele2) {
                                $.each($(this).children("td"), function(index2, ele2) {
                                    d += $(this).find("input,select,textarea").val() + "__";
                                })

                                d += ";";
                            })
                            options['Table'] = d;
                        })

                        showMyloading(".main", "start");


                        //  console.log(options);


                        setajax(date['url'], options, date['done'], date['fail']);

                    }
                } else if (date['action'] === "save") {

                    if (from.checkreq(pf)) {

                        showMyloading(".main", "start");
                        options["table"] = date['table'];
                        options["fildes"] = myfildes;
                        options["values"] = myvalues;



                        setajax("ajax/engine/DBInsert.jsp", options, date['done'], date['fail']);
                    }


                } else if (date['action'] === "update") {
                    showMyloading(".main", "start");
                    options[table] = date['table'];
                    options[fildes] = myfildes;
                    options[values] = myvalues;
                    options[wvalues] = date['wvalues'];
                    options[wfildes] = date['wfields'];
                    setajax("ajax/engine/DBUPdate.jsp", options, date['done'], date['fail']);
                } else if (date['action'] === "delete") {



                    showMyloading(".main", "start");

                    options["table"] = date['table'];
                    /*   options["fildes"] = myfildes;
                     options["values"] = myvalues;*/

                    options["filde"] = date['filde'];
                    ;


                    options["id"] = date['id'];
                    setajax("ajax/engine/DBDelete.jsp", options, date['done'], date['fail']);
                }






                c.fireWith(window, [$(this)]);



            })
        }
    }

    this.windowsHtml = function() {
        //alert (this.windows['height']);
        if (this.windows['height'] == null) {


            this.windows['height'] = "150";
        }

        var style = "";
        var classs = "";
        if (this.windows['x'] != null) {

            style += "left:" + this.windows['x'] + "px;";

        }
        if (this.windows['y'] != null) {

            style += "top:" + this.windows['y'] + "px;";

        }

        if (this.windows['width'] != null) {
            style += "width:" + this.windows['width'] + "px;";
        } else {
            style += "width:auto;";
        }



        if (this.windows['height'] != null) {
            style += "height:" + this.windows['height'] + "px;";
        } else {
            style += "height:auto;";
        }

        style += "position:fixed;";

        if (this.windows['position'] != null) {
            //alert(this.windows['position']);
            classs += "to" + this.windows['position'] + "";
        }


        return "<div style='" + style + "' class='" + classs + " " + this.WidowsID + "  xactWindows'>\n\
    <div class='" + fromName + "widows " + this.windows['class'] + " inner'>\n\
<div class='xactWindowsClose' ></div>\n\
            <div class='xactWindowsTitle'>" + this.windows['title'] + "</div>\n\
            <div class='xactWindowsBody'><div class='mydata'>" + this.windows['content'] + "</div>\n\
<div class='windowsfooter'>" + this.windows['footerContent'] + "</div>\n\
\n\
\n\
<div class='clearfix' style='width:100%; height:1px; clear:both'></div></div>\n\
</div></div>";
    };
//</editor-fold>

//<editor-fold defaultstate="collapsed" desc="formItems">

    var updateStayle = " ;width:46%;  float:left;max-width:46%;min-width:46%;margin:1px;";




    this.getHtmlToTable = function(data) {
        data['noTitle'] = true;
        return  this.formItem(data);
    };
    this.formItem = function(date) {
        var r = "";
        var h = "";

        //  console.log(date);

        if (date['value'] === null) {
            date['value'] = "";
        }



        date['name'] = $.trim(date['name']);
        date['value'] = $.trim(date['value']);





        if (date['divideby'] != null) {


            date['value'] = parseInt(date['value']) / parseInt(date['divideby']);

        }


        if (date['multiplyby'] != null) {


            date['value'] = parseInt(date['value']) * parseInt(date['multiplyby']);

        }

        if (!date['title']) {

            date['title'] = "";
        }
        if (!date['style']) {

            date['style'] = "";
        }
        if (!date['name']) {

            date['name'] = "";
        }

        if (!date['pClass']) {

            date['pClass'] = "";
        }

        var required = date['required'];
        if (date['type'] === "label")
        {
            h += "<div  data-title=\"" + date['title'] + "\"    style=\"" + date['style'] + "\"  class=\"label   " + date['name'] + " " + date['type'] + " " + date['class'] + " \" >" + date['title'] + "</div>";
        }

        else if (date['type'] === "dataLabel" || date['type'] === "info")
        {



            h += "<div  data-title=\"" + date['title'] + "\" style=\"" + date['style'] + "\"  class=\"label   " + date['name'] + " " + date['type'] + " " + date['class'] + " \" >" + date['value'] + "</div>";
        }
        else
        if (date['type'] === "line")
        {
            h += "<div    data-title=\"" + date['title'] + "\" style=\"" + date['style'] + "\"   class=\"line " + date['name'] + " " + date['type'] + " " + date['class'] + " \" ></div>";
        }
        else
        if (date['type'] === "lineBorder")
        {
            h += "<div    data-title=\"" + date['title'] + "\" style=\"" + date['style'] + "\"  class=\"lineBorder " + date['name'] + " " + date['type'] + " " + date['class'] + " \" ></div>";
        }
        else if (date['type'] === "div")
        {
            h += "<div     data-title=\"" + date['title'] + "\" style=\"" + date['style'] + "\"  class=\" " + date['name'] + " " + date['type'] + " " + date['class'] + " \" >" + date['value'];
        } else if (date['type'] === "enddiv")
        {
            h += "</div>";
        }
        else if (date['type'] === "tabs")
        {
            h += "<div     data-title=\"" + date['title'] + "\" style=\"" + date['style'] + "\"  class=\"newtabs tabs " + date['name'] + " " + date['class'] + " \" >" + date['value'];
        } else if (date['type'] === "tab")
        {



            var moreclass = "";
            var morestyle = "";
            if (date['act'] === true) {

                moreclass = "act";

            } else {

                morestyle = "style='display:none'";

            }
            h += "<li   id='" + date['name'] + "' style=\"" + date['style'] + "\"    data-title=\"" + date['title'] + "\" class=\"tabheader tab " + moreclass + " " + date['class'] + " \" >" + date['title'] + "</li>";
            h += "<div   " + morestyle + "     data-title=\"" + date['title'] + "\" class=\" tabbody " + date['name'] + " " + date['type'] + " " + date['class'] + " \" >" + date['value'];


        }
        else if (date['type'] === "endtabs")
        {
            h += "</div>";
        }
        else if (date['type'] === "endtab")
        {
            h += "</div>";
        }
        else if (date['type'] === 'border') {
            h += "<fieldset  style=\"" + date['style'] + "\"    data-title=\"" + date['title'] + "\" style=\"text-align:left;\" class=\"" + date['name'] + " " + date['type'] + " " + date['class'] + " \"><legend><b>" + date['title'] + "</b></legend>";
        } else if (date['type'] === 'endborder') {
            h += '</fieldset>';
        } else if (date['type'] === "text")
        {

            var nr = "";
            if (date['readonly'] == true) {
                nr = " readonly";

            }

            h += "<input " + nr + " style=\"" + date['style'] + "\"   data-title=\"" + date['title'] + "\" type=\"text\"  name=\"" + date['name'] + "\"  class=\" " + nr + " " + date['name'] + " " + date['type'] + " " + required + " " + date['class'] + " \" value='" + date['value'] + "' />";
        } else if (date['type'] === "textupdate")
        {
            if (date['newvalue'] === "") {

                date['newvalue'] = date['value'];
            }


            h += "<input readonly  style=\"" + date['style'] + " ;" + updateStayle + "\"   data-title=\"" + date['title'] + "\" type=\"text\"  name=\"" + date['name'] + "\"  class=\"readonly " + date['name'] + " " + date['type'] + " " + required + " " + date['class'] + " \" value='" + date['value'] + "' />\n\
                  <input  style=\"" + date['style'] + " ;" + updateStayle + "\"   data-title=\"" + date['title'] + " Update\" type=\"text\"  name=\"" + date['name'] + "_new\"  class=\"" + date['name'] + "_new " + date['type'] + " " + required + " " + date['class'] + " \" value='" + date['newvalue'] + "' />";




        } else if (date['type'] === "headerupdate")
        {




            h += "<input readonly  style=\"" + date['style'] + " ;" + updateStayle + ";\"   data-title=\"" + date['title'] + "\" type=\"text\"  class=\"readonly header " + date['name'] + " " + date['type'] + " " + required + " " + date['class'] + " \" value='Original Value' />\n\
                  <input readonly  style=\"" + date['style'] + " ;" + updateStayle + ";\"   data-title=\"" + date['title'] + " Update\" type=\"text\"   class=\"readonly header " + date['name'] + "_new " + date['type'] + " " + required + " " + date['class'] + " \" value='New Value' />";





        } else if (date['type'] === "button")
        {
            h += "<input style=\"" + date['style'] + "\"    data-title=\"" + date['title'] + "\" type=\"button\"  name=\"" + date['name'] + "\"  class=\"" + " " + date['class'] + " " + date['type'] + " " + date['name'] + " \" value='" + date['value'] + "' />";
        } else if (date['type'] === "textarea")
        {
            h += "<textarea style=\"" + date['style'] + "\"   data-title=\"" + date['title'] + "\"  name=\"" + date['name'] + "\"   class=\"" + date['name'] + " " + required + " " + date['type'] + " " + date['class'] + " \"  >" + date['value'] + "</textarea>";
        } else if (date['type'] === "select")
        {
            var nrstyle = "";

            var nr = "";
            if (date['readonly'] == true) {
                nr = " disabled";
                nrstyle = " readonly";
            }


            h += "<select " + nr + "  style=\"" + date['style'] + "\"  data-title=\"" + date['title'] + "\"  class=\"" + nrstyle + " " + date['class'] + " " + required + " " + date['type'] + " " + date['name'] + " \"    name=\"" + date['name'] + "\"   >" + this.getmyOptions(date['options'], date['value']) + "</select>";
        } else if (date['type'] === "list")
        {

            var nr = "";
            var nrstyle = "";
            if (date['readonly'] == true) {
                nr = " disabled";
                nrstyle = " readonly";
            }


            h += "<select " + nr + " style=\"" + date['style'] + "\"  data-title=\"" + date['title'] + "\" multiple class=\"" + nrstyle + " " + required + " " + date['name'] + " " + date['type'] + " " + date['class'] + " \"    name=\"" + date['name'] + "\"   >" + this.getmyOptions(date['options'], date['value']) + "</select>";
        } else if (date['type'] === "radio")
        {
            h += "<input  style=\"" + date['style'] + "\"  data-title=\"" + date['title'] + "\" type=\"radio\"  name=\"" + date['name'] + "\"  class=\"" + date['name'] + " " + date['class'] + " \" value='" + date['value'] + "' " + date['checked'] + " />";
        } else if (date['type'] === "table")
        {


            h += "<table  style=\"" + date['style'] + "\"  data-title=\"" + date['title'] + "\" class=\"" + date['name'] + " " + date['class'] + " \" >";

            h += "<thead><tr>";



            for (var i = 0; i < date['columns'].length; i++) {


                h += "<th class='" + date['columns'][i]['type'] + "'>" + date['columns'][i]["title"] + "</th>";
            }
            h += "</tr></thead><tbody>";
            for (i = 0; i < date['rows'].length; i++) {
                var row = date['rows'][i];
                h += "<tr>";
                for (var j = 0; j < row.length; j++) {



                    date['columns'][j]["value"] = row[j];
                    h += "<td class='" + date['columns'][j]['type'] + "'>" + this.getHtmlToTable(date['columns'][j]) + "</td>";
                }
                h += "</tr>";
            }

            h += "</tr>";

            h += "</tbody></table>";
        }


        else if (date['type'] === "checkbox")
        {
            var m = "";
            if (date['value'] === "1") {
                m = "checked";
            } else {
                m = "";
            }


            h += "<input style=\"" + date['style'] + "\"  data-title=\"" + date['title'] + "\"  " + m + " type=\"checkbox\"  name=\"" + date['name'] + "\"  class=\"" + date['name'] + " " + required + " " + date['name'] + " " + date['class'] + " \" value='" + date['value'] + "' />";
        }
        else if (date['type'] === "color")
        {
            h += "<input style=\"" + date['style'] + "\"  data-title=\"" + date['title'] + "\"  type=\"color\"  name=\"" + date['name'] + "\"  class=\"color " + required + " " + date['name'] + " " + date['class'] + " \" value='" + date['value'] + "' />";
        }
        else if (date['type'] === "date")
        {
            h += "<input style=\"" + date['style'] + "\"  data-title=\"" + date['title'] + "\" type=\"date\"  name=\"" + date['name'] + "\"  class=\"date " + required + " " + date['name'] + " " + date['class'] + " \" value='" + date['value'] + "' />";
        }
        else if (date['type'] === "datetime")
        {
            h += "<input style=\"" + date['style'] + "\"  data-title=\"" + date['title'] + "\" type=\"datetime\"  name=\"" + date['name'] + "\"  class=\"datetime " + required + " " + required + "" + date['name'] + " " + date['class'] + " \" value='" + date['value'] + "' />";
        }
        else if (date['type'] === "datetime-local")
        {
            h += "<input style=\"" + date['style'] + "\"  data-title=\"" + date['title'] + "\" type=\"datetime-local\"  name=\"" + date['name'] + "\"  class=\" " + required + "  datetime-local " + date['name'] + " " + date['class'] + " \" value='" + date['value'] + "' />";
        }
        else if (date['type'] === "email")
        {
            h += "<input style=\"" + date['style'] + "\"  data-title=\"" + date['title'] + "\" type=\"email\"  name=\"" + date['name'] + "\"  class=\"email " + required + "  " + date['class'] + " " + date['name'] + " \" value='" + date['value'] + "' />";
        }
        else if (date['type'] === "month")
        {
            h += "<input style=\"" + date['style'] + "\"  data-title=\"" + date['title'] + "\" type=\"month\"  name=\"" + date['name'] + "\"  class=\"month " + required + " " + date['class'] + " " + date['name'] + " \" value='" + date['value'] + "' />";
        }
        else if (date['type'] === "number")
        {

            if (date['Precision'] != null) {


                date['Precision'] = 2;

            }


            var nr = "";
            if (date['readonly'] == true) {
                nr = " readonly";

            }

            h += "<input style=\"" + date['style'] + "\" " + nr + " data-title=\"" + date['title'] + "\" type=\"number\"  oninput=\"maxLengthCheck(this)\" \n\
max=\"" + date['max'] + "\"  min=\"" + date['min'] + "\" name=\"" + date['name'] + "\"  \n\
class=\"number " + date['name'] + " " + date['class'] + " " + nr + " " + required + " \" value='" + parseFloat($.trim(date['value'])) + "' />";
        } else if (date['type'] === "numberupdate")
        {

            if (date['Precision'] != null) {


                date['Precision'] = 2;

            }

            if ($.trim(date['newvalue']) == "") {

                date['newvalue'] = date['value'];
            }


            h += "<input style=\"" + date['style'] + " ;" + updateStayle + "\"  readonly  data-title=\"" + date['title'] + "\" type=\"number\"  oninput=\"maxLengthCheck(this)\"  max=\"" + date['max'] + "\"  min=\"" + date['min'] + "\" name=\"" + date['name'] + "\" class=\"readonly number " + date['name'] + " " + date['class'] + " " + required + " \"  value='" + parseFloat($.trim(date['value'])) + "' />\n\
                  <input style=\"" + date['style'] + " ;" + updateStayle + "\"  data-title=\"" + date['title'] + " NewValue\" type=\"number\"  oninput=\"maxLengthCheck(this)\"  max=\"" + date['max'] + "\"  min=\"" + date['min'] + "\" name=\"" + date['name'] + "_new\" class=\"number " + date['name'] + "_new " + date['class'] + " " + required + " \" value='" + parseFloat($.trim(date['newvalue'])) + "' />";

        } else if (date['type'] === "selectupdate")
        {

            if (date['Precision'] != null) {


                date['Precision'] = 2;

            }

            if ($.trim(date['newvalue']) == "") {

                date['newvalue'] = date['value'];
            }


            h += "<input style=\"" + date['style'] + " ;" + updateStayle + "\"  readonly  data-title=\"" + date['title'] + "\" type=\"text\"  oninput=\"maxLengthCheck(this)\"  max=\"" + date['max'] + "\"  min=\"" + date['min'] + "\" name=\"" + date['name'] + "\" class=\"readonly  " + date['name'] + " " + date['class'] + "  \"  value='" + parseFloat($.trim(date['value'])) + "' />\n\
                  <select style=\"" + date['style'] + " ;" + updateStayle + "\" \n\
                     data-title=\"" + date['title'] + " NewValue\" name=\"" + date['name'] + "_new\" class=\"select " + date['name'] + "_new " + date['class'] + " " + required + " \" >\n\
            " + this.getmyOptions(date['options'], date['value']) + "<</select>";

        }
        else if (date['type'] === "range")
        {
            h += "<input style=\"" + date['style'] + "\" data-title=\"" + date['title'] + "\" type=\"range\"  name=\"" + date['name'] + "\"  class=\"range " + required + " " + date['name'] + " " + date['class'] + " \" value='" + date['value'] + "' />";
        }
        else if (date['type'] === "tel")
        {
            h += "<input style=\"" + date['style'] + "\"  data-title=\"" + date['title'] + "\" type=\"tel\"  name=\"" + date['name'] + "\"  class=\"tel " + required + " " + date['name'] + " " + date['class'] + " \" value='" + date['value'] + "' />";
        }
        else if (date['type'] === "time")
        {
            h += "<input style=\"" + date['style'] + "\"  data-title=\"" + date['title'] + "\" type=\"time\"  name=\"" + date['name'] + "\"  class=\"time " + required + " " + date['name'] + " " + date['class'] + " \" value='" + date['value'] + "' />";
        }
        else if (date['type'] === "url")
        {
            h += "<input style=\"" + date['style'] + "\"  data-title=\"" + date['title'] + "\" type=\"url\"  name=\"" + date['name'] + "\"  class=\"url " + required + " " + date['name'] + " " + date['class'] + " \" value='" + date['value'] + "' />";
        }
        else if (date['type'] === "week")
        {
            h += "<input style=\"" + date['style'] + "\" data-title=\"" + date['title'] + "\" type=\"week\"  name=\"" + date['name'] + "\"  class=\"week " + required + " " + date['name'] + " " + date['class'] + " \" value='" + date['value'] + "' />";
        }
        else if (date['type'] === "hidden")
        {
            h += "<input style=\"" + date['style'] + "\" data-title=\"" + date['title'] + "\" type=\"hidden\"  name=\"" + date['name'] + "\"  class=\"" + required + " week " + date['name'] + " " + date['class'] + " \" value='" + date['value'] + "' />";
        }
        else if (date['type'] === "image" || date['type'] === "upload")
        {
            h += "<input style=\"" + date['style'] + "\" data-title=\"" + date['title'] + "\" name=\"" + date['name'] + "\"  class=\"hidden " + date['name'] + " " + required + "  " + date['class'] + " \" value='" + date['filename'] + ".jpg' /> \n\
         <div name=\"" + date['name'] + "\"  id=\"" + date['name'] + "\" ></div>\n\
                <script>createUploader('" + date['name'] + "','" + date['uploadFolder'] + "' ,'" + date['filename'] + "','" + date['filetype'] + "');</script>";



        } else if (date['type'] === "image" || date['type'] === "upload")
        {
            h += " <input style=\"" + date['style'] + "\"   data-title=\"" + date['title'] + "\" type='hidden' class=\"" + date['name'] + " " + required + "  \" value='" + date['filename'] + "' /> <div name=\"" + date['name'] + "\"  id=\"" + date['name'] + "\" >\n\
                <script>createModelUploader('" + date['name'] + "','" + date['uploadFolder'] + "' ,'" + date['filename'] + "');</script>";
        }



        if (date['type'] != "hidden"
                && $.trim(date['type']) != "button"
                && $.trim(date['type']) != "div"
                && $.trim(date['type']) != "enddiv"
                && $.trim(date['type']) != "line"
                && $.trim(date['type']) != "border"
                && $.trim(date['type']) != "lineBorder"

                && $.trim(date['type']) != "endborder"
                && $.trim(date['type']) != "label"
                && $.trim(date['type']) != "tabs"
                && $.trim(date['type']) != "tab" && $.trim(date['type']) != "endtabs"
                && $.trim(date['type']) != "endtab"

                && date['noTitle'] !== true
                )
        {



            r += " <div style=\"" + date['pStyle'] + "\"   class=\"frm_row   " + date['pClass'] + " " + date['type'] + "_p " + date['name'] + "_p \" >";
            if (date["title"] != null && date["title"] !== "") {
                r += "<div class=\"frm_label\">" + date['title'] + "</div>";
            }
            r += "<div class=\"frm_input\">" + h + "</div></div>";
        } else {


            r = h;
        }




        return r;
    }
    this.getmyOptions = function(options, value) {
        var returnData = "";
        if (options !== null) {
            var mop = options.split(";");
            for (var i = 0; i < mop.length; i++) {
                if ($.trim(mop[i]) !== "") {
                    var thop = mop[i].split("__");


                    var seleted = "";
                    if (value !== null && $.trim(value) === $.trim(thop[0])) {
                        seleted = "selected='selected'";
                    }

                    if (!thop[1]) {


                        thop[1] = thop[0];
                    }

                    returnData += "<option " + seleted + " value='" + thop[0] + "' title='" + thop[1] + "'>" + thop[1] + " </option>";
                }
            }
        }
        return returnData;
    }

    this.formItems = function() {

        var r = "";
        for (i = 0; i < this.fields.length; i++) {

            r += this.formItem(this.fields[i]);
        }


        return "<div class='" + fromName + "fields'>" + r + "</div>";
    };
//</editor-fold>

    this._renderhtml = function()
    {

        this.windowsAction(this.windows);
        return "<div class='" + this.WidowsID + "'>" + this.formItems() + "</div>";
    };
    this._renderWindows = function()
    {
        return this.createWinDows();
    };
}


