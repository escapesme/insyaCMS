/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function hostXml(data2, serverid, modelid) {


    var data = "<script>importComplex('" + serverid + "','" + modelid + "')";
    data += "</script><div class='view_pre mydata'>";
    data += data2;
    data += "</div><div class=\"do_center\">";
    data += CreateFiled(" Import Complex", "button", "importComplex");
    data += CreateFiled("Close", "button", "addServerCancel", "", "_50");
    data += "</div>";
    return data;
}

function importComplex(serverId, modelId) {

    $(".importComplex").click(function() {
        var rdata = "";
        $(".rightList li.selected").each(function() {
            rdata += $(this).attr("id") + ";";
        });
        $.get("ajax/hostdata/savexml.jsp?ids=" + rdata + "&serverId=" + serverId + "&modelId=" + modelId, function(mdata) {
            alert("Import Finished");
        });
    });
}

function importTableData(ids, caches, namespaces) {

    var data = "";
    data = "<script>importTableDataActions('" + ids + "');</script><div class='view_pre mydata'>";
    data += CreateFiled("DB Namespace", "select", "nameSpace", "", "", namespaces);
    data += CreateFiled("Cache Name", "select", "cache", "", "", caches);
    data += CreateFiled("Table Name", "text", "tableName", "", "_50");
    data += CreateFiled("Useful Size", "text", "usefulSizeTable", "1", "_50");
    data += CreateFiled("Row Length", "text", "rowLengthTable", "1", "_50");
    data += CreateFiled("Add Row", "button", "TableImportAddRow", "", "");
    data += "<table class='data_grid'>";
    data += "<thead><tr><th>Name</th><th>Useful Size</th><th>Row Length</th><th>Cache Name</th><th>DB Namesacae</th></tr>";
    data += "<thead>";
    data += "<tbody class='importTableBody'>";
    data += "<tbody>";
    data += "</table>";
    data += "   </div><div class=\"do_center\">";
    data += CreateFiled("OK", "button", "importTableDataOk");
    data += CreateFiled("Cancel", "button", "TableImportCancel", "", "_50");
    data += CreateFiled("Import CSV", "button", "csvTableImport", "", "");
    return data;
}

function importTableDataActions(ids) {
    $(".TableImportCancel").click(function() {

        closeWindows("importTableData");
    })
    $(".csvTableImport").click(function() {
        getImageLocation("exports", function(imageLocaiton) {

            makeWinDows("Import Table", "importTable", importTable(escape(imageLocaiton), ids), 420, 220, 400, null);
        })

    })
    $(".TableImportAddRow").click(function() {
        $(".importTableBody").append("\
<tr class='tableAllRow'><td class='rowTableName' id='" + $(".tableName").val() + "'>" + $(".tableName").val() + "</td>\n\
        <td class='rowTableUsefulSize'>" + $(".usefulSizeTable").val() + "</td>\n\
<td class='rowTableRowLength'>" + $(".rowLengthTable").val() + "</td>\n\
<td class='cacheTable'>" + $(".cache").val() + "</td>\n\
<td class='dbName'>" + $(".nameSpace").val() + "</td></tr>");
    })


    $(".importTableDataOk").click(function() {
        var myLink = "";
        $(".tableAllRow").each(function() {




            myLink += $.trim($(this).children(".rowTableName").text()) + ","
                    + $.trim($(this).children(".rowTableUsefulSize").text()) + ","
                    + $.trim($(this).children(".rowTableRowLength").text()) +
                    "," + $.trim($(this).children(".cacheTable").text()) + ","
                    + $.trim($(this).children(".dbName").text()) + "," + ";";
        })

        $.ajax({
            type: "POST",
            url: "ajax/xact/insertDataBase.jsp",
            data: {
                status: "saveTable",
                values: myLink
            }

        }).done(function(data) {

            alert(data)
        }

        );
    })


}
function importTable(folder, ids) {
    var modeId = ids;
    var data = "<script>importTableActions('" + modeId + "','" + folder + "');</script><div class='view_pre mydata'>";
    data += CreateFiled("CSV File", "import", "uploadTable", "", "", "", modeId, folder);
    data += " </div><div class=\"do_center\">";
    data += CreateFiled("OK", "button", "importTableok");
    data += CreateFiled("Cancel", "button", "importTableCancel", "", "_50");
    data += "   </div>";
    return data;
}
function importTableActions(pro_id, filePath) {
    $(".importTableok").click(function() {
        showMyloading(".main", "start");
        $.get("ajax/xact/importDataBase.jsp?filePath=" + filePath + "&name=" + pro_id + " &status=importTable", function(r_data) {
            showMyloading(".main", "end");
            // alert(r_data);
            closeWindows("importModel");
        })
    })
    $(".importTableCancel").click(function() {
        closeWindows("importTable");
    })
}
function importIndexData(ids, tables) {

    var data = "";
    data = "<script>importIndexDataActions('" + ids + "');</script><div class='view_pre mydata'>";
    data += CreateFiled("Table Name", "select", "tables", "", "", tables);
    data += CreateFiled("Index Name", "text", "indexName", "", "_50");
    data += CreateFiled("Useful Size", "text", "usefulSizeTable", "1", "_50");
    data += CreateFiled("Row Length", "text", "rowLengthTable", "1", "_50");
    data += CreateFiled("Add Row", "button", "TableImportAddRow", "", "");
    data += "<table class='data_grid'>";
    data += "<thead><tr><th>Index Name</th><th>Table Name</th><th>Useful Size</th><th>Row Length</th></tr>";
    data += "<thead>";
    data += "<tbody class='importTableBody'>";
    data += "<tbody>";
    data += "</table>";
    data += "   </div><div class=\"do_center\">";
    data += CreateFiled("OK", "button", "indexDataOk");
    data += CreateFiled("Cancel", "button", "indexdataCancel", "", "_50");
    data += CreateFiled("Import CSV", "button", "csvTableImport", "", "");
    return data;
}

function importIndexDataActions(ids) {
    $(".indexdataCancel").click(function() {

        closeWindows("importIndexData");
    })
    $(".csvTableImport").click(function() {
        getImageLocation("exports", function(imageLocaiton) {

            makeWinDows("Import Index", "importIndex", importIndex(escape(imageLocaiton)), 420, 220, 400, null);
        })

    })

    $(".TableImportAddRow").click(function() {
        $(".importTableBody").append("\
<tr class='indexAllRow'><td class='indexname' id='" + $(".indexName").val() + "'>" + $(".indexName").val() + "</td>" + "<td class='tableName' id='" + $(".tables").val() + "'>" + $(".tables").val() + "</td>\n\
        <td class='indexUsefulSize'>" + $(".usefulSizeTable").val() + "</td>\n\
<td class='indexRowLength'>" + $(".rowLengthTable").val() + "</td></tr>");
    })
    $(".indexDataOk").click(function() {
        var myLink = "";
        $(".indexAllRow").each(function() {




            myLink += $.trim($(this).children(".indexname").text()) + ","
                    + $.trim($(this).children(".tableName").text()) + ","
                    + $.trim($(this).children(".indexUsefulSize").text()) + ","
                    + $.trim($(this).children(".indexRowLength").text()) + ";";
        })

        $.ajax({
            type: "POST",
            url: "ajax/xact/insertDataBase.jsp",
            data: {
                status: "saveIndex",
                values: myLink
            }

        }).done(function(data) {

            alert(data)
        }

        );
    })
}
function importIndex(folder) {
    var modeId = "new";
    var data = "<script>importIndexActions('" + modeId + "','" + folder + "');</script><div class='view_pre mydata'>";
    data += CreateFiled("CSV File", "import", "uploadIndex", "", "", "", modeId, folder);
    data += "   </div><div class=\"do_center\">";
    data += CreateFiled("OK", "button", "importIndexok");
    data += CreateFiled("Cancel", "button", "importIndexCancel", "", "_50");
    data += "   </div>";
    return data;
}
function importIndexActions(pro_id, filePath) {



    $(".importIndexok").click(function() {
        showMyloading(".main", "start");
        $.get("ajax/xact/importDataBase.jsp?filePath=" + filePath + "&name=" + pro_id + " &status=importIndex", function(r_data) {




            showMyloading(".main", "end");
            alert(r_data);
            closeWindows("importModel");
        })

    })

    $(".importIndexCancel").click(function() {

        closeWindows("importIndex");
    })



}
function importCacheData(ids, fields, points) {

    var data = "";
    data = "<script>importCacheDataActions('" + ids + "');</script><div class='view_pre mydata'>";
    data += CreateFiled("Cache Name", "text", "cacheName", "", "_50");
    data += CreateFiled("Cache Size", "text", "cacheSize", "1", "_50");
    data += CreateFiled("Page Size", "text", "pageSize", "1", "_50");
    data += CreateFiled("Add Row", "button", "TableImportAddRow", "", "");
    data += "<table class='data_grid'>";
    data += "<thead><tr><th>Cache Name</th><th>Page Size</th><th>Cache Size</th></tr>";
    data += "<thead>";
    data += "<tbody class='importTableBody'>";
    data += "<tbody>";
    data += "</table>";
    data += "   </div><div class=\"do_center\">";
    data += CreateFiled("OK", "button", "cacheDataOk");
    data += CreateFiled("Cancel", "button", "cacheDataCancel", "", "_50");
    data += CreateFiled("Import From CSV File", "button", "csvTableImport", "", "");
    return data;
}
function importCacheDataActions(ids) {
    $(".cacheDataCancel").click(function() {
        closeWindows("importCacheData");
    })
    $(".csvTableImport").click(function() {
        getImageLocation("exports", function(imageLocaiton) {
            makeWinDows("Import Cache", "importCache", importCache(escape(imageLocaiton), ids), 420, 220, 400, null);
        })

    })
    $(".TableImportAddRow").click(function() {
        $(".importTableBody").append("\
<tr class='cacheAllRow'><td class='cachename' id='" + $(".cacheName").val() + "'>" + $(".cacheName").val() + "</td>\n\
        <td class='cachePage'>" + $(".pageSize").val() + "</td>\n\
<td class='cachesize'>" + $(".cacheSize").val() + "</td></tr>");
    })
    $(".cacheDataOk").click(function() {
        var myLink = "";
        $(".cacheAllRow").each(function() {




            myLink += $.trim($(this).children(".cachename").text()) + ","
                    + $.trim($(this).children(".cachePage").text()) + ","
                    + $.trim($(this).children(".cachesize").text()) + ";";
        })

        $.ajax({
            type: "POST",
            url: "ajax/xact/insertDataBase.jsp",
            data: {
                status: "saveCache",
                values: myLink,
                id: ids
            }

        }).done(function(data) {

            alert(data)
        }

        );
    })
}
function importCache(folder, ids) {
    var modeId = ids;
    var data = "<script>importCacheActions('" + modeId + "','" + folder + "');</script><div class='view_pre mydata'>";
    data += CreateFiled("CSV File", "import", "uploadcache", "", "", "", modeId, folder);
    data += "   </div><div class=\"do_center\">";
    data += CreateFiled("OK", "button", "importCacheok");
    data += CreateFiled("Cancel", "button", "importCacheCancel", "", "_50");
    data += "   </div>";
    return data;
}
function importCacheActions(pro_id, filePath) {



    $(".importCacheok").click(function() {
        showMyloading(".main", "start");
        $.get("ajax/xact/importDataBase.jsp?filePath=" + filePath + "&name=" + pro_id + " &status=importCache&id=" + pro_id, function(r_data) {




            showMyloading(".main", "end");
            alert(r_data);
            closeWindows("importModel");
        })

    })

    $(".importCacheCancel").click(function() {

        closeWindows("importTable");
    })



}
function importBufferData(ids) {

    var data = "";
    data = "<script>importBufferDataActions('" + ids + "');</script><div class='view_pre mydata'>";
    data += CreateFiled("Cache Name", "text", "cacheName", "", "_50");
    data += CreateFiled("Cache Size", "text", "cacheSize", "1", "_50");
    data += CreateFiled("Page Size", "text", "pageSize", "1", "_50");
    data += CreateFiled("Add Row", "button", "TableImportAddRow", "", "");
    data += "<table class='data_grid'>";
    data += "<thead><tr><th>Buffer Name</th><th>Page Size</th><th>Buffer Pool Size</th></tr>";
    data += "<thead>";
    data += "<tbody class='importTableBody'>";
    data += "<tbody>";
    data += "</table>";
    data += "   </div><div class=\"do_center\">";
    data += CreateFiled("OK", "button", "bufferDataOk");
    data += CreateFiled("Cancel", "button", "bufferDataCancel", "", "_50");
    data += CreateFiled("Import CSV", "button", "csvTableImport", "", "");
    return data;
}

function importBufferDataActions(ids) {
    $(".bufferDataCancel").click(function() {

        closeWindows("importBufferData");
    })
    $(".csvTableImport").click(function() {
        getImageLocation("exports", function(imageLocaiton) {

            makeWinDows("Import Cache", "importCache", importCache(escape(imageLocaiton), ids), 420, 220, 400, null);
        })
        $(".TableImportAddRow").click(function() {
            $(".importTableBody").append("\
<tr class='buferAllRow'><td class='buffName' id='" + $(".bufferName").val() + "'>" + $(".bufferName").val() + "</td>\n\
        <td class='buffPage'>" + $(".pageSize").val() + "</td>\n\
<td class='poolbuff'>" + $(".poolSize").val() + "</td></tr>");
        })

    })
    $(".bufferDataOk").click(function() {
        var myLink = "";
        $(".buferAllRow").each(function() {




            myLink += $.trim($(this).children(".buffName").text()) + ","
                    + $.trim($(this).children(".buffPage").text()) + ","
                    + $.trim($(this).children(".poolbuff").text()) + ";";
        })

        $.ajax({
            type: "POST",
            url: "ajax/xact/insertDataBase.jsp",
            data: {
                status: "saveBuffer",
                values: myLink,
                id: ids
            }

        }).done(function(data) {

            alert(data)
        }

        );
    })
}
function importBuffer(folder, ids) {
    var modeId = ids;
    var data = "<script>importCacheActions('" + modeId + "','" + folder + "');</script><div class='view_pre mydata'>";
    data += CreateFiled("CSV File", "import", "uploadcache", "", "", "", modeId, folder);
    data += "   </div><div class=\"do_center\">";
    data += CreateFiled("OK", "button", "importCacheok");
    data += CreateFiled("Cancel", "button", "importCacheCancel", "", "_50");
    data += "   </div>";
    return data;
}
function importBufferActions(pro_id, filePath) {



    $(".importCacheok").click(function() {
        showMyloading(".main", "start");
        $.get("ajax/xact/importDataBase.jsp?filePath=" + filePath + "&name=" + pro_id + " &status=importCache&id=" + pro_id, function(r_data) {




            showMyloading(".main", "end");
            alert(r_data);
            closeWindows("importModel");
        })

    })

    $(".importCacheCancel").click(function() {

        closeWindows("importTable");
    })



}
