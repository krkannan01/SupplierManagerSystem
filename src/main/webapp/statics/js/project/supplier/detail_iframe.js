jQuery(function($) {
    //$.getJSON("${pageContext.request.contextPath}/statics/json/defined_field.json", function(data) {
    $.post($ctx + "/supplier/getUserDefinedFieldName", function(data) {
        if (data) {
            var userDefinedFieldName = $(".userDefinedFieldName");
            userDefinedFieldName.eq(0).html(data.userDefinedFieldOneName);
            userDefinedFieldName.eq(1).html(data.userDefinedFieldTwoName);
            userDefinedFieldName.eq(2).html(data.userDefinedFieldThreeName);
            userDefinedFieldName.eq(3).html(data.userDefinedFieldFourName);
            userDefinedFieldName.eq(4).html(data.userDefinedFieldFiveName);
        }
    }, "json");



});

/*初始化信用级别栏样式*/
$("#level").raty({
    'cancel' : false,//是否可以取消 default:false
    'half': true,//是否可以选择半星 default:false
    'starType' : 'i',
    'score' : $("#level").attr("data-score"),
    'readOnly' : true,
    'hints' : ['坏', '不好', '合格', '好', '极好']
}).children("i").attr("style", "font-size: 18px;");
