package com.funo.report.echarts.header;

import java.util.List;

/**
 * Created by chenfeiquan on 15/10/18.
 */
public class XAxis {
    private String type;
    private List data;
    private String name;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public List getData() {
        return data;
    }

    public void setData(List data) {
        this.data = data;
    }

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
