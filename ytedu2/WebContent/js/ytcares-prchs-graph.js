
var chart = null;
function drawAccmPntChart(td, type) {
	if(td) {
		$('.right-tab-menu td').removeClass('select');
		$(td).addClass('select');
		$('#graphType').val(type);
	}
	 
	if(type == null || type == undefined) {
		type = $('#graphType').val();
	}
	var include_stlmnt_yn = $(':radio[name=include_stlmnt_yn]:checked').val();
	var accm_ym = $('#accm_ym').val();
	var param = {'include_stlmnt_yn':include_stlmnt_yn, 'accm_ym':accm_ym};
	if (type == 'monthly') {
			param.queryId = 'accm.selectMonthlyAccm';
			drawMonthlyAccmChart('accmPntGraph', param);
		} else if (type == 'agency') {
			param.queryId = 'accm.selectAccmPntByAgency';
			drawAgencyAccmChart('accmPntGraph', param);
		} else if (type == 'agemon') {
			param.queryId = 'accm.selectAccmPntListByAgency';
			drawAgenciesDailyChart('accmPntGraph', param);
		} else if (type == 'csmt') {
			param.queryId = 'accm.selectAccmPntByCsmt';
			drawCsmtAccmChart('accmPntGraph', param);
		}
	}
function drawCsmtAccmChart(divId, param) {
	$.ajax({
		url: '/YTCaresAccmPntGraph.do',
		asynch:false,
		cache:false,
		dataType: 'json',
		type:'POST',
		data:param,
		success: function(json){
			if (chart != null) chart.destroy();
		    var data 	= new Array(json.length);
			for (var i = 0; i < json.length; i++) {
				data[i]= [json[i].CSMT_ID, Number(json[i].ACCM_PNT)];
			}
			chart = $.jqplot(divId, [data], {
				seriesDefaults: {
					renderer: $.jqplot.PieRenderer,
			        rendererOptions: { 
						showDataLabels: true,
						sliceMargin:4,
						fill:true
					}
				}
			});
		},
		error:function(jqXHR, textStatus, err) {
			alert(err);
		}
	});
}


function drawAgenciesDailyChart(divId, param) {
	$.ajax({
		url: '/YTCaresAccmPntGraph.do',
		asynch:false,
		cache:false,
		dataType: 'json',
		type:'POST',
		data:param,
		success: function(json){
			if (chart != null) chart.destroy();
			//전체데이터
			var allData = [];
			//레전드(가맹점명)
			var arrAgencyName 	= [];
			var arrAccmDate		= [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31];
			//가맹점명 비교변수
			var agency_name = '';

			var maxAccmPnt	= 0;
			var tmpArr = null;
			for (var i = 0; i < json.length; i++) {
				if (json[i].AGENCY_NAME != agency_name) {
					if (agency_name != '') {
						allData[allData.length] = tmpArr;
					}
					tmpArr = new Array(32);

					agency_name = json[i].AGENCY_NAME;
					arrAgencyName[arrAgencyName.length] = {label:json[i].AGENCY_NAME};
				}
				
				var date		= parseInt(json[i].ACCM_DATE.split('-')[2], 10);
				tmpArr[date]	= json[i].ACCM_PNT;
				maxAccmPnt		= Math.max(maxAccmPnt, Number(json[i].ACCM_PNT));
			}
			
			chart = $.jqplot(divId, allData, {
				seriesDefaults: {
					rendererOptions:{
						smooth:true,
						showDataLabels: true
					}
				},
				axes:{
					xaxis: {
						renderer: $.jqplot.CategoryAxisRenderer,
						ticks: arrAccmDate,
						numberTicks : 31
					},
					yaxis : {
						max:(maxAccmPnt*1.1),
						numberTicks : 10
					}
				},
				highlighter : {
					show:true,
					showTooltip : true,
					fadeTooltip : true
				},
				cursor : {
					style : 'crosshair',
					show : true,
					zoom : true,
					looseZoom :true,
					showTooltip : true,
					followMouse : false,
					tooltipLocation : 'se', 
					tooltipOffset : 6,
					showTooltipUnitPosition : true
				}
			});
		},
		error:function(jqXHR, textStatus, err) {
			alert(err);
		}
	});
}
function drawAgencyAccmChart(divId, param) {
	$.ajax({
		url: '/YTCaresAccmPntGraph.do',
		asynch:false,
		cache:false,
		dataType: 'json',
		type:'POST',
		data:param,
		success: function(json){
			if (chart != null) chart.destroy();
		    var ticks 		= [];
			var line1		= [];
			var maxPnt		= 0;
			for (var i = 0; i < json.length; i++) {
				ticks[i]	= json[i].AGENCY_NAME;
				line1[i]	= [json[i].AGENCY_NAME, Number(json[i].ACCM_PNT)];
				maxPnt 		= Math.max(maxPnt, Number(json[i].ACCM_PNT));
			}
			chart		= $.jqplot(divId, [line1], {
				seriesDefaults: {
					renderer:$.jqplot.BarRenderer,
					pointLabels:{show:true}
				},
				series:[{renderer:$.jqplot.BarRenderer}],
				axes: {
					xaxis: {
						renderer: $.jqplot.CategoryAxisRenderer,
						tickRenderer: $.jqplot.CanvasAxisTickRenderer,
						tickOptions: {angle: -35,fontFamily:'tahoma',fontSize:'8px'}
					},
					/*
					x2axis: {
						renderer: $.jqplot.CategoryAxisRenderer,
						tickRenderer: $.jqplot.CanvasAxisTickRenderer,
						tickOptions: {angle: 30}
					},
					*/
					yaxis: {
						autoscale:true//,
						//tickRenderer: $.jqplot.CanvasAxisTickRenderer,
						//tickOptions: {angle: 30}
					}
					/*,
					y2axis: {
						autoscale:true,
						tickRenderer: $.jqplot.CanvasAxisTickRenderer,
						tickOptions: {angle: 30}
					}
					*/
				},
				cursor : {
					style : 'crosshair',
					show : true,
					zoom : true,
					looseZoom :true,
					showTooltip : true,
					followMouse : false,
					tooltipLocation : 'se', 
					tooltipOffset : 6,
					showTooltipUnitPosition : true
				},
				highlighter : {
					show:true,
					showTooltip : true,
					fadeTooltip : true
				}
			});
		},
		error:function(jqXHR, textStatus, err) {
			alert(err);
		}
	});
}
function drawMonthlyAccmChart(divId, param) {
	$.ajax({
		url: '/YTCaresAccmPntGraph.do',
		asynch:false,
		cache:false,
		dataType: 'json',
		type:'POST',
		data:param,
		success: function(json){
			if (chart != null) chart.destroy();
		    var prevMonth 	= [];
			var thisMonth 	= [];
			var dateTicks	= [];
			var maxPnt		= 0;
			for (var i = 0; i < json.length; i++) {
				dateTicks[i]= json[i].RN;
				prevMonth[i]= Number(json[i].PM_PNT);
				thisMonth[i]= Number(json[i].CM_PNT);
				maxPnt = Math.max(maxPnt, Number(json[i].PM_PNT));
				maxPnt = Math.max(maxPnt, Number(json[i].CM_PNT));
			}
			chart		= $.jqplot(divId, [prevMonth, thisMonth], {
				//title : 'test graph',
				series : [{label : '上个月'}, {label : '本月'}], //이전달, 
				seriesDefaults: {
					pointLabels:{show:false},
					showMarker:true
				},
				axes:{
					xaxis: {
						renderer: $.jqplot.CategoryAxisRenderer,
						ticks: dateTicks,
						numberTicks : 31
					},
					yaxis : {
						min:0,
						max:maxPnt,
						//autoscale : true,
						numberTicks : 10
					}
				},
				legend : {
					show : true,
					location : 'nw'
				},
				highlighter : {
					show:true,
					showTooltip : true,
					fadeTooltip : true
				},
				cursor : {
					style : 'crosshair',
					show : true,
					zoom : true,
					looseZoom :true,
					showTooltip : true,
					followMouse : false,
					tooltipLocation : 'se', 
					tooltipOffset : 6,
					showTooltipUnitPosition : true
				},
			    animate:true,
			    animateReplot: true
			});
		},
		error:function(jqXHR, textStatus, err) {
			alert(err);
		}
	});
}