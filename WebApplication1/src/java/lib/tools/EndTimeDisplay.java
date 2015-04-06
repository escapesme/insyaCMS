/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lib.tools;


import java.util.Calendar;

/**
 *
 * @author shwells
 */
public class EndTimeDisplay {

    public static double calcOffsetInSecond(String tod) {
        int days = 0;
        int hrs = 0;
        int mins = 0;
        int secs = 0;
        String[] tSegs = tod.split(":");
        if (tSegs.length > 4) {
            return -1d;
        }
        try {
            switch (tSegs.length) {
                case 4:
                    days = Integer.parseInt(tSegs[0]);
                    hrs = Integer.parseInt(tSegs[1]);
                    mins = Integer.parseInt(tSegs[2]);
                    secs = Integer.parseInt(tSegs[3]);
                    break;
                case 3:
                    hrs = Integer.parseInt(tSegs[0]);
                    mins = Integer.parseInt(tSegs[1]);
                    secs = Integer.parseInt(tSegs[2]);
                    break;
                case 2:
                    mins = Integer.parseInt(tSegs[0]);
                    secs = Integer.parseInt(tSegs[1]);
                    break;
                case 1:
                    secs = Integer.parseInt(tSegs[0]);
                    break;
                default:
            }
        } catch (NumberFormatException e) {
            return -1d;
        }
        double dur = daysToSeconds(days);
        dur += hrsToSeconds(hrs);
        dur += minsToSeconds(mins);
        dur += secs;
        return dur;
    }

    public static String calcEndTime(double cSecs, String tod) {
        int days = 0;
        int hrs = 0;
        int mins = 0;
        int secs = 0;
        long etDays = 0;
        long etHrs = 0;
        long etMins = 0;
        long etSecs = 0;

        String[] tSegs = tod.split(":");
        if (tSegs.length > 4) {
            return "Invalid TOD";
        }
        try {
            switch (tSegs.length) {
                case 4:
                    days = Integer.parseInt(tSegs[0]);
                    hrs = Integer.parseInt(tSegs[1]);
                    mins = Integer.parseInt(tSegs[2]);
                    secs = Integer.parseInt(tSegs[3]);
                    break;
                case 3:
                    hrs = Integer.parseInt(tSegs[0]);
                    mins = Integer.parseInt(tSegs[1]);
                    secs = Integer.parseInt(tSegs[2]);
                    break;
                case 2:
                    mins = Integer.parseInt(tSegs[0]);
                    secs = Integer.parseInt(tSegs[1]);
                    break;
                case 1:
                    secs = Integer.parseInt(tSegs[0]);
                    break;
                default:
            }
        } catch (NumberFormatException e) {
            return "TOD not numeric";
        }
        if (hrs >= 24) {
            return "Hours invalid";
        }
        if (mins >= 60) {
            return "Minutes invalid";
        }
        if (secs >= 60) {
            return "Seconds invalid";
        }
        etDays = getDays(cSecs);
        etHrs = getHours(cSecs, etDays);
        etMins = getMins(cSecs, etDays, etHrs);
        etSecs = getSecs(cSecs, etDays, etHrs, etMins);
        int carry = 0;
        long dSecs = secs + etSecs;
        if (dSecs > 59) {
            dSecs = dSecs - 60;
            carry = 1;
        }
        long dMins = mins + etMins + carry;
        if (dMins > 59) {
            dMins = dMins - 60;
            carry = 1;
        } else {
            carry = 0;
        }
        long dHrs = hrs + etHrs + carry;
        if (dHrs > 23) {
            dHrs = dHrs - 24;
            carry = 1;
        } else {
            carry = 0;
        }
        long dDays = etDays + carry;
        String tStr = String.format("%1$02d:%2$02d:%3$02d", dHrs, dMins, dSecs);
        if (dDays > 0) {
            return tStr + " plus " + dDays + " days";
        } else {
            return tStr;
        }
    }

    public static Calendar getStartCalendar(String tod) throws Exception {
        int days = 0;
        int hrs = 0;
        int mins = 0;
        int secs = 0;

        String[] tSegs = tod.split(":");
        if (tSegs.length == 3) {
            try {
                hrs = Integer.parseInt(tSegs[0]);
                mins = Integer.parseInt(tSegs[1]);
                secs = Integer.parseInt(tSegs[2]);
            } catch (NumberFormatException e) {
                throw new Exception("TOD not numeric");
            }

        } else if (tSegs.length == 4) {
            try {
                days = Integer.parseInt(tSegs[0]);
                hrs = Integer.parseInt(tSegs[1]);
                mins = Integer.parseInt(tSegs[2]);
                secs = Integer.parseInt(tSegs[3]);
            } catch (NumberFormatException e) {
                throw new Exception("TOD not numeric");
            }
        } else {
            throw new Exception("Invalid TOD");
        }
        if (days > 365) {
            throw new Exception("Scheduling beyond 1 year is not supported.");
        }
        if (hrs >= 24) {
            throw new Exception("Hours invalid");
        }
        if (mins >= 60) {
            throw new Exception("Minutes invalid");
        }
        if (secs >= 60) {
            throw new Exception("Seconds invalid");
        }
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.HOUR, hrs);
        cal.set(Calendar.MINUTE, mins);
        cal.set(Calendar.SECOND, secs);
        if (days > 0) {
            cal.add(Calendar.DAY_OF_YEAR, days);
        }
        return cal;
    }

    private static long getDays(double val) {
        if (val >= 86400) {
            return (long) (val / 86400);
        }
        return 0;
    }

    public static void incCalendar(double secs, Calendar c) {
        int iSecs = (int) secs;
        int iMilli = (int) ((secs - iSecs) * 1000);
        c.add(Calendar.SECOND, iSecs);
        c.add(Calendar.MILLISECOND, iMilli);
    }

    public static boolean isNotSet(String tod) throws Exception {
        int days = 0;
        int hrs = 0;
        int mins = 0;
        int secs = 0;

        String[] tSegs = tod.split(":");
        if (tSegs.length == 3) {
            try {
                hrs = Integer.parseInt(tSegs[0]);
                mins = Integer.parseInt(tSegs[1]);
                secs = Integer.parseInt(tSegs[2]);
            } catch (NumberFormatException e) {
                throw new Exception("TOD not numeric");
            }

        } else if (tSegs.length == 4) {
            try {
                days = Integer.parseInt(tSegs[0]);
                hrs = Integer.parseInt(tSegs[1]);
                mins = Integer.parseInt(tSegs[2]);
                secs = Integer.parseInt(tSegs[3]);
            } catch (NumberFormatException e) {
                throw new Exception("TOD not numeric");
            }
        } else {
            throw new Exception("Invalid TOD");
        }
        if (days > 0) {
            return false;
        }
        if (hrs > 0) {
            return false;
        }
        if (mins > 0) {
            return false;
        }
        if (secs > 0) {
            return false;
        }
        return true;
    }

    private static long getHours(double val, long days) {
        double dWk = 0d;
        if (days > 0) {
            dWk = val % (days * 86400);
        } else {
            dWk = val;
        }
        if (dWk >= 3600) {
            return (long) (dWk / 3600);
        }
        return 0;
    }

    private static long getMins(double val, long days, long hours) {
        double dWk = 0d;
        if (days > 0) {
            dWk = val % (days * 86400);
        } else {
            dWk = val;
        }
        if (hours > 0) {
            dWk = (dWk % (hours * 3600));
        }
        if (dWk >= 60) {
            return (long) (dWk / 60);
        }
        return 0;
    }

    private static long getSecs(double val, long days, long hours, long mins) {
        double dWk = 0d;
        if (days > 0) {
            dWk = val % (days * 86400);
        } else {
            dWk = val;
        }
        if (hours > 0) {
            dWk = (dWk % (hours * 3600));
        }
        if (mins >= 0) {
            dWk = (dWk % (mins * 60));
        }
        if (dWk > 0) {
            return (long) dWk;
        }
        return 0;
    }

    public static double parseDurationString(String str) throws Exception {
        String[] p1 = str.split(":");
        double d = 0;
        for (int i = 1; i < p1.length; i++) {
            String[] p2 = p1[i].split(" ");
            try {
                double m = 1;
                double td = Double.parseDouble(p2[0]);
                switch (i) {
                    case 1:
                        m = 86400;
                        break;
                    case 2:
                        m = 3600;
                        break;
                    case 3:
                        m = 60;
                        break;
                    default:
                        m = 1;
                }
                d += td * m;
            } catch (NumberFormatException e) {
                throw new Exception("Invalid format!");
            }
        }
        return d;
    }

    public static double daysToSeconds(long yrs) {
        return yrs * 86400;
    }

    public static double hrsToSeconds(long hrs) {
        return hrs * 3600;
    }

    public static double minsToSeconds(long mins) {
        return mins * 60;
    }
}
