$("#athlete_performance_head").click(function(){
  $("#athlete_performance").toggle("slow");
});

$(document).ready(function() {
    $("#done").css("display", "none");
    $("#pending").css("display", "none");

    $("#allhead").click(function(event){
      event.preventDefault();
      
      $(this).css("color", "#534741");
      if(!coach){
        $("#donehead").css("color", "#FFA900");
        $("#pendinghead").css("color", "#FFA900");
      }
      else{
        $("#donehead").css("color", "#01939A");
        $("#pendinghead").css("color", "#01939A");
      }

      $("#pending").slideUp('slow', function() {});
      $("#done").slideUp('slow', function() {});
      $("#all").toggle("slide", {}, 1000);
    });
    
    $("#donehead").click(function(event){
      event.preventDefault();
      $(this).css("color", "#534741");
      if(!coach){
        $("#allhead").css("color", "#FFA900");
        $("#pendinghead").css("color", "#FFA900");
      }
      else{
        $("#allhead").css("color", "#01939A");
        $("#pendinghead").css("color", "#01939A");
      }
      
      $("#all").slideUp('slow', function() {});
      $("#done").toggle("slide", {}, 1000);
    });
    $("#pendinghead").click(function(event){
      event.preventDefault();
      $(this).css("color", "#534741");
      if(!coach){
        $("#donehead").css("color", "#FFA900");
        $("#allhead").css("color", "#FFA900");
      }
      else{
        $("#donehead").css("color", "#01939A");
        $("#allhead").css("color", "#01939A");
      }
      
      $("#all").slideUp('slow', function() {});
      $("#all").css("display", "none");
      $("#pending").toggle("slide", {}, 1000);
    });
});
