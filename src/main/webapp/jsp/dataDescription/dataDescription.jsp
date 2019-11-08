<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setAttribute("home", request.getContextPath());
%>
<html>
  <head>
    <title>景区监控数据说明</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
  </head>
  <style>
		ul{margin: 0;}
		.listAreaLi{list-style:decimal;font-family: "微软雅黑";font-size: 14px;margin:7px 0;}
		.text{
			color: #666;
			margin-top: 5px;
		}
		.title{color: #1f1f1f;font-weight: bold;}
		.textList{list-style:circle;}
	</style>
	<body>
		<ul class="listArea">
			<li class="listAreaLi ">
				<div class="title">名词解释:</div>
				<ul class="text">
					<li class="textList">昨日城市游客：在对应地市驻留时间在6小时以上的人。</li>
					<li class="textList">昨日城市客流：在对应地市出现过的人。</li>
					<li class="textList">游客转化率：昨日城市游客/昨日城市客流。</li>
					<li class="textList">昨日外省游客：在对应地市驻留时间在6小时以上且游客归属地为外省的人。</li>
					<li class="textList">一日游过夜客：在对应地市驻留时间在6小时以上且晚上9点到第二天早上7点有通信行为的人。</li>
				</ul>
			</li>
			<li class="listAreaLi ">
				<div class="title">所有景区接待统计:</div>
				<div class="text">统计城市所有景区的接待统计数据，并按天进行去重，分级查询：全省、地市，同时能够按照游客来源地查询（全部游客、外地游客、本地游客），更新周期：每天一次。</div>
			</li>
			<li  class="listAreaLi">
				<div class="title">景区接待游客统计:</div>
				<div class="text">从单个景区的维度统计该景区各季度、月份、日接待人数情况，与历史年份对应的季度、月、日比较。每人每天仅计算1人次。</div>
			</li>
			<li  class="listAreaLi">
				<div class="title">景区实时新增游客统计:</div>
				<div class="text">通过实时数据采集、实时分析技术，实时统计分析各个旅游景点每小时内新增的游客数量，通过该数据可以观察该景区的游客入园规律，方便景区做好接待准备。</div>
			</li>
			<li  class="listAreaLi">
				<div class="title">景区游客实时流量统计:</div>
				<ul class="text">
					<li class="textList">实时统计分析各个旅游景点当前在园总数，可以通过设计采集时间间隔，反映景区当前的在园人数。系统每个整点更新一次数据。</li>
					<li class="textList">通过归属省份的分析，分析旅游用户的来源地特征，实时显示游客来源地比例，可同比显示去年同期的数据。</li>
				</ul>
			</li>
			<li  class="listAreaLi">
				<div class="title">景区游客归属地统计:</div>
				<div class="text">针对各个景点：按国内游客、海外游客、港澳台游客，或按各省市，统计市全年游客总数，统计各月份、各季度游客人数和比例，与历史年份比较，统计同比增长比例。省、市管理员，可选择管辖区域范围内景区，了解景区的游客归属地。</div>
			</li>
			<li  class="listAreaLi">
				<div class="title">景区驻留分析统计:</div>
				<div class="text">针对单个景区的游客逗留时间区间的游客人数统计。对统计日期向前多天（固定值）的移动用户（非常驻）在统计目标区域内连续的停留时间按0-1小时、1-2小时、2-6小时等几个时间段进行的统计分析，得到满足条件的游客数量。</div>
			</li>
			<li  class="listAreaLi">
				<div class="title">景区驻留时间统计:</div>
				<div class="text">统计所辖范围内所有景点平均逗留时间，按年、季度、月统计，现实同比数据，通过该数据客户了解景区当前的旅游资源开发程度。</div>
			</li>
			<li  class="listAreaLi">
				<div class="title">景区游客旅游天数统计:</div>
				<div class="text">统计一日游全年游客总数，统计各月份、各季度一日游游客人数和比例；统计旅游时间超过一天的全年游客总数，统计各月份、各季度旅游时间超过一天的游客人数和比例，以饼图和报表形式展示一日游和多日游所占比例，计算多日游与历史值同比增长比例。计算全年平均旅游时间，与历史平均值比较，计算同比增长比例。</div>
			</li>
			<li  class="listAreaLi">
				<div class="title">境外入皖漫游用户数:</div>
				<div class="text">实现按照月份统计，统计查询月份内进入安徽省的境外漫游用户数量。</div>
			</li>
			<li  class="listAreaLi">
				<div class="title">本（外）省漫游用户数:</div>
				<div class="text">实现按照用户来源地、去往目的地、统计月份的查询统计，统计符合查询条件的省内（外）漫游用户数量。</div>
			</li>
			<li  class="listAreaLi">
				<div class="title">本（外）省漫游用户过夜统计:</div>
				<div class="text">实现按照用户来源地、去往目的地、统计月份的查询统计，统计符合查询条件的本（外）省漫游过夜用户数量。</div>
			</li>
		</ul>
	</body>
</html>
