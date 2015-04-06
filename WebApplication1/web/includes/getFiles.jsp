<%@page  import="lib.Options.MyVariables" %>
<%
    String js_link = MyVariables.jsFolder;
%>

<!--
<script type="text/javascript" src="<%=js_link%>jquery.jsfield-1.0.js" ></script>

<script type="text/javascript" src="<%=js_link%>jquery.validate.js" ></script>

<link rel="stylesheet" type="text/css" href="<%=js_link%>ext/resources/css/ext-all.css" />

-->










<link rel="stylesheet" media="screen" type="text/css" href="<%=js_link%>upload/fileuploader.css" />
<link type="text/css" href="<%=js_link%>jqueryui/css/cupertino/jquery-ui-1.8.13.custom.css" rel="stylesheet" />
<link rel="stylesheet" media="screen" type="text/css" href="<%=js_link%>colorPicker/css/colorpicker.css" />
<link rel="stylesheet" type="text/css" href="<%=js_link%>treeview/jquery.treeview.css" />
<script type="text/javascript" src="<%=js_link%>jquery.js" ></script>

<script type="text/javascript" src="<%=js_link%>libs/helperClass.js" ></script>
<script type="text/javascript" src="<%=js_link%>libs/postionsClass.js" ></script>
<script type="text/javascript" src="<%=js_link%>libs/formClass.js" ></script>
<script type="text/javascript" src="<%=js_link%>libs/messagesClass.js" ></script>
<script type="text/javascript" src="<%=js_link%>libs/mxgraphClass.js" ></script>


<script type="text/javascript" src="<%=js_link%>mxgraph/mxgraphUtils.js" ></script>






<script type="text/javascript" src="<%=js_link%>jsUtils.js" ></script>
<script type="text/javascript" src="<%=js_link%>jqueryui/js/jquery-ui.js" ></script>
<script type="text/javascript" src="<%=js_link%>colorPicker/js/colorpicker.js"></script>
<script type="text/javascript" src="<%=js_link%>mxgraph/general.js"></script>

<script type="text/javascript" src="<%=js_link%>jquery.rightClick.js" ></script>
<script type="text/javascript" src="<%=js_link%>/xact/my.js" ></script>
<script type="text/javascript" src="<%=js_link%>/xact/xact.js" ></script>

<script type="text/javascript" src="<%=js_link%>/xact/layout.js" ></script>
<script type="text/javascript">mxBasePath = '<%=MyVariables.jsFolder%>mxgraph/src';</script>
<script type="text/javascript" src="<%=js_link%>/xact/windows.js" ></script>
<script type="text/javascript" src="<%=js_link%>/xact/Windowsfiles/project_windows.js" ></script>
<script type="text/javascript" src="<%=js_link%>/xact/Windowsfiles/genWindows.js" ></script>

<script type="text/javascript" src="<%=js_link%>/views/ImplementationWindows.js" ></script>


<script type="text/javascript" src="<%=js_link%>/xact/PopupMenu.js" ></script>
<script type="text/javascript" src="<%=js_link%>mxgraph/src/js/mxClient.js"></script>


<script type="text/javascript" src="<%=js_link%>mxgraph/styles.js"></script>

<script type="text/javascript" src="<%=js_link%>mxgraph/CorporateCreateClass.js"></script>




<script type="text/javascript" src="<%=js_link%>upload/fileuploader.js" ></script>



<script type="text/javascript" src="<%=js_link%>treeview/jquery.treeview.js"></script>



<script type="text/javascript" src="<%= MyVariables.jsFolder%>timers.js"></script>

<link href="https://code.google.com/apis/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?libraries=geometry&sensor=false"></script>



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








