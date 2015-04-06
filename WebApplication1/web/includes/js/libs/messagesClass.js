/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(function() {

    $(document).on("click", ".CloseBt", function() {

        $(this).parent().remove();

    })


    $(function() {
        $(".draggable").draggable();
        $(".resizable").resizable();
    });
    
    
    
    
})



/*
 * Name	Option1	Option2 	Option3	Option4	Default		
 Closable	Yes	No			Yes		
 Movable	Yes	No			No		
 Position	Position System				TopRight		
 FreezeApp	Yes	No			No		
 AutoHide	Yes	No			No		
 HideSeconds	500	1000	1500	2000	2000		
 Style	success	warning	error				
 Button	single (ok)	double (ok/cancel)	triple (yes/no/cancel)				
 Title							
 Body							
 Footer							
 
 
 
 * 
 */




messagesClass = function(fromName)
{

    this.message = "";


var h = new helperClass();
    this.messageID = h.generateId();


   


    this.messageHide = function()
    {
        $("." + this.messageID).hide("normal");
    }
    this.messageHtml = function()
    {

        var ob = this;
        $(document).on("click", "." + this.messageID + " .button.Ok", this.message['okCode']);
        $(document).on("click", "." + this.messageID + " .button.Yes", this.message['yesCode']);
        $(document).on("click", "." + this.messageID + " .button.No", this.message['noCode']);
        $(document).on("click", "." + this.messageID + " .button.Cancel", function() {
            ob.messageHide();
        });





        if (this.message['position'] == null) {
            this.message['position'] = "TopRight";

        }



        var moreClass = "";
        // ui-resizable


        if (this.message['Movable'] === true) {

            moreClass += " draggable ";

        }
        if (this.message['resizable'] === true) {

            moreClass += " resizable ";

        }







        var h = "<div class='" + this.messageID + "  to" + this.message['position'] + " " + moreClass + " xactMesssage " + this.message['type'] + "'>";


   h += "<div class='ico'></div>";

        if (this.message['Closable'] == true) {
            h += "<div class='CloseBt xactWindowsClose'></div>";
        }


        if (this.message['title'] != null) {
            h += "<div class='msgTitle'>" + this.message['title'] + "</div>";
        }


        if (this.message['body'] != null) {
            h += "<div class='msgbody'>" + this.message['body'] + "</div>";
        }


        if (this.message['footer'] != null) {
            h += "<div class='msgfooter'>" + this.message['footer'] + "</div>";
        }






        if (this.message['Buttons'] == "single") {
            h += "<div class=' buttons doceneter'>\n\
<input type='button' class='button' value='Ok'>\n\
</div>";
        } else if (this.message['Buttons'] == "double") {
            h += "<div class='buttons doceneter'>\n\
<input type='button' class='button Ok' value='Ok'>\n\
<input type='button' class='button Cancel' value='Cancel'>\n\
</div>";
        } else if (this.message['Buttons'] == "triple") {
            h += "<div class='buttons doceneter'>\n\
<input type='button' class='button Yes' value='Yes'>\n\
<input type='button' class='button No' value='No'>\n\
<input type='button' class='button Cancel' value='Cancel'>\n\
</div>";
        }












        h += "</div>";

        return h;
    }

    this.createMessage = function() {

        var content = document.createElement('div');


        content.setAttribute("style", "  height: 100%;margin: 0;position: relative; display:block;");
        content.className = this.message['class'] + " MsaageDataBody";
        var cl = "." + this.message['class'];
        if (!$(cl).is(":visible")) {
            var h = this.messageHtml();
            $("html").append(h).hide().show("normal");
            ;


            if (this.message['AutoHide'] == true) {
                if (this.message['HideSeconds'] == null) {
                    this.message['HideSeconds'] = 2000;

                }
                $("html").trigger("AutoHide", [this.messageID, this.message['HideSeconds']]);
            }
        }
    };



    this._renderMessage = function()
    {
        return this.createMessage();
    };
};



//$(function() {



$("html").on("AutoHide", function(event, myclass, time) {
    setTimeout(function() {
        $("." + myclass).hide("normal");
    }, time);
})
