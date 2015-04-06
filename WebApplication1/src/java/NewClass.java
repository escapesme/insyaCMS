/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ismail

public class NewClass {
    
}

public static ThruputValue computeBPThroughput(int iter, BoCorporate corporate, BasicMutableNodeElement bp, FileGroupResult results, ParamSystem pSystem, HashMap<String, ThruputValue> allThruputs, Hashtable arrivalRates, ARRatioPersistManager apm) throws SQLException, XactComputeException {
        double thruputBP = -1d;
        double thruputNext = -1d;
        double efficiencyBP = -1d;
        double efficiencyNext = -1d;
        double scalabilityBP = 1d;
        double scalabilityNext = 1d;
        String acidBP = "";
        String acidNext = "";
        String nameBP = "";
        String nameNext = "";
        if (debugFlow) {
            System.out.println("Entering computBPThroughput. Node type = " + bp.getTag() + " :Name = " + bp.getProperty("NAME"));
        }
        Iterator<NextNode> iNN = NodeLocatorTools.getNodeChildren(bp).iterator();
        while (iNN.hasNext()) {
            NextNode nn = iNN.next();
            BasicMutableNodeElement bmne = nn.getObj();
            double ufreq = nn.getUfreq();
            if (debugFlow) {
                System.out.println("Located Child " + nn.getObj().getProperty("NAME") + " of type: " + nn.getObj().getTag());
            }
            if (bmne instanceof BoActivity) {
                BoActivity act = (BoActivity) bmne;
                Collection<BasicElement> colAC = act.getMyACsWithUtilization();
                if (colAC.isEmpty()) {
                    ThruputValue tv = computeBPThroughput(iter, corporate, act, results, pSystem, allThruputs, arrivalRates, apm);
                    double thruputSubBP = tv.getThruput();
                    double eff = tv.getEfficiency();
                    if (thruputBP == -1d) {
                        thruputBP = 0d;
                    }
                    thruputBP += thruputSubBP;
                    if (efficiencyBP == -1d) {
                        efficiencyBP = eff;
                        scalabilityBP = tv.getScalability();
                        acidBP = tv.getAcid();
                        nameBP = tv.getName();
                    } else if (efficiencyBP > eff) {
                        efficiencyBP = eff;
                        scalabilityBP = tv.getScalability();
                        acidBP = tv.getAcid();
                        nameBP = tv.getName();
                    }
                } else {
                    ThruputValue tv = computeBCThroughput(iter, corporate, act, results, pSystem, allThruputs, arrivalRates, apm);
                    double thruputBC = tv.getThruput();
                    double eff = tv.getEfficiency();
                    if (thruputBP == -1d) {
                        thruputBP = 0d;
                    }
                    thruputBP += thruputBC;
                    if (efficiencyBP == -1d) {
                        efficiencyBP = eff;
                        scalabilityBP = tv.getScalability();
                        acidBP = tv.getAcid();
                        nameBP = tv.getName();
                    } else if (efficiencyBP > eff) {
                        efficiencyBP = eff;
                        scalabilityBP = tv.getScalability();
                        acidBP = tv.getAcid();
                        nameBP = tv.getName();
                    }
                }
            } else if (bmne instanceof BoTask) {
                BoTask tsk = (BoTask) bmne;
                if (tsk.getProperty("TYPE").toString().equalsIgnoreCase("preparation")) {
                    ThruputValue tv = computeBCThroughput(iter, corporate, tsk, results, pSystem, allThruputs, arrivalRates, apm);
                    double thruputBC = getAdjThruPut(tv.getThruput(), ufreq);
                    double eff = tv.getEfficiency();
                    if (thruputBP == -1d) {
                        thruputBP = 0d;
                    }
                    thruputBP += thruputBC;
                    if (efficiencyBP == -1d) {
                        efficiencyBP = eff;
                        scalabilityBP = tv.getScalability();
                        acidBP = tv.getAcid();
                        nameBP = tv.getName();
                    } else if (efficiencyBP > eff) {
                        efficiencyBP = eff;
                        scalabilityBP = tv.getScalability();
                        acidBP = tv.getAcid();
                        nameBP = tv.getName();
                    }
                } else {
                    ThruputValue tv = computeBPThroughput(iter, corporate, tsk, results, pSystem, allThruputs, arrivalRates, apm);
                    double thruputSubBP = tv.getThruput();
                    double eff = tv.getEfficiency();
                    if (thruputBP == -1d) {
                        thruputBP = 0d;
                    }
                    thruputBP += thruputSubBP;
                    if (efficiencyBP == -1d) {
                        efficiencyBP = eff;
                        scalabilityBP = tv.getScalability();
                        acidBP = tv.getAcid();
                        nameBP = tv.getName();
                    } else if (efficiencyBP > eff) {
                        efficiencyBP = eff;
                        scalabilityBP = tv.getScalability();
                        acidBP = tv.getAcid();
                        nameBP = tv.getName();
                    }
                }
            } else if (bmne instanceof BoService) {
                BoService svc = (BoService) bmne;
                Collection<BoS2SXref> colSvc = svc.getMyServices();
                double msgTP = -1d;
                double eff = -1d;
                double scale = 1d;
                String acid = "";
                String name = "";
                if (colSvc.isEmpty()) {
                    System.out.println("ThroughputCalculator: Service2Service empty.");
                    msgTP = 0d;
                    eff = 1d;
                } else {
                    Iterator<BoS2SXref> itSvc = colSvc.iterator();
                    if (itSvc.hasNext()) {
                        BoS2SXref xrf = itSvc.next();
                        if (xrf.getType() == BoS2SXref.SIMPLELINK) {
                            computeBPThroughput(iter, corporate, svc, results, pSystem, allThruputs, arrivalRates, apm);
                            ThruputValue tv = ThroughtputCalculator.getMessageThroughput(svc, results);
                            msgTP = tv.getThruput();
                            eff = tv.getEfficiency();
                            scalabilityBP = tv.getScalability();
                            acidBP = tv.getAcid();
                            nameBP = tv.getName();
                        } else {
                            msgTP = 0d;
                            eff = 1d;
                        }
                    }
                }
                if (thruputBP == -1d) {
                    thruputBP = 0d;
                }
                thruputBP += msgTP;
                if (efficiencyBP == -1d) {
                    efficiencyBP = eff;
                    scalabilityBP = scale;
                    acidBP = acid;
                    nameBP = name;
                } else if (efficiencyBP > eff) {
                    efficiencyBP = eff;
                    scalabilityBP = scale;
                    acidBP = acid;
                    nameBP = name;
                }
            } else {
                ThruputValue tv = computeBPThroughput(iter, corporate, nn.getObj(), results, pSystem, allThruputs, arrivalRates, apm);
                double thruputSubBP = tv.getThruput();
                double eff = tv.getEfficiency();
                if (thruputBP == -1d) {
                    thruputBP = 0d;
                }
                thruputBP += thruputSubBP;
                if (efficiencyBP == -1d) {
                    efficiencyBP = eff;
                    scalabilityBP = tv.getScalability();
                    acidBP = tv.getAcid();
                    nameBP = tv.getName();
                } else if (efficiencyBP > eff) {
                    efficiencyBP = eff;
                    scalabilityBP = tv.getScalability();
                    acidBP = tv.getAcid();
                    nameBP = tv.getName();
                }
            }
        }

        if (debugFlow) {
            System.out.println("Exiting computBPThroughput children. Node type = " + bp.getTag() + " :Name = " + bp.getProperty("NAME"));
        }
        Iterator<NextNode> iNN2 = NodeLocatorTools.getNodeNeighbors(bp).iterator();
        while (iNN2.hasNext()) {
            NextNode nn = iNN2.next();
            BasicMutableNodeElement bmne = nn.getObj();
            double ufreq = nn.getUfreq();
            if (debugFlow) {
                System.out.println("Located Neighbor " + nn.getObj().getProperty("NAME") + " of type: " + nn.getObj().getTag());
            }
            if (bmne instanceof BoActivity) {
                BoActivity act = (BoActivity) bmne;
                Collection<BasicElement> colAC = act.getMyACsWithUtilization();
                if (colAC.isEmpty()) {
                    ThruputValue tv = computeBPThroughput(iter, corporate, act, results, pSystem, allThruputs, arrivalRates, apm);
                    double thruputSubBP = tv.getThruput();
                    double eff = tv.getEfficiency();
                    if (thruputNext == -1d) {
                        thruputNext = 0d;
                    }
                    thruputNext += thruputSubBP;
                    if (efficiencyNext == -1d) {
                        efficiencyNext = eff;
                        scalabilityNext = tv.getScalability();
                        acidNext = tv.getAcid();
                        nameNext = tv.getName();
                    } else if (efficiencyNext > eff) {
                        efficiencyNext = eff;
                        scalabilityNext = tv.getScalability();
                        acidNext = tv.getAcid();
                        nameNext = tv.getName();
                    }
                } else {
                    ThruputValue tv = computeBCThroughput(iter, corporate, act, results, pSystem, allThruputs, arrivalRates, apm);
                    double thruputBC = tv.getThruput();
                    double eff = tv.getEfficiency();
                    if (thruputNext == -1d) {
                        thruputNext = 0d;
                    }
                    thruputNext += thruputBC;
                    if (efficiencyNext == -1d) {
                        efficiencyNext = eff;
                        scalabilityNext = tv.getScalability();
                        acidNext = tv.getAcid();
                        nameNext = tv.getName();
                    } else if (efficiencyNext > eff) {
                        efficiencyNext = eff;
                        scalabilityNext = tv.getScalability();
                        acidNext = tv.getAcid();
                        nameNext = tv.getName();
                    }
                }
            } else if (bmne instanceof BoTask) {
                BoTask tsk = (BoTask) bmne;
                if (tsk.getProperty("TYPE").toString().equalsIgnoreCase("preparation")) {
                    ThruputValue tv = computeBCThroughput(iter, corporate, tsk, results, pSystem, allThruputs, arrivalRates, apm);
                    double thruputBC = getAdjThruPut(tv.getThruput(), ufreq);
                    double eff = tv.getEfficiency();
                    if (thruputNext == -1d) {
                        thruputNext = 0d;
                    }
                    thruputNext += thruputBC;
                    if (efficiencyNext == -1d) {
                        efficiencyNext = eff;
                        scalabilityNext = tv.getScalability();
                        acidNext = tv.getAcid();
                        nameNext = tv.getName();
                    } else if (efficiencyNext > eff) {
                        efficiencyNext = eff;
                        scalabilityNext = tv.getScalability();
                        acidNext = tv.getAcid();
                        nameNext = tv.getName();
                    }
                } else {
                    ThruputValue tv = computeBPThroughput(iter, corporate, tsk, results, pSystem, allThruputs, arrivalRates, apm);
                    double thruputSubBP = tv.getThruput();
                    double eff = tv.getEfficiency();
                    if (thruputNext == -1d) {
                        thruputNext = 0d;
                    }
                    thruputNext += thruputSubBP;
                    if (efficiencyNext == -1d) {
                        efficiencyNext = eff;
                        scalabilityNext = tv.getScalability();
                        acidNext = tv.getAcid();
                        nameNext = tv.getName();
                    } else if (efficiencyNext > eff) {
                        efficiencyNext = eff;
                        scalabilityNext = tv.getScalability();
                        acidNext = tv.getAcid();
                        nameNext = tv.getName();
                    }
                }
            } else if (bmne instanceof BoService) {
                BoService svc = (BoService) bmne;
                Collection<BoS2SXref> colSvc = svc.getMyServices();
                double msgTP = -1d;
                double eff = -1d;
                double scale = 1d;
                String acid = "";
                String name = "";
                if (colSvc.isEmpty()) {
                    System.out.println("ThroughputCalculator: Service2Service empty.");
                    msgTP = 0d;
                    eff = 1d;
                } else {
                    Iterator<BoS2SXref> itSvc = colSvc.iterator();
                    if (itSvc.hasNext()) {
                        BoS2SXref xrf = itSvc.next();
                        if (xrf.getType() == BoS2SXref.SIMPLELINK) {
                            computeBPThroughput(iter, corporate, svc, results, pSystem, allThruputs, arrivalRates, apm);
                            ThruputValue tv = ThroughtputCalculator.getMessageThroughput(svc, results);
                            msgTP = tv.getThruput();
                            eff = tv.getEfficiency();
                            scale = tv.getScalability();
                            acid = tv.getAcid();
                            name = tv.getName();
                        } else {
                            msgTP = 0d;
                            eff = 1d;
                        }
                    }
                }
                if (thruputNext == -1d) {
                    thruputNext = 0d;
                }
                thruputNext += msgTP;
                if (efficiencyNext == -1d) {
                    efficiencyNext = eff;
                    scalabilityNext = scale;
                    acidNext = acid;
                    nameNext = name;
                } else if (efficiencyNext > eff) {
                    efficiencyNext = eff;
                    scalabilityNext = scale;
                    acidNext = acid;
                    nameNext = name;
                }
            } else {
                ThruputValue tv = computeBPThroughput(iter, corporate, nn.getObj(), results, pSystem, allThruputs, arrivalRates, apm);
                double thruputSubBP = tv.getThruput();
                double eff = tv.getEfficiency();
                if (thruputNext == -1d) {
                    thruputNext = 0d;
                }
                thruputNext += thruputSubBP;
                if (efficiencyNext == -1d) {
                    efficiencyNext = eff;
                    scalabilityNext = tv.getScalability();
                    acidNext = tv.getAcid();
                    nameNext = tv.getName();
                } else if (efficiencyNext > eff) {
                    efficiencyNext = eff;
                    scalabilityNext = tv.getScalability();
                    acidNext = tv.getAcid();
                    nameNext = tv.getName();
                }
            }
        }

        if (debugFlow) {
            System.out.println("Exiting computBPThroughput neighbor. Node type = " + bp.getTag() + " :Name = " + bp.getProperty("NAME"));
        }
        double rtnThruput = Double.MAX_VALUE;
        double rtnEfficiency = 0d;
        double rtnScalability = 1d;
        String rtnAcid = "";
        String rtnName = "";
        if ((thruputBP <= thruputNext && thruputBP >= 0d) || (thruputBP != -1d && thruputNext == -1d)) {
            rtnThruput = thruputBP;
        } else if ((thruputNext < thruputBP && thruputNext >= 0d) || (thruputBP == -1d && thruputNext != -1d)) {
            rtnThruput = thruputNext;
        }
        if ((efficiencyBP <= efficiencyNext && efficiencyBP >= 0d) || (efficiencyBP != -1d && efficiencyNext == -1d)) {
            rtnEfficiency = efficiencyBP;
            rtnScalability = scalabilityBP;
            rtnAcid = acidBP;
            rtnName = nameBP;
        } else if ((efficiencyNext < efficiencyBP && efficiencyNext >= 0d) || (efficiencyBP == -1d && efficiencyNext != -1d)) {
            rtnEfficiency = efficiencyNext;
            rtnScalability = scalabilityNext;
            rtnAcid = acidNext;
            rtnName = nameNext;
        }
        allThruputs.put(bp.getID() + "_" + bp.getClass().getSimpleName(), new ThruputValue(rtnThruput, rtnEfficiency, rtnScalability, rtnAcid, rtnName));
        if (debug) {
            System.out.println(bp.getProperty("SELECTOR") + ";" + bp.getTag() + ";" + bp.getProperty("NAME") + ";" + rtnThruput + ";" + results.getIterationNumber() + ";" + rtnEfficiency);
        }
//        System.err.println("BP name = " + bp.getProperty("NAME") + " type = " + bp.getTag() + " thruput = " + rtnThruput + " Efficiency = " + rtnEfficiency);
        return new ThruputValue(rtnThruput, rtnEfficiency, rtnScalability, rtnAcid, rtnName);
    }

    private static ThruputValue computeBCThroughput(int iter, BoCorporate corporate, BasicMutableNodeElement bc, FileGroupResult results, ParamSystem pSystem, HashMap<String, ThruputValue> allThruputs, Hashtable arrivalRates, ARRatioPersistManager apm) throws SQLException, XactComputeException {
        double thruputBC = -1d;
        double efficiencyBC = -1d;
        double scalabilityBC = 1d;
        String acidBC = "";
        String nameBC = "";
        double thruputNext = -1d;
        double efficiencyNext = -1d;
        double scalabilityNext = 1d;
        String acidNext = "";
        String nameNext = "";
        if (bc instanceof BoActivity) {
            BoActivity act = (BoActivity) bc;
            Collection<BasicElement> colAC = act.getMyACsWithUtilization();
            if (colAC.isEmpty()) {
                ThruputValue tv = computeBPThroughput(iter, corporate, act, results, pSystem, allThruputs, arrivalRates, apm);
                double thruputSubBP = tv.getThruput();
                double eff = tv.getEfficiency();
                if (thruputBC == -1d) {
                    thruputBC = 0d;
                }
                thruputBC += thruputSubBP;
                if (efficiencyBC == -1d) {
                    efficiencyBC = eff;
                    scalabilityBC = tv.getScalability();
                    acidBC = tv.getAcid();
                    nameBC = tv.getName();
                } else if (efficiencyBC > eff) {
                    efficiencyBC = eff;
                    scalabilityBC = tv.getScalability();
                    acidBC = tv.getAcid();
                    nameBC = tv.getName();
                }

            } else {
                ThruputValue tv = getACThroughput(corporate, colAC, results, pSystem, apm);
                thruputBC = tv.getThruput();
                efficiencyBC = tv.getEfficiency();
                scalabilityBC = tv.getScalability();
                acidBC = tv.getAcid();
                nameBC = tv.getName();
            }
        } else if (bc instanceof BoTask) {
            BoTask tsk = (BoTask) bc;
            if (tsk.getProperty("TYPE").toString().equalsIgnoreCase("preparation")) {
                Object obj = arrivalRates.get(bc);
                double dbl = 1;
                if (obj != null) {
//                    dbl = (Double) obj;
                    dbl = ((BigDecimal) obj).doubleValue();
                }
                thruputBC = dbl;
                efficiencyBC = dbl;
                scalabilityBC = 1d;
                acidBC = "";
                nameBC = "";
            } else {
                ThruputValue tv = computeBPThroughput(iter, corporate, tsk, results, pSystem, allThruputs, arrivalRates, apm);
                double thruputSubBP = tv.getThruput();
                double eff = tv.getEfficiency();
                if (thruputBC == -1d) {
                    thruputBC = 0d;
                }
                thruputBC += thruputSubBP;
                if (efficiencyBC == -1d) {
                    efficiencyBC = eff;
                    scalabilityBC = tv.getScalability();
                    acidBC = tv.getAcid();
                    nameBC = tv.getName();
                } else if (efficiencyBC > eff) {
                    efficiencyBC = eff;
                    scalabilityBC = tv.getScalability();
                    acidBC = tv.getAcid();
                    nameBC = tv.getName();
                }
            }
        } else if (bc instanceof BoService) {
            BoService svc = (BoService) bc;
            Collection<BoS2SXref> colSvc = svc.getMyServices();
            double msgTP = -1d;
            double eff = -1d;
            double scale = 1d;
            String acid = "";
            String name = "";
            if (colSvc.isEmpty()) {
                System.out.println("ThroughputCalculator: Service2Service empty.");
                msgTP = 0d;
                eff = 0d;
            } else {
                Iterator<BoS2SXref> itSvc = colSvc.iterator();
                if (itSvc.hasNext()) {
                    BoS2SXref xrf = itSvc.next();
                    if (xrf.getType() == BoS2SXref.SIMPLELINK) {
                        ThruputValue tv = ThroughtputCalculator.getMessageThroughput(svc, results);
                        msgTP = tv.getThruput();
                        eff = tv.getEfficiency();
                        scale = tv.getScalability();
                        acid = tv.getAcid();
                        name = tv.getName();
                    } else {
                        msgTP = 0d;
                        eff = 0d;
                        scale = 1d;
                        acid = "";
                        name = "";
                    }
                }
            }
            if (thruputBC == -1d) {
                thruputBC = 0d;
            }
            thruputBC += msgTP;
            if (efficiencyBC == -1d) {
                efficiencyBC = eff;
                scalabilityBC = scale;
                acidBC = acid;
                nameBC = name;
            } else if (efficiencyBC > eff) {
                efficiencyBC = eff;
                scalabilityBC = scale;
                acidBC = acid;
                nameBC = name;
            }
        }
        Iterator<NextNode> iNN = NodeLocatorTools.getNodeNeighbors(bc).iterator();
        while (iNN.hasNext()) {
            NextNode nn = iNN.next();
            BasicMutableNodeElement bmne = nn.getObj();
            double ufreq = nn.getUfreq();
            if (debugFlow) {
                System.out.println("Located Neighbor " + nn.getObj().getProperty("NAME") + " of type: " + nn.getObj().getTag());
            }
            if (bmne instanceof BoActivity) {
                BoActivity act = (BoActivity) bmne;
                Collection<BasicElement> colAC = act.getMyACsWithUtilization();
                if (colAC.isEmpty()) {
                    ThruputValue tv = computeBPThroughput(iter, corporate, act, results, pSystem, allThruputs, arrivalRates, apm);
                    double thruputSubBP = tv.getThruput();
                    double eff = tv.getEfficiency();
                    if (thruputNext == -1d) {
                        thruputNext = 0d;
                    }
                    thruputNext += thruputSubBP;
                    if (efficiencyNext == -1d) {
                        efficiencyNext = eff;
                        scalabilityNext = tv.getScalability();
                        acidNext = tv.getAcid();
                        nameNext = tv.getName();
                    } else if (efficiencyNext > eff) {
                        efficiencyNext = eff;
                        scalabilityNext = tv.getScalability();
                        acidNext = tv.getAcid();
                        nameNext = tv.getName();
                    }
                } else {
                    ThruputValue tv = computeBCThroughput(iter, corporate, act, results, pSystem, allThruputs, arrivalRates, apm);
                    double nextBCThruput = tv.getThruput();
                    double eff = tv.getEfficiency();
                    if (thruputNext == -1d) {
                        thruputNext = 0d;
                    }
                    thruputNext += nextBCThruput;
                    if (efficiencyNext == -1d) {
                        efficiencyNext = eff;
                        scalabilityNext = tv.getScalability();
                        acidNext = tv.getAcid();
                        nameNext = tv.getName();
                    } else if (efficiencyNext > eff) {
                        efficiencyNext = eff;
                        scalabilityNext = tv.getScalability();
                        acidNext = tv.getAcid();
                        nameNext = tv.getName();
                    }
                }
            } else if (bmne instanceof BoTask) {
                BoTask tsk = (BoTask) bmne;
                if (tsk.getProperty("TYPE").toString().equalsIgnoreCase("preparation")) {
                    ThruputValue tv = computeBCThroughput(iter, corporate, tsk, results, pSystem, allThruputs, arrivalRates, apm);
                    double nextBCThruput = getAdjThruPut(tv.getThruput(), ufreq);
                    // this is a black box so don't constrain overall process.
                    // It may be necessary to compute efficiency by dividing the
                    // adjusted throughput by the arrival rate.
                    double eff = 1;
                    if (thruputNext == -1d) {
                        thruputNext = 0d;
                    }
                    thruputNext += nextBCThruput;
                    if (efficiencyNext == -1d) {
                        efficiencyNext = eff;
                        scalabilityNext = tv.getScalability();
                        acidNext = tv.getAcid();
                        nameNext = tv.getName();
                    } else if (efficiencyNext > eff) {
                        efficiencyNext = eff;
                        scalabilityNext = tv.getScalability();
                        acidNext = tv.getAcid();
                        nameNext = tv.getName();
                    }
                } else {
                    ThruputValue tv = computeBPThroughput(iter, corporate, tsk, results, pSystem, allThruputs, arrivalRates, apm);
                    double thruputSubBP = tv.getThruput();
                    double eff = tv.getEfficiency();
                    if (thruputNext == -1d) {
                        thruputNext = 0d;
                    }
                    thruputNext += thruputSubBP;
                    if (efficiencyNext == -1d) {
                        efficiencyNext = eff;
                        scalabilityNext = tv.getScalability();
                        acidNext = tv.getAcid();
                        nameNext = tv.getName();
                    } else if (efficiencyNext > eff) {
                        efficiencyNext = eff;
                        scalabilityNext = tv.getScalability();
                        acidNext = tv.getAcid();
                        nameNext = tv.getName();
                    }
                }
            } else if (bmne instanceof BoService) {
                BoService svc = (BoService) bmne;
                Collection<BoS2SXref> colSvc = svc.getMyServices();
                double msgTP = -1d;
                double efficiency = -1d;
                double scale = 1d;
                String acid = "";
                String name = "";
                if (colSvc.isEmpty()) {
                    System.out.println("ThroughputCalculator: Service2Service empty.");
                    msgTP = 0d;
                    efficiency = 0d;
                } else {
                    Iterator<BoS2SXref> itSvc = colSvc.iterator();
                    if (itSvc.hasNext()) {
                        BoS2SXref xrf = itSvc.next();
                        if (xrf.getType() == BoS2SXref.SIMPLELINK) {
                            ThruputValue tv = ThroughtputCalculator.getMessageThroughput(svc, results);
                            msgTP = tv.getThruput();
                            scale = tv.getScalability();
                            acid = tv.getAcid();
                            name = tv.getName();
                        } else {
                            msgTP = 0d;
                            efficiency = 0d;
                        }
                    }
                }
                if (thruputNext == -1d) {
                    thruputNext = 0d;
                }
                thruputNext += msgTP;
                if (efficiencyNext == -1d) {
                    efficiencyNext = efficiency;
                    scalabilityNext = scale;
                    acidNext = acid;
                    nameNext = name;
                } else if (efficiencyNext > efficiency) {
                    efficiencyNext = efficiency;
                    scalabilityNext = scale;
                    acidNext = acid;
                    nameNext = name;
                }
            } else {
                ThruputValue tv = computeBPThroughput(iter, corporate, nn.getObj(), results, pSystem, allThruputs, arrivalRates, apm);
                double thruputSubBP = tv.getThruput();
                double eff = tv.getEfficiency();
                if (thruputNext == -1d) {
                    thruputNext = 0d;
                }
                thruputNext += thruputSubBP;
                if (efficiencyNext == -1d) {
                    efficiencyNext = eff;
                    scalabilityNext = tv.getScalability();
                    acidNext = tv.getAcid();
                    nameNext = tv.getName();
                } else if (efficiencyNext > eff) {
                    efficiencyNext = eff;
                    scalabilityNext = tv.getScalability();
                    acidNext = tv.getAcid();
                    nameNext = tv.getName();
                }
            }
        }

        if (debugFlow) {
            System.out.println("Exiting computBCThroughput neighbor. Node type = " + bc.getTag() + " :Name = " + bc.getProperty("NAME"));
        }
        double rtnThruput = Double.MAX_VALUE;
        double rtnEfficiency = 0d;
        double rtnScalability = 1d;
        String rtnAcid = "";
        String rtnName = "";
        if ((thruputBC <= thruputNext && thruputBC >= 0d) || (thruputBC != -1d && thruputNext == -1d)) {
            rtnThruput = thruputBC;
        } else if ((thruputNext < thruputBC && thruputNext >= 0d) || (thruputBC == -1d && thruputNext != -1d)) {
            rtnThruput = thruputNext;
        }
        if ((efficiencyBC <= efficiencyNext && efficiencyBC >= 0d) || (efficiencyBC != -1d && efficiencyNext == -1d)) {
            rtnEfficiency = efficiencyBC;
            rtnScalability = scalabilityBC;
            rtnAcid = acidBC;
            rtnName = nameBC;
        } else if ((efficiencyNext < efficiencyBC && efficiencyNext >= 0d) || (efficiencyBC != -1d && efficiencyNext == -1d)) {
            rtnEfficiency = efficiencyNext;
            rtnScalability = scalabilityNext;
            rtnAcid = acidNext;
            rtnName = nameNext;
        }
        if (debug) {
            System.out.println(bc.getProperty("SELECTOR") + ";" + bc.getTag() + ";" + bc.getProperty("NAME") + ";" + rtnThruput + ";" + results.getIterationNumber() + ";" + rtnEfficiency);
        }
        return new ThruputValue(rtnThruput, rtnEfficiency, rtnScalability, rtnAcid, rtnName);

    }

    public static ThruputValue getACThroughput(BoCorporate corporate, Collection<BasicElement> colAC, FileGroupResult results, ParamSystem pSystem, ARRatioPersistManager apm) throws SQLException {
        double throughput = 0d;
        double efficiency = -1d;
        double scaleability = 1d;
        String acid = "";
        String name = "";
        Iterator itACs = colAC.iterator();
        while (itACs.hasNext()) {
            ActivityACListElement ale = (ActivityACListElement) itACs.next();
            ThruputValue tv = getACThroughput(corporate, ale.getAc(), results, pSystem, apm);
            double rt = tv.getThruput();
            double eff = tv.getEfficiency();
            if (rt == Double.MAX_VALUE) {
                return new ThruputValue(rt, 0d, scaleability, tv.getAcid(), tv.getName());
            }
            throughput += rt;
            if (efficiency == -1d) {
                efficiency = eff;
                scaleability = tv.getScalability();
                acid = tv.getAcid();
                name = tv.getName();
            } else if (eff < efficiency) {
                efficiency = eff;
                scaleability = tv.getScalability();
                acid = tv.getAcid();
                name = tv.getName();
            }
        }
        if (debugFlow) {
            System.out.println("getACThroughput AC value for thruput:  " + throughput + " Iteration=" + results.getIterationNumber());
        }

        return new ThruputValue(throughput, efficiency, scaleability, acid, name);
    }

    public static ThruputValue getACThroughput(BoCorporate corporate, BoApplicationComponent ac, FileGroupResult results, ParamSystem pSystem, ARRatioPersistManager apm) throws SQLException {

        if (ac != null && ac.getMyNode() != null) {
            BoNode node = ac.getMyNode();
            String virtual = ac.getVirtual();
            int type = results.getIntACValue(ac.getMyNode().getHostname(), ac.getComplexValue(), ac.getPartitionValue(), ac.getShortname(), FileGroupResult.AC_TYPE);
            if (virtual != null && !virtual.equals("") && !virtual.equals("0")) {
                HashMap<String, String[]> vACs = results.getVirtualACValues(ac.getShortname());

                double thruputAC = 0d;
                Iterator<String[]> iteValues = vACs.values().iterator();
                while (iteValues.hasNext()) {
                    String[] val = iteValues.next();
                    thruputAC += Double.parseDouble(val[FileGroupResult.AC_THROUGHPUT]);
                }
                double ar = results.getDoubleACValue(ac.getMyNode().getHostname(), ac.getComplexValue(), ac.getPartitionValue(), ac.getShortname(), FileGroupResult.AC_ARRIVAL_RATE);
                double serviceTime = 1d;
                if (type < 5) {
                    serviceTime = results.getDoubleACValue(ac.getMyNode().getHostname(), ac.getComplexValue(), ac.getPartitionValue(), ac.getShortname(), FileGroupResult.AC_SERVICE_TIME);
                }
                double cpuTime = results.getDoubleACValue(ac.getMyNode().getHostname(), ac.getComplexValue(), ac.getPartitionValue(), ac.getShortname(), FileGroupResult.AC_CPU_TIME);
                double scalability = 1 - (serviceTime - cpuTime) / serviceTime;
                double atp = apm.getRatio(ac.getID()) * thruputAC;
                double efficiency = thruputAC / ar;
                return new ThruputValue(atp, efficiency, scalability, ac.getID(), ac.getShortname());
            } else {
                double ar = results.getDoubleACValue(ac.getMyNode().getHostname(), ac.getComplexValue(), ac.getPartitionValue(), ac.getShortname(), FileGroupResult.AC_ARRIVAL_RATE);
                double tp = results.getDoubleACValue(ac.getMyNode().getHostname(), ac.getComplexValue(), ac.getPartitionValue(), ac.getShortname(), FileGroupResult.AC_THROUGHPUT);
                double serviceTime = 1d;
                if (type < 5) {
                    serviceTime = results.getDoubleACValue(ac.getMyNode().getHostname(), ac.getComplexValue(), ac.getPartitionValue(), ac.getShortname(), FileGroupResult.AC_SERVICE_TIME);
                }

                double cpuTime = results.getDoubleACValue(ac.getMyNode().getHostname(), ac.getComplexValue(), ac.getPartitionValue(), ac.getShortname(), FileGroupResult.AC_CPU_TIME);
                double scalability = 1 - (serviceTime - cpuTime) / serviceTime;

//                int type = results.getIntACValue(ac.getMyNode().getHostname(), ac.getComplexValue(), ac.getPartitionValue(), ac.getShortname(), FileGroupResult.AC_TYPE);
                double atp = apm.getRatio(ac.getID()) * tp;
                double efficiency = 0d;
                efficiency = tp / ar;
//                efficiency = atp / ar;
                if (type == 2 || type == 6 || type == 7) {
                    double responseTime = results.getDoubleACValue(ac.getMyNode().getHostname(), ac.getComplexValue(), ac.getPartitionValue(), ac.getShortname(), FileGroupResult.AC_RESPONSE_TIME);
                    int mpl = results.getIntACValue(ac.getMyNode().getHostname(), ac.getComplexValue(), ac.getPartitionValue(), ac.getShortname(), FileGroupResult.AC_PARALLELISME_LEVEL);
                    double duration = responseTime * (ar / mpl);
                    double windowDuration = (corporate.getWindowDuration() * BoCorporate.SECONDS_REFERENCE[corporate.getWindowDurationType()]);
                    if (duration > windowDuration) {
                        efficiency = windowDuration / duration;
                    } else {
                        efficiency = 1d;
                    }
                }
                if (debug) {
                    System.out.println(type + "; AC " + ";" + ac.getShortname() + ";" + atp + ";" + results.getIterationNumber() + ";" + efficiency + ";" + ar);
                }
                return new ThruputValue(atp, efficiency, scalability, ac.getID(), ac.getShortname());
            }
        }
        return new ThruputValue(Double.MAX_VALUE, 0d, 0d, "", "");
    }

    public static ThruputValue getMessageThroughput(BoService svc, FileGroupResult results) {
        double throughput = 0d;
        double efficiency = 0d;
        BoPersistence bop = svc.getBoPersistence();
        Iterator itSvc = bop.requestObjects(BoS2SXref.class, "S2S_ID='" + svc.getID() + "'").iterator();
        while (itSvc.hasNext()) {
            BoS2SXref xrf = (BoS2SXref) itSvc.next();
            BoMessage msg = (BoMessage) bop.getObjectById(BoMessage.class, xrf.getObject_ID());
            ThruputValue tv = getMessageThroughput(msg, results);
            double rtMessage = tv.getThruput();
            double eff = tv.getEfficiency();
            if (rtMessage == Double.MAX_VALUE) {
                return new ThruputValue(Double.MAX_VALUE, 0d, 1d, msg.getID(), msg.getName());
            }
            if (rtMessage > throughput) {
                throughput = rtMessage;
            }
            if (eff > efficiency) {
                efficiency = eff;
            }
        }
        if (debugFlow) {
            System.out.println("getMessageThroughput1 Message value for thruput:  " + throughput + " Iteration=" + results.getIterationNumber());
        }
        return new ThruputValue(throughput, efficiency, 1d, svc.getID(), svc.getName());
    }

    public static ThruputValue getMessageThroughput(BoMessage message, FileGroupResult results) {
        double minThroughput = Double.MAX_VALUE;
        if (message != null) {
            if (!results.getIterationNumber().equals("SL")) {
                Hashtable<String, Double> checker = new Hashtable();

                Vector<String> linksResults = results.getLinkList(message.getName());
                if (linksResults != null) {
                    Iterator<String> iter = linksResults.iterator();
                    while (iter.hasNext()) {
                        String linkNameID = iter.next();
                        double val = results.getDoubleFlowLineValue(message.getName(), linkNameID, true, FileGroupResult.FLOW_LINE_MESSAGE_THROUGHPUT);
                        String indexE2E = results.getStringFlowLineValue(message.getName(), linkNameID, true, FileGroupResult.FLOW_LINE_MESSAGE_E2E_INDEX);
                        if (!checker.containsKey(indexE2E)) {
                            checker.put(indexE2E, val);
                        } else {
                            Double minSelectedE2E = checker.get(indexE2E);
                            if (val < minSelectedE2E) {
                                checker.put(indexE2E, val);
                            }
                        }
                    }
                }

                if (checker.size() > 0d) {
                    minThroughput = 0d;
                }

                Iterator<Double> values = checker.values().iterator();
                if (values.hasNext()) {
                    minThroughput += values.next();

                }
//                double ar = results.getDoubleFlowMessageValue(message.getName(), FileGroupResult.);
            } else {
                minThroughput = 10000d;
            }
        }
//        minThroughput = 10000d;
        if (debug) {
            System.out.println(";Message;" + message.getName() + ";" + minThroughput + ";" + results.getIterationNumber());
        }
        // debug do not let message constrain model.
        return new ThruputValue(minThroughput, 1d, 1d, message.getID(), message.getName());
    } */