package com.hhgy.model;

/** POJO for the 'emergency_contacts' table. */
public class EmergencyContact {
    private int    contactId;
    private int    seniorId;
    private String contactName;
    private String relationship;
    private String phone;

    public int    getContactId()              { return contactId; }
    public void   setContactId(int id)        { this.contactId = id; }
    public int    getSeniorId()               { return seniorId; }
    public void   setSeniorId(int id)         { this.seniorId = id; }
    public String getContactName()            { return contactName; }
    public void   setContactName(String n)    { this.contactName = n; }
    public String getRelationship()           { return relationship; }
    public void   setRelationship(String r)   { this.relationship = r; }
    public String getPhone()                  { return phone; }
    public void   setPhone(String p)          { this.phone = p; }
}
