<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
.label{float:left;width:120px;}
.infobox{width:200px;}
.error{color:red; padding-left:10px;}
div{padding:5px;}
</style>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.error').hide();
		$('.infobox').each(function(){
			$(this).blur(function(){
				var data=$(this).val();
				var len=data.length;
				if(len<1){
					$(this).parent().find('.error').show();
				}
				else{
					$(this).parent().find('.error').hide();
				}
			});
		});
	});
</script>
</head>
<body>
	<div>
		<span class="label">User Id*</span><input type="text" class="infobox"
			name="userid" /><span class="error">This field cannot be blank</span>
	</div>
	<div>
		<span class="label">Password*</span><input type="password"
			class="infobox" name="password" /><span class="error">This
			field cannot be blank</span>
	</div>
</body>
</html>