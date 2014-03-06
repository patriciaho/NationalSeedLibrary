
$(function() {
  $.get(window.location.href + '.json', function(data) {
    var seed = data.seed;

    // Set name into h1 tag
    $('h2').html(seed.common_name);
    $('.seed_sci').html(seed.scientific_name);
    $('.seed_quantity').html(seed.quantity);
    $('.seed_season').html(seed.planting_season);
    $('.seed_descrip').html(seed.description);

    // Set up the image tag
    // $('img').prop({ src: seed.image_url, alt: seed.common_name, title: seed.common_name })

  });

});

$(document).on('page:change', function() {

  $('.seedpacket').css('opacity',0).show().animate( {opacity:1}, 400);

});
