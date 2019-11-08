package com.funo.report.charts;

import org.apache.commons.lang.StringUtils;

public class DataSetStr {

	private String name; //数据显示的名称
	
	private String value; //数据的值 
	
	private String color; //数据的显示颜色 
	
	private String hoverText; //鼠标上移浮现的文字
	
	private String link; //超链接地址
	
	private String alpha; //图像透明度
	
	private String showName;//是否显示该数据 值为 1：显示 ，0：隐藏
	
	private final String header = "<set ";
	
	private final String footer = " />";
	
	/**
	 * <p><b>功能：</b>默认的数据的构造函数<br/>
	 * 		<I>注意：</I>必须提供<code>name</code>和<code>value</code> 
	 * 作为默认最少的参数构造子
	 * </p>
	 * @param name 
	 * @param value
	 */
	public DataSetStr(String name ,String value){
		this.name  = name;
		this.value = value;
	}

	public DataSetStr(String value){
		this.value = value;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getHoverText() {
		return hoverText;
	}

	public void setHoverText(String hoverText) {
		this.hoverText = hoverText;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getAlpha() {
		return alpha;
	}

	public void setAlpha(String alpha) {
		this.alpha = alpha;
	}

	public String getShowName() {
		return showName;
	}

	public void setShowName(String showName) {
		this.showName = showName;
	}

	public String getHeader() {
		return header;
	}

	public String getFooter() {
		return footer;
	}
	
	private String creatdot(String tempStr){
		return " '"+tempStr+"' ";
	}
	
	/***
	 * <p>
	 * 	 <b>功能：</b>组装数据项
	 * 	<br/> <i>注意：</i>属性<code>name</code>和<code>value</code>不能默认为空
	 *   若<code>value</code>没有值应该使用0代替
	 * </p>
	 * @return:返回数据项字符串
	 */
	public String getDataSetStr(){
		StringBuffer tbuf = new StringBuffer();
		if (StringUtils.isNotBlank(name)){
			tbuf.append("name=");
			tbuf.append(this.creatdot(name));
		}
		if (StringUtils.isNotBlank(value)){
			tbuf.append("value=");
			tbuf.append(this.creatdot(value));
		}
	    
		if(StringUtils.isNotBlank(this.color)){
			tbuf.append("color=");
			tbuf.append(this.creatdot(color));
		}
		if(StringUtils.isNotBlank(this.hoverText)){
			tbuf.append("hoverText=");
			tbuf.append(this.creatdot(hoverText));
		}
		if(StringUtils.isNotBlank(this.link)){
			tbuf.append("link=");
			tbuf.append(this.creatdot(link));
		}
		if(StringUtils.isNotBlank(this.alpha)){
			tbuf.append("alpha=");
			tbuf.append(this.creatdot(alpha));
		}
		if(StringUtils.isNotBlank(this.showName)){
			tbuf.append("showName=");
			tbuf.append(this.creatdot(showName));
		}
		
		return tbuf.toString();
	}
}
