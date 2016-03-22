// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require imagesloaded.pkgd.min.js
//= require masonry.pkgd.min.js
//= require html2canvas.js
//= require canvas2image.js
//= require Blob.js
//= require canvas-toBlob.js
//= require FileSaver.min.js
//= require base64.js
//= require jquery_ujs
//= require_tree .

var ready = function() {

	var $container = $('.box');
	$container.imagesLoaded(function() {
	  $container.masonry({
	    columnWidth: '.item',
	    itemSelector: '.item'
	  });   
	});

	var classNum = 1;
	$('html').click(function() {
	  $('.'+classNum).show(500);
		$container.masonry();
		$("html, body").delay(50).animate({ scrollTop: $(document).height() });
	  classNum += 1;
	});

	$('.col-sm-6').click(function(){
	  event.stopPropagation();
	});

	var darkColors = ['#47528f', '#8396b1', '#bda99c', '#8d5157', '#301322'];
	var lightColors = ['#d7a9bd', '#f0e5e7', '#cdd2e6', '#8dabd3'];
	
	$('.quote').each(function() {
		var random_dark = darkColors[Math.floor(Math.random() * darkColors.length)];
		$(this).css('background-color', random_dark);
	});
	$('.text').each(function() {
		var random_light = lightColors[Math.floor(Math.random() * lightColors.length)];
		$(this).css('background-color', random_light);
	});

	$(function() { 
    $(".btn-save").click(function() { 
        html2canvas($('.box'), {
        		proxy: "/proxy/get",
        		allowTaint: true,
            onrendered: function(canvas) {
                theCanvas = canvas;
                document.body.appendChild(canvas);

                // Convert and download as image 
                //Canvas2Image.saveAsPNG(canvas);

                // Canvas to blob
                ctx = canvas.getContext("2d");
								canvas.toBlob(function(blob) {
									saveAs(blob, "Ashlee Board.png");
								});

                //$('.11').append(canvas);
                // Clean up 
                document.body.removeChild(canvas);
            }
        });
    });
});

};

$(document).ready(ready);
//$(document).on('page:load', ready);

