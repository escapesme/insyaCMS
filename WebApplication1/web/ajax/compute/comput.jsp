
<%@page import="java.util.Arrays"%>
<%@page import="lib.Options.XMLDataModel"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%

    lib.engine.db.operations db = new lib.engine.db.operations();

%>
<%@page  import="lib.Options.MyVariables" %>
<%    String[] id = request.getParameter("id").split("__");

    String status = "";
    if (request.getParameter("status") != null) {

        status = request.getParameter("status");
    }

    String js_link = MyVariables.jsFolder;
    String modelID = id[1];
    String scenarioid = id[2];

    s_id = modelID;
    if (!scenarioid.equals("0")) {

        s_id = scenarioid;

    }


%>





<div class="getCapacityPlan">

    <input type="button" value="next" />


</div> 


<script type="text/javascript" src="<%=js_link%>/xact/compute.js" ></script>

<%!    lib.engine.db.operations db = new lib.engine.db.operations();
    String tableData = "";
    String comData = "";
    String s_id = "";

    String getcombo(String modelID) {
        String resdata = "";
        db.openCon();
        String[] myName = db.getColumnNOCON(XMLDataModel.BUSINESS_ENTITY_TABLENAME, "NAME", "MODEL_ID=" + modelID + " AND NUMBER >0");

        String[] myid = db.getColumnNOCON(XMLDataModel.BUSINESS_ENTITY_TABLENAME, "ID", "MODEL_ID=" + modelID + " AND NUMBER >0");

        String[] mynumber = db.getColumnNOCON(XMLDataModel.BUSINESS_ENTITY_TABLENAME, "number", "MODEL_ID=" + modelID + " AND NUMBER >0");

        tableData += Arrays.deepToString(myName);

        db.closeCon();

        db.openDBCon(lib.Options.DbInfo.connectionStringRes);
        tableData = "";
        resdata = "";

        try {
            for (int i = 0; i < myid.length; i++) {

                String[] itnum = db.getRowNocon(XMLDataModel.PARAMSYSTEM_TABLENAME, " m_id='" + s_id + "' and BE_ID=" + myid[i]);

                String val = itnum[7];

                String ar = lib.tools.Utils.getScenarioPram(modelID, s_id, myid[i], "number", mynumber[i], XMLDataModel.BUSINESS_ENTITY_TABLENAME);

                if (itnum[7] == null) {

                    resdata += "<option value=\"" + myid[i] + "__" + myName[i] + "__" + ar + " \">" + myName[i] + "</option>";
                } else {

                    tableData += "<tr  class=\"comtd clname \" ><td >" + myName[i] + "<input type=\"hidden\" class=\"myhidden\" value=\"" + myid[i] + "__" + myName[i] + "__" + ar + "__" + itnum[6] + "__" + itnum[7] + "\"/></td><td class=\"clarrival\">" + itnum[5] + "</td><td class=\"clainc\"><input type='text' class='increment' value='" + itnum[6] + "' /></td><td class=\"cllimit\">" + itnum[7] + "</td> </tr>";

                }

            }
        } catch (Exception ex) {
        }
        db.closeCon();

        return resdata;

    }


%>

<div class="comp_all">
    <div class="comp_top"><label>Business Entity:</label><div class="comp_input"><select class="be_select"><option></option> <%=getcombo(modelID)%><select></div>  </div>

                    
                                                 <div class="comp_line"></div>

                    <div class="comp_med"><div class="comp_left">
                            <div class="comp_row">  <label>Arrival Rate:</label><div class="comp_input"><input class="Arrival_Rate" readonly="readonly" type="text" value="" /></div></div>

                            <div class="comp_row">  <label>Increment:</label><div class="comp_input"><input class="Increment" type="text" value="50" />%</div></div>

                            <div class="comp_row">  <label>Elongation Limit:</label><div class="comp_input"><input class="Elongaion" type="text" value="100" />%</div></div>

                            <div class="comp_row">  <label></label><div class="comp_input"></div></div>
         <div class="comp_line"></div>
                            
                            
                            <div class="comp_row">  <input class="comp_bt_add" type="button" value="Add" /> <input class="comp_bt_remove" type="button" value="Remove" /><input class="comp_bt_clear" type="button" value="Clear" id="<%= request.getParameter("id")%>"/> </div>



                            <div class="comp_line"></div>

                            <div class="comp_row">  <label>Max PlanPoint</label><div class="comp_input"><input class="maxPlanPoint" type="text" value="0" /></div></div>

                            <div class="comp_row">  <div class="comp_input">Capacity Planning Compute <input class="cp" type="checkbox" value="" /></div></div>


                            <!-- <div class="comp_row">     <label>System Limt:</label><div class="comp_input"><input class="systemlimt" type="text" value="50" /></div></div>
                            -->


                            <div class="comp_row bt">  <input class="comp_bt" type="button" value="Compute" /></div></div>


                    </div>  
                              <div class="comp_line"></div>
                            <div class="comp_right"><table class="comp_table"><thead><th>Name</th><th>Arrival Rate</th><th>Increment</th><th>Limit</th></thead><%=tableData%></table></div></div>



                    </div>
                    <style>
                        input[type="text"]{
                            width:100px;
                        }
                        .mybtclos{
                            position: absolute;
                            right:5px;
                            top:5px;
                            background: #000;
                            color: #fff;
                            width:20px;
                            height:20px;
                            cursor: pointer;
                            text-align: center;
                        }
                        .comp_all label{
                          float: left;
width: auto;
display: block;
margin-right: 6px;
                        }
                        .comp_row{
                            clear: none;
                            width: 275px;
                            float: left;
                            margin: 5px;

                        }
                        .increment{
                            border: 0 none;
                        }
                        .comp_right{
                            border:1px #888 solid; 
                            width:100% ;
                            min-height:300px;
                            float:none;
                            ;
                        }



                        .be_select{
                            width:300px;


                        }
                        .comp_table{
                            width:100%;
                        }
                        .comtd{
                            background: #fff


                        }

                        .comtd.mycat{
                            background: #888


                        }
                        .comp_row.bt{
                            
                           margin-top: -5px; 
                        }
                        


                        .getCapacityPlan{

                            border: 3px  #000 solid;

                            position:fixed;
                            width:400px; 
                            height:250px;
                            overflow: auto;
                            left :30%;


                            z-index: 1000;

                            padding: 5px;

                            background: #ffffff url("images/buopbg.png") bottom repeat-x;
                            margin-left: 5px;
                            margin-right: 5px;
                            border-radius: 5px  ; 
                            margin: 5px;
                            display: none

                        }
                        .getCapacityPlan table{
                            width:100%;
                            height:80%;

                        }
                        .getCapacityPlan table td{




                        }
                        body{
                            background: #fff;
                            margin: 5px; 
                        }
                        .comp_line{
                            clear: both;
                            width:100%;
                            height:1px;
                        }
                    </style>


                    <script>
                        $(function() {

                            $(".be_select").change(function() {

                                var th = $(this).val();
                                var dtt = th.split("__");



                                $(".Arrival_Rate").val(dtt[2]);


                            })



                            $(".comtd").toggle(function() {

                                $(this).addClass("mycat");

                            },
                                    function() {

                                        $(this).removeClass("mycat");

                                    }



                            )





                            $(".getCapacityPlan").hide();



                            $(".comp_bt").click(function() {

                                if ($(".comp_table").children().size() < 2) {
                                    alert("Add at least 1 business entity to the table");
                                } else {
                                    var data = "";
                                    var incrementData = "";

                                    $(".myhidden").each(function() {

                                        data += $(this).val() + ";";


                                    })
                                    $(".increment").each(function() {

                                        incrementData += $(this).val() + ";";


                                    })


                                    var st = "0";

                                    if ($(".cp").attr("checked") == true) {



                                        st = "0";

                                    } else {

                                        st = "1";

                                    }

                                    var sdata = "res_data=<%= request.getParameter("id")%>&systemlimt=" + $(".systemlimt").val() + "&showst=" + st + "&scenarioid=<%=scenarioid%>&modelID=<%=modelID%>&be=" + data + "&ppoint=" + $(".maxPlanPoint").val() + "&status= <%= status%>&increment=" + incrementData;

                                    // alert (sdata);
                                    $(".comp_bt").val("Computing...");
                                    $(".comp_bt").attr('disabled', 'disabled');
                                    $.get("ajax/compute/compute2.jsp?" + sdata, function(data) {
                                        var myaata = data;

                                        $(".getCapacityPlan").html(myaata);


                                        if ($(".cp").attr("checked") == true) {
                                            $(".getCapacityPlan").show();
                                        } else {

                                            $(".getCapacityPlan").hide();


                                        }

                                    })

                                }


                            })

                        })



                    </script>