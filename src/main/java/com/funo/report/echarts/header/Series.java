package com.funo.report.echarts.header;

import java.util.List;

/**
 * Created by chenfeiquan on 15/10/18.
 */
public class Series {
    private String name;
    private String type;
    private String radius;
    private List center;
    private List data;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getRadius() {
        return radius;
    }

    public void setRadius(String radius) {
        this.radius = radius;
    }

    public List getCenter() {
        return center;
    }

    public void setCenter(List center) {
        this.center = center;
    }

    public List getData() {
        return data;
    }

    public void setData(List data) {
        this.data = data;
    }
}
