/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package xact;

import java.util.Date;
import javax.annotation.PostConstruct;
import javax.enterprise.context.ApplicationScoped;
import javax.inject.Named;

/**
 *
 * @author ahmed
 */
@Named
@ApplicationScoped
public class ReleaseManager {
    private Date releaseDate;
    @PostConstruct
    public void init(){
        releaseDate=new Date();
    }
    public String getFormattedDate(){
        return releaseDate.toString();
    }
}
