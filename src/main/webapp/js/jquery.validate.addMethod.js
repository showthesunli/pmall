// JavaScript Document
//手机验证
$.validator.addMethod("isPhone", function (value, element) {
        var phone = $("#phone").val();// 手机号码
        var phoneRule = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0-9]|170)\d{8}$/;

        // 手机号码错误
        if (!phoneRule.test(phone))
            return false;
        return true;
    }, "ignore");

//真实姓名
$.validator.addMethod("isRealName", function (value, element) {
        var name = $("#memberName").val();// 手机号码
        var nameRule=/^[\u4e00-\u9fa5]{1,10}|[a-zA-Z]{1,20}$/;

        // 姓名错误
        if (!nameRule.test(name) && name != '')
            return false;
        return true;
    }, "ignore");
    
    
//QQ验证
$.validator.addMethod("isQQ", function (value, element) {
		var qq = $("#QQ").val();// 手机号码
        var qqRule = /^[1-9][0-9]{4,9}$/;

        // QQ号码错误
        if (!qqRule.test(qq))
            return false;
        return true;
    }, "ignore");

// 身份证号码验证
jQuery.validator.addMethod("isIdCardNo", function(value, element) {return this.optional(element) || idCardNoUtil.checkIdCardNo(value);}, "请正确输入您的身份证号码");
var idCardNoUtil = {  
	provinceAndCitys: {
		11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"
	},
	powers: ["7","9","10","5","8","4","2","1","6","3","7","9","10","5","8","4","2"],
	parityBit: ["1","0","X","9","8","7","6","5","4","3","2"],
	genders: {male:"男",female:"女"},
	checkAddressCode: function(addressCode){
		var check = /^[1-9]\d{5}$/.test(addressCode);
		if(!check) return false;
		if(idCardNoUtil.provinceAndCitys[parseInt(addressCode.substring(0,2))]){return true;}
		else{return false;}
	},
	checkBirthDayCode: function(birDayCode){
		var check = /^[1-9]\d{3}((0[1-9])|(1[0-2]))((0[1-9])|([1-2][0-9])|(3[0-1]))$/.test(birDayCode);
		if(!check) return false;
		var yyyy = parseInt(birDayCode.substring(0,4),10);
		var mm = parseInt(birDayCode.substring(4,6),10);
		var dd = parseInt(birDayCode.substring(6),10);
		var xdata = new Date(yyyy,mm-1,dd);
		if(xdata > new Date()){return false;}//生日不能大于当前日期
		else if ( ( xdata.getFullYear() == yyyy ) && ( xdata.getMonth () == mm - 1 ) && ( xdata.getDate() == dd ) ){return true;}
		else{return false;}
	},
	getParityBit: function(idCardNo){
		var id17 = idCardNo.substring(0,17);  
		var power = 0;
		for(var i=0;i<17;i++){power += parseInt(id17.charAt(i),10) * parseInt(idCardNoUtil.powers[i]);}  
		var mod = power % 11;
		return idCardNoUtil.parityBit[mod];
	},
	checkParityBit: function(idCardNo){
		var parityBit = idCardNo.charAt(17).toUpperCase();
		if(idCardNoUtil.getParityBit(idCardNo) == parityBit){return true;}
		else{return false;}
	},
	checkAddressCode: function(addressCode){
		var check = /^[1-9]\d{5}$/.test(addressCode);
		if(!check) return false;
		if(idCardNoUtil.provinceAndCitys[parseInt(addressCode.substring(0,2))]){return true;}
		else{return false;}
	},
	checkBirthDayCode: function(birDayCode){
		var check = /^[1-9]\d{3}((0[1-9])|(1[0-2]))((0[1-9])|([1-2][0-9])|(3[0-1]))$/.test(birDayCode);
		if(!check) return false;
		var yyyy = parseInt(birDayCode.substring(0,4),10);
		var mm = parseInt(birDayCode.substring(4,6),10);
		var dd = parseInt(birDayCode.substring(6),10);
		var xdata = new Date(yyyy,mm-1,dd);
		if(xdata > new Date()){return false;}//生日不能大于当前日期
		else if ( ( xdata.getFullYear() == yyyy ) && ( xdata.getMonth () == mm - 1 ) && ( xdata.getDate() == dd ) ){return true;}
		else{return false;}
	},
	checkIdCardNo: function(idCardNo){
		//15位和18位身份证号码的基本校验
		var check = /^\d{15}|(\d{17}(\d|x|X))$/.test(idCardNo);if(!check) return false;
		//判断长度为15位或18位
		if(idCardNo.length==15){return idCardNoUtil.check15IdCardNo(idCardNo);}
		else if(idCardNo.length==18){return idCardNoUtil.check18IdCardNo(idCardNo);}
		else{return false;}
	},
	//校验15位的身份证号码
	check15IdCardNo: function(idCardNo){
		//15位身份证号码的基本校验
		var check = /^[1-9]\d{7}((0[1-9])|(1[0-2]))((0[1-9])|([1-2][0-9])|(3[0-1]))\d{3}$/.test(idCardNo);
		if(!check) return false;
		//校验地址码
		var addressCode = idCardNo.substring(0,6);
		check = idCardNoUtil.checkAddressCode(addressCode);
		if(!check) return false;
		var birDayCode = '19' + idCardNo.substring(6,12);
		//校验日期码
		return idCardNoUtil.checkBirthDayCode(birDayCode);
	},
	//校验18位的身份证号码
	check18IdCardNo: function(idCardNo){
		//18位身份证号码的基本格式校验
		var check = /^[1-9]\d{5}[1-9]\d{3}((0[1-9])|(1[0-2]))((0[1-9])|([1-2][0-9])|(3[0-1]))\d{3}(\d|x|X)$/.test(idCardNo);
		if(!check) return false;
		//校验地址码
		var addressCode = idCardNo.substring(0,6);
		check = idCardNoUtil.checkAddressCode(addressCode);
		if(!check) return false;
		//校验日期码
		var birDayCode = idCardNo.substring(6,14);
		check = idCardNoUtil.checkBirthDayCode(birDayCode);
		if(!check) return false;
		//验证校检码
		return idCardNoUtil.checkParityBit(idCardNo);
	},  
	formateDateCN: function(day){
		var yyyy =day.substring(0,4);
		var mm = day.substring(4,6);
		var dd = day.substring(6);
		return yyyy + '-' + mm +'-' + dd;
	},
	getId15:function(idCardNo){
		if(idCardNo.length==15){return idCardNo;}
		else if(idCardNo.length==18){return idCardNo.substring(0,6) + idCardNo.substring(8,17);}
		else{return null;}
	},
	getId18: function(idCardNo){
		if(idCardNo.length==15){
			var id17 = idCardNo.substring(0,6) + '19' + idCardNo.substring(6);
			var parityBit = idCardNoUtil.getParityBit(id17);
			return id17 + parityBit;
		}
		else if(idCardNo.length==18){return idCardNo;}
		else{return null;}
	}
};