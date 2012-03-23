$(document).ready(function() {
    $("#content").css("display", "none");
 
    $("#content").fadeIn(700);
 
    $("a").click(function(event){
        event.preventDefault();
        linkLocation = this.href;
        $("body").fadeOut(350, redirectPage);
    });
 
    function redirectPage() {
        window.location = linkLocation;
    }
});
