/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function creatmyupoloader(id) {
    function createUploader() {
        var uploader = new qq.FileUploader({
            element: document.getElementById(id),
            action: 'ajax/upload.php'
        });
    }
}
