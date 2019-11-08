package com.funo.report.echarts;

import com.funo.report.echarts.header.*;

import java.util.List;

/**
 * Created by chenfeiquan on 15/10/18.
 */
public class EChart {
    private Title title;
    private Tooltip tooltip;
    private Legend legend;
    private boolean calculable;
    private List series;
    private List xAxis;
    private List yAxis;

    public Legend getLegend() {
        return legend;
    }

    public void setLegend(Legend legend) {
        this.legend = legend;
    }

    public Tooltip getTooltip() {
        return tooltip;
    }

    public void setTooltip(Tooltip tooltip) {
        this.tooltip = tooltip;
    }

    public Title getTitle() {
        return title;
    }

    public void setTitle(Title title) {
        this.title = title;
    }

    public boolean isCalculable() {
        return calculable;
    }

    public void setCalculable(boolean calculable) {
        this.calculable = calculable;
    }

    public List getxAxis() {
        return xAxis;
    }

    public void setxAxis(List xAxis) {
        this.xAxis = xAxis;
    }

    public List getyAxis() {
        return yAxis;
    }

    public void setyAxis(List yAxis) {
        this.yAxis = yAxis;
    }

    public List getSeries() {
        return series;
    }

    public void setSeries(List series) {
        this.series = series;
    }
}
