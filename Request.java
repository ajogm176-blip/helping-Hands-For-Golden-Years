package com.hhgy.model;

import java.sql.Date;

/** POJO representing a row of the 'requests' table. */
public class Request {
    private int    requestId;
    private int    seniorId;
    private int    volunteerId;     // 0 if not yet accepted
    private String category;
    private String description;
    private String address;
    private Date   requestDate;
    private String emergencyLevel;  // LOW / MEDIUM / HIGH
    private String status;          // PENDING / ACCEPTED / COMPLETED

    // Names for display (joined from users)
    private String seniorName;
    private String volunteerName;

    public int    getRequestId()                { return requestId; }
    public void   setRequestId(int id)          { this.requestId = id; }
    public int    getSeniorId()                 { return seniorId; }
    public void   setSeniorId(int id)           { this.seniorId = id; }
    public int    getVolunteerId()              { return volunteerId; }
    public void   setVolunteerId(int id)        { this.volunteerId = id; }
    public String getCategory()                 { return category; }
    public void   setCategory(String c)         { this.category = c; }
    public String getDescription()              { return description; }
    public void   setDescription(String d)      { this.description = d; }
    public String getAddress()                  { return address; }
    public void   setAddress(String a)          { this.address = a; }
    public Date   getRequestDate()              { return requestDate; }
    public void   setRequestDate(Date d)        { this.requestDate = d; }
    public String getEmergencyLevel()           { return emergencyLevel; }
    public void   setEmergencyLevel(String e)   { this.emergencyLevel = e; }
    public String getStatus()                   { return status; }
    public void   setStatus(String s)           { this.status = s; }
    public String getSeniorName()               { return seniorName; }
    public void   setSeniorName(String n)       { this.seniorName = n; }
    public String getVolunteerName()            { return volunteerName; }
    public void   setVolunteerName(String n)    { this.volunteerName = n; }
}
