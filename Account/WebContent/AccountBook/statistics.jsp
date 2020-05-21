<!-- 그래프 https://www.amcharts.com/demos/simple-pie-chart/ 참조  -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="lib/header.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

Calendar cal1= Calendar.getInstance();
Calendar cal2= Calendar.getInstance();
cal1.setTime(new Date());//지난 달
cal2.setTime(new Date());//현재 달
DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
cal1.add(Calendar.MONTH, -1);

String date1=request.getParameter("inDate1");
String date2=request.getParameter("inDate2");
if(date1==null||date1.length()==0) date1 = df.format(cal1.getTime());
if(date2==null||date2.length()==0) date2 = df.format(cal2.getTime());

if(!userID.equals("guest")){
	int liveCnt = 0, studyCnt = 0, drinkCnt = 0, outEscCnt = 0;
	int allowanceCnt = 0, salaryCnt = 0, inEscCnt = 0;
	int inMoney=0, outMoney=0;
	
	String strSQL = "Select sum(CASE WHEN money='지출' THEN price END) as outMoney,";
	strSQL += "sum(CASE WHEN money='입금' THEN price END) as inMoney,";
	strSQL += "sum(CASE WHEN category='생활' THEN price END) as liveCnt,";
	strSQL += "sum(CASE WHEN category='교육' THEN price END) as studyCnt,";
	strSQL += "sum(CASE WHEN category='음주' THEN price END) as drinkCnt,";
	strSQL += "sum(CASE WHEN money='지출' and category='기타' THEN price END) as outEscCnt,";
	strSQL += "sum(CASE WHEN category='용돈' THEN price END) as allowanceCnt,";
	strSQL += "sum(CASE WHEN category='월급' THEN price END) as salaryCnt,";
	strSQL += "sum(CASE WHEN money='입금' and category='기타' THEN price END) as inEscCnt ";
	strSQL += "From account where id='"+userID+"' and date between '"+date1+"' and '"+date2+"';";
	//out.print(strSQL);
	
	Connection conn = new DBConnection().getConnection();
	Statement stmt = null;
	ResultSet rs = null;
	if(conn!=null){
		stmt = conn.createStatement();
		rs = stmt.executeQuery(strSQL);
		if(rs.next()){ 
			outMoney = rs.getInt("outMoney");
			inMoney = rs.getInt("inMoney");
			liveCnt = rs.getInt("liveCnt");
			studyCnt = rs.getInt("studyCnt");
			drinkCnt = rs.getInt("drinkCnt");
			outEscCnt = rs.getInt("outEscCnt");
			allowanceCnt = rs.getInt("allowanceCnt");
			salaryCnt = rs.getInt("salaryCnt");
			inEscCnt = rs.getInt("inEscCnt");
		}
	}
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	if(conn!=null) conn.close();
%>
<script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end

// Create chart instance
var outChart = am4core.create("outChart", am4charts.PieChart);
var inChart = am4core.create("inChart", am4charts.PieChart);

// Add data
outChart.data = [ { "detail": "생활", "ratio": <%=liveCnt%> }, 
	{ "detail": "교육","ratio": <%=studyCnt%> }, 
	{ "detail": "음주","ratio": <%=drinkCnt%> }, 
	{ "detail": "기타","ratio": <%=outEscCnt%> } ];
	
inChart.data = [ { "detail": "용돈", "ratio": <%=allowanceCnt%> }, 
	{ "detail": "월급","ratio": <%=salaryCnt%> }, 
	{ "detail": "기타","ratio": <%=inEscCnt%> } ];

// Add and configure Series
var outPieSeries = outChart.series.push(new am4charts.PieSeries());
outPieSeries.dataFields.value = "ratio";
outPieSeries.dataFields.category = "detail";
outPieSeries.slices.template.stroke = am4core.color("#fff");
outPieSeries.slices.template.strokeWidth = 2;
outPieSeries.slices.template.strokeOpacity = 1;

// This creates initial animation
outPieSeries.hiddenState.properties.opacity = 1;
outPieSeries.hiddenState.properties.endAngle = -90;
outPieSeries.hiddenState.properties.startAngle = -90;

var inPieSeries = inChart.series.push(new am4charts.PieSeries());
inPieSeries.dataFields.value = "ratio";
inPieSeries.dataFields.category = "detail";
inPieSeries.slices.template.stroke = am4core.color("#fff");
inPieSeries.slices.template.strokeWidth = 2;
inPieSeries.slices.template.strokeOpacity = 1;

// This creates initial animation
inPieSeries.hiddenState.properties.opacity = 1;
inPieSeries.hiddenState.properties.endAngle = -90;
inPieSeries.hiddenState.properties.startAngle = -90;

}); // end am4core.ready()
</script>

<div align="center" class="accountDiv">
   	<table class="accountTable">
   		<tr class="title"><td colspan="3"> 통계 </td></tr>
   		<tr>
   			<td colspan="4" class="date">
   				<input type="date" name="date1" value="<%=date1%>"/>
   				~
   				<input type="date" name="date2" value="<%=date2%>"/>
   				<input type="button" class="accountButton" value="조회" onclick="javascript:restatistics();"/>
   			</td>
   		</tr>
 	</table>
	<div class="outChartDiv">
		<div class="chartTitle"><p>지출 : <%=formatter.format(outMoney) %>원</p></div>
		<div align="center" id="outChart">
		</div>
	</div>
	<div class="inChartDiv">
		<div class="chartTitle"><p>입금 : <%=formatter.format(inMoney) %>원</p></div>
		<div align="center" id="inChart">
		</div>
	</div>
</div>
<%	}
	else{
		out.print("<script>alert('로그인 해주세요');</script>");
		//out.print("<script>location.href='index.jsp';</script>");
		out.print("<script>location.replace('index.jsp');</script>");
	}
%>
<%@ include file="lib/footer.jsp" %>