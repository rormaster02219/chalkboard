var path  = window.location.pathname;

if(path.match('questions') == "questions") {
  $(document).ready(function() {
     function countdown(minutes,opp,up){

    var counts = 0 + up
    var seconds = 60;
    var mins = minutes
    var oppmin = opp
    function tick() {
        var current_minutes = mins-1
        var opp_minutes = oppmin+1
        seconds--;
        
        if( seconds > 0 ) {
            counts = counts + 1
            $("#counter").width(((counts/initial_count)*100)+"%");
            setTimeout(tick, 1000);
        } else {
            counts = counts + 1
            $("#counter").width(((counts/initial_count)*100)+"%");

            document.getElementById("startTime").innerHTML = opp_minutes.toString();
            document.getElementById("countdown").innerHTML = current_minutes.toString();
            if(mins > 1){

               // countdown(mins-1);   never reach “00″ issue solved:Contributed by Victor Streithorst    
               setTimeout(function () { countdown(mins - 1,oppmin+1,counts); }, 1000);

		}
  
         if(current_minutes == 0){$(".timeover").show();}
        }
    }
    tick();
      } 

     window.count = $("#setTimer").attr("class");   
     var initial_count = window.count * 60
     countdown(window.count,0,0)

  });  
   
}
