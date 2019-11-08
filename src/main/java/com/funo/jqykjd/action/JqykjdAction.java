package com.funo.jqykjd.action;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Calendar;
import java.util.List;
import java.util.Map;





import com.funo.common.CommonAction;
import com.funo.common.ActionResult;
import com.funo.jqykjd.mgmt.IJqykjdMgmt;
import com.funo.jqykjd.model.Jqykjd;
import com.funo.jqykjd.model.Srykzs;
import com.funo.jqykjd.model.Ydtj;
import com.funo.jqykjd.model.YdtjBt;
import com.funo.jqykjd.model.Ysjfx;
import com.funo.provincereceivetourist.model.ProvinceReceiveTourist;
import com.funo.report.StringUtil;
import com.funo.system.model.SysOperator;
import com.funo.utils.DateUtils;
import com.funo.utils.StringUtils;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class JqykjdAction extends CommonAction {
	private IJqykjdMgmt jqykjdMgmt;

	public IJqykjdMgmt getJqykjdMgmt() {
		return jqykjdMgmt;
	}

	public void setJqykjdMgmt(IJqykjdMgmt jqykjdMgmt) {
		this.jqykjdMgmt = jqykjdMgmt;
	}

	/**
	 * 获取所有?????
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getAllJqykjd() {
		ActionResult ar = new ActionResult();
		List result = null;
		try {
			result = jqykjdMgmt.queryJqykjd(new Jqykjd());
			ar.setReturnList(result);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}

	/**
	 * 根据条件获取?????列表
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ActionResult getJqykjdList(Jqykjd jqykjd) {
		ActionResult ar = new ActionResult();
		List result = null;
		if (jqykjd.getType() != null && jqykjd.getType().equals("1")) {// 分页动态刷新
			int page = jqykjd.getPage();
			int total = jqykjdMgmt.queryByCount().size();
			if (page * 4 > total) {
				jqykjd.setPage(1);
				page = 1;
			}
			if (page == 1) {
				jqykjd.setPageSize(page * 4);
				jqykjd.setPage((page - 1) * 4);

			} else {
				jqykjd.setPageSize(page * 4);
				jqykjd.setPage((page - 1) * 4 + 1);
			}

			try {
				result = jqykjdMgmt.queryJqykjd(jqykjd);
				jqykjd.setPage(page + 1);
				ar.setReturnObject(jqykjd);
				ar.setReturnList(result);
				ar.setResultCode(0);
			} catch (Exception e) {
				e.printStackTrace();
				ar.setResultCode(-1);
				ar.setResultMessage(e.getMessage());
			}
		} else {
			try {
				jqykjd.setPage(0);
				jqykjd.setPageSize(4);
				result = jqykjdMgmt.queryJqykjd(jqykjd);
				// jqykjdMgmt.q
				ar.setReturnList(result);
				ar.setResultCode(0);
			} catch (Exception e) {
				e.printStackTrace();
				ar.setResultCode(-1);
				ar.setResultMessage(e.getMessage());
			}

		}
		return ar;
	}

	/**
	 * <p>
	 * <b>describe:月度统计环比-同比</b><br>
	 * <br>
	 * <b><i>notice:</i></b>
	 * <ol>
	 * <li></li>
	 * </ol>
	 * </p>
	 * 
	 * @param ysjfx
	 * @return
	 * @author Chen-JY
	 */

	public ActionResult getYdjdtj(Ysjfx ysjfx) {
		ActionResult ar = new ActionResult();
		List result = null;
		Ysjfx y1 = null;
		DecimalFormat    df   = new DecimalFormat("######0.0");
		try {
			result = jqykjdMgmt.queryByjdtj(ysjfx);
			if (result.size() > 0 && result.size() == 2) {
				y1 = (Ysjfx) result.get(0);
				double wszb = Double.parseDouble(y1.getWsyksSum()) / Double.parseDouble(y1.getYkzsSum()) * 100;
				// int w = Double.parseDouble(y1.getWsyksSum());
				// int s= Integer.parseInt(y1.getYkzsSum());
				// double wszb = w/s;
				y1.setWszb(df.format(wszb) + "%");
				double jwzb = Double.parseDouble(y1.getJwyksSum()) / Double.parseDouble(y1.getYkzsSum()) * 100;
			
				double bszb =Double.parseDouble(y1.getSnmyrsSum())/Double.parseDouble(y1.getYkzsSum())*100;
				y1.setJwzb(df.format(jwzb) + "%");
				y1.setBszb(df.format(jwzb) + "%");

				Ysjfx y2 = (Ysjfx) result.get(1);
				int tb1, tb2, tb3;
				tb1 = Integer.parseInt(y1.getWsyksSum()) - Integer.parseInt(y2.getWsyksSum());
				tb2 = Integer.parseInt(y1.getJwyksSum()) - Integer.parseInt(y2.getJwyksSum());
				tb3 = Integer.parseInt(y1.getSnmyrsSum()) - Integer.parseInt(y2.getSnmyrsSum());
				if (tb1 > 0) {// 上涨
					y1.setWsImg("up");
				} else {
					y1.setWsImg("down");
				}
				if (tb2 > 0) {// 上涨
					y1.setJwImg("up");
				} else {
					y1.setJwImg("down");
				}
				if (tb3 > 0) {// 上涨
					y1.setBsImg("up");
				} else {
					y1.setBsImg("down");
				}
				double a = (Math.abs(tb1)), b = (Math.abs(tb2)), c = (Math.abs(tb3));
				double wstb = a / Double.parseDouble(y2.getWsyksSum()) * 100;
				double jwtb = b / Double.parseDouble(y2.getJwyksSum()) * 100;
				double bstb = c / Double.parseDouble(y2.getJwyksSum()) * 100;
				y1.setWstb(df.format(wstb) + "%");
				y1.setJwtb(df.format(jwtb) + "%");
				y1.setBstb(df.format(bstb) + "%");
				y1.setStatus("0");
			} else if (result.size() == 1) {
				y1 = (Ysjfx) result.get(0);
				double wszb = Double.parseDouble(y1.getWsyksSum()) / Double.parseDouble(y1.getYkzsSum()) * 100;
				BigDecimal   b   =   new   BigDecimal(wszb);  
				double   f1   =   b.setScale(1,   BigDecimal.ROUND_HALF_UP).doubleValue();  
				y1.setWszb(f1+""+ "%");
				//y1.setWszb(df.format(wszb)+ "%");
				double jwzb = Double.parseDouble(y1.getJwyksSum()) / Double.parseDouble(y1.getYkzsSum()) * 100;
				double bszb = Double.parseDouble(y1.getSnmyrsSum()) / Double.parseDouble(y1.getYkzsSum()) * 100;
				BigDecimal   b2   =   new   BigDecimal(jwzb);  
				double   f2   =   b2.setScale(1,   BigDecimal.ROUND_HALF_UP).doubleValue();
				BigDecimal   b3   =   new   BigDecimal(bszb);  
				double   f3   =   b3.setScale(1,   BigDecimal.ROUND_HALF_UP).doubleValue();
				y1.setJwzb(f2+"" + "%");
				y1.setBszb(f3+"" + "%");
//				y1.setJwzb(df.format(jwzb) + "%");
//				y1.setBszb( df.format(bszb) + "%");
				y1.setStatus("1");
			} else {
				y1.setStatus("2");
			}

			// ar.setReturnList(result);
			ar.setReturnObject(y1);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}

	/**
	 * <p>
	 * <b>describe:年度统计环比-同比</b><br>
	 * <br>
	 * <b><i>notice:</i></b>
	 * <ol>
	 * <li></li>
	 * </ol>
	 * </p>
	 * 
	 * @param ysjfx
	 * @return
	 * @author Chen-JY
	 */

	public ActionResult getNdjdtj(Ysjfx ysjfx) {
		ActionResult ar = new ActionResult();
		Ysjfx y1 = null;
		List<Ysjfx> result = new ArrayList<Ysjfx>();
		BigDecimal wsrs = null;
		BigDecimal jwrs = null;
		BigDecimal zrs = null;
		BigDecimal snrs = null;
		try {
			for (int yearIndex = 0; yearIndex > -2; yearIndex--) {
				Ysjfx ysjfxResultBuf = new Ysjfx();
				Calendar cal = Calendar.getInstance();
				cal.add(Calendar.YEAR, yearIndex);
				ysjfx.setUpdateTime(String.valueOf(cal.get(Calendar.YEAR)));
				List<Ysjfx> listResult = jqykjdMgmt.queryByndtj(ysjfx);
				int ykzs = 0;
				for (Ysjfx ysjfxResult : listResult) {
					if ("swyk".equals(ysjfxResult.getSumType())) {
						// 外省游客
						ysjfxResultBuf.setWsyksSum(ysjfxResult.getYkrs());
					} else if ("snyk".equals(ysjfxResult.getSumType())) {
						// 省内游客
						ysjfxResultBuf.setSnmyrsSum(ysjfxResult.getYkrs());
					} else if ("jwyk".equals(ysjfxResult.getSumType())) {
						// 境外人数
						ysjfxResultBuf.setJwyksSum(ysjfxResult.getYkrs());
					}
					ykzs += Integer.parseInt(ysjfxResult.getYkrs());
					ysjfxResultBuf.setYkzsSum(String.valueOf(ykzs));
				}
				result.add(ysjfxResultBuf);
			}
			if (result.size() > 0 && result.size() == 2) {
				y1 = (Ysjfx) result.get(0);
				wsrs = new BigDecimal(y1.getWsyksSum());
				jwrs = new BigDecimal(y1.getJwyksSum());
				zrs = new BigDecimal(y1.getYkzsSum());
				snrs = new BigDecimal(y1.getSnmyrsSum());
				BigDecimal wszb = new BigDecimal(0);
				BigDecimal jwzb = new BigDecimal(0);
				BigDecimal snzb = new BigDecimal(0);
				if (zrs.compareTo(BigDecimal.ZERO) != 0) {
					wszb = wsrs.multiply(new BigDecimal(100)).divide(zrs, 1, BigDecimal.ROUND_HALF_UP);
					snzb = snrs.multiply(new BigDecimal(100)).divide(zrs, 1, BigDecimal.ROUND_HALF_UP);
					jwzb = jwrs.multiply(new BigDecimal(100)).divide(zrs, 1, BigDecimal.ROUND_HALF_UP);
				}
				y1.setWszb(wszb.toString() + "%");
				y1.setJwzb(jwzb.toString() + "%");
				y1.setBszb(snzb.toString() + "%");

				Ysjfx y2 = (Ysjfx) result.get(1);
				wsrs = new BigDecimal(y2.getWsyksSum());
				jwrs = new BigDecimal(y2.getJwyksSum());
				zrs = new BigDecimal(y2.getYkzsSum());
				int tb1 = Integer.parseInt(y1.getWsyksSum()) - Integer.parseInt(y2.getWsyksSum());
				int tb2 = Integer.parseInt(y1.getJwyksSum()) - Integer.parseInt(y2.getJwyksSum());
				int tb3 = Integer.parseInt(y1.getSnmyrsSum()) - Integer.parseInt(y2.getSnmyrsSum());
				if (tb1 > 0) {// 上涨
					y1.setWsImg("up");
				} else {
					y1.setWsImg("down");
				}
				if (tb2 > 0) {// 上涨
					y1.setJwImg("up");
				} else {
					y1.setJwImg("down");
				}
				if (tb3 > 0) {// 上涨
					y1.setBsImg("up");
				} else {
					y1.setBsImg("down");
				}
				BigDecimal wstb = new BigDecimal(100);
				BigDecimal jwtb = new BigDecimal(100);
				BigDecimal sntb = new BigDecimal(100);
				if (!"0".equals(y2.getWsyksSum())) {
					wstb = new BigDecimal(Math.abs(tb1))
							.divide(new BigDecimal(y2.getWsyksSum()), 2, BigDecimal.ROUND_HALF_UP)
							.multiply(new BigDecimal(100));

				}
				if (!"0".equals(y2.getJwyksSum())) {
					jwtb = new BigDecimal(Math.abs(tb2))
							.divide(new BigDecimal(y2.getJwyksSum()), 2, BigDecimal.ROUND_HALF_UP)
							.multiply(new BigDecimal(100));

				}
				if (!"0".equals(y2.getSnmyrsSum())) {
					sntb = new BigDecimal(Math.abs(tb3))
							.divide(new BigDecimal(y2.getSnmyrsSum()), 2, BigDecimal.ROUND_HALF_UP)
							.multiply(new BigDecimal(100));
				}
				y1.setWstb(wstb.toString() + "%");
				y1.setJwtb(jwtb.toString() + "%");
				y1.setBstb(sntb.toString() + "%");
				y1.setStatus("0");
			}
			// ar.setReturnList(result);
			ar.setReturnObject(y1);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}

	/**
	 * <p>
	 * <b>describe:月度统计--曲线图</b><br>
	 * <br>
	 * <b><i>notice:</i></b>
	 * <ol>
	 * <li></li>
	 * </ol>
	 * </p>
	 * 
	 * @param ydtj
	 * @return
	 * @author Chen-JY
	 */

	public ActionResult getYdtj(Ydtj ydtj) {

		ActionResult ar = new ActionResult();
		List result = null;
		try {
			List<Ydtj> yList = jqykjdMgmt.queryByydtj(ydtj);
			List<Ydtj> zList =  jqykjdMgmt.queryByydtjToTourist(ydtj);
			List<String> x = new ArrayList<String>();
			List<Double> y = new ArrayList<Double>();

			List<Double> z = new ArrayList<Double>();
			for(Ydtj y1 : yList){
				x.add(y1.getDays());
                double a = (double)y1.getSumyrs()/10000;
				java.text.DecimalFormat   df   =new   java.text.DecimalFormat("#.00"); 
				y.add(Double.parseDouble(df.format(a)));
			}
			for(Ydtj z1:zList){
				double b=(double)z1.getSumyrs()/10000;
                java.text.DecimalFormat   df   =new   java.text.DecimalFormat("#.00"); 
				
				z.add(Double.parseDouble(df.format(b)));
			}
			result = new ArrayList();
			result.add(x);
			result.add(y);
			result.add(z);
			ar.setReturnList(result);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}

	/**
	 * <p>
	 * <b>describe:年度统计--曲线图</b><br>
	 * <br>
	 * <b><i>notice:</i></b>
	 * <ol>
	 * <li></li>
	 * </ol>
	 * </p>
	 * 
	 * @param ydtj
	 * @return
	 * @author Chen-JY
	 */

	public ActionResult getNdtj(Ydtj ydtj) {

		ActionResult ar = new ActionResult();
		List result = null;
		try {
			//查询年度游客统计
			List<Ydtj> yYkList = jqykjdMgmt.queryByNdtjqx(ydtj);
			List<String> x = new ArrayList<String>();
			List<Double> y = new ArrayList<Double>();
			for (Ydtj y1 : yYkList) {
				x.add(y1.getDays() + "月");
				double z = (double) y1.getSumyrs() / 10000;
				java.text.DecimalFormat df = new java.text.DecimalFormat("#.00");
				y.add(Double.parseDouble(df.format(z)));

			}
			List<Ydtj> yLkList =jqykjdMgmt.queryByNdtjLkqx(ydtj);
			List<Double> y2 = new ArrayList<Double>();
			for(Ydtj lkY : yLkList){
				double z = (double) lkY.getSumyrs() / 10000;
				java.text.DecimalFormat df = new java.text.DecimalFormat("#.00");
				y2.add(Double.parseDouble(df.format(z)));

			}
			//查询年度旅客统计
			result = new ArrayList();
			result.add(x);
			result.add(y);
			result.add(y2);
			ar.setReturnList(result);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}

	/**
	 * <p>
	 * <b>describe:月度统计 饼图</b><br>
	 * <br>
	 * <b><i>notice:</i></b>
	 * <ol>
	 * <li></li>
	 * </ol>
	 * </p>
	 * 
	 * @param ydtjBt
	 * @return
	 * @author Chen-JY
	 */
	public String getYdtjBt(YdtjBt ydtjBt) {
		JSONObject jsonb = new JSONObject();
		JSONArray json = new JSONArray();
		long viewnum = 4;// 默认显示10个地区（包含其他）
		long viewflag = 1;// 默认显示其他
		Long totle = 0l;// 总条数
		Long other = 0l;// 其他的条数
		List<YdtjBt> list = null;
		try {
			list = jqykjdMgmt.queryByydtjBt(ydtjBt);
			if (list.size() > 0) {
				for (int i = 0; i < list.size(); i++) {
					if (list.get(i).getProvinceName().indexOf("安徽") != -1) {
						JSONObject jo = new JSONObject();
						jo.put("value", list.get(i).getYkzs());
						jo.put("name", list.get(i).getProvinceName());
						json.put(jo);
						if (i < viewnum) {
							viewnum = viewnum + 1;
						}
					} else if (list.get(i).getProvinceName().equals("其他")) {// 排除统计数据中的”其他“数据

					      other = other + list.get(i).getYkzs();
				      if(i<viewnum){
						viewnum = viewnum + 1;
					}

              }else{
					   if (i < (viewnum-2)) {

							JSONObject jo = new JSONObject();
							jo.put("value", list.get(i).getYkzs());
							jo.put("name", list.get(i).getProvinceName());
							json.put(jo);
						}
						// 获取其他的数据和
						if (i >= (viewnum - 2)) {
							other = other + list.get(i).getYkzs();
						}
					}
					// 获取所有的数据和
					totle = totle + list.get(i).getYkzs();
				}
				if (viewflag == 1) {
					JSONObject jo = new JSONObject();
					jo.put("value", other);
					jo.put("name", "其他");
					json.put(jo);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		jsonb.put("total", totle);
		jsonb.put("datavalue", json.toString());
		return jsonb.toString();
	}

	/**
	 * <p>
	 * <b>describe:游客来源年度统计 饼图</b><br>
	 * <br>
	 * <b><i>notice:</i></b>
	 * <ol>
	 * <li></li>
	 * </ol>
	 * </p>
	 * 
	 * @param ydtjBt
	 * @return
	 * @author Chen-JY
	 */
	public String getNdtjBt(YdtjBt ydtjBt) {
		JSONObject jsonb = new JSONObject();
		JSONArray json = new JSONArray();

		long viewnum = 5;//默认显示10个地区（包含其他）  
		long viewflag = 1;//默认显示其他
		Long totle = 0l;//总条数
		Long other = 0l;//其他的条数
		List<YdtjBt> list =null;
        try {
			if (!StringUtil.isEmpty(ydtjBt.getProvinceId())) {
				ydtjBt.setCityId(ydtjBt.getProvinceId());
				list = jqykjdMgmt.queryByndtjBt2(ydtjBt);
			}else{
				list = jqykjdMgmt.queryByndtjBt(ydtjBt);					
			}
			if (list.size() > 0) {
				for (int i = 0; i < list.size(); i++) {
					if (!StringUtil.isEmpty(list.get(i).getProvinceName())) {
						if (list.get(i).getProvinceName().indexOf("安徽") != -1) {
							JSONObject jo = new JSONObject();
							jo.put("value", list.get(i).getYkzs());
							jo.put("name", list.get(i).getProvinceName());
							json.put(jo);
						} else if (list.get(i).getProvinceName().indexOf("其他") != -1) {
							other = other + list.get(i).getYkzs();
							if (i < viewnum) {
								viewnum = viewnum + 1;
							}
						} else {
							if (i < (viewnum - 1)) {
								JSONObject jo = new JSONObject();
								jo.put("value", list.get(i).getYkzs());
								jo.put("name", list.get(i).getProvinceName());
								json.put(jo);
							}
							// 获取其他的数据和
							if (i >= (viewnum - 2)) {
								other = other + list.get(i).getYkzs();
							}
						}
						// 获取所有的数据和
						totle = totle + list.get(i).getYkzs();
					} else {
						other = other + list.get(i).getYkzs();
					}

				}
				JSONObject jo = new JSONObject();
				jo.put("value", other);
				jo.put("name", "其他");
				json.put(jo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		jsonb.put("total", totle);
		jsonb.put("datavalue", json.toString());
		return jsonb.toString();
	}

	/**
	 * 创建?????
	 */
	public ActionResult createJqykjd(Jqykjd jqykjd) {
		ActionResult ar = new ActionResult();
		try {
			// jqykjd.setUnid(jqykjdMgmt.getKey());
			jqykjd = jqykjdMgmt.createJqykjd(jqykjd);
			ar.setReturnObject(jqykjd);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	
	/**
	 * <p>
	 * <b>describe:省日游客游客接待总数</b><br>
	 * <br>
	 * <b><i>notice:</i></b>
	 * <ol>
	 * <li></li>
	 * </ol>
	 * </p>
	 * 
	 * @return
	 * @author Chen-JY
	 */
	public ActionResult getSrykzs() {

		ActionResult ar = new ActionResult();
		List result = null;
		Srykzs srykzs = new Srykzs();
		try {
			List<Srykzs> sList = jqykjdMgmt.queryBySrykzs();
			if (sList != null && sList.size() > 0) {
				for (Srykzs s : sList) {
					if (s.getCityId().equals("340100")) {
						srykzs.setHfroam(s.getYkzs());
					} else if (s.getCityId().equals("340200")) {
						srykzs.setWhroam(s.getYkzs());
					} else if (s.getCityId().equals("340300")) {
						srykzs.setBbroam(s.getYkzs());
					} else if (s.getCityId().equals("340400")) {
						srykzs.setHnroam(s.getYkzs());
					} else if (s.getCityId().equals("340500")) {
						srykzs.setMasroam(s.getYkzs());
					} else if (s.getCityId().equals("340600")) {
						srykzs.setHbroam(s.getYkzs());
					} else if (s.getCityId().equals("340700")) {
						srykzs.setTlroam(s.getYkzs());
					} else if (s.getCityId().equals("340800")) {
						srykzs.setAqroam(s.getYkzs());
					} else if (s.getCityId().equals("341000")) {
						srykzs.setHsroam(s.getYkzs());
					} else if (s.getCityId().equals("341100")) {
						srykzs.setChuzroam(s.getYkzs());
					} else if (s.getCityId().equals("341200")) {
						srykzs.setFyroam(s.getYkzs());
					} else if (s.getCityId().equals("341300")) {
						srykzs.setSzroam(s.getYkzs());
					} else if (s.getCityId().equals("341500")) {
						srykzs.setLaroam(s.getYkzs());
					} else if (s.getCityId().equals("341600")) {
						srykzs.setHzroam(s.getYkzs());
					} else if (s.getCityId().equals("341700")) {
						srykzs.setChizroam(s.getYkzs());
					} else if (s.getCityId().equals("341800")) {
						srykzs.setXcroam(s.getYkzs());
					}
				}
			}

			ar.setReturnObject(srykzs);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}

		/**
		 * 
		 * 描述：获取各地市的实时人数
		 * @return 
		 * @return：ActionResult
		 * @author 吴宝龙
		 * @date： 2016年2月16日 上午9:30:08
		 */
		public ActionResult getProDayRealForCities(){
			
			ActionResult ar=new ActionResult();
			List result=null;
			Srykzs srykzs = new Srykzs();
			String hour=DateUtils.nowHourTime();
			//String hour="2015-11-11 10:00:00";
			try {
				List<Ysjfx> sList =  jqykjdMgmt.queryByProDayReal(hour);
				if(sList != null && sList.size()>0){
					for(Ysjfx s : sList){
						if(s.getCityId().equals("340100")){
							srykzs.setHfroam(StringUtils.stringToLong(s.getYkzsSum()));
						}else if(s.getCityId().equals("340200")){
							srykzs.setWhroam(StringUtils.stringToLong(s.getYkzsSum()));
						}else if(s.getCityId().equals("340300")){
							srykzs.setBbroam(StringUtils.stringToLong(s.getYkzsSum()));
						}else if(s.getCityId().equals("340400")){
							srykzs.setHnroam(StringUtils.stringToLong(s.getYkzsSum()));
						}else if(s.getCityId().equals("340500")){
							srykzs.setMasroam(StringUtils.stringToLong(s.getYkzsSum()));
						}else if(s.getCityId().equals("340600")){
							srykzs.setHbroam(StringUtils.stringToLong(s.getYkzsSum()));
						}else if(s.getCityId().equals("340700")){
							srykzs.setTlroam(StringUtils.stringToLong(s.getYkzsSum()));
						}else if(s.getCityId().equals("340800")){
							srykzs.setAqroam(StringUtils.stringToLong(s.getYkzsSum()));
						}else if(s.getCityId().equals("341000")){
							srykzs.setHsroam(StringUtils.stringToLong(s.getYkzsSum()));
						}else if(s.getCityId().equals("341100")){
							srykzs.setChuzroam(StringUtils.stringToLong(s.getYkzsSum()));
						}else if(s.getCityId().equals("341200")){
							srykzs.setFyroam(StringUtils.stringToLong(s.getYkzsSum()));
						}else if(s.getCityId().equals("341300")){
							srykzs.setSzroam(StringUtils.stringToLong(s.getYkzsSum()));
						}else if(s.getCityId().equals("341500")){
							srykzs.setLaroam(StringUtils.stringToLong(s.getYkzsSum()));
						}else if(s.getCityId().equals("341600")){
							srykzs.setHzroam(StringUtils.stringToLong(s.getYkzsSum()));
						}else if(s.getCityId().equals("341700")){
							srykzs.setChizroam(StringUtils.stringToLong(s.getYkzsSum()));
						}else if(s.getCityId().equals("341800")){
							srykzs.setXcroam(StringUtils.stringToLong(s.getYkzsSum()));
						}
					}
				}
				
				ar.setReturnObject(srykzs);
				ar.setResultCode(0);
			} catch (Exception e) {
				e.printStackTrace();
				ar.setResultCode(-1);
				ar.setResultMessage(e.getMessage());
			}
			return ar;
		}
	
	/**
	 * 
	 * 描述：省大屏日数据：实时人数等
	 * @return 
	 * @return：ActionResult
	 * @author 吴宝龙
	 * @date： 2016年2月2日 下午3:01:34
	 */
	public ActionResult getCitiesDataForProDaPing(){
		ActionResult ar=new ActionResult();
		String edate=DateUtils.nowHourTime();
		String sdate=DateUtils.todayHourTime();
		//String hour="2015-11-11 10:00:00";
		List allResult = new ArrayList<ProvinceReceiveTourist>();//返回总结果
		try {
			List<Ysjfx> sList =  jqykjdMgmt.queryByProDayAll(sdate, edate);
			Long ykzs=0L;
			Long wsykrs=0L;
			Long snmyrs=0L;
			Long jwykrs=0L;
			if(sList != null && !sList.isEmpty()){
				for (int i = 0; i < sList.size(); i++) {
					Ysjfx ysjfx=sList.get(i);
					Long ykzsTemp=StringUtils.stringToLong(ysjfx.getYkzsSum());
					Long wsykrsTemp=StringUtils.stringToLong(ysjfx.getWsyksSum());
					Long snmyrsTemp=StringUtils.stringToLong(ysjfx.getSnmyrsSum());
					Long jwykrsTemp=StringUtils.stringToLong(ysjfx.getJwyksSum());
					ykzs+=ykzsTemp;
					wsykrs+=wsykrsTemp;
					snmyrs+=snmyrsTemp;
					jwykrs+=jwykrsTemp;
					
					if(i<3){
						ProvinceReceiveTourist pro=new ProvinceReceiveTourist();
						pro.setCityid(StringUtils.stringToLong(ysjfx.getCityId()));
						pro.setJkjq(StringUtils.stringToLong(ysjfx.getRegionSum()));
						pro.setJwykrs(jwykrsTemp);
						pro.setSnmyrs(snmyrsTemp);
						pro.setWsykrs(wsykrsTemp);
						pro.setYkzs(ykzsTemp);
						allResult.add(pro);
					}
				}
				ProvinceReceiveTourist pro=new ProvinceReceiveTourist();
				pro.setCityid(340000L);
				pro.setJwykrs(jwykrs);
				pro.setSnmyrs(snmyrs);
				pro.setWsykrs(wsykrs);
				pro.setYkzs(ykzs);
				allResult.add(pro);
			}
			ar.setReturnList(allResult);
			System.out.println("省日大屏接待总数数据："+allResult);
			ar.setResultCode(0);
		}catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}
	

	/**
	 * 修改?????
	 */
	public ActionResult updateJqykjd(Jqykjd jqykjd) {
		ActionResult ar = new ActionResult();
		try {
			jqykjd = jqykjdMgmt.modifyJqykjd(jqykjd);
			ar.setReturnObject(jqykjd);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}

	/**
	 * 删除?????
	 */
	public ActionResult deleteJqykjd(Jqykjd jqykjd) {
		ActionResult ar = new ActionResult();
		try {
			jqykjdMgmt.deleteJqykjd(jqykjd);
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}

	/**
	 * 批量删除?????
	 */
	public ActionResult batchDeleteJqykjd(List<Jqykjd> jqykjdList) {
		ActionResult ar = new ActionResult();
		try {
			for (int i = 0; i < jqykjdList.size(); i++) {
				this.deleteJqykjd(jqykjdList.get(i));
			}
			ar.setResultCode(0);
		} catch (Exception e) {
			e.printStackTrace();
			ar.setResultCode(-1);
			ar.setResultMessage(e.getMessage());
		}
		return ar;
	}

	/**
	 * 通过Session获取用户信息
	 */
	public SysOperator getSessionUser() {
		SysOperator user = super.getSessionUser();
		if (user == null) {
			user = new SysOperator();
			user.setUnid("0");
			user.setName("超级管理员");
		}
		return user;
	}
}