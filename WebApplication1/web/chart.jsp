<%@page import="lib.tools.Utils"%>
<%@page import="xact.results.ChronoResults"%>
<%@page import="org.jfree.data.time.SimpleTimePeriod"%>
<%@page import="org.jfree.data.gantt.Task"%>
<%@page import="org.jfree.data.gantt.TaskSeries"%>
<%@page import="org.jfree.data.gantt.TaskSeriesCollection"%>
<%@page contentType="text/html"%>

<%@page import="java.awt.*" %>
<%@page import="java.util.*"%>
<%@page import="de.laures.cewolf.*"%>




<%@taglib uri='/WEB-INF/cewolf.tld' prefix='cewolf' %>




<%







    final String res_id = request.getParameter("res_id");
    final String id = request.getParameter("id");

String  type="";
String scenario2="";


    final String[] results = res_id.split("__");
    
    String results_id = Utils.getResultID(results[1], results[2]);
    String modelName = Utils.getModName(results[1], results[2]);


    final ChronoResults cr = new ChronoResults(results_id, modelName,type);
    
    
    if(results.length==5){
       out.print(results[2]+"__"+results[3]);
        //cr.getdataForOps(id, results[2], results[3]);
        
    }else{
    String bpName = cr.getBpName(id);
    cr.getdata(id);
    }
    //out.print(cr.test);


    final Object[] Names = cr.mydata.toArray();

    DatasetProducer ganttData = new DatasetProducer() {
        
        final private long now = System.currentTimeMillis();
        final private long day = 1000 * 60 * 60 * 24;
        //left sidecr.mydata.toArray()
        final private Object[] StartDate1 = cr.starta1.toArray();
        final private Object[] StartDate2 = cr.starta2.toArray();
        final private Object[] EndDate1 = cr.enda1.toArray();
        final private Object[] EndDate2 = cr.enda2.toArray();
        final HashMap<String, Date> ends1=cr.ends1;
        final HashMap<String, Date> ends2=cr.ends2;
        
        boolean firstActual,firstperdictive=true;
        
         String bpName = cr.getBpName(id);
        //bottom side
        final private String[] person = {"Scheduled", "Actual"};

        public Object produceDataset(Map params) {
            TaskSeriesCollection ds = new TaskSeriesCollection();
            if(results.length==5){
                ds=cr.createDataset(id, results[2], results[3]);
            }else{
            for (int j = 0; j < 2; j++) {
                TaskSeries ser = new TaskSeries(person[j]);
                if(j==0){
                Task t1 = new Task("" + bpName, new SimpleTimePeriod(cr.getbpStartdate(), cr.getbpEnddate()));
                
                ser.add(t1);
               
                }else{
                    Task t2 = new Task("" + bpName, new SimpleTimePeriod(cr.getbpStartdate2(), cr.getbpEnddate2()));
                     ser.add(t2);
                }
                for (int i = 0; i < Names.length; i++) {

                String nodeId   =cr.getNodeId(""+Names[i], results[1]);
                    Date sd1 = (Date) StartDate1[i];
                    Date sd2 = (Date) StartDate2[i];
                    Date ed2 = (Date) EndDate2[i];
                    Date ed1 = (Date) EndDate1[i];
                    if (j == 0) {
                        /*
                         * if (sd1.after(ed1)){
                         *
                         * sd1= ed1;
                         *
                         * }
                         */
                        
                            Task t = new Task("" + Names[i], new SimpleTimePeriod(sd1, ed1));
                            ser.add(t);
                       

                    } else {

                        /*
                         * if (sd2.after(ed2)){
                         *
                         * sd2= ed2;
                         *
                         * }
                         */

                        
                            Task t = new Task("" + Names[i], new SimpleTimePeriod(sd2, ed2));
                            ser.add(t);
                       
                    }



                }
                ds.add(ser);
            }
        }




            return ds;
        }

        private long getRandomTime() {
            return day * (long) (Math.random() * 31 + 15);
        }

        public String getProducerId() {
            return "GanttDataProducer";
        }

        public boolean hasExpired(Map params, Date since) {
            return true;
        }
    };

    pageContext.setAttribute(
            "ganttData", ganttData);



    int ihc = Names.length * 20;





%>

<div class='mychart'>



    <cewolf:chart id="gantt" title="Chronograph" type="gantt" xaxislabel="Tasks" plotbackgroundcolor="#D6DFFD" >
        <cewolf:colorpaint color="#E4E4E4"/>
        <cewolf:data>
            <cewolf:producer id="ganttData" />
        </cewolf:data>
    </cewolf:chart>

    <cewolf:img chartid="gantt"  renderer="/cewolf" width="900" height="1000" />


</div>

