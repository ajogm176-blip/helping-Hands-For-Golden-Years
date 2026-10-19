package com.hhgy.model;

/** POJO representing a row of the 'users' table. */
public class User {
    private int userId;
    private String name;
    private int age;
    private String gender;
    private String phone;
    private String email;
    private String address;
    private String password;
    private String role;        // SENIOR / VOLUNTEER / ADMIN

    // Volunteer-only fields (joined from volunteers table when needed)
    private String idProofNumber;
    private String verificationStatus;

    public User() {}

    public int    getUserId()              { return userId; }
    public void   setUserId(int userId)    { this.userId = userId; }
    public String getName()                { return name; }
    public void   setName(String name)     { this.name = name; }
    public int    getAge()                 { return age; }
    public void   setAge(int age)          { this.age = age; }
    public String getGender()              { return gender; }
    public void   setGender(String gender) { this.gender = gender; }
    public String getPhone()               { return phone; }
    public void   setPhone(String phone)   { this.phone = phone; }
    public String getEmail()               { return email; }
    public void   setEmail(String email)   { this.email = email; }
    public String getAddress()             { return address; }
    public void   setAddress(String a)     { this.address = a; }
    public String getPassword()            { return password; }
    public void   setPassword(String p)    { this.password = p; }
    public String getRole()                { return role; }
    public void   setRole(String role)     { this.role = role; }
    public String getIdProofNumber()       { return idProofNumber; }
    public void   setIdProofNumber(String s){ this.idProofNumber = s; }
    public String getVerificationStatus()  { return verificationStatus; }
    public void   setVerificationStatus(String s){ this.verificationStatus = s; }
}
