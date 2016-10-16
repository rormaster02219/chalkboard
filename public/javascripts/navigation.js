jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

jQuery.fn.submitWithAjax = function() {
  this.submit(function() {
    $.post(this.action, $(this).serialize(), null, "script");
    return false;
  })
  var math = document.getElementById("MathExample");
  MathJax.Hub.Queue(["Typeset",MathJax.Hub,math]);
  return this;
};

function saveResults(){
  $.post('/results', $("#new_result").serialize(), null, "script");
  return false;
}

$(document).ready(function() {

  //$('.validate').click(function() {
    //var choice = getChoice($('input:radio[name=question]:checked').index());
    //var student_response = $('#correct_answer').val();
//    var rightWrong = isRightWrong(student_response,choice);
    
 //   $('#result_correct').val(rightWrong);
   // $('#result_student_answer').val(choice);
   
    //saveResults();

 // });

  $("#get_question").submit(function(){
    $.get('/questions/1'+ '.js', $(this).serialize(), null, "script");
    return false;
  });

  $("#go_module_test").submit(function(){
    $.post(("#go_module_test").action, $("#go_module_test").serialize(),null, "script");
    return false;
  });

 // $("#fetch_fwd").submitWithAjax();
  //$("#fetch_back").submitWithAjax();

});	

//function isRightWrong(given,choice){
  //var verdict = "";
  //var code;
 // if (given.trim() == choice.trim()){
  //  verdict = "You are correct!";
 //   code = 1;
  //}else{
  //  verdict = "I'm sorry.  Try again."
  //  code = 0;
  //}
  //$('#tell_them').html(verdict);
  //return code;
//}

function getChoice(index){
  var choice = "";

  if (index == 0){
    choice = "choice_a";
  }
  else if (index == 1){
    choice = "choice_b";
  }
  else if (index == 2){
    choice = "choice_c";
  }
  else{
    choice = "choice_d";
  }
  return choice;
}

