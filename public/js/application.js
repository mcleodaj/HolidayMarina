$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  
});

// $(document).ready(function() {
//         // Transition effect for navbar 
//         $(window).scroll(function() {
//           // checks if window is scrolled more than 500px, adds/removes solid class
//           if($(this).scrollTop() > 500) { 
//               $('.navbar').addClass('solid');
//           } else {
//               $('.navbar').removeClass('solid');
//           }
//         });
// });

// $(function () {

//     function initMap() {

//         var location = new google.maps.LatLng(35.4870919, -80.888728);

//         var mapCanvas = document.getElementById('map');
//         var mapOptions = {
//             center: location,
//             zoom: 10,
//             panControl: false,
//             disableDefaultUI: true,
//             mapTypeId: google.maps.MapTypeId.ROADMAP
//         }
//         var map = new google.maps.Map(mapCanvas, mapOptions);

//         // var markerImage = '/imgs/marker.png';

//         var marker = new google.maps.Marker({
//             position: location,
//             map: map,
//             // icon: markerImage
//         });

//     }

//     google.maps.event.addDomListener(window, 'load', initMap);
//  });