

if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
$("section").customScrollbar('remove');
var isMobile = window.matchMedia("only screen and (max-width: 700px)");
}
else
var isMobile = '';
    $(document).ready(function(){
		if (isMobile.matches)
		{
if($(".dataTable").is(":visible"))
		{
			$('body').width('680px');
var viewPortTag=document.createElement('meta');
viewPortTag.id="viewport";
viewPortTag.name = "viewport";
document.getElementsByTagName('head')[0].appendChild(viewPortTag);

		}
		}
var windowheight = ($(window).height()) - 96 - 96;
	   $("section").height(windowheight);
	   $(".wrapper .centerRight").height(windowheight);
	  $("section").customScrollbar();
	  
});
	

$(window).load(function(){
	$(".blackLabel18, .progressBarBox").show();
		if ($(".centerRight > div > .blackLabel18 > b").text() == "TIME LEFT (in minutes)")
		{
  $(".centerRight > div > .blackLabel18").parent().addClass('customPage');
$("body").addClass('customBody');
		}
	   var windowheight = ($(window).height()) - 96 - 96;
	   $("section").height(windowheight);
	   $(".wrapper .centerRight").height(windowheight);
	   $("section").customScrollbar("resize", true);
	$(".homeSliderChild ul li").width($('.viewport').width());
    nodeBlock = $(".homeSlider");
	 $(nodeBlock).each(function() {
        $("ul", this).css('width', ($("li", this).width()) * ($("li", this).length));
    });
   $("section").customScrollbar("resize", true);
     // alert(($(".slider").height()))
// if(($(".slider").height()) > 300)
// $(".pageWithVerification").css({position:'absolute',right:'20px',top: '135px'})

$(".dTab").height($(".viewport").height());
if (isMobile.matches)
	{
        $("section").customScrollbar("remove");
		$(".centerRight, .mCS_destroyed, section, .viewport").removeAttr('style');
	}

						   });


$(window).resize(function(){
						//alert('resize');
						
						   var windowheight = ($(window).height()) - 96 - 96;
						   $("section").height(windowheight);
						   $(".wrapper .centerRight").height(windowheight);
						   
	$(".homeSliderChild ul li").width($('.viewport').width());
    nodeBlock = $(".homeSlider");
	 $(nodeBlock).each(function() {
        $("ul", this).css('width', ($("li", this).width()) * ($("li", this).length));
    });
   $("section").customScrollbar("resize", true);
// if(($(".slider").height()) > 300)
// $(".pageWithVerification").css({position:'absolute',right:'20px',top: '135px'})

$(".dTab").height($(".viewport").height());

if (isMobile.matches)
   {
        $("section").customScrollbar("remove");
		$(".centerRight, .mCS_destroyed, section, .viewport").removeAttr('style');
   }


						   });

$(document).ready(function(){
	$(".mobileNav .mob").click(function(){
			if($("> ul", $(this).parent()).is(":visible"))
			{
			$(this).removeClass('active');
			$("> ul", $(this).parent()).hide();
			}
			else
			{
			$(this).addClass('active');
			$("> ul", $(this).parent()).show();
			}
			return false;
			});
			
			$(".mobileNav ul li a.sub").click(function(){
			if($("> ul", $(this).parent()).is(":visible"))
			{
			$(this).parent().removeClass('active1');
			$("> ul", $(this).parent()).hide();
			}
			else
			{
			$(this).parent().addClass('active1');
			$("> ul", $(this).parent()).show();
			}
			return false;
			});
			
if($("#userState").val() =='true')
{
	$(".mobileNav .userLogOutState").show();
	$(".mobileNav .userLogInState").hide();
}
else
{
$(".mobileNav .userLogInState").show();
$(".mobileNav .userLogOutState").hide();
}

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
			$(".nailedIt").html("Excellent");
			document.getElementById("validate_ans").classList.add('validate-answer');
			document.getElementById("validate_ans").classList.remove('validate');
		}
		else
		{
			$(".nailedIt").html("Sorry Incorrect");
			document.getElementById("validate_ans").classList.add('validate-answer');
			document.getElementById("validate_ans").classList.remove('validate');
		}
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
   $(".subscription_error .buttonsPopup a").click(function(){
                                                                         $(".subscription_error").hide();
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
														$(".testpage").addClass('withAnswer');
														});
   $(".wrapper").click(function(){
											 $(".whitePopUp").hide();
											 });
   $(".whitePopUp").click(function(event){
									$(this).show();
									event.stopPropagation();
									//alert('click');
									});
   
   
    if (isMobile.matches) {
		$("section").customScrollbar("remove");
		$(".centerRight, .mCS_destroyed, section, .viewport").removeAttr('style');
		$(".centerRight, .mCS_destroyed, section").removeAttr('style');
		$(".rightSection").append('<article class="aboutUs">' + $(".aboutUs").html() + '</article>');
		$("section").click(function(){
			$(".mobileNav ul").hide();
			$(".mobileNav .active").removeClass("active");
			$(".mobileNav .dropdownMob").removeClass("active1");
			});
		
    }
	
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
		 $(".testpage").removeClass('withAnswer');
            $("ul", thisB).animate({
            marginLeft: nodeBMarginL
        }, speed, function() {
            flag = true;
        });
    }

});


$(document).ready(function() {

    $(".login_path").click(function(){
      $(".loading").show();
      $.ajax( {
        type: "POST",
        url: "/sessions",
        data: $('.login').serialize(),
        success: function( response ) {
          $(".loading").hide();
          return false;
        }
       });
      });


     $(".forgot_path").click(function(){
      $(".loading").show();
      $.ajax( {
        type: "POST",
        url: "/reset_password",
        data: $('.forget_password').serialize(),
        success: function( response ) {
          $(".loading").hide();
          return false;
        }
       });
      });


      $(".contact_message").click(function(){
        $(".loading").show();
        $.ajax( {
                type: "POST",
                url: "/static_pages/contact",
                data: $('.Contact').serialize(),
                success: function( response ) {
                   $(".loading").hide();
                   return false;
                }
              });
      });


    $(".signup_path").click(function(){
      $(".loading").show();
      $.ajax( {
        type: "POST",
        url: "/students",
        data: $('.signup').serialize(),
        success: function( response ) {
          $(".loading").hide();
          return false;
        }
      } );

    });


    $(".yesIDo").click(function(){
      window.location.href="/static_pages/home"
    });


    $(".open_popup").click(function(){
		$(".mobileNav ul").hide();
		$(".mobileNav .mob.active").removeClass('active');
      $(".subjectPopup").hide();
      $(".GoToSignin").show();
    });
    
    $(".index-home").click(function(){
     
      window.location ="/static_pages/home";
     });   


    $(".openReportPopup").click(function(){
		$(".mobileNav ul").hide();
		$(".mobileNav .mob.active").removeClass('active');
      $(".subjectPopup").hide();
      $(".GoToSignin").show();
    });
    $(".openSubjectPopup").click(function(){
		$(".mobileNav ul").hide();
		$(".mobileNav .mob.active").removeClass('active');
      $(".GoToSignin").hide();
      $(".subjectPopup").show();
    });
    $("#notSignIn").click(function(){
		$(".mobileNav ul").hide();
		$(".mobileNav .mob.active").removeClass('active');
      $(".reportCardPopUp").hide();
      $(".subjectsPopUp").hide();
      $(".GoToSignin").hide();
      $(".loginPopup").show();
      return false;
    });  

    $("#subject_popup").click(function(){
		$(".mobileNav ul").hide();
		$(".mobileNav .mob.active").removeClass('active');
      $(".subjectsPopUp").hide();
      $(".subjectPopup").hide();
      return false;
    });

    $("#report_card_popup").click(function(){

      window.location.href="/reports"
    });

    $(".signin_path").click(function(){
      $(".loading").show();
      $.ajax( {
        type: "POST",
        url: "/sessions",
        data: $('.signin').serialize(),
        success: function( response ) {
          $(".loading").hide();
          return false;
        }
      });
      return false;
    });

    
  });


	  
  $(document).ready(function() {
    $("#subject_popup").click(function(){
		$(".mobileNav ul").hide();
		$(".mobileNav .mob.active").removeClass('active');
      $(".subjectsPopUp").hide();
      $(".subjectPopup").hide();
      return false;
    });
    $("#report_card_popup").click(function(){
$(".mobileNav ul").hide();
$(".mobileNav .mob.active").removeClass('active');
      window.location.href="/reports"
    });
  $(".signin_path").click(function(){
      $(".loading").show();
  $.ajax( {
    type: "POST",
    url: "/sessions",
    data: $('.signin').serialize(),
    success: function( response ) {
      $(".loading").hide();
      return false;
     }
  });
   });
 });


  $( document ).ready(function() {
        $('.reset').click(function(){

          $('.Contact')[0].reset();
          $("#contact-error").html("");
        });

        $(".reset_signup").click(function(){
          $(".signup").trigger("reset");
          $("#signup-error").html("");
        });

        $(".reset_signup_popup").click(function(){
          $(".signup_header").trigger("reset");
          $("#signupPopup-error").html("");
          return false;
        });
      });
      $(document).ready(function() {
        $('#foofaa').trigger('click');
        $('#foofaasignin').trigger('click');
        $('#foofaasignup').trigger('click');
      });


  $( document ).ready(function() {

    
    Stripe.setPublishableKey('pk_test_E35OrkIgx4r9qZLNwrO1RtoQ');

    $("#submit_subs_form").click(function(){

      if($("input:radio[name=payment]:checked").val() == "credit"){
        var card_number = $('#card_number').val();
        var card_code = $('#card_code').val();
        var card_month = $('#card_month :selected').val();
        var card_year = $('#card_year :selected').val();
        submit_subs_form(card_number, card_code, card_month, card_year);
      }else{
        var pin_number = $('#pin_number').val();
        checkValidPin(pin_number)
      }
    });

    function checkValidPin(pin_number){

      $(".loading").show();
      var url_pass = '/pins/' + pin_number
      var resp = "one"
      $.ajax( {
            type: "GET",
            url: url_pass,
            success: function( response ) {
              if(response == true){
                $(".loading").hide();
        	$(".subscription_error h5").html("Error Processing Card");
        	$(".subscription_error").css("display", "block");
	      }else{
                $(".loading").hide();
                var url_pass = '/pins/' + pin_number
		console.log(url_pass);
                console.log($('.profileData').serialize());
                var form$ = $("#new_subscription");
                form$.append("<input type='hidden' name='stripeToken' value='" + pin_number + "'/>");
          $(".loading").show();
          $.ajax( {
            type: "POST",
            url: "/pins",
            data: $('.profileData').serialize(),
            success: function( response ) {
              $(".loading").hide();
              return false;
            }
          });
	      }
              return false;
            }
          });
      
    }

    function submit_subs_form (card_number, card_code, card_month, card_year) {
      Stripe.card.createToken({
          number: card_number,
          cvc: card_code,
          exp_month: card_month,
          exp_year: card_year
      }, stripeResponseHandler);
    }

    function stripeResponseHandler(status, response) {

      if (response.error) {
        $(".subscription_error h5").html(response.error.message);
        $(".subscription_error").css("display", "block");
      } else {
          var form$ = $("#new_subscription");
          // token contains id, last4, and card type
          var token = response['id'];
          // insert the token into the form so it gets submitted to the server
          form$.append("<input type='hidden' name='stripeToken' value='" + token + "'/>");
          // and submit
          $(".loading").show();
          $.ajax( {
            type: "POST",
            url: "/subscriptions",
            data: $('.profileData').serialize(),

            success: function( response ) {
              $(".loading").hide();
              return false;
            }
          });
          // form$.get(0).submit();
      }
    }

  });
	
