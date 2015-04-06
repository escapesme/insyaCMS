
var statr_link="";


function makesublable(G,k,n,x,y,height,width,style_number,mstyle,my_id){


   

    if (height==null ||height==""||height=="0" ){
        height=35
    }
    if (width==null ||width==""||width=="0" ){
        width=35
    }
 
    var st=returnStyle2(G,style_number,mstyle);

    
    G.setHtmlLabels(true);

    
    
    var v11 = G.insertVertex(k, null,  "<div class=\"myvol "+my_id+"\">"+n+"</div>", 1, 1, width, height,"st"+style_number);
    v11.geometry.offset = new mxPoint(x,y);
    v11.geometry.relative = true;
}



function creatchlid(G,parent,id,kmytext,x,y,height,width){


   

    if (height==null ||height==""||height=="0" ){
        height=35
    }
    if (width==null ||width==""||width=="0" ){
        width=35
    }
    // var st=returnStyle2(G,style_number,mstyle);

    
    var parent2 = G.getDefaultParent();


    var v11 = G.insertVertex(parent, id, kmytext, 1, 1, width, height);
    v11.geometry.offset = new mxPoint(x,y);
    v11.geometry.relative = true;
    return v11;
}


function toimage(graph){
/* var svgDoc = mxUtils.createXmlDocument();
    var root = svgDoc.createElement('svg');
    var bounds = graph.getGraphBounds();
    root.setAttribute('width', (bounds.x + bounds.width + 4) + 'px');
    root.setAttribute('height', (bounds.y + bounds.height + 4) + 'px');
    root.setAttribute('xmlns:xlink', mxConstants.NS_XLINK);
    root.setAttribute('xmlns', mxConstants.NS_SVG);
    root.setAttribute('version', '1.1');
    svgDoc.appendChild(root);
    var svgCanvas = new mxSvgCanvas2D(root);
   */ 
    
    
   
   
    
    
    
    
    
    
}



function creatD(G,id,mytext,x,y,height,width,mstyle) {
    

    
    if (height==null ||height==""||height=="0" ){
        height=40
    }
    if (width==null ||width==""||width=="0" ){
        width=90
    }
    var parent = G.getDefaultParent( );
    
    
    
    var st=returnStyle2(G,id,mstyle);
   
   
    if(mytext=="" && mytext==null){
        mytext="-";
    }
    G.setHtmlLabels(true);
 
 
    G.setCellsMovable(false);
    G.setAutoSizeCells(true);
    G.setPanning(true);
    G.panningHandler.useLeftButtonForPanning = true;



    //create node
    var nyr =G.insertVertex(parent, id, mytext , x, y, width,height,"st"+id );// mxGraph.insertVertex(parent, id, value, x, y, width, height, style)
    mstyle=null
    return nyr;
}





function creatNode(G,id,mytext,x,y,style_number ,height,width,mstyle) {
    if (height==null ||height==""||height=="0" ){
        height=40
    }
    if (width==null ||width==""||width=="0" ){
        width=90
    }
    var parent = G.getDefaultParent( );
    var st=returnStyle2(G,style_number,mstyle);

    if(mytext=="" && mytext==null){
        mytext="-";
    }
    G.setHtmlLabels(true);


    return  G.insertVertex(parent, id,"<div class=\"vol\">"+ mytext+"</div>" , x, y, width,height,"st"+style_number );// mxGraph.insertVertex(parent, id, value, x, y, width, height, style)
}










function mack_ev(G){






    G.addListener(mxEvent.DOUBLE_CLICK, function(sender, evt)
    {

        var cell_id=0;
        var cell = evt.getProperty('cell');

                    $(".mxTooltip").remove();

        if (cell != null)
        {

            if (cell.isEdge()){
                
           
            } else {

                if (cell_id==cell.getId()){}else{

                    var daa=cell.getId().split("/");
                    $(".mxTooltip").remove();

                    //initialize link for service view          
                    var link2="?alias=xact&module=serves&process_id="+daa[1]+"&res_data="+daa[2]+"__"+daa[3];

                    if (daa[0]=="business_process"||daa[0]=="BUSINESS_PROCESS"){
                        
                        //open service view
                        openService(link2);
                    }

                }



                  
            }


        }
  

    });






















    //event listener for clicks


    G.addListener(mxEvent.CLICK, function(sender, evt)
    {

        var cell_id=0;
        var cell = evt.getProperty('cell');

    
        if (cell != null)
        {
            // if event is an edge show edge properties 
            if (cell.isEdge()){
            
              
              
                $.get("modules/mod_nodeproperties/index.jsp?pro_id="+cell.getId(),function(r_data){
                    $("#Properties_con").html(r_data);
                 
                })
              
              
              

            } else {

                
              

                if (cell_id==cell.getId()){
                    
                }else{

                    // if cell show node properties
                   
                    $.get("modules/mod_nodeproperties/index.jsp?pro_id="+cell.getId(),function(r_data){

                    
                 
                        $("#Properties_con").html(r_data);
                 
                    })
                    cell_id=cell.getId();
                }


            }
        } 
    
    
    });
}






function mack_sublabel(G,parent,textvalue ,offestX ,offestY){
    var v11 = G.insertVertex(parent, null,textvalue, 1, 1, 0, 0, 'labelposition=top; align=right;verticalAlign=bottom;');
// v11.geometry.offset = new mxPoint(offestX, offestY);
//v11.geometry.relative = true;
}




function creatE(G,v1 ,v2,value,mode) {



    var md=null;
    if (mode=="leftToRight"){
        md=mxEdgeStyle.SideToSide;
    }else{
        md=mxEdgeStyle.TopToBottom;
    }




    var style = G.getStylesheet().getDefaultEdgeStyle();
    style[mxConstants.STYLE_ROUNDED] = true;
    style[mxConstants.STYLE_FONTCOLOR]= '#774400';
 
 
    style[mxConstants.STYLE_VERTICAL_ALIGN] = 'bottom';
 
    style[mxConstants.STYLE_VERTICAL_LABEL_POSITION] = 'bottom';
    style[mxConstants.STYLE_LABEL_POSITION] = 'bottom';
    style[mxConstants.STYLE_NOLABEL] = 1;
 

    style[mxConstants.STYLE_EDGE] = md;//mxEdgeStyle.Loop   mxEdgeStyle.SideToSide  mxEdgeStyle.TopToBottom  mxGraph.defaultLoopStyle  mxEdgeStyle.ElbowConnector
    G.getStylesheet().putCellStyle('ROUNDED',style);
    var parent = G.getDefaultParent( );
    return   G.insertEdge(parent, null, value, v1, v2,'ROUNDED');// mxGraph.insertEdge(parent, id, value, source, target, style)



}





function creatE(G,v1 ,v2,value,mode,id) {


    //check mode and set accordingly in mxgraph
    var md=null;
    if (mode=="leftToRight"){
        md=mxEdgeStyle.SideToSide;
    }else{
        md=mxEdgeStyle.TopToBottom;
    }




    var style = G.getStylesheet().getDefaultEdgeStyle();
    style[mxConstants.STYLE_ROUNDED] = true;
    style[mxConstants.STYLE_FONTCOLOR]= '#774400';
   

    style[mxConstants.STYLE_VERTICAL_ALIGN] = 'bottom';

    style[mxConstants.STYLE_VERTICAL_LABEL_POSITION] = 'bottom';
    style[mxConstants.STYLE_LABEL_POSITION] = 'bottom';
    style[mxConstants.STYLE_NOLABEL] = 1;


    style[mxConstants.STYLE_EDGE] = md;//mxEdgeStyle.Loop   mxEdgeStyle.SideToSide  mxEdgeStyle.TopToBottom  mxGraph.defaultLoopStyle  mxEdgeStyle.ElbowConnector
   
   
    G.getStylesheet().putCellStyle('ROUNDED',style);
    var parent = G.getDefaultParent( );
    //create edge between v1 and v2
    return   G.insertEdge(parent, id, value, v1, v2,'ROUNDED');// mxGraph.insertEdge(parent, id, value, source, target, style)



}






//makg_service
function makg(mode){
    
 
    if (!mxClient.isBrowserSupported())
    {
     
        mxUtils.error('Browser is not supported!', 200, false);
    }
    else
    {
        mxLog.show();
        
        
        var md=false;


        if (mode=="leftToRight"){
            md=true;
        }else{
            md=false;
        }

        var levelDistance = 40;

        var nodeDistance = 25;


        //xactContainer

        var outline = document.getElementById('outlineContainer');
        var container= document.getElementById("xactContainer");

        mxRectangleShape.prototype.crisp = true;
        var graph = new mxGraph(container);

        new mxRubberband(graph);

        graph.setCellsMovable(false);
        graph.setTooltips(false);
    

        graph.setCellsEditable(false);
        // graph.set
        graph.panningHandler.selectOnPopup = false;
        //    var keyHandler = new mxKeyHandler(graph);


        //   var parent = graph.getDefaultParent();

  
        var layout = new mxCompactTreeLayout(graph, md);
        layout.useBoundingBox = false;
        layout.levelDistance = levelDistance;
        layout.nodeDistance = nodeDistance;

 
        if (mxClient.IS_IE)
        {
            new mxDivResizer(container);
            new mxDivResizer(outline);
        }
 
        layout.isVertexMovable = function(cell)
        {
            return true;
        }

        var layoutMgr = new mxLayoutManager(graph);

        layoutMgr.getLayout = function(cell)
        {
            if (cell.getChildCount() > 0)
            {
                return layout;
            }
        }


 
        var outln = new mxOutline(graph, outline);
   
        outln.update(graph);
        graph.getModel().beginUpdate();
     


        graph.foldingEnabled=false;


        mack_ev(graph);
    
        // glaberl(graph);
        cbar(graph);
    }
    return graph;



}

function exportimage(graph){
    
 
    var xmlDoc = mxUtils.createXmlDocument();
    var root = xmlDoc.createElement('output');
    
    
    
    
    xmlDoc.appendChild(root);

    var xmlCanvas = new mxXmlCanvas2D(root);
    var imgExport = new mxImageExport();
    imgExport.drawState(graph.getView().getState(graph.model.root), xmlCanvas);

    var bounds = graph.getGraphBounds();
    var w = Math.round(bounds.x + bounds.width + 4);
    var h = Math.round(bounds.y + bounds.height + 4);

    var xml = mxUtils.getXml(root);
    
    
    var filename = 'export.png';
//   new mxXmlRequest('test3', 'filename=' + filename +'&format=png&w=' + w + '&h=' + h + '&bg=#F9F7ED&xml=' + encodeURIComponent(xml)).simulate(document, '_blank');
   
    


    			
        
 
    
  
}





function cbar(graph){


    $(function(){



        $(".zoomIn").click(function(){
           
            graph.zoomIn();
        })
        $(".zoomOut").click(function(){
            graph.zoomOut();
        })
        $(".zoomActual").click(function(){
            graph.zoomActual();
        })

        $(".fit").click(function(){
            graph.fit();
        })
        $(".Print").click(function(){
            var preview = new mxPrintPreview(graph, 1);

            preview.open();
        })
        $(".preview").click(function(){

            var pageCount = mxUtils.prompt('Enter maximum page count', '1');

            if (pageCount != null)
            {
                var scale = mxUtils.getScaleForPageCount(pageCount, graph);
                var preview = new mxPrintPreview(graph, scale);
                preview.open();
            }

        })
        $(".preview").click(function(){
            
            
            var  mycell=cell.getId();
            
            var   link2="?id="+mycell;
                
                
        
            $.get("ajax/project/nodeValues.jsp"+link2 ,function(r_data1){
                    
           

                edit_Node(mycell,graph,r_data1,mycell);
                    
                    
                $(".create_Node_ok").click(function(){
                    my_edit_Node_do(mycell,graph,cell);
                    
                })
                
            })
        
        })

    })

    var content ="\n\
<div class=\"cbrItmen zoomIn\" title></div>\n\
<div class=\"cbrItmen zoomActual\" title></div>\n\
<div class=\"cbrItmen zoomOut\" title></div>\n\
<div class=\"cbrItmen fit\" title></div>\n\
<div class=\"cbrItmen Print\" title></div>\n\
<div class=\"cbrItmen preview\" title></div>\n\
";





    $(".div_c .tbar").html(content);
}









function makgraph(container_id){

    var container= document.getElementById(container_id);

    mxRectangleShape.prototype.crisp = true;
    var graph = new mxGraph(container);
    new mxRubberband(graph);
    glaberl(graph);
    // alert ("sdf");
    graph.getModel().beginUpdate();
    return graph;

}






function addChild(graph, cell)
{



    var model = graph.getModel();
    var parent = graph.getDefaultParent();

    model.beginUpdate();
    try
    {
        var vertex = graph.insertVertex(parent, null, 'Double click to set name');
        var geometry = model.getGeometry(vertex);

                    
        var size = graph.getPreferredSizeForCell(vertex);
        geometry.width = size.width;
        geometry.height = size.height;

              
        var edge = graph.insertEdge(parent, null, '', cell, vertex);

                
    }
    finally
    {
        model.endUpdate();
    }
}













function createPopupMenu_module(id)
{


    var menu="<div><ul><li></li><li>1</li><li>1</li><li>1</li></ul></div>";

    return menu;


}

