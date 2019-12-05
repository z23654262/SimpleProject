function count_change(idV, numV) {
	var url = getRootPath()+"/user/updateCart";
    $.ajax({
		url: url,
		type: 'POST',
		data: {
			id: idV,
			num: numV
		},
		success: function(result) {},
		error: function(result) {
			alert("error")
		}
	}) 
}

function getRootPath() {
	    // 1、获取当前全路径，如： http://localhost:8080/springmvc/page/frame/test.html
	    var curWwwPath = window.location.href;
	    // 获取当前相对路径： /springmvc/page/frame/test.html
	    var pathName = window.location.pathname;    // 获取主机地址,如： http://localhost:8080
	    var local = curWwwPath.substring(0,curWwwPath.indexOf(pathName));  
	    // 获取带"/"的项目名，如：/springmvc  
	    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);  
	    var rootPath = local + projectName;  
	    return rootPath; 
}

function count_minus(obj) {
	var next = $(obj).next();
	var id = $(next).attr('value')
	var count = $(next).html()
	var total = parseInt(count) - 1
	if (total != 0) {
		$(next).html(total)
		$(next).prev().prev().val(total)
		count_change(id, total)
		priceChange($(obj).parent().next())
		calcTotal()
	}
}

function count_plus(obj) {
	var prev = $(obj).prev();
	var id = $(prev).attr('value')
	var count = $(prev).html()
	var total = parseInt(count) + 1
	$(prev).html(total)
	$(prev).prev().prev().val(total)
	count_change(id, total)
	priceChange($(obj).parent().next())
	calcTotal()
}

function pass() {
	var length = $(".checkCart").length
	var checked = 0
	console.log(length)
	$(".checkCart").each(function() {
		if ($(this).prop("checked")) {
			checked++
		}
	})
	if (0 != checked) return true
	alert("请至少选中一个商品")
	return false;
}

function priceChange(obj) {
	var singlePrice = $(obj).prev().prev().html()
	var count = $(obj).prev().find('.count').html()
	$(obj).children('span').html((singlePrice * count).toFixed(2))
}

function calcTotal() {
	var totalPrice = 0;
	$(".cart-content-item-payment").each(function() {
		var checkBox = $(this).parent().find('.cart-content-item-select').children('input');
		if ($(checkBox).is(':checked')) {
			totalPrice += parseFloat($(this).children('span').html())
		}
	})
	$('#totalPrice').html('totalPrice:' + totalPrice)
	console.log($('#totalPrice').next())
	$('#totalPrice').next().val(totalPrice)
}

calcTotal()

$(document).on("click", "#checkAll", function() {
	$(".checkCart").prop("checked", $(this).prop("checked")) //多选框的状态与全选框状态保持一致
	if ($('#checkAll').is(':checked')) {
		$(".num").each(function() {
			$(this).attr('name', 'num');
		})
		$(".id").each(function() {
			$(this).attr('name', 'id');
		})
	} else {
		$(".num").each(function() {
			$(this).attr('name', 'num1');
		})
		$(".id").each(function() {
			$(this).attr('name', 'id1');
		})
	}
	setTimeout(function() {
		calcTotal()
	}, 10);
})

$(document).ready(function() {
	$(".checkCart").each(function() {
		$(this).click(function() {
			calcTotal()
			if (!$(this).prop("checked")) { //多选框有一个未选中 全选变为未选中状态
				$("#checkAll").prop("checked", false)
				$(this).parent().parent().find('.num').attr('name', 'num1')
				$(this).parent().parent().find('.id').attr('name', 'id1')
			} else if ($(this).prop("checked")) {
				$(this).parent().parent().find('.num').attr('name', 'num')
				$(this).parent().parent().find('.id').attr('name', 'id')
				$(".checkCart").each(function(index, ele) {
					if ($(this).prop("checked")) {
						if (index == $(".checkCart").length - 1) {
							$("#checkAll").prop("checked", true) //多选框全部选中 全选变为选中状态
						}
						return true //each()跳过本次循环
					} else {
						return false //each()跳出循环
					}
				})
			}
		})
	})
});
