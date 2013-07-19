var Yetsy = {}

Yetsy.init = function() {

  $('.unfavorite').click(function(event) {
    
    var that = this;
    var dataId = $('.favorite').attr('data-id');
    var url = location.protocol + "//" + location.host + '/favorites/' +dataId;
    
    $.post(url, { "_method": "delete" })

    var sib = $(that).parent().children('.favorite');
    $(that).toggleClass('hidden');
    $(sib).toggleClass('hidden');
  });

  $('.favorite').click(function(event) {
    var that = this;
    var url = location.protocol + "//" + location.host;
    var dataId = $(this).attr('data-id');

    $.ajax({
      url: url + '/favorites',
      type: 'POST',
      data: { favorite: { item_id: dataId } },
      success: function(data) {

        var sib = $(that).parent().children('.unfavorite');
        $(sib).attr('data-id', data.id)
        $(that).toggleClass('hidden');
        $(sib).toggleClass('hidden');
      }
    })
  })   
}

$(document).ready(Yetsy.init); 