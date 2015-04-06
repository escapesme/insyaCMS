$(function(){
    if (!mxClient.isBrowserSupported()){
        mxUtils.error('Browser is not supported!', 200, false);
    }else{
        var graph =makg();
        alert ("xxxxxx");
        try{
            
        }finally {

            graph.getModel().endUpdate();
            $(".olv").parent().parent().parent().parent().parent().parent().attr("height","300");
        }
    }
})