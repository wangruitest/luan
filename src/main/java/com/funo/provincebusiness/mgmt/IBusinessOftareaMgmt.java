package com.funo.provincebusiness.mgmt;

import java.util.List;

import com.funo.provincebusiness.model.BusinessOftarea;


public interface IBusinessOftareaMgmt {

	public String getKey();

	public BusinessOftarea createBusinessOftarea(BusinessOftarea businessOftarea);

	public BusinessOftarea modifyBusinessOftarea(BusinessOftarea businessOftarea);

	public void deleteBusinessOftarea(BusinessOftarea businessOftarea);

	public void batchDeleteBusinessOftarea(List<BusinessOftarea> businessOftareaList);

	public BusinessOftarea getBusinessOftareaById(String unid);

	public List<BusinessOftarea> queryBusinessOftarea(BusinessOftarea businessOftarea);

}