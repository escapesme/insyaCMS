/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$(function(){
    
    
    $("#fileds_names_add").click(function(){
        
        
        var fileds_types_com =$("#fileds_types_com").val();
        var fileds_values_com =$("#fileds_values_com").val();
        var fileds_names_com =$("#fileds_names_com").val();
    
    
        $("#fileds_types").val($("#fileds_types").val()+";"+ fileds_types_com);
        $("#fileds_values").val($("#fileds_values").val()+";" +fileds_values_com);
        $("#fileds_names").val($("#fileds_names").val()+";"+ fileds_names_com);
        
        $("#fileds_types_com").val("");
        $("#fileds_values_com").val("");
        $("#fileds_names_com").val("");
        
        
        
    })
})