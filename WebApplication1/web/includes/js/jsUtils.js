/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$(function() {

    $("foreignobject").css(" position", "relative");

})





function getListValuse(selectores) {

    var foo = [];

    $(selectores + ' :selected').each(function(i, selected) {
        foo[i] = $(selected).attr("value");
    });
    return        foo;



}

function showMyloading(myclass, Status, size) {

    //size = full small 

    //   $(".main").append("<div class=\"myloading\"><img src=\"/Xact/images/ajax-loader.gif\" /> </div>"); 
    if (Status === "start") {
        $(".myloading").remove();



        $(myclass).append("<div class=\"myloading " + size + "\"><img src=\"/Xact/images/ajax-loader.gif\" /> </div>");
    } else {
        $(".myloading").remove();

        //  $(myclass).remove(".myloading"); 

    }


}



function is_login(data) {

    $.get("ajax/sesstion/islogin.jsp", data);


}



$(function() {



})


function checkSession(name)
{



}

function showloading(url, myclass, size) {

    showMyloading(".main", "start", size);

    if (xhrpp) {
        xhrpp.abort();
    }
    xhrpp = $.get(url, function(data) {
        $("." + myclass).html(data);
        showMyloading(".main", "end", size);
    }

    )

}





/*ajax template
 * 
 *       var x = new Array(dddl);
 ajaxAbort(x);
 dddl=loadAjax("http://localhost:8080/Xact/ajax/engine/getMain.jsp?alias=xact&model_id=1319836684971","data","hide","");
 * 
 */



function loadAjax(url, putClass, loaderLoadin, size, moreText, moreTextbefor, addtype) {

    loaderLoadin = loaderLoadin.split(",")

    if (loaderLoadin[0] != "hide" && (loaderLoadin[0] == "start" || loaderLoadin[0] == "all")) {

        showMyloading("." + loaderLoadin[1], "start", size);

    }




    var dddd = $.get(url, function(data) {



        if (moreTextbefor == null) {
            moreTextbefor = "";

        }
        if (moreText == null) {
            moreText = "";

        }

        if (addtype == "append")
        {
            $(putClass).append(moreTextbefor + data + moreText);
        } else if (addtype == "text")
        {
            $(putClass).text(moreTextbefor + data + moreText);
        }


        else {

            $(putClass).html('');
            $(putClass).html(moreTextbefor + data + moreText);
        }





        if (loaderLoadin[0] != "hide" && (loaderLoadin[0] == "end" || loaderLoadin[0] == "all")) {
            showMyloading("." + loaderLoadin[1], "end", size);
        }

    }
    )


    return   dddd;

}






function setAjax(url, loaderLoadin, size, done) {

    loaderLoadin = loaderLoadin.split(",")

    if (loaderLoadin[0] != "hide" && (loaderLoadin[0] == "start" || loaderLoadin[0] == "all")) {

        showMyloading("." + loaderLoadin[1], "start", size);

    }


    var callbacks = $.Callbacks();


    callbacks.add(done);
      var dddd = $.get(url, function(data) {

        callbacks.fire(data);
        
        if (loaderLoadin[0] != "hide" && (loaderLoadin[0] == "end" || loaderLoadin[0] == "all")) {
            showMyloading("." + loaderLoadin[1], "end", size);
        }

    });



    return   dddd;

}


function ajaxAbort(dddl) {

    for (i = 0; i < dddl.length; i++) {
        if (dddl[i]) {
            dddl[i].abort();
        }

    }

}





String.prototype.replaceAll = function(token, newToken, ignoreCase) {
    var str, i = -1, _token;
    if ((str = this.toString()) && typeof token === "string") {
        _token = ignoreCase === true ? token.toLowerCase() : undefined;
        while ((i = (
                _token !== undefined ?
                str.toLowerCase().indexOf(
                _token,
                i >= 0 ? i + newToken.length : 0
                ) : str.indexOf(
                token,
                i >= 0 ? i + newToken.length : 0
                )
                )) !== -1) {
            str = str.substring(0, i)
                    .concat(newToken)
                    .concat(str.substring(i + token.length));
        }
    }
    return str;
};


function showMessage(type, title, Body, okTitle, addAction) {

    var data = "";
    var more = '';


    if (okTitle != "") {

        more += '<button class=\'button ok\'>' + okTitle + '</button>';
    }
    if (type != 'err') {
        more += "<div class='cbt'></div>";
    }
    data = "<div class='xmessagep " + type + "'><div class='xmessage " + type + "'>\n\
<h3 class='title'>" + title + "</h3>" + Body + " " + more + "</div><div class='bg'></div></div>";

    $(".mymassges").append(data);




    if (okTitle != '') {
        $("body").on("click", "." + type + " .ok", addAction);
    }



    $("body").on("click", ".button.cancel ,.cbt", function() {
        $(this).parent(".xmessage").parent(".xmessagep").remove();
    });

    // return data;





}




function isValid(Class, or) {
    var retData = true;



    if ($.trim($(Class).val()) == "" || $.trim($(Class).val()) == or) {
        retData = false;
        $(Class).addClass("require");
        alert("Some Fields Are Required!");
    }


    return  retData;
}
function IsNumeric(input)
{
    return (input - 0) == input && input.length > 0;
}
