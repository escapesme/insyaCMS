



function makstyle(STYLE_GRADIENTCOLOR,STYLE_STROKECOLOR,STYLE_FILLCOLOR,STYLE_FONTCOLOR,STYLE_FONTFAMILY,
    STYLE_SHADOW,STYLE_ROUNDED,STYLE_GLASS,STYLE_VERTICAL_ALIGN,STYLE_VERTICAL_LABEL_POSITION,STYLE_ROTATION,STYLE_HORIZONTAL
    ,STYLE_LABEL_POSITION,STYLE_SHAPE,STYLE_IMAGE){
    //alert (STYLE_SHADOW);
   
   
   
   
   
    var style = new Object();
    style[mxConstants.STYLE_SHAPE] ="label" ;
    style[mxConstants.STYLE_GRADIENTCOLOR] =STYLE_GRADIENTCOLOR;
    style[mxConstants.STYLE_STROKECOLOR] = STYLE_STROKECOLOR;
    style[mxConstants.STYLE_FILLCOLOR] = STYLE_FILLCOLOR;
    style[mxConstants.STYLE_FONTCOLOR] = STYLE_FONTCOLOR;
    style[mxConstants.STYLE_FONTFAMILY] =STYLE_FONTFAMILY ;
    style[mxConstants.STYLE_SHADOW] = STYLE_SHADOW;
    style[mxConstants.STYLE_ROUNDED] = STYLE_ROUNDED;
    style[mxConstants.STYLE_GLASS] =STYLE_GLASS;
    style[mxConstants.STYLE_VERTICAL_ALIGN] = STYLE_VERTICAL_ALIGN;
    style[mxConstants.STYLE_VERTICAL_LABEL_POSITION] =STYLE_VERTICAL_LABEL_POSITION;
    style[mxConstants.STYLE_ROTATION] = STYLE_ROTATION;
    style[mxConstants.STYLE_HORIZONTAL] = STYLE_HORIZONTAL;
    style[mxConstants.STYLE_LABEL_POSITION] = STYLE_LABEL_POSITION;
    style[mxConstants.STYLE_] = STYLE_LABEL_POSITION;
    
    style[mxConstants.STYLE_FONTSTYLE]=mxConstants.FONT_BOLD; 
    
    
    
    /*style[mxConstants.STYLE_SPACING_TOP] = '4';
    style[mxConstants.STYLE_SPACING_BOTTOM] = '4';
    style[mxConstants.STYLE_SPACING_LEFT] = '4'; 
    style[mxConstants.STYLE_SPACING_RIGHT] = '4';*/


    //style[mxConstants.STYLE_FONTSIZE/

    if (STYLE_SHAPE!="" && STYLE_SHAPE!=null){
        style[mxConstants.STYLE_SHAPE] = STYLE_SHAPE;
    }
    if (STYLE_SHAPE!="" && STYLE_SHAPE!=null &&STYLE_IMAGE!="" && STYLE_IMAGE!=null){
        style[mxConstants.STYLE_IMAGE] = STYLE_IMAGE;
    }
    
    //  style[mxConstants.W]=mxConstants.FONT_BOLD; 
        
        
    return style;
}













function makstyletext(STYLE_GRADIENTCOLOR,STYLE_STROKECOLOR,STYLE_FILLCOLOR,STYLE_FONTCOLOR,STYLE_FONTFAMILY,
    STYLE_SHADOW,STYLE_ROUNDED,STYLE_GLASS,STYLE_VERTICAL_ALIGN,STYLE_VERTICAL_LABEL_POSITION,STYLE_ROTATION,STYLE_HORIZONTAL
    ,STYLE_LABEL_POSITION,STYLE_SHAPE,STYLE_IMAGE){
    //alert (STYLE_SHADOW);
   
   
    var rstyle="";
   
   
    rstyle+="shape=label;"
    
    rstyle+="fontColor="+STYLE_FONTCOLOR+";";
    rstyle+="gradientColor="+STYLE_GRADIENTCOLOR+";";
    rstyle+="glass="+STYLE_GLASS+";";
    rstyle+="strokeColor="+STYLE_STROKECOLOR+";";
    rstyle+="fillColor="+STYLE_FILLCOLOR+";";
    rstyle+="fontFamily="+STYLE_FONTFAMILY+";";
    rstyle+="shadow="+STYLE_SHADOW+";";
    rstyle+="rounded="+STYLE_ROUNDED+";";
    rstyle+="verticalAlign="+STYLE_VERTICAL_ALIGN+";";
    rstyle+="verticalLabelPosition="+STYLE_VERTICAL_LABEL_POSITION+";";
    rstyle+="position="+STYLE_ROTATION+";";
    rstyle+="horizontal="+STYLE_HORIZONTAL+";";
    rstyle+="labelPosition="+STYLE_LABEL_POSITION+";";
    
    rstyle+="shape="+STYLE_SHAPE+";";
     
    rstyle+="image="+STYLE_IMAGE+";";

    /* // style[mxConstants.STYLE_SHAPE] ="label" ;
    // style[mxConstants.STYLE_GRADIENTCOLOR] =STYLE_GRADIENTCOLOR;
    style[mxConstants.STYLE_STROKECOLOR] = STYLE_STROKECOLOR;
    style[mxConstants.STYLE_FILLCOLOR] = STYLE_FILLCOLOR;
    style[mxConstants.STYLE_FONTCOLOR] = STYLE_FONTCOLOR;
    style[mxConstants.STYLE_FONTFAMILY] =STYLE_FONTFAMILY ;
    style[mxConstants.STYLE_SHADOW] = STYLE_SHADOW;
    style[mxConstants.STYLE_ROUNDED] = STYLE_ROUNDED;
    style[mxConstants.STYLE_GLASS] =STYLE_ROUNDED;
    style[mxConstants.STYLE_VERTICAL_ALIGN] = STYLE_VERTICAL_ALIGN;
    style[mxConstants.STYLE_VERTICAL_LABEL_POSITION] =STYLE_VERTICAL_LABEL_POSITION;
    style[mxConstants.STYLE_ROTATION] = STYLE_ROTATION;
    style[mxConstants.STYLE_HORIZONTAL] = STYLE_HORIZONTAL;
    style[mxConstants.STYLE_LABEL_POSITION] = STYLE_LABEL_POSITION;
    style[mxConstants.STYLE_] = STYLE_LABEL_POSITION;
    
    style[mxConstants.STYLE_FONTSTYLE]=mxConstants.FONT_BOLD; 
    
    
    
    /*style[mxConstants.STYLE_SPACING_TOP] = '4';
    style[mxConstants.STYLE_SPACING_BOTTOM] = '4';
    style[mxConstants.STYLE_SPACING_LEFT] = '4'; 
    style[mxConstants.STYLE_SPACING_RIGHT] = '4';*/


    //style[mxConstants.STYLE_FONTSIZE/
    /*
    if (STYLE_SHAPE!="" && STYLE_SHAPE!=null){
        style[mxConstants.STYLE_SHAPE] = STYLE_SHAPE;
    }
    if (STYLE_SHAPE!="" && STYLE_SHAPE!=null &&STYLE_IMAGE!="" && STYLE_IMAGE!=null){
        style[mxConstants.STYLE_IMAGE] = STYLE_IMAGE;
    }*/
    
    //  style[mxConstants.W]=mxConstants.FONT_BOLD; 
        
        
    return rstyle;
}















function makstyle2(STYLE_GRADIENTCOLOR,STYLE_STROKECOLOR,STYLE_FILLCOLOR,STYLE_FONTCOLOR,STYLE_FONTFAMILY,
    STYLE_SHADOW,STYLE_ROUNDED,STYLE_GLASS,STYLE_VERTICAL_ALIGN,STYLE_VERTICAL_LABEL_POSITION,STYLE_ROTATION,STYLE_HORIZONTAL
    ,STYLE_LABEL_POSITION,STYLE_SHAPE,STYLE_IMAGE ,styleName,graph){





    var style  = new Object();
    // style[mxConstants.STYLE_SHAPE] = 'label';
    // style[mxConstants.STYLE_GRADIENTCOLOR] =STYLE_GRADIENTCOLOR;
    //style[mxConstants.STYLE_STROKECOLOR] = STYLE_STROKECOLOR;
    // style[mxConstants.STYLE_FILLCOLOR] = STYLE_FILLCOLOR;
    // style[mxConstants.STYLE_FONTCOLOR] = STYLE_FONTCOLOR;
    // style[mxConstants.STYLE_FONTFAMILY] =STYLE_FONTFAMILY ;
    // style[mxConstants.STYLE_SHADOW] = STYLE_SHADOW;
    // style[mxConstants.STYLE_ROUNDED] = STYLE_ROUNDED;
    style[mxConstants.STYLE_GLASS] =STYLE_GLASS;
    style[mxConstants.STYLE_VERTICAL_ALIGN] = STYLE_VERTICAL_ALIGN;
    style[mxConstants.STYLE_VERTICAL_LABEL_POSITION] =STYLE_VERTICAL_LABEL_POSITION;
    style[mxConstants.STYLE_ROTATION] = STYLE_ROTATION;
    style[mxConstants.STYLE_HORIZONTAL] = STYLE_HORIZONTAL;
    style[mxConstants.STYLE_LABEL_POSITION] = STYLE_LABEL_POSITION;


    if (STYLE_SHAPE!="" && STYLE_SHAPE!=null){
        style[mxConstants.STYLE_SHAPE] = STYLE_SHAPE;
    }
    if (STYLE_SHAPE!="" && STYLE_SHAPE!=null &&STYLE_IMAGE!="" && STYLE_IMAGE!=null){
        style[mxConstants.STYLE_IMAGE] = STYLE_IMAGE;
    }


    //graph.getStylesheet().putCellStyle(styleName, style);
    // style = mxUtils.clone(style);
    return style;





}









function  Style(G ,styleName,style){
    
    
    
    G.getStylesheet().putCellStyle(styleName, style);
    


   
    style = mxUtils.clone(style);
    return styleName;


}





function returnStyle2(G,StyleName,style){
    returnStyle=Style(G,"st"+StyleName,style);
    return  returnStyle;

}


