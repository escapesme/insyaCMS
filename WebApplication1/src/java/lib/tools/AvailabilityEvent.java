/*
 * To change this template, choose Tools | Templates and open the template in
 * the editor.
 */
package lib.tools;

import java.util.Date;

/**
 *
 * @author A7med
 */
public class AvailabilityEvent {

    private Date creationDate;
    private String modelId;
    private String nodeId;
    private Date eventDate;
    private int eventType;
    private String eventDescription;
    private String owner;
    private String clientId;
    private String groupId;
    public static final int HARDWARE_EVENT = 0;
    public static final int NETWORK_EVENT = 1;
    public static final int SOFTWARE_EVENT = 2;
    public static final int ENVIRONMENT_EVENT = 3;
    public static final int RESTORED_EVENT = 4;
    public static final int ENTERED_SERVICE_EVENT = 5;
    
    public static String[] EVENT_TYPE = {"Hardware", "Network", "Software", "Environment", "Restored", "Entered Service"};

    public AvailabilityEvent() {
    }

    public AvailabilityEvent(Date creationDate, String modelId, String nodeId, Date eventDate, int eventType, String eventDescription, String owner, String clientId, String groupId) {
        this.creationDate = creationDate;
        this.modelId = modelId;
        this.nodeId = nodeId;
        this.eventDate = eventDate;
        this.eventType = eventType;
        this.eventDescription = eventDescription;
        this.owner = owner;
        this.clientId = clientId;
        this.groupId = groupId;
    }

    
    public String getClientId() {
        return clientId;
    }

    public void setClientId(String clientId) {
        this.clientId = clientId;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public Date getEventDate() {
        return eventDate;
    }

    public void setEventDate(Date eventDate) {
        this.eventDate = eventDate;
    }

    public String getEventDescription() {
        return eventDescription;
    }

    public void setEventDescription(String eventDescription) {
        this.eventDescription = eventDescription;
    }

    public int getEventType() {
        return eventType;
    }

    public void setEventType(int eventType) {
        this.eventType = eventType;
    }

    public String getGroupId() {
        return groupId;
    }

    public void setGroupId(String groupId) {
        this.groupId = groupId;
    }

    public String getModelId() {
        return modelId;
    }

    public void setModelId(String modelId) {
        this.modelId = modelId;
    }

    public String getNodeId() {
        return nodeId;
    }

    public void setNodeId(String nodeId) {
        this.nodeId = nodeId;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }
    
}
