/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */



function updateTabModel(Class) {





    $(Class + " .tabBody").eq(0).show();
    $(Class + " .tabTitle").eq(0).addClass("act");
    $(Class + " .tabTitle").click(function() {
        var mClass = $(this).attr("id");
        mClass = mClass.replace("title", "body");

        $(Class + " .tabTitle").removeClass("act");

        $(this).addClass("act");

        $(Class + " .tabBody").hide();
        $(Class + "  ." + mClass).show("slow");


    })


}



