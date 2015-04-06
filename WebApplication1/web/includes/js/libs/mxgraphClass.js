/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


mxgraphClass = function(graph)
{


    this.cells;



    //<editor-fold defaultstate="collapsed" desc="comment">



    this.changeStyle = function(style) {
        console.log(style);
        if (style['STYLE_IMAGE'])
            graph.setCellStyles(mxConstants.STYLE_IMAGE, style['STYLE_IMAGE'], this.cells);

        if (style['STYLE_SHAPE'])
            graph.setCellStyles(mxConstants.STYLE_SHAPE, style['STYLE_SHAPE'], this.cells);

        if (style['STYLE_GRADIENTCOLOR'])
            graph.setCellStyles(mxConstants.STYLE_GRADIENTCOLOR, style['STYLE_GRADIENTCOLOR'], this.cells);

        if (style['STYLE_STROKECOLOR'])
            graph.setCellStyles(mxConstants.STYLE_STROKECOLOR, style['STYLE_STROKECOLOR'], this.cells);

        if (style['STYLE_FILLCOLOR'])
            graph.setCellStyles(mxConstants.STYLE_FILLCOLOR, style['STYLE_FILLCOLOR'], this.cells);

        if (style['STYLE_FONTFAMILY'])
            graph.setCellStyles(mxConstants.STYLE_FONTFAMILY, style['STYLE_FONTFAMILY'], this.cells);

        if (style['STYLE_FONTCOLOR'])
            graph.setCellStyles(mxConstants.STYLE_FONTCOLOR, style['STYLE_FONTCOLOR'], this.cells);

        if (style['STYLE_SHADOW'])
            graph.setCellStyles(mxConstants.STYLE_SHADOW, style['STYLE_SHADOW'], this.cells);

        if (style['STYLE_ROUNDED'])
            graph.setCellStyles(mxConstants.STYLE_ROUNDED, style['STYLE_ROUNDED'], this.cells);

        if (style['STYLE_GLASS'])
            graph.setCellStyles(mxConstants.STYLE_GLASS, style['STYLE_GLASS'], this.cells);

        if (style['STYLE_FILLCOLOR'])
            graph.setCellStyles(mxConstants.STYLE_FILLCOLOR, style['STYLE_FILLCOLOR'], this.cells);

        if (style['STYLE_VERTICAL_ALIGN'])
            graph.setCellStyles(mxConstants.STYLE_VERTICAL_ALIGN, style['STYLE_VERTICAL_ALIGN'], this.cells);

        if (style['STYLE_VERTICAL_LABEL_POSITION'])
            graph.setCellStyles(mxConstants.STYLE_VERTICAL_LABEL_POSITION, style['STYLE_VERTICAL_LABEL_POSITION'], this.cells);

        if (style['STYLE_ROTATION'])
            graph.setCellStyles(mxConstants.STYLE_ROTATION, style['STYLE_ROTATION'], this.cells);

        if (style['STYLE_HORIZONTAL'])
            graph.setCellStyles(mxConstants.STYLE_HORIZONTAL, style['STYLE_HORIZONTAL'], this.cells);

        if (style['STYLE_LABEL_POSITION'])
            graph.setCellStyles(mxConstants.STYLE_LABEL_POSITION, style['STYLE_LABEL_POSITION'], this.cells);

        if (style['STYLE_FONTSTYLE'])
            graph.setCellStyles(mxConstants.STYLE_FONTSTYLE, style['STYLE_FONTSTYLE'], this.cells);


    }

    this.getStyle = function() {
        return  graph.getCellStyle(this.cells[0]);
    }
    //</editor-fold>




    this.setTitle = function(title) {
        this.cells[0].setValue(title);


    }
}