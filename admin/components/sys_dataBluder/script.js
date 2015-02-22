$(function() {


    $(document).on("change", "#editable", function() {

        var htmlData = "";
        var Values = $(this).val();



        for (var i = 0; i < Values.length; i++) {

            htmlData += "<div><label>" + Values[i] + " as Type</label><select id='" + Values[i] + "' class='" + Values[i] + "__asValue editDVlaues'  >\n\
  <option class='text'>Text</option>\n\\n\
   <option class='comboBox'>comboBox</option>\n\
</select></div>";
        }

        $(".editdata .data").html(htmlData);
        updateEdit();
    })




    $(document).on("change", ".editDVlaues", function() {

        updateEdit();

    })


    $(document).on("change", "#pluginTitle", function() {



        var obj = $(this).parent().parent().parent();
        getAjax("admin/pluginoption", "plugin=" + $(this).val(), function(d) {

            obj.find(".PlguinOptions").html(d);


        })


    })

    $(document).on("change", "#filter", function() {
        var htmlData = "";
        var Values = $(this).val();



        for (var i = 0; i < Values.length; i++) {

            htmlData += "<div><label>" + Values[i] + " as Value</label><input id='" + Values[i] + "' class='" + Values[i] + "__asValue filterDVlaues'  /></div>";
        }

        $(".filterdata .data").html(htmlData);
        updatefiler();

    })

    $(document).on("focusout", ".filterDVlaues", function() {

        updatefiler();

    })


    $(document).on("change", "#addlink", function() {

        var htmlData = "";
        var Values = $(this).val();



        for (var i = 0; i < Values.length; i++) {

            htmlData += "<div><div><label>" + Values[i] + " as Link</label>\n\
<textarea id='" + Values[i] + "' title =' Hidden Id Format [@%hidden_com_products@id%@] , Other  Fields [@%ID%@] ,other  variables [@%get::id%@,@%post::id%@] ' class='" + Values[i] + "__asValue addlinkDVlaues'  ></textarea><\n\
</div>";

            htmlData += "<div><label>" + Values[i] + " as Link Type</label>\n\
<select id='" + Values[i] + "' class='" + Values[i] + "__asValue addlinkTypeDVlaues'  >\n\
  <option class='page'>Page</option>\n\
   <option class='lightbox'>Light Box</option>\n\
   <option class='tooltip'>Tooltip</option>\n\
</select>\n\
</div></div><div class='line'></div>";

        }

        $(".addlinkdata .data").html(htmlData);
        updateAlllink();
    })

    $(document).on("focusout", ".addlinkDVlaues,.addlinkTypeDVlaues", function() {


        updateAlllink();

    })






})



function updateAlllink() {
    var htmlData = "";
    $(".addlinkDVlaues").each(function() {
        if ($.trim($(this).val()) != "") {

            var type = $(this).parent().parent().find(".addlinkTypeDVlaues").val();
            htmlData += $(this).attr("id") + ">" + $(this).val() + ">" + type + ",";
        }
    })

    $("#addlinkDVlaues").val(htmlData);
}


function updatefiler() {

    var htmlData = "";
    $(".filterDVlaues").each(function() {
        if ($.trim($(this).val()) != "") {


            htmlData += $(this).attr("id") + ">" + $(this).val() + ",";
        }
    })

    $("#filterDVlaues").val(htmlData);


}




function  updateEdit() {


    var htmlData = "";
    $(".editDVlaues").each(function() {
        if ($.trim($(this).val()) != "") {


            htmlData += $(this).attr("id") + ">" + $(this).val() + ",";
        }
    })

    $("#editDVlaues").val(htmlData);


}

