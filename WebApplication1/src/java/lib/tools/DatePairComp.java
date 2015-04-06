/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lib.tools;

import java.util.Date;

/**
 *
 * @author shwells
 */
public class DatePairComp {

    private DatePair setOne;
    private DatePair setTwo;

    public DatePairComp(DatePair setOne, DatePair setTwo) {
        this.setOne = setOne;
        this.setTwo = setTwo;
    }

    public DatePair getSetOne() {
        return setOne;
    }

    public void setSetOne(DatePair setOne) {
        this.setOne = setOne;
    }

    public DatePair getSetTwo() {
        return setTwo;
    }

    public void setSetTwo(DatePair setTwo) {
        this.setTwo = setTwo;
    }

    public Date getSetOneStart() {
        return setOne.getStartDate();
    }

    public Date getSetTwoStart() {
        return setTwo.getStartDate();
    }

    public void setSetOneStart(Date start) {
        setOne.setStartDate(start);
    }

    public void setSetTwoStart(Date start) {
        setTwo.setStartDate(start);
    }

    public Date getSetOneEnd() {
        return setOne.getEndDate();
    }

    public Date getSetTwoEnd() {
        return setTwo.getEndDate();
    }

    public void setSetOneEnd(Date end) {
        setOne.setEndDate(end);
    }

    public void setSetTwoEnd(Date end) {
        setTwo.setEndDate(end);
    }

}
