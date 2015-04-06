/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package xact;
//import com.acrtek.xactws.ComputeResponse;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JLabel;
import javax.swing.SwingUtilities;
import javax.xml.ws.AsyncHandler;
import javax.xml.ws.Response;
import lib.Options.XMLDataModel;

/**
 *
 * @author ismail
 */
public class compute {
    

private int result ;

    public  int compute_do (java.lang.String pid, java.lang.String mid, java.lang.String scenarioid, int ctype, int npoints, double slimitStart) {
        
       /* try { // Call Web Service Operation
            com.acrtek.xactws.XActEngWSService service = new com.acrtek.xactws.XActEngWSService();
            com.acrtek.xactws.XActEngWS port = service.getXActEngWSPort();
            // TODO initialize WS operation arguments here

            AsyncHandler<ComputeResponse> handler = new AsyncHandler<ComputeResponse>() {

                @Override
                public void handleResponse(final Response<ComputeResponse> res) {
                    SwingUtilities.invokeLater(new Runnable() {

                        @Override
                        public void run() {
                            try {
                                int valuet = res.get().getReturn();
                               
                                setResult(valuet);
                            } catch (InterruptedException ex) {
                                Logger.getLogger(ComputeTest.class.getName()).log(Level.SEVERE, null, ex);
                            } catch (ExecutionException ex) {
                                
                            }

                        }
                    });
                }
            };
            Future resnum = port.computeAsync(pid, mid, scenarioid, ctype, npoints, slimitStart, handler);
            while (!resnum.isDone()) {
                Thread.sleep(1000);
            }


        } catch (Exception ex) {
            // TODO handle custom exceptions here
        }*/
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




