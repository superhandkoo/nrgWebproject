package com.nrg.vo;

import java.util.Date;

public class Aboutus {
    private Integer aboutusId;

    private String aboutusType;

    private String aboutusName;

    private String aboutusIntroduction;

    private String aboutusAddress;

    private Date addtime;

    private Integer sort;

    private String aboutusHtml;

    public Integer getAboutusId() {
        return aboutusId;
    }

    public void setAboutusId(Integer aboutusId) {
        this.aboutusId = aboutusId;
    }

    public String getAboutusType() {
        return aboutusType;
    }

    public void setAboutusType(String aboutusType) {
        this.aboutusType = aboutusType == null ? null : aboutusType.trim();
    }

    public String getAboutusName() {
        return aboutusName;
    }

    public void setAboutusName(String aboutusName) {
        this.aboutusName = aboutusName == null ? null : aboutusName.trim();
    }

    public String getAboutusIntroduction() {
        return aboutusIntroduction;
    }

    public void setAboutusIntroduction(String aboutusIntroduction) {
        this.aboutusIntroduction = aboutusIntroduction == null ? null : aboutusIntroduction.trim();
    }

    public String getAboutusAddress() {
        return aboutusAddress;
    }

    public void setAboutusAddress(String aboutusAddress) {
        this.aboutusAddress = aboutusAddress == null ? null : aboutusAddress.trim();
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public String getAboutusHtml() {
        return aboutusHtml;
    }

    public void setAboutusHtml(String aboutusHtml) {
        this.aboutusHtml = aboutusHtml == null ? null : aboutusHtml.trim();
    }
}