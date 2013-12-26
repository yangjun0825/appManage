var contextPath = $('#contextPath').val() || '';

$(function() {
	$("#summary_section").show();
	$("#detail_section").hide();
	$("#price_section").hide();
	$("#comments_section").hide();
});

$("#tabs li:eq(0)").click(function() {
	$(this).addClass("curr").siblings().removeClass("curr");
	$("#summary_section").show();
	$("#detail_section").hide();
	$("#price_section").hide();
	$("#comments_section").hide();
});

$("#tabs li:eq(1)").click(function() {
	$(this).addClass("curr").siblings().removeClass("curr");
	$("#summary_section").hide();
	$("#detail_section").show();
	$("#price_section").hide();
	$("#comments_section").hide();
});

$("#tabs li:eq(2)").click(function() {
	$(this).addClass("curr").siblings().removeClass("curr");
	$("#summary_section").hide();
	$("#detail_section").hide();
	$("#price_section").show();
	$("#comments_section").hide();
});

$("#tabs li:eq(3)").click(function() {
	$(this).addClass("curr").siblings().removeClass("curr");
	$("#summary_section").hide();
	$("#detail_section").hide();
	$("#price_section").hide();
	$("#comments_section").show();
});

//药店
$(".search_drugstore .search_button").click(function() {
	var storeName = $.trim($("#storeName").val());
	if(storeName == ''){
		return;
	}
	window.location.href = contextPath + "/drugStore/storeSearch?storeName="+storeName;
});

//$("#area_list td").click(function() {
//	window.location.href = "area_drugstore.html";
//});

$(".drug_stores li").click(function() {
	var storeId = $(this).find("#storeId").val();
	window.location.href = contextPath + "/drugStore/storeDetail?storeId="+storeId;
});

$("#location_info").click(function() {
	var storeId = $("#storeId").val();
	window.location.href = contextPath + "/drugStore/locationDetail?storeId="+storeId;
});

$("#my_location").click(function() {
	window.location.href = contextPath + "/drugStore/myLocate";
});

//药品

$(".search_drug .search_button").click(function() {
	var drugName = $("#drugName").val();
	if(drugName == ""){
		return;
	}
	window.location.href = contextPath + "/drugInfo/drugSearch?searchName="+drugName;
});

$(".drugs_list li").click(function() {
	var drugSname = $(this).find("#drugSname").val();
	window.location.href = contextPath + "/drugInfo/drugList?drugSname="+drugSname;
});

$(".drugs_info li").click(function() {
	var drugId = $(this).find("#drugInfoId").val();
	window.location.href = contextPath + "/drugInfo/drugDetail?id="+drugId;
});

$("#top_news").click(function(){
	var drugId = $(this).find("#drugInfoId").val();
	window.location.href = contextPath + "/drugInfo/drugDetail?id="+drugId;
});

$("#drug_more").click(function(){
	var drugSname = $.trim($(".section_header").text());
	var page = $("#page").val();
	window.location.href = contextPath + "/drugInfo/drugList?drugSname="+drugSname+"&page="+page;
});

$("#drug_search_more").click(function(){
	var searchName = $.trim($("#drugName").val());
	var page = $("#page").val();
	window.location.href = contextPath + "/drugInfo/drugSearch?searchName="+searchName+"&page="+page;
});

$("#store_more").click(function(){
	var page = $("#page").val();
	window.location.href = contextPath + "/drugStore/list?page="+page;
});

$("#store_search_more").click(function(){
	var storeName = $.trim($("#storeName").val());
	var page = $("#page").val();
	window.location.href = contextPath + "/drugStore/storeSearch?storeName="+storeName+"&page="+page;
});