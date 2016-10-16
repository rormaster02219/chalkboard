function resizeSlideshow()
{
	var heightB1 = 0, heightB = 0;
	$(".sliderWrap").css('visibility','visible');
	if($(".sliderWrap .rightSlide li img").css('display')=='inline')
		heightB = $(".sliderWrap .rightSlide li img").height();
	if($(".sliderWrap .rightSlide li img").css('display')=='none')
	{
		heightB = $(".sliderWrap .rightSlide li:first-child img").show().height();
		$(".sliderWrap .rightSlide li:first-child img").hide();
	}
		
	if($(".sliderWrap .leftSlide li img").css('display')=='inline')
		heightB1 = $(".sliderWrap .leftSlide li img").height();
	if($(".sliderWrap .leftSlide li img").css('display')=='none')
	{
		heightB1 = $(".sliderWrap .leftSlide li:first-child img").show().height();
		$(".sliderWrap .leftSlide li:first-child img").hide();
	}
	if((heightB > 0 ))
	{
	$(".sliderWrap").height(heightB);
	}
	if(heightB < heightB1)
	{
	$(".sliderWrap").height(heightB);
	}
	if(heightB > heightB1)
	{
	$(".sliderWrap").height(heightB1);
	}
	
	//$(".sliderWrap > ul").height("inherit");
	
}
$(document).ready(function(){
	$(".sliderWrap .rightSlide li img").load(function(){resizeSlideshow();});setTimeout("resizeSlideshow()", 2000);					   

  $(window).resize(function() {resizeSlideshow();});
});


