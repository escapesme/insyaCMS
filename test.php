<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">




        <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>




        <script>



            $(function() {

                $(document).on("click", ".im", function() {
                    /* var data = [{
                     "node": {
                     "id": $(this).data("nodeid")
                     },
                     "job": {
                     "id": $(this).data("id")
                     }
                     }];*/






                    $.ajax({
                        url: "https://acrtek-lab.com/xact-bridge-web-1.0-SNAPSHOT/api/bridge/",
                        type: "POST",
                        data: JSON.stringify({
                            "node": {
                                "id": "1421498617426"
                            },
                            "job": {
                                "id": "1"
                            }
                        }), beforeSend: function(jqXHR) {
                            jqXHR.setRequestHeader("X-MicrosoftAjax", "Delta=true");


                            jqXHR.setRequestHeader("Access-Control-Allow-Origin", "*");
                            jqXHR.setRequestHeader("Access-Control-Allow-Headers", "Content-Type");
                            jqXHR.setRequestHeader("Access-Control-Allow-Methods", "POST, OPTIONS");//CAN BE ENHANCED WITH OTHER HTTP CALL METHODS 



                        },
                            headers: { 'contentType': 'application/json' }
,
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function(json) {
                            console.log("reponse :" + json);
                        },
                        error: function(XMLHttpRequest, textStatus, errorThrown) {
                            console.log(">>>>>error :" + XMLHttpRequest.responseText);
                        }

                        ,
                        complete: function(rdata) {
                            // alert(data);
                            console.log(rdata)

                        }
                    });
                })

            })
        </script>
</html>
</head>
<body>
    <div>TODO write content</div>


    sdfsdfsdfsdfsd
    <button class="im">asdasdasd</button> 
</body>