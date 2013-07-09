var Yetsy = {}

Yetsy.init = function() {

  $('.unfavorite').click(function(event) {
    console.log("hello")
    var that = this;
    var dataId = $(this).attr('data-id');

    $.ajax({
      url: '/favorites/' + dataId,
      type: 'DELETE',
      success: function() {
        console.log("delete-y");
        var sib = $(that).siblings().first();
        $(that).toggleClass('hidden');
        $(sib).toggleClass('hidden');
      }
    })
  });

  $('.favorite').click(function(event) {
    var that = this;
    var dataId = $(this).attr('data-id');
    
    $.ajax({
      url: '/favorites',
      type: 'POST',
      data: { favorite: { item_id: dataId } },
      success: function() {
        console.log("success-y");
        var sib = $(that).siblings().first();
        $(that).toggleClass('hidden');
        $(sib).toggleClass('hidden');
      }
    })
  })   
}

$(document).ready(Yetsy.init); 