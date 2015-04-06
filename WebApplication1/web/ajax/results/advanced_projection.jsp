
<%!    xact.results.advancedProjection ad = new xact.results.advancedProjection();
    String link = MyVariables.siteUrl;
%>

<div>
    <%@include  file="/includes/getFiles_ajax.jsp" %>


    <script type="text/javascript" >


        $(function() {
            var buttonAP = $('.advanced_projection', window.parent.document);
            buttonAP.attr('id', 'done');
            buttonAP.data('res_data', '<%=request.getParameter("res_data")%>');

            $.get(<%=link%> + "/ajax/results/getAdvancedProjectionPath.jsp?res_data=<%=request.getParameter("res_data")%>", function(data) {
                $(".me_left_bottom").html(data);

            })

        })



    </script>

</head>

<body>




    <div class="me_left">
        <h4>Service Trajectories:</h4>
        <div class="me_left_top">

            <%=  ad.Servic_tabel(request.getParameter("res_data").split("__")[1], request.getParameter("res_data").split("__")[2])%>

        </div> 
        <h4>Service Component:</h4>
        <div class="me_left_bottom">

        </div> 
    </div>
    <div class="me_right">





    </div>





</body>
</div>
<style>


    table th {
        background: #1E1E1E;
        color: white;
        font-family: helvetica,tahoma,verdana,sans-serif;
        font-size: 8pt;
    }
    .me_right ,.me_left{
        width:40%;
        float:left; overflow: auto

    }



    .me_right {
        float: right;
        border-left:1px #eee solid ; 
        height:480px;

        width:59%;
    }
    .me_left_top , .me_left_bottom
    {
        width: 100%;
        height:170px;
        overflow: auto;

    }
    .me_left_bottom{
        margin-top:15px;
        border-top:1px #eee solid ; 
    }

    table{
        width:100%;
        border:1px #eee solid
    }

    table td{

        font-size: 8pt;
        border:1px #1E1E1E solid;
        font-family: helvetica,tahoma,verdana,sans-serif;
    }

    h4{
        background: #1E1E1E;

        color: white;
        font-size: 10pt;
        padding:2px;
        font-family: helvetica,tahoma,verdana,sans-serif;

    }
</style>




