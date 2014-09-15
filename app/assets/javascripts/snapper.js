$(function(){

  // Set global config
  Snapper.configure({
    snapper_size: 'tiny', // set the default snapper size to tiny
    snapper_border: 'round shadow', // render snapper with a round corners and a shadow
    output_format: 'png' // switch from 'jpg' to use 'png' when saving.
    // see configuration section of docs for full list.
  });

  // Load snapper when a button is clicked
  $('#take_photo').click(function(){
    Snapper.show({ // open snapper in an overlay window
      complete: function(image){ // called when the photo has been saved
        // e.g. set value of hidden form element
        saveImage(image)


        $('#saved_image').val(image);
      },
      // instance config
      snapper_size: 'medium' // override the default size, set it to medium
    });
  });
  function saveImage(image){
    $.ajax({url: "/photos", type: "POST", data: { photo: {photo_url: image}}});
  }
  // Embed snapper into the page
  Snapper.embed({ // renders snapper in the page
    target: 'my_photo_booth', // pass the ID of the div where you want snapper to embed
    complete: function(image){ // called when the photo has been saved
      // e.g. ajax call to save photo on server
      $.post('/my_save_handler', {snap: image}, function(){
        alert('Snap saved');
      });
    },
    // instance config
    output_format: 'jpg', // set output format to jpg
    jpg_quality: 90 // use high quality
  });

});
