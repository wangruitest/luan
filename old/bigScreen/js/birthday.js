(function(a){a.extend({ms_DatePicker:function(c){var h={YearSelector:"#holidayYearSel",MonthSelector:"#holidayMonSel",DaySelector:"#holidayDaySel",FirstText:"请选择",FirstValue:0};var j=a.extend({},h,c);var t=a(j.YearSelector);var k=a(j.MonthSelector);var b=a(j.DaySelector);var d=j.FirstText;var r=j.FirstValue;var n='<option value="'+r+'">'+d+"</option>";var l='<option value="'+r+'">请选择年份</option>';t.html(l);k.html(n);b.html(n);var o=new Date().getFullYear();var g=document.getElementById("holidayYearSel");for(var p=0;p<=4;p++){var m=document.createElement("option");m.innerHTML=currentYear+p+" 年";m.value=currentYear+p;select.appendChild(m)}var f=k.attr("rel");for(var p=1;p<=12;p++){var s=f==p?"selected":"";if(p<10){p="0"+p}var e='<option value="'+p+'" '+s+">"+p+"</option>";k.append(e)}function q(){if(t.val()==0||k.val()==0){b.html(n);b.select2("val","0")}else{b.html(n);var y=parseInt(t.val());var A=parseInt(k.val());var z=0;switch(A){case 1:case 3:case 5:case 7:case 8:case 10:case 12:z=31;break;case 4:case 6:case 9:case 11:z=30;break;case 2:z=28;if((y%4==0)&&(y%100!=0)||(y%400==0)){z=29}break;default:break}var u=b.attr("rel");for(var w=1;w<=z;w++){var v=u==w?"selected":"";if(w<10){w="0"+w}var x='<option value="'+w+'" '+v+">"+w+"</option>";b.append(x);b.select2("val","0")}}}k.change(function(){q()});t.change(function(){q()});if(b.attr("rel")!=""){q()}}})})(jQuery);