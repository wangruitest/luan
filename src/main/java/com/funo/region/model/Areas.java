package com.funo.region.model;

public class Areas {
    private String id;

    private String areaid;

    private String areas;

    private String cityid;

    private String cities;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getAreaid() {
        return areaid;
    }

    public void setAreaid(String areaid) {
        this.areaid = areaid == null ? null : areaid.trim();
    }

    public String getAreas() {
        return areas;
    }

    public void setAreas(String areas) {
        this.areas = areas == null ? null : areas.trim();
    }

    public String getCityid() {
        return cityid;
    }

    public void setCityid(String cityid) {
        this.cityid = cityid == null ? null : cityid.trim();
    }

    public String getCities() {
        return cities;
    }

    public void setCities(String cities) {
        this.cities = cities == null ? null : cities.trim();
    }
}