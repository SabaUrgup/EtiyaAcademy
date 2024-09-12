package org.example;

public class CorporateCustomer extends Customer{
    private String companyName; // The corporate customer's company name
    private String taxNumber;   // The corporate customer's tax number

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getTaxNumber() {
        return taxNumber;
    }

    public void setTaxNumber(String taxNumber) {
        this.taxNumber = taxNumber;
    }
}