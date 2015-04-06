/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package xact;

import java.util.concurrent.TimeUnit;

/**
 *
 * @author ismail
 */
public class ComputeTester {
    private int result;
    public int ComputeWS(String pid,String mid,String sid,int ctype,int npoints,double limit){
        
try { // Call Web Service Operation(async. callback)
   com.acrtek.xactws.XActEngWSService service = new com.acrtek.xactws.XActEngWSService();
   com.acrtek.xactws.XActEngWS port = service.getXActEngWSPort();
   	 // TODO initialize WS operation arguments here
	java.lang.String projectID = pid;
	java.lang.String modelID = mid;
	java.lang.String scenarioID = "";
        if(!(sid.equalsIgnoreCase(""))&&sid!=null){
            scenarioID=sid;
        }
	int type =ctype;
	int points = npoints;
	double limitStart = limit;
	javax.xml.ws.AsyncHandler<com.acrtek.xactws.ComputeResponse> asyncHandler = new javax.xml.ws.AsyncHandler<com.acrtek.xactws.ComputeResponse>() {
       public void handleResponse(javax.xml.ws.Response<com.acrtek.xactws.ComputeResponse> response) {
           try {
               // TODO process asynchronous response here
               //System.out.println("Result = "+ response.get());
               setResult(response.get().getReturn());
           } catch(Exception ex) {
               // TODO handle exception
           }
       }
   };
   java.util.concurrent.Future<? extends java.lang.Object> result = port.computeAsync(projectID, modelID, scenarioID, type, points, limitStart, asyncHandler);
   while(!result.isDone()) {
       // do something
       //result.get(120, TimeUnit.SECONDS);
       Thread.sleep(100);
   }
} catch (Exception ex) {
   // TODO handle custom exceptions here
}

        return getResult();
    }

    /**
     * @return the result
     */
    public int getResult() {
        return result;
    }

    /**
     * @param result the result to set
     */
    public void setResult(int result) {
        this.result = result;
    }
}
