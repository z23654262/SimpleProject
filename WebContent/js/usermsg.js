$(function(){
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
	
	$('#update-user-img').on('propertychange input', function(event) {
		var formData = new FormData()
		formData.append("file",$(this)[0].files[0])
		$.ajax({
			type:'POST',
			url:getRootPath()+"/user/updateUserImg",
			data:formData,
			contentType: false,// 注意：让jQuery不要处理数据
			processData: false,// 注意：让jQuery不要设置contentType
			success:function (msg) {
				window.location.reload()
			},
			error:function (mag) {
				console.log("上传失败，请重试")
				alert("上传失败，请重试")
				// window.location.reload();
			}
		});
	});
})