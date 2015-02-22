/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */










function moreCommets(limitfrom, limitnumber, ob_type, ob_id, datalang,users) {
    $(function() {
        

        $(".getMore").click(function() {
    
    

            sendPAjax("ajax/coms/plg_comments", "users="+users+"&datalang=" + datalang + "&ob_type=" + ob_type + "&ob_id=" + ob_id + "&limitfrom=" + limitfrom + "&limitnumber=" + limitnumber, function(isdata) {

                $(".comment_like.in").append(isdata)

            })
        });
    })

}





