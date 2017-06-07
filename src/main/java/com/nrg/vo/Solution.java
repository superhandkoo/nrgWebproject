package com.nrg.vo;

import java.util.Date;

public class Solution {
    private Integer solutionId;

    private String solutionType;

    private String solutionName;

    private String solutionIntroduction;

    private String solutionImage;

    private String solutionAddress;

    private Date addtime;

    private Integer sort;

    private String solutionHtml;

    public Integer getSolutionId() {
        return solutionId;
    }

    public void setSolutionId(Integer solutionId) {
        this.solutionId = solutionId;
    }

    public String getSolutionType() {
        return solutionType;
    }

    public void setSolutionType(String solutionType) {
        this.solutionType = solutionType == null ? null : solutionType.trim();
    }

    public String getSolutionName() {
        return solutionName;
    }

    public void setSolutionName(String solutionName) {
        this.solutionName = solutionName == null ? null : solutionName.trim();
    }

    public String getSolutionIntroduction() {
        return solutionIntroduction;
    }

    public void setSolutionIntroduction(String solutionIntroduction) {
        this.solutionIntroduction = solutionIntroduction == null ? null : solutionIntroduction.trim();
    }

    public String getSolutionImage() {
        return solutionImage;
    }

    public void setSolutionImage(String solutionImage) {
        this.solutionImage = solutionImage == null ? null : solutionImage.trim();
    }

    public String getSolutionAddress() {
        return solutionAddress;
    }

    public void setSolutionAddress(String solutionAddress) {
        this.solutionAddress = solutionAddress == null ? null : solutionAddress.trim();
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

    public String getSolutionHtml() {
        return solutionHtml;
    }

    public void setSolutionHtml(String solutionHtml) {
        this.solutionHtml = solutionHtml == null ? null : solutionHtml.trim();
    }
}