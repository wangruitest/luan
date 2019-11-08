package com.funo.report.paging;

/**
 * <p>Title: funo_webframe</p>
 *
 * <p>Description: 福诺WEB框架</p>
 *
 * <p>Copyright: Copyright (c) 2010</p>
 *
 * <p>Company: FUNO</p>
 *
 * @author luojz
 * @version 1.0
 */
public class PagingMgt {
    public static final String IS_PAGING = "is_paging";
    public static final String PAGE_COUNT = "page_count";
    public static final String CURRENT_PAGE = "current_page";
    public static final String PAGING_CLASS_NAME = "paging_class_name";

    /**
     * 实例化查询对象
     * @param class_name String
     * @return Paging
     */
    public static Paging newInstance(String class_name){
        if(class_name==null)return null;

        try {
            Class classPaging = Class.forName(class_name);
            return (Paging)classPaging.newInstance();
        } catch (Exception ex) {
            return null;
        }
    }

    /**
     * 生成空的表格XML串
     * @return String
     */
    public static String genBlankXml(){
        StringBuffer sbOutput = new StringBuffer();
        sbOutput.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n");
        sbOutput.append("  <rows total_record=\"0\">\r\n");
        sbOutput.append("  </rows>\r\n");
        return sbOutput.toString();
    }
}