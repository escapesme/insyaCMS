<%@page  import="lib.Options.MyVariables" %>
<%
    String js_link = MyVariables.siteUrl + MyVariables.jsFolder;
%>



<link type="text/css" href="<%=js_link%>jqueryui/css/cupertino/jquery-ui-1.8.13.custom.css" rel="stylesheet" />
<link rel="stylesheet" media="screen" type="text/css" href="<%=js_link%>colorPicker/css/colorpicker.css" />
<link rel="stylesheet" media="screen" type="text/css" href="<%=js_link%>upload/fileuploader.css" />
<link rel="stylesheet" type="text/css" href="<%=js_link%>ext/resources/css/ext-all.css" />
<link rel="stylesheet" type="text/css" href="<%=js_link%>treeview/jquery.treeview.css" />


<script type="text/javascript" src="<%=js_link%>jquery.js" ></script>
<script type="text/javascript" src="<%=js_link%>jquery.validate.js" ></script>

<script type="text/javascript" src="<%=js_link%>jquery.jsfield-1.0.js" ></script>
<script type="text/javascript" src="<%=js_link%>jqueryui/js/jquery-ui.js" ></script>
<script type="text/javascript" src="<%=js_link%>colorPicker/js/colorpicker.js"></script>
<script type="text/javascript" src="<%=js_link%>treeview/jquery.treeview.js"></script>

<script type="text/javascript" src="<%=js_link%>jquery.rightClick.js" ></script>
<script type="text/javascript" src="<%=js_link%>xact/my.js" ></script>
<script type="text/javascript" src="<%=js_link%>xact/xact.js" ></script>
<script type="text/javascript" src="<%=js_link%>xact/layout.js" ></script>

<script type="text/javascript">mxBasePath = '<%=js_link%>mxgraph/src_15';</script>
<script type="text/javascript" src="<%=js_link%>/xact/windows.js" ></script>
<script type="text/javascript" src="<%=js_link%>/xact/Windowsfiles/genWindows.js" ></script>
<script type="text/javascript" src="<%=js_link%>/xact/PopupMenu.js" ></script>
<script type="text/javascript" src="<%=js_link%>mxgraph/src_15/js/mxClient.js"></script>
<script type="text/javascript" src="<%=js_link%>mxgraph/styles.js"></script>

<script type="text/javascript" src="<%=js_link%>mxgraph/mxgraphUtils.js" ></script>



<script type="text/javascript" >

    $(function() {

        $(".ui-state-default").hover(function() {

            $(this).addClass("ui-state-hover");

            $("a.disable .ui-state-default").removeClass("ui-state-hover");


        }, function() {
            $(this).removeClass("ui-state-hover");
        })

        $("a.disable .ui-state-default").removeClass("ui-state-hover");
        $("a.disable").click(function() {
            return false;

        })




    })


</script>











