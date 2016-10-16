$(window).load(function(){
					
   var windowheight = ($(window).height()) - 96 - 96;
   $("section").height(windowheight);
   $(".wrapper .centerRight").height(windowheight);
   $("section").mCustomScrollbar({
		scrollButtons:{
			enable:true
		}
	});
	$(".homeSliderChild ul li").width($('#mCSB_1').width());
    nodeBlock = $(".homeSlider");
	 $(nodeBlock).each(function() {
        $("ul", this).css('width', ($("li", this).width()) * ($("li", this).length));
    });
   $("section").mCustomScrollbar("update");
     // alert(($(".slider").height()))
	// if(($(".slider").height()) > 300)
		// $(".pageWithVerification").css({position:'absolute',right:'20px',top: '135px'})

		$(".dTab").height($(".mCSB_container").height());


});


$(window).resize(function(){
						//alert('resize');
						   var windowheight = ($(window).height()) - 96 - 96;
						   $("section").height(windowheight);
						   $(".wrapper .centerRight").height(windowheight);
						   
	$(".homeSliderChild ul li").width($('#mCSB_1').width());
    nodeBlock = $(".homeSlider");
	 $(nodeBlock).each(function() {
        $("ul", this).css('width', ($("li", this).width()) * ($("li", this).length));
    });
   $("section").mCustomScrollbar("update");
// if(($(".slider").height()) > 300)
// $(".pageWithVerification").css({position:'absolute',right:'20px',top: '135px'})

$(".dTab").height($(".mCSB_container").height());


						   });

$(document).ready(function(){
							
						   $('select').fancySelect();
						   $(".profileData .fancy-select").on('click','.trigger',function(){
																	$(".relativeHigh").removeClass('relativeHigh');
																	  $(this).parents(".formRow.mT").addClass('relativeHigh');
																	  
																	  });
						  $(".selectModuleDrop .fancy-select").on('click','.trigger',function(){
																	$(".relativeHigh").removeClass('relativeHigh');
																	  $(this).parents(".selectModuleDrop").addClass('relativeHigh');
																	  });

						   $(".customRadio input[type='radio']").click(function(){
																				$(".customRadio .checked").removeClass();
																				$(this).prev().addClass('checked');
																				});
						   $(".pageWithVerification .validate").click(function(){
						   	     
									var cMar =  - (eval($(".homeSliderChild ul").css("marginLeft").substring(0, $(".homeSliderChild ul").css("marginLeft").length - 2)));
									currentSlide = cMar / ($(".homeSliderChild ul li").width());
									if(($(".homeSliderChild ul li:eq(" + currentSlide + ") .radioBtnGrp .radioSelectP input[type='radio']").attr('answer')) =='true')
									{
										$(".nailedIt").html("You Nailed It!");
									}
									else
									{
										$(".nailedIt").html("Its Wrong!");
									}
							});
						   $(".pageWithVerification .solution").click(function(){
									var cMar =  - (eval($(".homeSliderChild ul").css("marginLeft").substring(0, $(".homeSliderChild ul").css("marginLeft").length - 2)));
									currentSlide = cMar / ($(".homeSliderChild ul li").width());
									$(".homeSliderChild ul li:eq(" + currentSlide + ") .leftChildQ .answerPanel .blackLabel22").html($(".homeSliderChild ul li:eq(" + currentSlide + ") .radioBtnGrp input[answer='true']").parent('.withSelectedText').text());
									
									if(($(this).html())=='Solution')
									{
									$(".homeSliderChild ul li:eq(" + currentSlide + ") .leftChildQ .answerPanel").show();
									$(".homeSliderChild ul li:eq(" + currentSlide + ") .leftChildQ .questionPanel").hide()
									$(this).html('Question');
									}
									else	{
									$(".homeSliderChild ul li:eq(" + currentSlide + ") .leftChildQ .answerPanel").hide();
									$(".homeSliderChild ul li:eq(" + currentSlide + ") .leftChildQ .questionPanel").show()
									$(this).html('Solution');
									}
									return false;

							});
						   
						   $(".popup").click(function(event){
													  if(($("." + $(this).attr('rel')).css('display'))=='block')
													  {
													  $(".whitePopUp").hide();
													  $("." + $(this).attr('rel')).hide();
													  }
													  else
													  {
													  $(".whitePopUp").hide();
													  $("." + $(this).attr('rel')).show();
													  }
													  event.stopPropagation();
													  });
						   $(".commitChanges").click(function(){
															  $(".popUpConfirm").show();
															  return false;
															  });
						   $(".popUpConfirm .buttonsPopup a").click(function(){
															  $(".popUpConfirm").hide();
															  return false;
																			 
																			 });
						
						  /* $(".selectModuleDrop select, .formRow.mT .secondColForm select").change(function(){
																		 $("span",$(this).parent()).html($(this).val());
																		 });*/
						   $(".radioBtnGrp input[type='radio']").click(function(){
																				$(".radioBtnGrp .checked").removeClass();
																				$(this).prev().addClass('checked');
																				$(".withSelectedText.radioSelectP").removeClass('radioSelectP');
																				$(this).parent('.withSelectedText').addClass('radioSelectP');
																				
																				});
						   $(".wrapper").click(function(){
																	 $(".whitePopUp").hide();
																	 });
						   $(".whitePopUp").click(function(event){
															$(this).show();
															event.stopPropagation();
															//alert('click');
															});
						   });
		
		
$(document).ready(function(){
    $(".socialPopup p span").each(function(){
		  $(this).html($(this).attr('count'));
	});
   $(".greenCol a").hover(function(){
	 $('a', $(this).parents('.greenCol')).css('text-decoration','underline');  
	   },
	   function(){
		   $('a', $(this).parents('.greenCol')).css('text-decoration','none');  
		   });
   });

var node_count,nodeWidth,nodeBlock,nodeBMarginL = 0,flag = true,currentNode = 0,lastNode,speed = 500;

var nCount=0;
$(document).ready(function() {

    // Next Button Click Code 
    $(".sliderNextBtn").click(function() {
        if (flag) {
			
            flag = false;
            var thisB = $(this).parents(".homeSlider");
            var nodeBWidth = ($("ul", thisB).css("width"));
            nodeWidth = ($("li", thisB).width());
            nodeBMarginL = eval($("ul", thisB).css("marginLeft").substring(0, $("ul", thisB).css("marginLeft").length - 2));
			nodeBWidth = eval(nodeBWidth.substring(0, nodeBWidth.length - 2)) - eval(nodeWidth);
            nodeCount = ($("li", thisB).length - Math.round($(".homeSliderChild",thisB).width() / nodeWidth));
            if (nodeCount != nCount) {
                if (nodeBMarginL / nodeWidth)
                    currentNode = parseInt(Math.abs(nodeBMarginL / nodeWidth)) + 1;
                else
                    currentNode = 1;
                nodeBMarginL = -(Math.abs(nodeBMarginL) + nodeWidth);
				
				nCount++;
                animateMe(thisB,nodeBMarginL, nCount,nodeCount);
            } else {
                flag = true;
            }
        }

    });

    // Previus Button Click Code
    $(".sliderPrvBtn").click(function() {
        if (flag) {
            flag = false;
            var thisB = $(this).parents(".homeSlider");
            var nodeBMarginL = $("ul", thisB).css("marginLeft");
            nodeBMarginL = eval(nodeBMarginL.substring(0, nodeBMarginL.length - 2));
            nodeWidth = ($("ul li", thisB).width());
			nodeCount = ($("li", thisB).length - Math.round($(".homeSliderChild",thisB).width() / nodeWidth));
            if (Math.abs(nodeBMarginL) > 0) {
                if (nodeBMarginL / nodeWidth)
                    currentNode = parseInt(Math.abs(nodeBMarginL / nodeWidth)) + 1;
                nodeBMarginL = -(Math.abs(nodeBMarginL) - nodeWidth);
				nCount--;
                animateMe(thisB,nodeBMarginL, nCount,nodeCount);
            } else
                flag = true;
        }

    });

    // Main Animation Function
    function animateMe(thisB,nodeBMarginL, nCount, nodeCount) {
        if (nCount == 0)
            $(".sliderPrvBtn", thisB).addClass("notActive");
        else
            $(" .sliderPrvBtn", thisB).removeClass("notActive");
        if (nCount == nodeCount)
            $(" .sliderNextBtn", thisB).addClass("notActive");
        else
            $(" .sliderNextBtn", thisB).removeClass("notActive");
$(".pageWithVerification .solution").html('Solution');
$(".nailedIt").html('');
        if (speed == 0)
        //Large image show button so no animation 
        $("ul", thisB).css("marginLeft", nodeBMarginL);
		 else
            $("ul", thisB).animate({
            marginLeft: nodeBMarginL
        }, speed, function() {
            flag = true;
        });
    }

});


	  
	  
		  
		  
		 		
