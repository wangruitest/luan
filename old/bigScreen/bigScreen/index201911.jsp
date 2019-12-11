<!-- 大数据监测中心 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <link href="<%=path %>/bigScreen/index201911.css" rel="stylesheet" />

  <script src="<%=path %>/js/const.js"></script>
  <script type="text/javascript" src="<%=path %>/	js/jquery.min.js"></script>
  <script src="<%=path %>/bigScreen/index201911.js"></script>
  <script src="<%=path %>/js/echarts.js"></script>
  <script src="<%=path %>/js/echarts/default.js"></script>
  <style>

  </style>
  <script>
    var basePath = '<%=path %>';
  </script>
</head>

<body>
  <div class="container">
    <div class="header">
      <div class="headerS header1">
        <div style="width: 100%;height:100%;">
          <img src="./img/六安市智慧旅游云中心.png" style="width:447px;height:46px;margin-top:30px;margin-left: 56px;" />
          <!-- <select id="region" style="width: 60px;height: 21px;font-size: 13px" onchange="func()">
              <option selected="selected" value="0000">全部</option>
          </select> -->
          <div style="text-align: center;margin-left: -10px;margin-top:10px;font-size:18px;">
            <span style="color:#597AB2;" class="topDate">2019年3月25日
              星期一 15:37:54 </span>
            <span style="color:#ED7C2F;" class="tem">19℃</span>
          </div>
        </div>
      </div>
      <!-- <div class="headerS header2"></div> -->
      <div class="headerS header3">
        <div class="header-low" style="text-align: center; color:#0083CE;">
          <div style="font-size: 21px;
          width: 300px;
          margin: 0 auto;
          height: 90px;
          line-height: 115px;
          border-bottom: 5px solid;">大数据决策中心</div>
        </div>
      </div>
      <div class="headerS header4">
        <div class="header-low">
          <ul id="weatherul">
            <%-- <li class="fr">
							<div class="wearther"><img src="<%=path %>/img/weather5.png"/>
        </div>
        <div class="weartherText">星期六 19°C/23°C</div>
        </li>
        <li class="fr">
          <div class="wearther"><img src="<%=path %>/img/weather4.png" /></div>
          <div class="weartherText">星期五 19°C/23°C</div>
        </li>
        <li class="fr">
          <div class="wearther"><img src="<%=path %>/img/weather3.png" /></div>
          <div class="weartherText">星期四 19°C/23°C</div>
        </li>
        <li class="fr">
          <div class="wearther"><img src="<%=path %>/img/weather2.png" /></div>
          <div class="weartherText">今日 19°C/23°C</div>
        </li>
        <li class="fr">
          <div class="wearther"><img src="<%=path %>/img/weather1.png" /></div>
          <div class="weartherText">昨日 17°C/23°C</div>
        </li>--%>
        </ul>
      </div>

    </div>
  </div>
  <div class="main">
    <div class="main1">
      <!-- 第一列 -->
      <div class="main1S main1_1">
        <div class="part_container">
          <div class="part_title">滚动提示</div>
          <div class="part_body">
            <ul class="listGroup" style="height: 90%;">
              <li class="listLi clearfix">
                <div class="listLiText fl">本月景区累计游客数：</div>
                <div class="listLiNum fr" id="regionSumByMonth">0</div>
              </li>
              <li class="listLi clearfix">
                <div class="listLiText fl">本月景区日游客峰值：</div>
                <div class="listLiNum fr" id="peakDay">0</div>
              </li>
              <li class="listLi clearfix">
                <div class="listLiText fl">昨日景区游客统计值：</div>
                <div class="listLiNum fr" id="cityVisitor">0</div>
              </li>
              <li class="listLi clearfix">
                <div class="listLiText fl">景区游客驻留时长：</div>
                <div class="listLiNum fr" id="stayMin">0</div>
              </li>
              <li class="listLi clearfix">
                <div class="listLiText fl">昨日城市旅客：</div>
                <div class="listLiNum fr" id="yesterdayVisitor"">0</div>
              </li>
              <li class="listLi clearfix">
                <div class="listLiText fl">昨日城市过夜游客：</div>
                <div class="listLiNum fr" id="overnight">0</div>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div class=" main1S main1_2">
                  <div class="part_container">
                    <div class="part_title">景区人流曲线</div>
                    <div class="part_body">
                      <iframe class="perLine" src="<%=path %>/bigScreen/perline.jsp" allowTransparency="true"
                        style="border: none;width:100%;height:100%;" frameborder="0" scrolling="no" marginwidth="0"
                        marginheight="0"></iframe>
                    </div>
                  </div>
                </div>
                <div class="main1S main1_3">
                  <div class="part_container">
                    <div class="part_title">近一周接待游客数量</div>
                    <div class="part_body">
                      <iframe class="perWeek" id="perWeek" src="<%=path %>/bigScreen/perWeek.jsp"
                        style="border: none;width:100%;height:100%;" allowTransparency="true" frameborder="0"
                        scrolling="no" marginwidth="0" marginheight="0"></iframe>
                    </div>
                  </div>
                </div>
          </div>
          <div class="main2">
            <!-- 第二列 -->
            <div class="main2S main2_1">
              <div class="part_container">

                <div class="part_container_half">
                  <div class="part_title">今日景区实时</div>
                  <div class="part_body">
                    <div id="shishi" class="part_num_container">
                      <div class="part_num">0</div>
                      <div class="part_num">0</div>
                      <div class="part_num">0</div>
                    </div>

                    <div style="font-size:16px;">
                      <span style="color:#5478B3;">环比前一小时</span>
                      <span id="huanbi" style="color:#28BF7E;margin-left:10px;">0</span>
                      <img id="huanImg" class="" src="./img/icon_加@2x.png" style="width:10px;height:20px;" />
                    </div>
                  </div>
                </div>
                <div class="part_container_half">
                  <div class="part_title">今日景区累计</div>
                  <div class="part_body">


                    <div id="jinri" class="part_num_container">
                      <div class="part_num">0</div>
                      <div class="part_num">0</div>
                      <div class="part_num">0</div>
                    </div>

                    <!-- <div><span>同前昨日此时</span>
                <span id="zhanbi">0</span>
                <img class="" src="" />
              </div> -->

                    <div style="font-size:16px;">
                      <span style="color:#5478B3;">同比昨日此时</span>
                      <span id="zhanbi" style="color:#F75555;margin-left:10px;">0</span>
                      <img id="zhanImg" class="" src="./img/icon_减.png" style="width:10px;height:20px;" />
                    </div>

                  </div>
                </div>
              </div>
            </div>
            <div class="main2S main2_2">
              <div class="main2_2S main2_2_1">
                <div class="main2_2_elem_container main2_2_elem_container1">
                  <div class="main2_2_title main2_2_content1" id="greenScenic">0</div>
                  <div class="main2_2_content main2_2_content1">正常景区</div>
                </div>
              </div>
              <div class="main2_2S main2_2_2">
                <div class="main2_2_elem_container main2_2_elem_container2">
                  <div class="main2_2_title main2_2_content2" id="blueScenic">0</div>
                  <div class="main2_2_content main2_2_content2">蓝色景区</div>
                </div>
              </div>
              <div class="main2_2S main2_2_3">
                <div class="main2_2_elem_container main2_2_elem_container3">
                  <div class="main2_2_title main2_2_content3" id="yellowScenic">0</div>
                  <div class="main2_2_content main2_2_content3">黄色景区</div>
                </div>
              </div>
              <div class="main2_2S main2_2_4">
                <div class="main2_2_elem_container main2_2_elem_container4">
                  <div class="main2_2_title main2_2_content4" id="orangeScenic">0</div>
                  <div class="main2_2_content main2_2_content4">橙色景区</div>
                </div>
              </div>
              <div class="main2_2S main2_2_5">
                <div class="main2_2_elem_container main2_2_elem_container5">
                  <div class="main2_2_title main2_2_content5" id="redScenic">0</div>
                  <div class="main2_2_content main2_2_content5">红色景区</div>
                </div>
              </div>
            </div>
            <div class="main2S main2_3">
              <div class="part_container">
                <div style="position: absolute;top:20px;right:20px;width:210px;height:35px;z-index:99999;">
                  <div id="province0" class="switchButton switchButton1_1" onclick="changeProvince(0)">
                    本省
                  </div>
                  <div id="province1" class="switchButton switchButton2_2" onclick="changeProvince(1)">
                    外省
                  </div>
                  <div id="province2" class="switchButton switchButton3_2" onclick="changeProvince(2)">
                    按城市
                  </div>
                </div>
                <div class="part_title">昨日游客前十统计</div>
                <div class="part_body" id="map_body" style="position: relative;">
                  <div id="ben_sheng_body">
                    <iframe id="ahmap" class="ahmapArea" src="<%=path %>/bigScreen/ahmap.jsp"
                      style="border: none;width:100%;height:100%;" allowTransparency="true" frameborder="0"
                      scrolling="no" marginwidth="0" marginheight="0"></iframe>
                    <div class="ahmap clearfix">
                      <!-- 目的地城市或区县 -->
                      <div class="lineArea" id="cityNamelaArea">
                        <div class="name" style="top:61%;left: calc(50% - 100px);" id="cityNamela"></div>
                      </div>
                      <div class="lineArea" id="cityNamechizhouArea">
                        <div class="name" style="top:88%;left: 43%;" id="cityNamechizhou"></div>
                      </div>
                      <div class="lineArea" id="cityNamefuyangArea">
                        <div class="name" style="top:39%;left: 10%;" id="cityNamefuyang"></div>
                      </div>
                      <div class="lineArea" id="cityNamebozhouArea">
                        <div class="name" style="top:19%;left: 15%;" id="cityNamebozhou"></div>
                      </div>
                      <div class="lineArea" id="cityNamesuzhouArea">
                        <div class="name" style="top:18%;left: 56%;" id="cityNamesuzhou"></div>
                      </div>
                      <div class="lineArea" id="cityNamechuzhouArea">
                        <div class="name" style="top:42%;left: 67%;" id="cityNamechuzhou"></div>
                      </div>
                      <div class="lineArea" id="cityNamexuanchengArea">
                        <div class="name" style="top:71%;left: 68%;" id="cityNamexuancheng"></div>
                      </div>
                      <div class="lineArea" id="cityNamehuangshanArea">
                        <div class="name" style="top:92%;left: 60%;" id="cityNamehuangshan"></div>
                      </div>
                      <div class="lineArea" id="cityNameanqingArea">
                        <div class="name" style="top:74%;left: calc(50% - 150px);" id="cityNameanqing"></div>
                      </div>
                      <div class="lineArea" id="cityNamemaanshanArea">
                        <div class="name" style="top:53%;left: 60%;" id="cityNamemaanshan"></div>
                      </div>
                      <div class="lineArea" id="cityNamehefeiArea">
                        <div class="name" style="top:49%;left: calc(50% - 160px);" id="cityNamehefei"></div>
                      </div>
                      <div class="lineArea" id="cityNametonglingArea">
                        <div class="name" style="top:65%;left: 50%;" id="cityNametongling"></div>
                      </div>
                      <div class="lineArea" id="cityNamebengbuArea">
                        <div class="name" style="top:28%;left: 39%;" id="cityNamebengbu"></div>
                      </div>
                      <div class="lineArea" id="cityNamehuaibeiArea">
                        <div class="name" style="top:17%;left: 26%;" id="cityNamehuaibei"></div>
                      </div>
                      <div class="lineArea" id="cityNamewuhuArea">
                        <div class="name" style="top:62%;left: calc(50% + 120px);" id="cityNamewuhu"></div>
                      </div>
                      <div class="lineArea" id="cityNamehuainanArea">
                        <div class="name" style="top:34%;left: 25%;" id="cityNamehuainan"></div>
                      </div>

                      <!-- 游客所属城市 -->
                      <div class="lineArea" id="cityNamelanArea">
                        <div class="cityName" style="top:51%;left: 17%;" id="cityNamelan">六安:0%</div>
                      </div>
                      <div class="lineArea" id="cityNamefyArea">
                        <div class="cityName" style="top:29%;left: calc(50% - 263px);" id="cityNamefy">阜阳:0%</div>
                      </div>
                      <div class="lineArea" id="cityNamebzArea">
                        <div class="cityName" style="top:22%;left: 15%;" id="cityNamebz">亳州:0%</div>
                      </div>
                      <div class="lineArea" id="cityNameszArea">
                        <div class="cityName" style="top:12%;left: 36%;" id="cityNamesz">宿州:0%</div>
                      </div>
                      <div class="lineArea" id="cityNameczArea">
                        <div class="cityName" style="top:37%;left: 51%;" id="cityNamecz">滁州:0%</div>
                      </div>
                      <div class="lineArea" id="cityNamexcArea">
                        <div class="cityName" style="top:71%;left: 68%;" id="cityNamexc">宣城:0%</div>
                      </div>
                      <div class="lineArea" id="cityNamehsArea">
                        <div class="cityName" style="top:92%;left: 60%;" id="cityNamehs">黄山:0%</div>
                      </div>
                      <div class="lineArea" id="cityNameaqArea">
                        <div class="cityName" style="top:74%;left: calc(50% - 140px);" id="cityNameaq">安庆:0%</div>
                      </div>
                      <div class="lineArea" id="cityNamemasArea">
                        <div class="cityName" style="top:53%;left: 60%;" id="cityNamemas">马鞍山:0%</div>
                      </div>
                      <div class="lineArea" id="cityNamehfArea">
                        <div class="cityName" style="top:49%;left: 44%;" id="cityNamehf">合肥:0%</div>
                      </div>
                      <div class="lineArea" id="cityNametlArea">
                        <div class="cityName" style="top:65%;left: 50%;" id="cityNametl">铜陵:0%</div>
                      </div>
                      <div class="lineArea" id="cityNamebbArea">
                        <!--不是前十名的添加  areaHide 类名进行隐藏-->
                        <div class="cityName" style="top:28%;left: 39%;" id="cityNamebb">蚌埠:0%</div>
                      </div>
                      <div class="lineArea" id="cityNamehbArea">
                        <div class="cityName" style="top:17%;left: 26%;" id="cityNamehb">淮北:0%</div>
                      </div>
                      <div class="lineArea" id="cityNamewhArea">
                        <div class="cityName" style="top:62%;left: calc(50% + 100px);" id="cityNamewh">芜湖:0%</div>
                      </div>
                      <div class="lineArea" id="cityNamecziArea">
                        <div class="cityName" style="top:78%;left:52%;" id="cityNameczi">池州:0%</div>
                      </div>
                      <div class="lineArea" id="cityNamehnArea">
                        <div class="cityName" style="top:34%;left: 25%;" id="cityNamehn">淮南:0%</div>
                      </div>
                    </div>
                    <ul class="ten" id="tenCityPercentArea" style="display:none;">

                    </ul>
                  </div>
                  <div id="wai_sheng_body">
                    <iframe id='chinamap' class="ahmapArea" xsrc="<%=path %>/bigScreen/chinamap.jsp"
                      style="border: none;width:100%;height:100%;" allowTransparency="true" frameborder="0"
                      scrolling="no" marginwidth="0" marginheight="0"></iframe>
                  </div>
                  <div id="quan_guo_body">
                    <iframe id='chinamap2' class="ahmapArea" xsrc="<%=path %>/bigScreen/toptencity.jsp"
                      style="border: none;width:100%;height:100%;" allowTransparency="true" frameborder="0"
                      scrolling="no" marginwidth="0" marginheight="0"></iframe>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="main3">
            <!-- 第三列 -->
            <div class="main3S main3_1">
              <div class="part_container">
                <div class="part_title">重点景区游客承载量</div>
                <div class="part_body">
                  <iframe class="sceneryArea" name="sceneryArea" id="sceneryArea"
                    src="<%=path %>/bigScreen/scenery2.jsp" style="border: none;width:100%;height:100%;"
                    allowTransparency="true" frameborder="0" scrolling="no" marginwidth="0" marginheight="0"> </iframe>

                </div>
              </div>
            </div>
            <div class="main3S main3_2">
              <div class="part_container">
                <div class="part_title">游客属性</div>
                <div class="part_body">
                  <div style="height:60px;width:100%;position:absolute;margin:0;">
                    <!--性别指示-->
                    <ul class="natureList">
                      <li>
                        <div class="natureListIcon nanArea"></div>
                        <div class="natureListText">男</div>
                      </li>
                      <li>
                        <div class="natureListIcon nvArea"></div>
                        <div class="natureListText">女</div>
                      </li>
                    </ul>

                    <!--年龄指示-->
                    <div style="position:absolute;top:0;left:50%;">
                      <ul class="natureList ageListArea1" style="padding-left:0px;">
                        <li>
                          <div class="natureListIcon age1"></div>
                          <div class="natureListText">0-20</div>
                        </li>
                        <li>
                          <div class="natureListIcon age2"></div>
                          <div class="natureListText">20-30</div>
                        </li>
                        <li>
                          <div class="natureListIcon age3"></div>
                          <div class="natureListText">30-40</div>
                        </li>
                        <!-- <li>
                  <div class="natureListIcon age4"></div>
                  <div class="natureListText">35-60</div>
                </li> -->
                      </ul>
                      <ul class="natureList ageListArea2">
                        <!-- <li>
                  <div class="natureListIcon fl age1"></div>
                  <div class="natureListText fl">0-12</div>
                </li>
                <li>
                  <div class="natureListIcon fl age2"></div>
                  <div class="natureListText fl">12-20</div>
                </li> -->
                        <li>
                          <div class="natureListIcon age4"></div>
                          <div class="natureListText">40-50</div>
                        </li>
                        <li>
                          <div class="natureListIcon age5" style="background:#CC3333"></div>
                          <div class="natureListText">>50</div>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <div style="height:calc(100% - 0px);font-size:0;padding-top: 20px;">

                    <div style="display: inline-block;width:50%;height:100%;">
                      <iframe class="natureArea fl" id="sex" src="<%=path %>/bigScreen/sex.jsp" allowTransparency="true"
                        style="border: none;width:100%;height:100%;" frameborder="0" scrolling="no" marginwidth="0"
                        marginheight="0">
                      </iframe>
                    </div>
                    <div style="display: inline-block;width:50%;height:100%;">
                      <iframe class="natureArea fr" id="age" src="<%=path %>/bigScreen/age.jsp" allowTransparency="true"
                        style="border: none;width:100%;height:100%;" frameborder="0" scrolling="no" marginwidth="0"
                        marginheight="0">
                      </iframe></div>
                  </div>
                  <!-- <div class="clearfix"></div> -->
                  <ul class="natureBottom">
                    <li class="fl">性 别</li>
                    <li class="fl">年 龄</li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="main3S main3_3">
              <div class="part_container">
                <div class="part_title">游客状态</div>
                <div class="part_body">
                  <div style="height:60px;width:100%;margin:0;position:absolute;">
                    <!--消费金额指示-->
                    <ul class="natureList levelList1">
                      <li>
                        <div class="natureListIcon level1"></div>
                        <div class="natureListText">≤20元</div>
                      </li>
                      <li>
                        <div class="natureListIcon level2"></div>
                        <div class="natureListText">20-50元</div>
                      </li>
                      <!-- <li>
                  <div class="natureListIcon level3"></div>
                  <div class="natureListText">51-100元</div>
                </li>
                <li>
                  <div class="natureListIcon level4"></div>
                  <div class="natureListText">≥100元</div>
                </li> -->
                    </ul>
                    <ul class="natureList levelList2">
                      <!-- <li>
                  <div class="natureListIcon level1"></div>
                  <div class="natureListText">≤20元</div>
                </li>
                <li>
                  <div class="natureListIcon level2"></div>
                  <div class="natureListText">20-50元</div>
                </li> -->
                      <li>
                        <div class="natureListIcon level3"></div>
                        <div class="natureListText">51-100元</div>
                      </li>
                      <li>
                        <div class="natureListIcon level4"></div>
                        <div class="natureListText">>100元</div>
                      </li>
                    </ul>
                    <!--驻留时间指示-->
                    <div style="position:absolute;top:0;left:50%;">
                      <ul class="natureList ageListArea timeList1" style="padding-left:0px;">
                        <li>
                          <div class="natureListIcon time1"></div>
                          <div class="natureListText">0-2小时</div>
                        </li>
                        <li>
                          <div class="natureListIcon time2"></div>
                          <div class="natureListText">2-6小时</div>
                        </li>
                        <li>
                          <div class="natureListIcon time3"></div>
                          <div class="natureListText">6-24小时</div>
                        </li>
                        <!-- <li>
                  <div class="natureListIcon time4"></div>
                  <div class="natureListText">24-48小时</div>
                </li>
                <li>
                  <div class="natureListIcon time5"></div>
                  <div class="natureListText">≥48小时</div>
                </li> -->
                      </ul>
                      <ul class="natureList ageListArea timeList2">
                        <!-- <li>
                  <div class="natureListIcon time1"></div>
                  <div class="natureListText">0-2小时</div>
                </li>
                <li>
                  <div class="natureListIcon time2"></div>
                  <div class="natureListText">2-6小时</div>
                </li>
                <li>
                  <div class="natureListIcon time3"></div>
                  <div class="natureListText">6-24小时</div>
                </li> -->
                        <li>
                          <div class="natureListIcon time4"></div>
                          <div class="natureListText">24-48小时</div>
                        </li>
                        <li>
                          <div class="natureListIcon time5"></div>
                          <div class="natureListText">>48小时</div>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <div style="height:calc(100% - 0px); font-size:0;    padding-top: 20px;">
                    <div style="display: inline-block;width:50%;height:100%;">

                      <!--消费水平饼图表-->
                      <iframe class="natureArea fl" src="<%=path %>/bigScreen/level.jsp" allowTransparency="true"
                        frameborder="0" style="border: none;width:100%;height:100%;" scrolling="no" marginwidth="0"
                        marginheight="0">

                      </iframe>
                    </div>
                    <div style="display: inline-block;width:50%;height:100%;">
                      <!--驻留时间饼图表-->
                      <iframe class="natureArea fr" src="<%=path %>/bigScreen/time.jsp" allowTransparency="true"
                        frameborder="0" style="border: none;width:100%;height:100%;" scrolling="no" marginwidth="0"
                        marginheight="0">

                      </iframe>
                    </div>
                  </div>
                  <ul class="natureBottom">
                    <li class="fl">通讯消费</li>
                    <li class="fl">驻留时长</li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="footer"></div>
      </div>
</body>

</html>