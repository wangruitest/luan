$.fn.validate = function(options) {
	var ErrorMessage = [];
	var ErrorItem = [];
	this.each( function() {
		if ($(this).attr("validation")) {
			var rules = $(this).attr("validation").split(";");
			for ( var r in rules) {
				var rule = $.validation.getRule(rules[r].toString().replace(/\(.*\)/, ""));// 校验规则
				if(rule==null)continue;
			var label = $(this).attr("label") || $(this).parent().prev().text().replace(/[×： *:]/ig,"");//取标签，且剔除星号、冒号(全角和半角)
			var elemValue = $(this).val();// 元素值--只支持具有value属性的元素
			var paramStr = rules[r].toString().match(/\(.*\)/);// 参数
			var result = true;
			if (paramStr) {// 带参
				var param = "label,elemValue," +paramStr[0].substr(1, paramStr[0].length - 2);
				result = eval("rule.check(" + param + ")");
			} else {
				result = eval("rule.check(label,elemValue)");
			}
			if (result) {
				ErrorMessage.push(result);
				ErrorItem.push($(this)[0]);
			}
		}
	}
})	;
	if (ErrorMessage.length > 0) {
		//showMsg(ErrorMessage.join("\n"));
		showMsg(ErrorMessage[0]);
		//ErrorItem[0].focus();
		return false;
	}
	return true;
};
( function($) {
	var validation = function() {
		var rules = { // Private object
			email : {
				check : function(label, value,errMsg) {
					if (value && testPattern(value, ".+@.+\..+")) {
						return null;
					}
					return errMsg||label+"必须为有效的邮件地址，请重新输入";
				}
			},
			require : {
				check : function(label, value,errMsg) {
					if (value&&$.trim(value.trim())!="") {
						return null;
					} else {
						return errMsg||"请输入"+label;
					}
				}
			},
			min : {
				check : function(label, value, minValue,errMsg) {
					minVal = minValue;
					if ((parseFloat(value) || 0) < minValue)
						return errMsg||label+"不能小于" + minValue + "，请重新输入";
					return null;
				}
			},
			max : {
				check : function(label, value, maxValue,errMsg) {
					maxVal = maxValue;
					if ((parseFloat(value) || 0) > maxValue)
						return errMsg||label+"不能大于" + maxValue + "，请重新输入";
					return null;
				}
			},
			maxlen: {
				check : function(label, value, maxValue,errMsg) {
					var lenB = value.replace(/[^\x00-\xff]/g,"**").length;
					if (lenB > maxValue)
						return errMsg||label+"不能超过" + maxValue/2 + "个中文或"+maxValue+"个英文，请重新输入";
					return null;
				}
			},
			phone : {
				check : function(label, value,errMsg) {
					if (value != null && value != "") {
						var reg = /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/;
						if (!reg.test(value)) {
							return errMsg||label+"格式不正确，请重新输入";
						} else {
							return null;
						}
					} else {
						return null;
					}
				}
			},
			mobile : {
				check : function(label, value, errMsg) {
					if (value != null && value != "") {
						var reg = /^((\(\d{3}\))|(\d{3}\-))?13[1234567890]\d{8}|14[1234567890]\d{8}|15[1234567890]\d{8}|18[1234567890]\d{8}$/;
						if (!reg.test(value)) {
							return errMsg||label+"必须为手机号码，请重新输入";
						} else {
							return null;
						}
					} else {
						return null;
					}
				}
			},
			url : {
				check : function(label, value, errMsg) {
					if (value != null && value != "") {
						var reg = /^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/;
						if (!reg.test(value)) {
							return errMsg||label+"必须为URL，请重新输入";
						} else {
							return null;
						}
					} else {
						return null;
					}
				}
			},
			ip : {
				check : function(label, value, errMsg) {
					if (value != null && value != "") {
						var reg = /^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])(\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])){3}$/;
						if (!reg.test(value)) {
							return errMsg||label+"必须为IP地址，请重新输入";
						} else {
							return null;
						}
					} else {
						return null;
					}
				}
			},
			ipDk : {
				check : function(label, value, errMsg) {
					var ipArray = value.split(":"); 
					if (value != null && value != "") {
						var reg = /^(([1-9]|([1-9]\d)|(1\d\d)|(2([0-4]\d|5[0-5])))\.)(([1-9]|([1-9]\d)|(1\d\d)|(2([0-4]\d|5[0-5])))\.){2}([1-9]|([1-9]\d)|(1\d\d)|(2([0-4]\d|5[0-5]))):\d{0,5}$/;
						if (!reg.test(value)) {
							return errMsg||label+"必须为IP地址，请重新输入";
						} else {
							return null;
						}
					} else {
						return null;
					}
				}
			},
			currency : {
				check : function(label, value, errMsg) {
					if (value != null && value != "") {
						var reg = /^\d+(\.\d+)?$/;
						if (!reg.test(value)) {
							return errMsg||label+"必须为货币金额，请重新输入";
						} else {
							return null;
						}
					} else {
						return null;
					}
				}
			},
			number : {
				check : function(label, value,errMsg) {
					if (value != null && value != "") {
						var reg = /^[1-9]\d*$/;
						if (!reg.test(value) && value !="0") {
							return errMsg||label+"必须为非负整数，请重新输入";
						} else {
							return null;
						}
					} else {
						return null;
					}
				}
			},
			between001to1:{
				check : function(label,value,errMsg){
					if(value != null && value != ""){
						var reg = /^0\.\d{1,2}$\d*$/;
						if(!reg.test(value)){
							return errMsg||label+"必须为0.01至0.99的数字，请重新输入";
						}else{
							return null;
						}
					}
				}
			},
			postcode : {
				check : function(label, value, errMsg) {
					if (value != null && value != "") {
						var reg = /^[1-9]\d{5}$/;
						if (!reg.test(value)) {
							return errMsg||label+"必须为邮政编码，请重新输入";
						} else {
							return null;
						}
					} else {
						return null;
					}
				}
			},
			qq : {
				check : function(label, value, errMsg) {
					if (value != null && value != "") {
						var reg = /^[1-9]\d{4,8}$/;
						if (!reg.test(value)) {
							return errMsg||label+"必须为QQ号码，请重新输入";
						} else {
							return null;
						}
					} else {
						return null;
					}
				}
			},
			integer : {
				check : function(label, value, errMsg) {
					if (value != null && value != "") {
						var reg = /^[-\+]?\d+$/;
						if (!reg.test(value)) {
							return errMsg||label+"必须为整数，请重新输入";
						} else {
							return null;
						}
					} else {
						return null;
					}
				}
			},
			positiveInteger : {
				check : function(label, value, errMsg) {
					if (value != null && value != "") {
						var reg = /^\d+$/;
						if (!reg.test(value)) {
							return errMsg||label+"必须为正整数，请重新输入";
						} else {
							return null;
						}
					} else {
						return null;
					}
				}
			},
			float : {
				check : function(label, value, decimal, errMsg) {
					if (value != null && value != "") {
						//var reg = /^[-\+]?\d+(\.\d+)?$/;
						var exp="^[-\+]?\\d+(\\.\\d{0,"+decimal+"})?$";
						var reg = new RegExp(exp);
						if (!reg.test(value)) {
							if(decimal){
								return errMsg||label + "必须为保留"+decimal+"位小数点的浮点数，请重新输入";
							}
							return errMsg||label + "必须为浮点数，请重新输入";
						} else {
							return null;
						}
					} else {
						return null;
					}
				}
			},
			english : {
				check : function(label, value, errMsg) {
					if (value != null && value != "") {
						var reg = /^[A-Za-z]+$/;
						if (!reg.test(value)) {
							return errMsg||label+"必须为英文字母，请重新输入";
						} else {
							return null;
						}
					} else {
						return null;
					}
				}
			},
			chinese : {
				check : function(label, value, errMsg) {
					if (value != null && value != "") {
						var reg = /^[\u0391-\uFFE5]+$/;
						if (!reg.test(value)) {
							return errMsg||label+"必须为中文，请重新输入";
						} else {
							return null;
						}
					} else {
						return null;
					}
				}
			},
			username : {
				check : function(label, value, errMsg) {
					if (value != null && value != "") {
						var reg = /^[a-z]\w{3,}$/i;
						if (!reg.test(value)) {
							return errMsg||label+"必须为英文字母或英文字母加数字，请重新输入";
						} else {
							return null;
						}
					} else {
						return null;
					}
				}
			},
			safe : {
				check : function(label, value, errMsg) {
					if (value != null && value != "") {
						var reg = /^(([A-Z]*|[a-z]*|\d*|[-_\~!@#\$%\^&\*\.\(\)\[\]\{\}<>\?\\\/\'\"]*)|.{0,5})$|\s/;
						if (reg.test(value)) {
							return errMsg||label+"必须为字母加数字加特殊符，请重新输入";
						} else {
							return null;
						}
					} else {
						return null;
					}
				}
			},
			filter : {
				check : function(label, input, filter,errMsg) {
					var tst = new RegExp("^.+\.(?=EXT)(EXT)$".replace(/EXT/g, filter.split(/\s*,\s*/).join("|")), "gi")
							.test(input);
					if (!tst) {
						return errMsg||label+"必须为" + filter + "文件，请重新输入";
					} else {
						return null;
					}
				}
			},
			repeat : {
				check : function(label, value, target, targetLabel,errMsg) {
					var elem = document.getElementById(target);
					if (value != elem.value) {
						return errMsg||label+"必须与" + targetLabel + "相同，请重新输入";
					} else {
						return null;
					}
				}
			},
			idcard : {
				check : function(label, value, errMsg) {
					var number = value;
					var date, Ai;
					var verify = "10x98765432";
					var Wi = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 ];
					var area = [ '', '', '', '', '', '', '', '', '', '', '', '北京', '天津', '河北', '山西', '内蒙古', '', '', '',
							'', '', '辽宁', '吉林', '黑龙江', '', '', '', '', '', '', '', '上海', '江苏', '浙江', '安微', '福建', '江西',
							'山东', '', '', '', '河南', '湖北', '湖南', '广东', '广西', '海南', '', '', '', '重庆', '四川', '贵州', '云南',
							'西藏', '', '', '', '', '', '', '陕西', '甘肃', '青海', '宁夏', '新疆', '', '', '', '', '', '台湾', '',
							'', '', '', '', '', '', '', '', '香港', '澳门', '', '', '', '', '', '', '', '', '国外' ];
					var re = number
							.match(/^(\d{2})\d{4}(((\d{2})(\d{2})(\d{2})(\d{3}))|((\d{4})(\d{2})(\d{2})(\d{3}[x\d])))$/i);
					if (re == null)
						return false;
					if (re[1] >= area.length || area[re[1]] == "")
						return false;
					if (re[2].length == 12) {
						Ai = number.substr(0, 17);
						date = [ re[9], re[10], re[11] ].join("-");
					} else {
						Ai = number.substr(0, 6) + "19" + number.substr(6);
						date = [ "19" + re[4], re[5], re[6] ].join("-");
					}
					if (!this.IsDate(date, "ymd"))
						return false;
					var sum = 0;
					for ( var i = 0; i <= 16; i++) {
						sum += Ai.charAt(i) * Wi[i];
					}
					Ai += verify.charAt(sum % 11);
					var isIdCard = (number.length == 15 || number.length == 18 && number == Ai);

					if (!isIdCard) {
						return errMsg||label+"必须为正确的身份证号，请重新输入";
					} else {
						return null;
					}
				}
			},
			compare : {
				check : function(label, op1, operator, op2, errMsg) {
					var rzt = false;
					switch (operator) {
					case "!=":
						rzt = (op1 != op2);
					case ">":
						rzt = (op1 > op2);
					case ">=":
						rzt = (op1 >= op2);
					case "<":
						rzt = (op1 < op2);
					case "<=":
						rzt = (op1 <= op2);
					default:
						rzt = (op1 == op2);
					}
					if (!rzt) {
						return errMsg||label+"必须" + operator + "" + op2 + "，请重新输入";
					}
				}
			},
			range : {
				check : function(label, value, min, max,errMsg) {
					if (value.length>20) {
						return errMsg||label+"数字长度不能超过20位，请重新输入";
					}
					if (min > (value || 0) || (value || 0) > max) {
						return errMsg||label+"必须在" + min + "~" + max + "之间，请重新输入";
					} else {
						return null;
					}
				}
			},
			regexp : {
				check : function(label,op, reg,errMsg) {
					if (!(new RegExp(reg, "g").test(op))) {
						return errMsg||label+"不符合规则，请重新输入";
					} else {
						return null;
					}
				}
			},
			date : {
				check : function(label, value, format,errMsg) {
					if (value != null && value != "") {
						var fmat = format || "ymd";
						if (!IsDate(value, fmat)) {
							if (fmat == "ymd")
								return errMsg||label+"必须为日期类型(2006/01/01)，请重新输入";
							else
								return errMsg||label+"必须为日期类型(30/01/2006)，请重新输入";
						} else {
							return null;
						}
					} else {
						return null;
					}
				}
			},
			dateless : {
				check : function(label, value, e, targetLabel, errMsg) {
					var elem = document.getElementById(e);
					var date1 = new Date(Date.parse(value));
					var date2 = new Date(Date.parse(elem.value));
					if (date1 > date2) {
						return errMsg||label+"必须小于等于" + targetLabel + "，请重新输入";
					} else {
						return null;
					}
				}
			},
			before : {
				check : function(label, value, date, errMsg) {
					var date1 = new Date(Date.parse(value));
					var date2 = new Date();
					if (date)
						date2 = new Date(Date.parse(date));
					if (date1 > date2) {
						if (date)
							return errMsg||label+"必须小于等于" + date + "，请重新输入";
						else
							return errMsg||label+"必须小于等于今天，请重新输入";
					} else {
						return null;
					}
				}
			},
			inmonth : {
				check : function(label, value, e, targetLabel, errMsg) {
					var elem = document.getElementById(e);
					var date1 = new Date(Date.parse(value));
					var date2 = new Date(Date.parse(elem.value));
					if ((date1.getFullYear() == date2.getFullYear()) && (date1.getMonth() == date2.getMonth())) {
						return null;
					} else {
						return errMsg||label+"必须与" + targetLabel + "在同一个月内，请重新输入";
					}
				}
			}
		}

		var testPattern = function(value, pattern) { // Private Method
			var regExp = new RegExp("^" + pattern + "$", "");
			return regExp.test(value);
		}

		var IsDate = function(op, formatString) {
			formatString = formatString || "ymd";
			var m, year, month, day;
			switch (formatString) {
			case "ymd":
				m = op.match(new RegExp("^((\\d{4})|(\\d{2}))([/])(\\d{1,2})\\4(\\d{1,2})$"));
				if (m == null)
					return false;
				day = m[6];
				month = m[5] * 1;
				year = (m[2].length == 4) ? m[2] : GetFullYear(parseInt(m[3], 10));
				break;
			case "dmy":
				m = op.match(new RegExp("^(\\d{1,2})([/])(\\d{1,2})\\2((\\d{4})|(\\d{2}))$"));
				if (m == null)
					return false;
				day = m[1];
				month = m[3] * 1;
				year = (m[5].length == 4) ? m[5] : GetFullYear(parseInt(m[6], 10));
				break;
			default:
				break;
			}
			if (!parseInt(month))
				return false;
			month = month == 0 ? 12 : month;
			var date = new Date(year, month - 1, day);
			return (typeof (date) == "object" && year == date.getFullYear() && month == (date.getMonth() + 1) && day == date
					.getDate());
			function GetFullYear(y) {
				return ((y < 30 ? "20" : "19") + y) | 0;
			}
		}

		return { // public方法
			addRule : function(name, rule) {// 添加自定义规则
				rules[name] = rule;
			},
			getRule : function(name) {// 根据validation名称获取规则
				return rules[name];
			}
		}
	}
	$.validation = new validation();
})(jQuery);