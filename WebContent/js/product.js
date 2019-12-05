$(function(){
	//鼠标移入显示
	$('.product-item-preview').each(function (index,element) {
		$(element).mouseenter(function () {
		   //$("#content").show();
			$(element).find('.product-item-dark').removeClass('opacity-0');
			$(element).find('.product-item-cart').removeClass('opacity-0');
			$(element).find('.product-item-detail').removeClass('opacity-0');
		})
	})
   $('.product-item-preview').each(function (index,element) {
   	$(element).mouseleave(function () {
   	   //$("#content").show();
   		$(element).find('.product-item-dark').addClass('opacity-0');
   		$(element).find('.product-item-cart').addClass('opacity-0');
   		$(element).find('.product-item-detail').addClass('opacity-0');
   	})
   })
   
	$('.num').each(function() {
		$(this).keyup(function() {
			var price = $(this).prev().val();
			var count = $(this).val();
			var total = price * count;
			$(this).parent().next().html("totalPrice:" + total.toFixed(2));
			$(this).parent().next().next().val(total.toFixed(2))
		})
	});
	
	
	
})