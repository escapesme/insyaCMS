package lib.tools;

import java.awt.Graphics2D;
import java.io.FileOutputStream;

import com.lowagie.text.Document;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.PdfContentByte;
import com.lowagie.text.pdf.PdfWriter;
import com.mxgraph.canvas.mxGraphics2DCanvas;
import com.mxgraph.canvas.mxICanvas;
import com.mxgraph.util.mxCellRenderer;
import com.mxgraph.util.mxRectangle;
import com.mxgraph.util.mxCellRenderer.CanvasFactory;
import com.mxgraph.view.mxGraph;
import view.serviecView;

// This example requires iText from http://www.lowagie.com/iText/
public class PdfExport {

    public PdfExport() {

    }

    public void exPDF() throws Exception {// Creates graph with model
       
        serviecView s = new serviecView();
        s.updateData();
        mxGraph graph = s.getGraph();
        mxRectangle bounds = graph.getGraphBounds();

        Document document = new Document(new Rectangle((float) (bounds
                .getWidth()), (float) (bounds.getHeight())));

        String f = Utils.getImageFolder() + "/example.pdf";

        PdfWriter writer = PdfWriter.getInstance(document,
                new FileOutputStream(f));
        document.open();
        final PdfContentByte cb = writer.getDirectContent();

        mxGraphics2DCanvas canvas = (mxGraphics2DCanvas) mxCellRenderer
                .drawCells(graph, null, 1, null, new CanvasFactory() {
                    public mxICanvas createCanvas(int width, int height) {
                        Graphics2D g2 = cb.createGraphics(width, height);
                        return new mxGraphics2DCanvas(g2);
                    }
                });

        canvas.getGraphics().dispose();
        document.close();
    }

    /*	public static void main(String[] args)
     {
     try
     {
     new PdfExport();
     }
     catch (Exception e)
     {
     e.printStackTrace();
     }
     }*/
}
