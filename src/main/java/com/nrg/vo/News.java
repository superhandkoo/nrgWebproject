package com.nrg.vo;

import java.util.Date;

public class News {
    private Integer newsId;

    private String newsType;

    private String newsName;

    private String newsIntroduction;

    private String newsImage;

    private String newsAddress;

    private Date addtime;

    private Integer sort;

    private String newsHtml;

    public Integer getNewsId() {
        return newsId;
    }

    public void setNewsId(Integer newsId) {
        this.newsId = newsId;
    }

    public String getNewsType() {
        return newsType;
    }

    public void setNewsType(String newsType) {
        this.newsType = newsType == null ? null : newsType.trim();
    }

    public String getNewsName() {
        return newsName;
    }

    public void setNewsName(String newsName) {
        this.newsName = newsName == null ? null : newsName.trim();
    }

    public String getNewsIntroduction() {
        return newsIntroduction;
    }

    public void setNewsIntroduction(String newsIntroduction) {
        this.newsIntroduction = newsIntroduction == null ? null : newsIntroduction.trim();
    }

    public String getNewsImage() {
        return newsImage;
    }

    public void setNewsImage(String newsImage) {
        this.newsImage = newsImage == null ? null : newsImage.trim();
    }

    public String getNewsAddress() {
        return newsAddress;
    }

    public void setNewsAddress(String newsAddress) {
        this.newsAddress = newsAddress == null ? null : newsAddress.trim();
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

    public String getNewsHtml() {
        return newsHtml;
    }

    public void setNewsHtml(String newsHtml) {
        this.newsHtml = newsHtml == null ? null : newsHtml.trim();
    }
}