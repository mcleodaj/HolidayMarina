$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $("#contactForm").submit(function(e) {
	    
	    e.preventDefault(); // avoid to execute the actual submit of the form.

	    $("#buttonDiv").html("<div class=\"spinner-border\" role=\"status\"> <span class=\"sr-only\">Loading...</span></div>");

	    var form = $(this);
	    var url = form.attr('action');

	    $.ajax({
	           type: "POST",
	           url: url,
	           data: form.serialize(), // serializes the form's elements.
	           success: function (data) {
	                $("#buttonDiv").html("<h4>Your Message has been Sent!</h4>");
	                $("[id=toBeRead]").prop('disabled', true);
	            },
	            error: function (data) {
	            	var r = jQuery.parseJSON(data.responseText);
	                $("#formError").html("<h4 class=\"text-danger\">${r.Message}</h4>");
	                $("#buttonDiv").html("<button type=\"submit\" class=\"btn btn-outline-dark btn-lg\">Send</button>");
	            },
	         });

	});
  
});

var images = ['/imgs/Marina_Pics/front_diag/2000.jpg',
	  '/imgs/Marina_Pics/Top_Down/2000.jpg',
	  '/imgs/Marina_Pics/lake_overlook/2000.jpg',
	  '/imgs/Marina_Pics/low_far/2000.jpg',
	  '/imgs/Marina_Pics/side_diag/2000.jpg',
	  '/imgs/Marina_Pics/Top_Down/2000.jpg'
	];

var img = document.getElementById("slideshow");

function displayImage(x) {
  img.style.backgroundImage = "linear-gradient(150deg, rgba(5,5,5,0.3) 5%,rgba(5,5,5,0.7) 100%), url(" + images[x] + ")";
  // img.innerText = images[x];
}

function getRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

function getRand() {
  var x = getRandomInt(0,5)
  displayImage(x);
}