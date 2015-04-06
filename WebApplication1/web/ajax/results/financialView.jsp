
<%@page import="java.util.ArrayList"%>
<%@page import="com.mysql.jdbc.Util"%>
<%@page import="xact.results.FinancialView"%>
<%@page import="lib.tools.Utils"%>
<%

    String test = "";

    FinancialView fi = new FinancialView();

    String bbid = request.getParameter("bpid");
    String scenarioId = request.getParameter("modid");
    int planPoints = fi.getpp(scenarioId);

    String resultId = "";
    String modName = "";

    if (Utils.isScenario(scenarioId)) {

        String modelId = Utils.getMOdelId(scenarioId);
        resultId = Utils.getResultID(modelId, scenarioId);
        modName = Utils.getModName(modelId, scenarioId);
        ArrayList<String> acList = fi.getACList(bbid, modelId, scenarioId);
        int index = fi.getACWithMaxRate(modelId, scenarioId, acList);
        fi.getMaxRate(acList.get(index), resultId, modName, planPoints);
        String elongation = fi.getElongation(bbid, modelId, scenarioId, planPoints);
        String pro = fi.getProductivity(bbid, modelId, scenarioId, planPoints, elongation);
        String cost = fi.getCost(bbid, modelId, scenarioId, planPoints, pro);
        elongation = fi.adjustComplexity(elongation);

        //out.print(fi.test);
        out.print(pro + ";" + cost + ";" + elongation);
    } else {

        resultId = Utils.getResultID(scenarioId, "0");
        modName = Utils.getModName(scenarioId, "0");
        ArrayList<String> acList = fi.getACList(bbid, scenarioId, "0");
        int index = fi.getACWithMaxRate(scenarioId, "0", acList);
        fi.getMaxRate(acList.get(index), resultId, modName, planPoints);
        String elongation = fi.getElongation(bbid, scenarioId, scenarioId, planPoints);
        String pro = fi.getProductivity(bbid, scenarioId, "0", planPoints, elongation);

        String cost = fi.getCost(bbid, scenarioId, "0", planPoints, pro);

        // out.print(acList.get(index)+"<br>");
        elongation = fi.adjustComplexity(elongation);
        out.print(pro + ";" + cost + ";" + elongation);
        //out.print(fi.test);

    }

%>
