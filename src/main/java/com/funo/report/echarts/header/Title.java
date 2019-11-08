package com.funo.report.echarts.header;

/**
 * Created by chenfeiquan on 15/10/18.
 */
public class Title {
    private String text; //标题
    private String subtext; //子标题
    private String x; //设置标题位置
    private Integer padding;

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getSubtext() {
        return subtext;
    }

    public void setSubtext(String subtext) {
        this.subtext = subtext;
    }

    public String getX() {
        return x;
    }

    public void setX(String x) {
        this.x = x;
    }

    public Integer getPadding() {
        return padding;
    }

    public void setPadding(Integer padding) {
        this.padding = padding;
    }
}
