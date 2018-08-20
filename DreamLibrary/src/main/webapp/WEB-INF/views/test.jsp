<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Table(tr) Event</title>
</head>
	<script type="text/javascript">
		function changeTrColor(trObj, oldColor, newColor) {
			trObj.style.backgroundColor = newColor;
			trObj.onmouseout = function(){
				trObj.style.backgroundColor = oldColor;
			}
		}

		function clickTrEvent(trObj) {
			alert(trObj.id);
		}
	</script>
</head>
<body>
	<table border="1">
		<tr id="firstRow" onclick="javascript:clickTrEvent(this)"
			onmouseover="javascript:changeTrColor(this, '#FFFFFF', '#F4FFFD')"
			style="cursor:hand">
			<td>first row - 1</td>
			<td>first row - 2</td>
		</tr>
		<tr id="secondRow" onclick="javascript:clickTrEvent(this)"
			onmouseover="javascript:changeTrColor(this, '#FFFFFF', '#F4FFFD')"
			style="cursor:hand">
			<td>second row - 1</td>
			<td>second row - 2</td>
		</tr>
		<tr id="thirdRow" onclick="javascript:clickTrEvent(this)"
			onmouseover="javascript:changeTrColor(this, '#FFFFFF', '#F4FFFD')"
			style="cursor:hand">
			<td>third row - 1</td>
			<td>third row - 2</td>
		</tr>
	</table>
</body>
</html>
