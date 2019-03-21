package com.customer;

public class CustomerInfo {
	private Integer CustomerId;
    private String CustomerName;
    private String CustomerCode;
    private String CustomerPhone;
    private String CustomerRank;
    private String CustomerVIP;
    private String UserId;

    public CustomerInfo() {
    }
    //
    public Integer getCustomerId() {
        return CustomerId;
    }
    public void setCustomerId(Integer CustomerId) {
        this.CustomerId = CustomerId;
    }
    //
    //
    public String getCustomerCode() {
        return CustomerCode;
    }
    public void setCustomerCode(String CustomerCode) {
        this.CustomerCode = CustomerCode;
    }
    //
    public String getCustomerName() {
        return CustomerName;
    }
    public void setCustomerName(String CustomerName) {
        this.CustomerName = CustomerName;
    }
    //
    public String getCustomerPhone() {
        return CustomerPhone;
    }
    public void setCustomerPhone(String CustomerPhone) {
        this.CustomerPhone = CustomerPhone;
    }
    //
    public String getCustomerRank() {
        return CustomerRank;
    }
    public void setCustomerRank(String CustomerRank) {
        this.CustomerRank = CustomerRank;
    }
    //
    public String getCustomerVIP() {
        return CustomerVIP;
    }
    public void setCustomerVIP(String CustomerVIP) {
        this.CustomerVIP = CustomerVIP;
    }
    //
    public String getUserId() {
        return UserId;
    }
    public void setUserId(String UserId) {
        this.UserId = UserId;
    }
}
