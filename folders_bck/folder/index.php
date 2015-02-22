
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="css/style.css" type="text/css" />

        <!--[if lt IE 9]>
                <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

        <!-- JS -->
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script src="js/countdown.js"></script>

        <script>

            $(document).ready(function() {
                $("#countdown").countdown({
                    date: "1 january 2013 12:00:00",
                    format: "on"
                },
                        function() {
                            // callback function
                        });
            });

        </script>


    </head>
    <body>
        <div class='bg'></div>
        <div class='logo'></div>
        <div class='data1'>
            <span class='red'>شركة أثير للدعاية والإعلان </span>  هى شركة       
            مسؤولة مسئولية كاملة عن القيام بالأنشطة الدعائية والمهام الإعلانية وحملات الدعاية والإعلان وجميع أشكال الإعلان والخدمات الإستشارية والإعلامية والنشاط الاعلانى نيابة عن الشركات والمكاتب والمؤسسات المختلفة من خلال فريق عمل يقوم بالسعى الحثيث للوصول بالعميل إلى المستوى الافضل، وذلك بالإبداع فى التعريف بالعميل والخدمات التى يقدمها وتعزيز صورته فى أذهان المجتمع وزيادة مبيعاته وهذا هو الهدف الاسمى الذى تسعى إليه الشركة.


        </div>
        <div class='data2'> الموقع تحت الصيانة</div>



        <!-- TIMER -->
        <div class="timer-area">

            <h1>أنتظرونـــــــــــــا...</h1>

            <ul id="countdown">



                <li>
                    <span class="seconds">00</span>
                    <p class="timeRefSeconds">ثانية</p>
                </li>


                <li>
                    <span class="minutes">00</span>
                    <p class="timeRefMinutes">دقيقة</p>
                </li>


                <li>
                    <span class="hours">00</span>
                    <p class="timeRefHours">ساعة</p>
                </li>
                <li>
                    <span class="days">00</span>
                    <p class="timeRefDays">يوم</p>
                </li>


            </ul>

        </div> <!-- end timer-area -->


    </body>
</html>


