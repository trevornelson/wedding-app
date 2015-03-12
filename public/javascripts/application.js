$(document).ready(function() {

  $('#nav-login').on('click', function(event){
    event.preventDefault();

    $.ajax({
      type: 'get',
      url: '/auth/login',
      success: function(result) {
        console.log(result);
        $('#page-content').html(result);
      }

    });
  });

  $('#login').on('submit', function(event){
    event.preventDefault();
    var data = $(this).serialize();

    $.ajax({
      type: 'post',
      url: '/auth/login',
      data: data,
      success: function(result) {
        $('#page-content').html(result);
      }

    });
  });

  $('#rsvp-form').on('submit', function(event){
    event.preventDefault();
    var data = $(this).serialize();

    $.ajax({
      type: 'put',
      url: '/users/rsvp',
      data: data,
      success: function(result) {
        View.openModal(result.title, result.description);
      },
      error: function() {
        View.openModal('Something went wrong!', 'Please try again.', 'error');
      }

    });
  });

  $('#nav-notes').on('click', function(event){
    event.preventDefault();

    $.ajax({
      type: 'get',
      url: '/prompts',
      success: function(result) {
        $('#page-content').html(result);
      },
      error: function() {
        View.openModal('Something went wrong!', 'Please try again.', 'error');
      }

    });
  });

  $('#add-note').on('click', function(event){
    event.preventDefault();
    var data = $(this).data('id');

    $.ajax({
      type: 'get',
      url: '/prompts/' + data,
      success: function(result) {
        $('#layout-modal').html(result);
        $('#layout-modal').trigger('click');
      },
      error: function() {
        View.openModal('Something went wrong!', 'Please try again.', 'error');
      }

    });
  });

  $('#prompts-form').on('submit', function(event){
    event.preventDefault();
    var data = $(this).serialize();

    $.ajax({
      type: 'post',
      url: '/prompts',
      data: data,
      success: function(result) {
        $('#page-content').html(result);
      }

    });
  });

  $('#notes-form').on('submit', function(event){
    event.preventDefault();
    var data = $(this).serialize();

    $.ajax({
      type: 'post',
      url: '/prompts',
      data: data,
      success: function(result) {
        $('#page-content').html(result);
      }

    });
  });



});

var View = function(){
  var errorModal = function() {
    $('.modal-header').css('background-color', 'red');
  }

  var openModal = function(title, description, type) {
    $('#title').text(title);
    $('#description').text(description);
    if (type === 'error') {
      errorModal();
    }
    $('#layout-modal').trigger('click');
  }



  return {
    openModal: openModal
  }
}();
