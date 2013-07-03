$(document).ready(
  function() {
    $('button.fav_button').on('click', function() {
      console.log($(event.target));
      $.ajax({
        url: 'users/' + 
      })
    })
  }
)