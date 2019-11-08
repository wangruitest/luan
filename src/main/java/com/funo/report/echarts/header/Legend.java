package com.funo.report.echarts.header;

import java.util.List;

/**
 * Created by chenfeiquan on 15/10/18.
 */
public class Legend {
    private List data;
    private String orient;
    private String x;
    private String y;
    public List getData() {
        return data;
    }

    public void setData(List data) {
        this.data = data;
    }

    public String getOrient() {
        return orient;
    }

    public void setOrient(String orient) {
        this.orient = orient;
    }

    public String getX() {
        return x;
    }

    public void setX(String x) {
        this.x = x;
    }

    public String getY() {
        return y;
    }

    public void setY(String y) {
        this.y = y;
    }
}
