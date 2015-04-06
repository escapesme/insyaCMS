/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */







helperClass = function(fromName)
{
 this.generateId =function() {
    var chars = "0123456789abcdefghiklmnopqrstuvwxyz",
            string_length = 8,
            id = '';
    for (var i = 0; i < string_length; i++) {
        var rnum = Math.floor(Math.random() * chars.length);
        id += chars.substring(rnum, rnum + 1);
    }

    return id;
}

}


