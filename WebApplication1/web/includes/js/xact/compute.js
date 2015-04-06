function doch(){
                             
    //css for selection in the table according to click event                       
                          
    $(".comtd").toggle(function(){
                              
        $(this).addClass("mycat");
                                 
    },
    function(){
                                 
        $(this).removeClass("mycat");
                                 
    }
                     
                 
                 
    ) 
    //show arrival rate when business entity elected in combo box  
        
    $(".be_select").change(function(){
                                
        var th=$(this).val();
        var dtt= th.split("__");
        

                            
        $(".Arrival_Rate").val(dtt[2]);
                            
                                
    })     
        
                             
                             
}



$(function(){
                            
    //deal with the click event on add button but saving a string of the values of the business entitty selected. the values are id of business entity
    //arrival rate, incremet and elongation.
                          
    $(".comp_bt_add").click(function(){
                            
                           

                            
        var th=$(".be_select").val();
        
      

        var dtt= th.split("__")
        
        // alert (th);
        th=dtt[0]+"__"+dtt[1]+"__"+$(".Arrival_Rate").val()+"__"+$(".Increment").val()+"__"+$(".Elongaion").val();
        
        // var mydata  =""   ;  
       
        if ($(".Increment").val()!==""){
            
            
            
   
        
            //the table for buines entities has a hidden input value containing the information to be saved if compute is done
                            
            var  mydata="<tr  class=\"comtd\" ><td >"+dtt[1]+"<input type=\"hidden\" class=\"myhidden\" value=\""+th+"\"/></td>\n\
<td>"+$(".Arrival_Rate").val()+"</td><td><input type='text' class='increment' value='"+$(".Increment").val()+"' /></td><td>"+$(".Elongaion").val()+"</td> </tr><script> doch();</script>";
                            
            $(".comp_table").append(mydata);
            $(".be_select option:selected").remove();                     
        }                
                                
                                
   
                       
                        
      
                
    })
    
    
    // deal with click on remove button. this removes the business entity selected from the table
    $(".comp_bt_remove").click(function(){
            
            

                        
        $(".mycat").each(function(){
                
                
            var nydata=$(this).children("td").children(".myhidden").val();
                
             
              
            var dtt= nydata.split("__");
            var mydata="<script> doch();</script><option value=\""+nydata+"\">"+dtt[1]+"</option>";
            // add the business entity removed back to the combo box   
            $(".be_select").append(mydata); 
            $(this).remove();
        })       
    })
    $(".comp_bt_clear").click(function(){
        var answer = confirm("Are you sure you want to clear all compute records?")
        if(answer){ 
            $(".comtd").each(function(){
                
                var nydata=$(this).children("td").children(".myhidden").val();
                var dtt= nydata.split("__");
                var mydata="<script> doch();</script><option value=\""+nydata+"\">"+dtt[1]+"</option>";
                // add the business entity removed back to the combo box   
                $(".be_select").append(mydata); 
                $(this).remove();
         
            })   
            $.get("ajax/compute/clearRecords.jsp?results_id="+$(".comp_bt_clear").attr("id"),function(r_data){

                    
            
                 
                })
        }
    } )     
            
})
                        