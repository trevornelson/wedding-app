$(document).ready(function(){

  $('#signin-modal').modal('show');

  $('#signin-form').on('submit', function(e){
    e.preventDefault();
    var data = $(this).serialize();
    var url = '/auth/create';

    Ajaj.postForm(url, data);
  });



});




var Ajaj = function(){

  var postForm = function(url, data) {
    $.ajax({
      type: 'post',
      url: url,
      data: data,
      success: function(result) {
        Ajaj.getUserPage(result);
        $('#signin-modal').modal('hide');
      },
      error: function(result) {
        $('#signin-title').text(View.errorAlert.pw).css('color', 'white');
        View.errorModal();
      }
    });
  }

  var getUserPage = function(user) {
    $.ajax({
      type: 'get',
      data: user,
      url: '/users/' + user['id'],
      success: function(result) {
        console.log(result);
        $('#page-content').html(result);
      },
      error: function(result) {
        console.log(result);
        View.openModal('Hmmm... something went wrong', 'Please try again.', 'Error');
      }
    });

  // var checkSession = function() {

  //   $.ajax({
  //     type: 'get',
  //     url: '/auth/new',
  //     success: function(result) {
  //       if (result['username']) {
  //         var user = new User(result);
  //         Ajaj.getUserPage(user);
  //       } else {
  //         $('#signin-modal').modal('show');
  //       }
  //     },
  //     error: function(result) {
  //       $('#signin-modal').modal('show');
  //     }
  //   });
  // }
  }

  return {
    // checkSession: checkSession,
    postForm: postForm,
    getUserPage: getUserPage
  }

}();




var View = function() {
  var errorAlert = {
    pw: 'Incorrect password, please try again.'
  }

  var errorModal = function() {
    $('.modal-header').css('background-color', '#D24D57');
  }

  var openModal = function(title, description, type) {
    $('#title').text(title);
    $('#description').text(description);
    if (type === 'error') { errorModal(); }
    $('#layout-modal').trigger('click');
  }

  return {
    openModal: openModal,
    errorAlert: errorAlert,
    errorModal: errorModal
  }
}();
