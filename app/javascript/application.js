// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

$("#datarecords").on("click",".btn-click",function(){
    console.log("hello")
    $.ajax({
        type: "patch",
        url: "clients/"+ this.id+"/update_status/",
        data: {id: this.id},
        cache: false
        
    });
});

$("#search").on("input", function () {
var val = $(this).val();

    $.ajax({
    type: "get",
    url: "/search",
    data: {fname: val},
    cache: false
    
});
});

$("#sortItems").click(function () { 
 
    $.ajax({
        type: "post",
        url: "/users/sort",  
        cache: false 
    });    
});

$("#sortEmail").click(function () { 
 
    $.ajax({
        type: "post",
        url: "/users/sortbyemail",  
        cache: false 
    });    
});

