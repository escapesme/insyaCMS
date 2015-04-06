/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


function getEdgesData(graph, parent) {
    var returdata = "";

    if (parent == null) {
        parent = graph.getDefaultParent();
    }
    var cells = graph.getChildCells(parent, true, true);

    for (var i = 0; i < cells.length; i++) {
        if (cells[i].isEdge()) {
            returdata += cells[i].source.getValue() + ";" + cells[i].target.getValue() + ";" + "__";
        }
    }

    return returdata;
}



function getCellTarget(id, graph, parent) {
    var returdata = "";

    if (parent == null) {
        parent = graph.getDefaultParent();
    }
    var cells = graph.getChildCells(parent, true, true);
    for (var i = 0; i < cells.length; i++) {
        var v = cells[i].getValue();
        if (cells[i].isEdge()) {
            if (cells[i].source.getId() == id) {
                returdata += cells[i].target.getValue() + "__";
            }
        }
    }
    return returdata;
}









function getCellSourcet(id, graph, parent) {
    var returdata = "";
    if (parent == null) {
        parent = graph.getDefaultParent();
    }

    var cells = graph.getChildCells(parent, true, true);
    for (var i = 0; i < cells.length; i++) {
        var v = cells[i].getValue();
        if (cells[i].isEdge()) {
            if (cells[i].target.getId() == id) {
                returdata += cells[i].source.getValue() + "__";
            }
        }
    }
    return returdata;
}






function getCellTargetID(id, graph, parent) {
    var returdata = "";

    if (parent == null) {
        parent = graph.getDefaultParent();
    }
    var cells = graph.getChildCells(parent, true, true);
    for (var i = 0; i < cells.length; i++) {
        var v = cells[i].getValue();
        if (cells[i].isEdge()) {
            if (cells[i].source.getId() == id) {
                returdata += cells[i].target.getId() + "__";
            }
        }
    }
    return returdata;
}









function getCellSourcetID(id, graph, parent) {
    var returdata = "";
    if (parent == null) {
        parent = graph.getDefaultParent();
    }

    var cells = graph.getChildCells(parent, true, true);
    for (var i = 0; i < cells.length; i++) {
        var v = cells[i].getValue();
        if (cells[i].isEdge()) {
            if (cells[i].target.getId() == id) {
                returdata += cells[i].source.getId() + "__";
            }
        }
    }
    return returdata;
}









function getAllCellsValue(graph) {
    var returdata = "";
    var cells = graph.getChildCells(graph.getDefaultParent(), true, true);
    for (var i = 0; i < cells.length; i++) {
        if (!cells[i].isEdge()) {
            returdata += cells[i].getValue() + "__";
        }
    }

    return returdata;
}



function getCellById(graph, id) {
    var returdata = null;

    var cells = graph.getChildCells(graph.getDefaultParent(), true, true);



    for (var i = 0; i < cells.length; i++) {
        if (cells[i].isVertex()) {

            if (cells[i].getId() == id) {
                returdata = cells[i];
            }

        }
    }

    return returdata;
}


function ISCell(graph, id) {
    var returdata = false;

    var cells = graph.getChildCells(graph.getDefaultParent(), true, true);



    for (var i = 0; i < cells.length; i++) {
        if (!cells[i].isEdge()) {


            if (cells[i].getId() == id) {
                returdata = true;
            }
        }
    }

    return returdata;
}




function getAllCells(graph) {
    var returdata = [];
    var cells = graph.getChildCells(graph.getDefaultParent(), true, true);


    for (var i = 0; i < cells.length; i++) {
        if (cells[i].isVertex()) {
            if (cells[i] != null) {

                returdata [i] = cells[i];
            }

        }
    }

    return returdata;
}


function getBAllEdge(graph) {
    var returdata = [];
    var cells = graph.getChildCells(graph.getDefaultParent(), true, true);


    for (var i = 0; i < cells.length; i++) {
        if (cells[i].isEdge()) {
            returdata [i] = cells[i];
        }
    }

    return returdata;
}
















