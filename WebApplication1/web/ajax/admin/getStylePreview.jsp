<%@page  import="lib.Options.MyVariables" %>
<%@taglib uri="/WEB-INF/tlds/engine" prefix="acr" %>
<script type="text/javascript">
    mxBasePath = '<%=MyVariables.jsFolder%>mxgraph/src';
</script><script type="text/javascript" src="<%=MyVariables.jsFolder%>mxgraph/styles.js"></script>
<script type="text/javascript" src="<%=MyVariables.jsFolder%>mxgraph/src/js/mxClient.js"></script>
<script type="text/javascript" src="<%=MyVariables.jsFolder%>mxgraph/myclass.js"></script>


<script type="text/javascript">
    $(function(){
    <%  String h_ver = "fales";
                if (request.getParameter("STYLE_HORIZONTAL") != null) {
                    h_ver = request.getParameter("STYLE_HORIZONTAL");
                }else{

            h_ver ="false";


            }%>;
                        var graph =  makgraph("xactContainer");
                        var parent = graph.getDefaultParent();
                        var HORIZONTAL_ver=  "<%=h_ver%>";

                        try
                        {
                            
                            
                            
                            
                            
                            var w= graph.container.offsetWidth;
                            
                            
                            
                        
                            
                            
                            
                            
                            
                            
                            
                            var style= makstyle(
                            "#<%=request.getParameter("STYLE_GRADIENTCOLOR")%>",
                            "#<%=request.getParameter("STYLE_STROKECOLOR")%>",
                            "#<%=request.getParameter("STYLE_FILLCOLOR")%>",
                            "#<%=request.getParameter("STYLE_FONTCOLOR")%>",
                            "<%=request.getParameter("STYLE_FONTFAMILY")%>",
                            "<%=request.getParameter("STYLE_SHADOW")%>",
                            "<%=request.getParameter("STYLE_ROUNDED")%>",
                            "<%=request.getParameter("STYLE_GLASS")%>",
                            "<%=request.getParameter("STYLE_VERTICAL_ALIGN")%>",

                            "<%=request.getParameter("STYLE_VERTICAL_LABEL_POSITION")%>",
                            "<%=request.getParameter("STYLE_ROTATION")%>",
                            HORIZONTAL_ver,
                            "<%=request.getParameter("STYLE_LABEL_POSITION")%>","<%=request.getParameter("SHAPE")%>"
            
                        );




//function creatD(G,id,mytext,x,y,style_number ,shapetype,height,width,myclass,mstyle)

 var v1 = creatD(graph,null, "test" ,w/2-30,35,1000,"<%=request.getParameter("SHAPE")%>","<%=request.getParameter("HEIGHT")%>","<%=request.getParameter("WIDTH")%>",100,style);
                        }
                        finally
                        {

                            graph.getModel().endUpdate();
                        }
        
                    });
</script>

<div id="xactContainer"></div>