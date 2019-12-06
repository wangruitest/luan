var basePath2='http://localhost:8088/';
$(function () {
  getCfg();
  getScrollTip();
  setScenicState();
  getProvinceYesterdayVisitors();
  getRegionSum();
  getRegionSumByDay();
  getWeather();

  //定时执行
  window.setInterval("getRegionSum()", 60000); //一分钟执行一次
  window.setInterval("getScrollTip();getRegionSumByDay()", 300000); //五分钟执行一次
  window.setInterval("setScenicState()", 60000); //一秒钟执行一次
  window.setInterval("getWeather()", 21600000); //六小时执行一次
  window.setInterval("getCurrentTime()", 1000); //一s执行一次
  window.setInterval("getRegionSum()", 300000); //五分钟执行一次
  window.setInterval("getProvinceYesterdayVisitors()", 300000); //五分钟执行一次
});

var titleName = "";
var areacode = '';//城市或区县id
var flag = '';//城市区县标示，0：省，1：市，2：区县
var simple_name = '';


function getCfg () {
  $.ajax({
    url: basePath + "/bigScreenCfg/getBigScreenCfg.html",
    async: false,
    dataType: "json",
    success: function (data) {
      for (var i = 0; i < data.length; i++) {
        titleName = data[i].area_name + "旅游景区监控中心";
        areacode = data[i].areaCode;
        flag = data[i].flag;
        simple_name = data[i].simple_name;
      }
      document.title = titleName;
      $("#titleText").html(titleName);
    }
  });
}
//右侧获取当前时间
function getCurrentTime () {
  var mydate = new Date();
  var year = mydate.getFullYear();//获取当前年份
  var month = mydate.getMonth() + 1;//获取当前月份
  var day = mydate.getDate();//获取当前日
  var hour = mydate.getHours(); //获取当前小时数(0-23)
  var min = mydate.getMinutes(); //获取当前分钟数(0-59)
  var seconds = mydate.getSeconds();
  var date = month + "/" + day + "/" + year;
  var dayd = new Date(Date.parse(date));   //需要正则转换的则 此处为 ： var day = new Date(Date.parse(date.replace(/-/g, '/')));  
  var today = new Array('星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六');
  var week = today[dayd.getDay()]; //获取当前星期几
  if (parseInt(hour) < 10) {
    hour = '0' + hour;
  }
  if (parseInt(min) < 10) {
    min = '0' + min;
  }
  if (parseInt(seconds) < 10) {
    seconds = '0' + seconds;
  }
  $(".topDate").html(year + "年" + month + "月" + day + "日" + " " + week + " " + hour + ":" + min + "" + ":" + seconds + " ");
}

function getScrollTip () {
  $.ajax({
    url: basePath + "/regionRealtimeController/scrollTip.html",
    dataType: "json",
    type: "POST",
    async: false,
    success: function (data) {
      $.each(data, function (index, values) {
        $.each(values, function (index2, value) {
          $("#regionSumByMonth").html(formatWan(value.currentMonth) + "万人");
          $("#peakDay").html(formatWan(value.touristPeak) + "万人");
          $("#overnight").html(formatWan(value.overnightGuest) + "万人");
          $("#cityVisitor").html(formatWan(value.cityVisitor) + "万人");
          $("#stayMin").html(value.scenicSpot + "分钟");
        });
      });
    },
    error: function (err) {
      console.log(err);
    }

  });
  $.ajax({
    url: basePath2 + "/bigScreen/getYesterdayTouristCount.do",
    dataType: "json",
    type: "POST",
    async: false,
    success: function (data) {
          var cnt=(data/10000).toFixed(2);
          $("#yesterdayVisitor").html(cnt + "万人");
    },
    error: function (err) {
      console.log(err);
    }

  });
}
function formatWan (n) {
  var b = parseInt(n).toString();
  var r = b / 10000;
  return r.toFixed(2);
}


//获取大屏天气函数
function getWeather () {
  $("#weatherul").empty();
  // var path = "<%=path %>";
  var yestedayMaxTemp = "";//昨日最高气温
  var yestedayMintemp = "";//昨日最低气温
  var yestedayTemp = "";//昨日气温差
  var yesterdayIcon = "";//昨日天气图标
  //获取国家气象局历史天气（昨日）
  $.ajax({
    url: basePath + "/bigScreenWeather/getCurrentScreenWeather.html",
    //dataType : "json",
    type: "POST",
    async: false,
    data: {
    },
    success: function (data) {
      var weatherDatas = eval(data);
      $(".tem").html(weatherDatas[0].temperature_curr);
    }
  });
  //获取国家气象局历史天气（昨日）
  $.ajax({
    url: basePath + "/bigScreenWeather/getYestedayScreenWeather.html",
    //dataType : "json",
    type: "POST",
    async: false,
    data: {
    },
    success: function (data) {
      var weatherDatas = eval(data);
      //格式化昨日天气
      for (var i = 1; i < weatherDatas.length; i++) {
        if (weatherDatas[i].temperature.replace("℃", "") > weatherDatas[i - 1].temperature.replace("℃", "")) {
          yestedayMaxTemp = weatherDatas[i].temperature.replace("℃", "");
        } else {
          yestedayMintemp = weatherDatas[i - 1].temperature.replace("℃", "");
        }
      }
      yestedayTemp = yestedayMaxTemp + "℃";
      yesterdayIcon = weatherDatas[12].weather_icon.substring(37, weatherDatas[12].weather_icon.length - 4);
    }
  });
  //获取国家气象局未来天气（未来5-7天天气，这里只取未来4天天气：包括今天）
  $.ajax({
    url: basePath + "/bigScreenWeather/getFutureScreenWeather.html",
    //dataType : "json",
    type: "POST",
    async: false,
    data: {
    },
    success: function (data) {
      var weatherDatas = eval(data);//将数据转化为json格式
      //填充昨日天气
      $("#weatherul").append("<li class=fr>"
        + "<div class='wearther'><img src='" + basePath + "/img/wearther/" + yesterdayIcon + ".png" + "'/></div>"
        + "<div class='weartherText'>昨日 " + yestedayTemp + "</div>"
        + "</li>");
      //填充今日天气
      $("#weatherul").append("<li class=fr>"
        + "<div class='wearther'><img src='" + basePath + "/img/wearther/" + weatherDatas[0].weather_icon.substring(37, weatherDatas[0].weather_icon.length - 4) + ".png'/></div>"
        + "<div class='weartherText'>今天 " + weatherDatas[0].temperature.substring(0,weatherDatas[0].temperature.indexOf('/')) + "</div>"
        // + "<div class='weartherText'>今天 " + weatherDatas[0].temperature.substring(0, 3) + "</div>"

        + "</li>");
      $("#weatherul").append("<li class=fr>"
        + "<div class='wearther'><img src='" + basePath + "/img/wearther/" + weatherDatas[1].weather_icon.substring(37, weatherDatas[1].weather_icon.length - 4) + ".png'/></div>"
        // + "<div class='weartherText'>" + weatherDatas[1].week + " " + weatherDatas[1].temperature.substring(0, 3) + "</div>"
        + "<div class='weartherText'>" + weatherDatas[1].week + " " + weatherDatas[1].temperature.substring(0,weatherDatas[0].temperature.indexOf('/')-1) + "</div>"
        + "</li>");
      $("#weatherul").append("<li class=fr>"
        + "<div class='wearther'><img src='" + basePath + "/img/wearther/" + weatherDatas[2].weather_icon.substring(37, weatherDatas[2].weather_icon.length - 4) + ".png'/></div>"
        // + "<div class='weartherText'>" + weatherDatas[2].week + " " + weatherDatas[2].temperature.substring(0, 3) + "</div>"
        + "<div class='weartherText'>" + weatherDatas[2].week + " " + weatherDatas[2].temperature.substring(0,weatherDatas[0].temperature.indexOf('/')-1) + "</div>"
        + "</li>");
      $("#weatherul").append("<li class=fr>"
        + "<div class='wearther'><img src='" + basePath + "/img/wearther/" + weatherDatas[3].weather_icon.substring(37, weatherDatas[3].weather_icon.length - 4) + ".png'/></div>"
        // + "<div class='weartherText'>" + weatherDatas[3].week + " " + weatherDatas[3].temperature.substring(0, 3) + "</div>"
        + "<div class='weartherText'>" + weatherDatas[3].week + " " + weatherDatas[3].temperature.substring(0,weatherDatas[0].temperature.indexOf('/')-1) + "</div>"
        + "</li>");




    }
  });
}


function setScenicState () {
  $.ajax({
    url: basePath + "/keyScenic/getScenicStateNum.html",
    async: false,
    dataType: "json",
    success: function (data) {
      $("#greenScenic").html("0");
      $("#blueScenic").html("0");
      $("#yellowScenic").html("0");
      $("#orangeScenic").html("0");
      $("#redScenic").html("0");
      for (var i = 0; i < data.length; i++) {
        if (data[i].color == '0') {
          $("#greenScenic").html(data[i].num);
        } else if (data[i].color == '1') {
          $("#blueScenic").html(data[i].num);
        } else if (data[i].color == '2') {
          $("#yellowScenic").html(data[i].num);
        } else if (data[i].color == '3') {
          $("#orangeScenic").html(data[i].num);
        } else if (data[i].color == '4') {
          $("#redScenic").html(data[i].num);
        }
      }
    }

  });
}
function getNumHtml(num){
  // <div class="part_num">0</div>
  var arr=(num+'').match(/./g);
  var result='';
  arr.forEach(e => {
    result=result+'<div class="part_num">'+e+'</div>';
  });
  return result;
}


function getRegionSum () {
  $.ajax({
    url: basePath + "/regionRealtimeController/regionRealtimeSum.html",
    dataType: "json",
    type: "POST",
    async: false,
    success: function (data) {
      $.each(data, function (index, values) {
        $.each(values, function (index2, value) {
          //  $("#shishi").html(format_number(value.currentMonth));

          $("#shishi").html(getNumHtml(value.currentMonth));
          $("#huanbi").text(value.huanBi.substr(0, 4) + "%");
          $("#huanImg").attr('src', basePath+'/img/' + value.showImg);
          if (value.showImg == "less.png") {
            $("#huanbi").css("color", "#F75555");
          } else {
            $("#huanbi").css("color", "#28BF7E");
          }
        });
      });
    }

  });
}

function getRegionSumByDay () {
  $.ajax({
    url: basePath + "/regionRealtimeController/regionRealtimeSumByDay.html",
    dataType: "json",
    type: "POST",
    async: false,
    success: function (data) {
      $.each(data, function (index, values) {
        $.each(values, function (index2, value) {
          //  $("#jinri").html(format_number(value.currentMonth));

          $("#jinri").html(getNumHtml(value.currentMonth));
          $("#zhanbi").text(value.zhanBi.substr(0, 4) + "%");
          $("#zhanImg").attr('src', basePath+'/img/' + value.showImg);
          if (value.showImg == "less.png") {
            $("#zhanbi").css("color", "#F75555");
          }else {
            $("#zhanbi").css("color", "#28BF7E");
          }
          $("#allregions").empty();
          $("#alarmregion").empty();
          if (value.regionNum.length == 1) {
            $("#allregions").append("<div class='listNum fl'><div class='numText'>0</div></div><div class='listNum fl'><div class='numText'>" + value.regionNum + "</div></div>");
          }
          if (value.regionNum.length == 2) {
            $("#allregions").append("<div class='listNum fl'><div class='numText'>" + value.regionNum.substring(0, 1) + "</div></div><div class='listNum fl'><div class='numText'>" + value.regionNum.substring(1, 2) + "</div></div>");
          }
          if (value.redAlarm.length = 1) {
            $("#alarmregion").append("<div class='listNum fl listRedNum'><div class='numText redNumText'>0</div></div><div class='listNum fl listRedNum'><div class='numText redNumText'>" + value.redAlarm + "</div></div>");
          }
          if (value.redAlarm.length == 2) {
            $("#alarmregion").append("<div class='listNum fl listRedNum'><div class='numText redNumText'>" + value.redAlarm.substring(0, 1) + "</div></div><div class='listNum fl'><div class='numText'>" + value.redAlarm.substring(1, 2) + "</div></div>");
          }
        });
      });
    }

  });
}


//获取昨日本省游客前十城市信息函数
function getProvinceYesterdayVisitors () {
  $("#tenCityPercentArea").empty();
  var arrCities = [];//前十城市
  var ayyCitiesNum = [];//前十城市游客数量
  var alltourists = '';//游客总数
  var touristPercent = [];//前十游客数量占比
  var countyCity = simple_name;
  if (flag == "2") {//flag为2表示为区县，则需要根据区县id获取其城市名供地图目的地范围使用
    $.ajax({
      url: basePath + "/bigScreenYesterdayVisitors/getCountyCityName.html",
      dataType: "json",
      type: "POST",
      async: false,
      data: {
        areacode: areacode,
        flag: flag
      },
      success: function (data) {
        countyCity = data.cities.substring(0, data.cities.length - 1);
      }
    });
  }
  $.ajax({
    type: "post",
    async: false, //同步执行
    url: basePath + "/bigScreenYesterdayVisitors/getProvinceYesterdayVisitors.html",
    data: {
      areacode: areacode,
      flag: flag
    },
    dataType: "json", //返回数据形式为json
    success: function (result) {
      if (result) {
        var yesterdayVisitors = result.data;
        if (yesterdayVisitors.length > 0) {
          alltourists = yesterdayVisitors[0].alltourists;
          for (var i = 0; i < yesterdayVisitors.length; i++) {
            arrCities.push(yesterdayVisitors[i].cities);
            ayyCitiesNum.push(yesterdayVisitors[i].tourist);
            touristPercent.push((yesterdayVisitors[i].tourist / alltourists * 100).toFixed(1));
          }
        }
        //将前十城市显示在地图上
        $("#cityNamelaArea").addClass("areaHide");
        $("#cityNamefuyangArea").addClass("areaHide");
        $("#cityNamebozhouArea").addClass("areaHide");
        $("#cityNamesuzhouArea").addClass("areaHide");
        $("#cityNamechuzhouArea").addClass("areaHide");
        $("#cityNamexuanchengArea").addClass("areaHide");
        $("#cityNamehuangshanArea").addClass("areaHide");
        $("#cityNameanqingArea").addClass("areaHide");
        $("#cityNamemaanshanArea").addClass("areaHide");
        $("#cityNamehefeiArea").addClass("areaHide");
        $("#cityNametonglingArea").addClass("areaHide");
        $("#cityNamebengbuArea").addClass("areaHide");
        $("#cityNamehuaibeiArea").addClass("areaHide");
        $("#cityNamewuhuArea").addClass("areaHide");
        $("#cityNamechizhouArea").addClass("areaHide");
        $("#cityNamehuainanArea").addClass("areaHide");
        if (countyCity == '六安') {
          $("#cityNamela").html(simple_name);
          $("#cityNamelaArea").removeClass("areaHide");
        } else if (countyCity == '阜阳') {
          $("#cityNamefuyang").html(simple_name);
          $("#cityNamefuyangArea").removeClass("areaHide");
        } else if (countyCity == '亳州') {
          $("#cityNamebozhou").html(simple_name);
          $("#cityNamebozhouArea").removeClass("areaHide");
        } else if (countyCity == '宿州') {
          $("#cityNamesuzhou").html(simple_name);
          $("#cityNamesuzhouArea").removeClass("areaHide");
        } else if (countyCity == '滁州') {
          $("#cityNamechuzhou").html(simple_name);
          $("#cityNamechuzhouArea").removeClass("areaHide");
        } else if (countyCity == '宣城') {
          $("#cityNamexuancheng").html(simple_name);
          $("#cityNamexuanchengArea").removeClass("areaHide");
        } else if (countyCity == '阜阳') {
          $("#cityNamechizhou").html(simple_name);
          $("#cityNamechizhouArea").removeClass("areaHide");
        } else if (countyCity == '黄山') {
          $("#cityNamehuangshan").html(simple_name);
          $("#cityNamehuangshanArea").removeClass("areaHide");
        } else if (countyCity == '安庆') {
          $("#cityNameanqing").html(simple_name);
          $("#cityNameanqingArea").removeClass("areaHide");
        } else if (countyCity == '马鞍山') {
          $("#cityNamemaanshan").html(simple_name);
          $("#cityNamemaanshanArea").removeClass("areaHide");
        } else if (countyCity == '合肥') {
          $("#cityNamehefei").html(simple_name);
          $("#cityNamehefeiArea").removeClass("areaHide");
        } else if (countyCity == '铜陵') {
          $("#cityNametongling").html(simple_name);
          $("#cityNametonglingArea").removeClass("areaHide");
        } else if (countyCity == '蚌埠') {
          $("#cityNamebengbu").html(simple_name);
          $("#cityNamebengbuArea").removeClass("areaHide");
        } else if (countyCity == '淮北') {
          $("#cityNamehuaibei").html(simple_name);
          $("#cityNamehuaibeiArea").removeClass("areaHide");
        } else if (countyCity == '芜湖') {
          $("#cityNamewuhu").html(simple_name);
          $("#cityNamewuhuArea").removeClass("areaHide");
        } else if (countyCity == '池州') {
          $("#cityNamechizhou").html(simple_name);
          $("#cityNamechizhouArea").removeClass("areaHide");
        } else if (countyCity == '淮南') {
          $("#cityNamehuainan").html(simple_name);
          $("#cityNamehuainanArea").removeClass("areaHide");
        }

        $("#cityNamelanArea").addClass("areaHide");
        $("#cityNamefyArea").addClass("areaHide");
        $("#cityNamebzArea").addClass("areaHide");
        $("#cityNameszArea").addClass("areaHide");
        $("#cityNameczArea").addClass("areaHide");
        $("#cityNamexcArea").addClass("areaHide");
        $("#cityNamehsArea").addClass("areaHide");
        $("#cityNameaqArea").addClass("areaHide");
        $("#cityNamemasArea").addClass("areaHide");
        $("#cityNamehfArea").addClass("areaHide");
        $("#cityNametlArea").addClass("areaHide");
        $("#cityNamebbArea").addClass("areaHide");
        $("#cityNamehbArea").addClass("areaHide");
        $("#cityNamewhArea").addClass("areaHide");
        $("#cityNamecziArea").addClass("areaHide");
        $("#cityNamehnArea").addClass("areaHide");
        for (var i = 0; i < arrCities.length; i++) {
          if (arrCities[i] == '阜阳市') {
            $("#cityNamefyArea").removeClass("areaHide");
            $("#cityNamefy").html(arrCities[i].substring(0, arrCities[i].length - 1) + ":" + touristPercent[i] + "%");
          } else if (arrCities[i] == '六安市') {
            $("#cityNamelanArea").removeClass("areaHide");
            $("#cityNamelan").html(arrCities[i].substring(0, arrCities[i].length - 1) + ":" + touristPercent[i] + "%");
          } else if (arrCities[i] == '亳州市') {
            $("#cityNamebzArea").removeClass("areaHide");
            $("#cityNamebz").html(arrCities[i].substring(0, arrCities[i].length - 1) + ":" + touristPercent[i] + "%");
          } else if (arrCities[i] == '宿州市') {
            $("#cityNameszArea").removeClass("areaHide");
            $("#cityNamesz").html(arrCities[i].substring(0, arrCities[i].length - 1) + ":" + touristPercent[i] + "%");
          } else if (arrCities[i] == '滁州市') {
            $("#cityNameczArea").removeClass("areaHide");
            $("#cityNamecz").html(arrCities[i].substring(0, arrCities[i].length - 1) + ":" + touristPercent[i] + "%");
          } else if (arrCities[i] == '宣城市') {
            $("#cityNamexcArea").removeClass("areaHide");
            $("#cityNamexc").html(arrCities[i].substring(0, arrCities[i].length - 1) + ":" + touristPercent[i] + "%");
          } else if (arrCities[i] == '黄山市') {
            $("#cityNamehsArea").removeClass("areaHide");
            $("#cityNamehs").html(arrCities[i].substring(0, arrCities[i].length - 1) + ":" + touristPercent[i] + "%");
          } else if (arrCities[i] == '安庆市') {
            $("#cityNameaqArea").removeClass("areaHide");
            $("#cityNameaq").html(arrCities[i].substring(0, arrCities[i].length - 1) + ":" + touristPercent[i] + "%");
          } else if (arrCities[i] == '马鞍山市') {
            $("#cityNamemasArea").removeClass("areaHide");
            $("#cityNamemas").html(arrCities[i].substring(0, arrCities[i].length - 1) + ":" + touristPercent[i] + "%");
          } else if (arrCities[i] == '合肥市') {
            $("#cityNamehfArea").removeClass("areaHide");
            $("#cityNamehf").html(arrCities[i].substring(0, arrCities[i].length - 1) + ":" + touristPercent[i] + "%");
          } else if (arrCities[i] == '铜陵市') {
            $("#cityNametlArea").removeClass("areaHide");
            $("#cityNametl").html(arrCities[i].substring(0, arrCities[i].length - 1) + ":" + touristPercent[i] + "%");
          } else if (arrCities[i] == '蚌埠市') {
            $("#cityNamebbArea").removeClass("areaHide");
            $("#cityNamebb").html(arrCities[i].substring(0, arrCities[i].length - 1) + ":" + touristPercent[i] + "%");
          } else if (arrCities[i] == '淮北市') {
            $("#cityNamehbArea").removeClass("areaHide");
            $("#cityNamehb").html(arrCities[i].substring(0, arrCities[i].length - 1) + ":" + touristPercent[i] + "%");
          } else if (arrCities[i] == '芜湖市') {
            $("#cityNamewhArea").removeClass("areaHide");
            $("#cityNamewh").html(arrCities[i].substring(0, arrCities[i].length - 1) + ":" + touristPercent[i] + "%");
          } else if (arrCities[i] == '池州市') {
            $("#cityNamecziArea").removeClass("areaHide");
            $("#cityNameczi").html(arrCities[i].substring(0, arrCities[i].length - 1) + ":" + touristPercent[i] + "%");
          } else if (arrCities[i] == '淮南市') {
            $("#cityNamehnArea").removeClass("areaHide");
            $("#cityNamehn").html(arrCities[i].substring(0, arrCities[i].length - 1) + ":" + touristPercent[i] + "%");
          } else {

          }
        }
        $(".ten").css("display", "none");
        //将前十城市占比显示在大屏上
        if (touristPercent.length > 0) {
          for (var i = 0; i < touristPercent.length; i++) {
            $("#tenCityPercentArea").append("<li class='tenList clearfix'>"
              + "<div class='tenNum fl'>" + (i + 1) + " </div>"
              + "<div class='tenName fl'>" + arrCities[i].substring(0, arrCities[i].length - 1) + " " + touristPercent[i] + "%</div>"
              + "</li>");
          }
        } else {
          $("#tenCityPercentArea").append("<li class='tenList clearfix'>"
            + "<div class='tenNum fl'></div>"
            + "<div class='tenName fl'>城市排名等待更新</div>"
            + "</li>");
        }
        $(".ten").fadeIn(1500);
      }
    }
  });
}

function format_number (n) {
  var b = parseInt(n).toString();
  var len = b.length;
  if (len <= 3) { return b; }
  var r = len % 3;
  return r > 0 ? b.slice(0, r) + "," + b.slice(r, len).match(/\d{3}/g).join(",") : b.slice(r, len).match(/\d{3}/g).join(",");
}
// var provinceStatus=1;


function changeProvince (val) {
  if (val === 0) {
    $("#province0").removeClass("switchButton1_2");
    $("#province0").addClass("switchButton1_1");
    $("#province1").removeClass("switchButton2_1");
    $("#province1").addClass("switchButton2_2");
    $("#province2").removeClass("switchButton3_1");
    $("#province2").addClass("switchButton3_2");
    
    $("#ben_sheng_body").show();
    $("#wai_sheng_body").hide();
    $("#quan_guo_body").hide();
    $('#ahmap').attr('src',basePath+'/bigScreen/ahmap.jsp');

    $('#chinamap2').attr('src','');

    $('#chinamap3').attr('src','');
    // $("#ben_sheng_body").attr("src",basePath +'bigScreen/ahmap.jsp'); 
  } else if(val === 1){
    $("#province0").removeClass("switchButton1_1");
    $("#province0").addClass("switchButton1_2");
    $("#province1").removeClass("switchButton2_2");
    $("#province1").addClass("switchButton2_1");
    $("#province2").removeClass("switchButton3_1");
    $("#province2").addClass("switchButton3_2");
    // $("#ben_sheng_body").attr("src",basePath +'bigScreen/chinamap.jsp'); 
    if(!$('#chinamap').attr('src')){
      $('#chinamap').attr('src',basePath+'/bigScreen/chinamap.jsp');
    }
    $('#ahmap').attr('src','');
    $('#chinamap2').attr('src','');
    $("#ben_sheng_body").hide();
    $("#wai_sheng_body").show();
    $("#quan_guo_body").hide();

  }else {
    $("#province0").removeClass("switchButton1_1");
    $("#province0").addClass("switchButton1_2");
    $("#province1").removeClass("switchButton2_1");
    $("#province1").addClass("switchButton2_2");
    $("#province2").removeClass("switchButton3_2");
    $("#province2").addClass("switchButton3_1");
    // // $("#ben_sheng_body").attr("src",basePath +'bigScreen/chinamap.jsp'); 
    if(!$('#chinamap2').attr('src')){
      $('#chinamap2').attr('src',basePath+'/bigScreen/toptencity_map.jsp');
    }``
    $('#chinamap').attr('src','');
    $('#ahmap').attr('src','');
    $("#quan_guo_body").show();
    $("#ben_sheng_body").hide();
    $("#wai_sheng_body").hide();
  }

}