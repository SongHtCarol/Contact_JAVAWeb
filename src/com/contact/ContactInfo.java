package com.contact;

public class ContactInfo {
	private Integer ContactId;
    private String CreateDate;
    private String EffectiveDate;
    private Integer LotId;
    private Integer CustomerId;
    private String UserId;
    private String Star;
    

    public ContactInfo() {
    }
    //
    public Integer getContactId() {
        return ContactId;
    }
    public void setContactId(Integer ContactId) {
        this.ContactId = ContactId;
    }
    //
    public String getCreateDate() {
        return CreateDate;
    }
    public void setCreateDate(String CreateDate) {
        this.CreateDate = CreateDate;
    }
    //
    public String getEffectiveDate() {
        return EffectiveDate;
    }
    public void setEffectiveDate(String EffectiveDate) {
        this.EffectiveDate = EffectiveDate;
    }
    //
    public Integer getLotId() {
        return LotId;
    }
    public void setLotId(Integer LotId) {
        this.LotId = LotId;
    }
    //
    public Integer getCustomerId() {
        return CustomerId;
    }
    public void setCustomerId(Integer CustomerId) {
        this.CustomerId = CustomerId;
    }
    //
    public String getUserId() {
        return UserId;
    }
    public void setUserId(String UserId) {
        this.UserId = UserId;
    }
    public String getStar() {
        return Star;
    }
    public void setStar(String Star) {
        this.Star = Star;
    }
}
