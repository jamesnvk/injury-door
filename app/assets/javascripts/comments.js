$(function(){

  $('.new_comment').on('submit', function(event){
    event.preventDefault()
    var url = this.action
    var values = $(this).serialize()

    $.post(url, values).done(function(data){
      debugger

      $('.media').after(data)
    });  
  });
});

