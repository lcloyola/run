$(document).ready(function() {
    $("#content").css("display", "none");
 
    $("#content").fadeIn(700);

    if (!coach) {
      $("#main a").css("color", "#FFA900");
    }
    
    $("a").click(function(event){
      if ((this.id != 'gallery') && (this.id != 'lbPrevLink') && (this.id != 'lbNextLink') && (this.id != 'lbCloseLink')) {
        event.preventDefault();
        linkLocation = this.href;
        $("body").fadeOut(350, redirectPage);
      }
    });

    function redirectPage() {
        window.location = linkLocation;
    }
});
