jQuery(document).ready(function() {
    jQuery(document).on("click","div.bhoechie-tab-menu>div.list-group>a",function(e) {
        e.preventDefault();
       jQuery(this).siblings('a.active').removeClass("active");
        jQuery(this).addClass("active");
        var index = jQuery(this).index();
        jQuery("div.bhoechie-tab>div.bhoechie-tab-content").removeClass("active");
        jQuery("div.bhoechie-tab>div.bhoechie-tab-content").eq(index).addClass("active");
    });
});




$(document).ready( function() {
    	$(document).on('change', '.btn-file :file', function() {
		var input = $(this),
			label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
		input.trigger('fileselect', [label]);
		});

		$('.btn-file :file').on('fileselect', function(event, label) {
		    
		    var input = $(this).parents('.input-group').find(':text'),
		        log = label;
		    
		    if( input.length ) {
		        input.val(log);
		    } else {
		        if( log ) alert(log);
		    }
	    
		});
		function readURL(input) {
		    if (input.files && input.files[0]) {
		        var reader = new FileReader();
		        
		        reader.onload = function (e) {
		            $('#img-upload').attr('src', e.target.result);
		        }
		        
		        reader.readAsDataURL(input.files[0]);
		    }
		}

		$("#imgInp").change(function(){
		    readURL(this);
		}); 	
	});




	jQuery(document).ready(function(){

		jQuery(".gallery_icon").hover(function() {
		    jQuery( this ).parent().parent().css( "opacity","0.5" );
		  }, function() {
		    jQuery( this ).parent().parent().css( "opacity","1" );
		  });
	});


jQuery( document ).ready(function() {
 jQuery(document).on("click",".single_li",function(){
 							jQuery(".all_images li").removeClass("selected")
 							var id=	jQuery(this).children().next().attr("id");
 							var selected	=	jQuery(this).addClass("selected");
 							jQuery(".new_cover_image").removeClass("disabled");
 							var href 	=jQuery(".new_cover_image").attr("href");
 						
 								var href_split=	href.split("/");
 								var complete_href= "/"+href_split[1]+"/"+id+"/"+href_split[3];
 								
 								jQuery(".new_cover_image").attr("href",complete_href);
 });

});



$(document).ready(function() {
  $('#media').carousel({
    pause: true,
    interval: false,
  });
});



