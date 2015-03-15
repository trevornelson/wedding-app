$(document).ready(function(){

  $('#signin-modal').modal('show');

  $('#signin-form').on('submit', function(e){
    e.preventDefault();
    var data = $(this).serialize();
    var url = '/auth/create';

    Ajaj.signInForm(url, data);
  });

  $('#nav-notes').on('click', function(e){
    e.preventDefault();

    Ajaj.getPage('/prompts');
  });

  $('#nav-registry').on('click', function(e){
    e.preventDefault();

    Ajaj.getPage('/gifts');
  });

  $('#page-content').on('click', '#rsvp-button', function(e){
    e.preventDefault();
    var party_num = $('#number-in-party option:selected').text();
    var data = $(this).data();
    var response = data['status'];
    var url = '/users/' + data['id'];

    Ajaj.updateUser(url, {status: data['status'],
                          number_in_party: party_num
                          });
  });

  $('#page-content').on('submit', '.note-form', function(e){
    e.preventDefault();
    var data = $(this).serialize();
    var url = '/notes';

    Ajaj.addNoteForm(data);
    $('.collapse.in').removeClass('in');
    $('.textarea-input').text('');
  });

});




var Ajaj = function(){

  var signInForm = function(url, data) {
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

  var addNoteForm = function(data) {
    $.ajax({
      type: 'post',
      url: '/notes',
      data: data,
      success: function(result) {
        $('.note-form-success').removeClass('hidden');
      },
      error: function() {
        $('.note-form-alert').removeClass('hidden');
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
  }

  var getPage = function(url) {
    $.ajax({
      type: 'get',
      url: url,
      success: function(result) {
        $('#page-content').html(result);
      },
      error: function(result) {
        View.openModal('Hmmm... something went wrong', 'Please try again.', 'Error');
      }
    });
  }

  var updateUser = function(url, data) {
    console.log('updating user');

    $.ajax({
      type: 'put',
      data: data,
      url: url,
      success: function(result) {
        Ajaj.getUserPage(result);
      },
      error: function() {
        console.log('something went wrong');  ////////////
      }
    });
  }


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

  return {
    // checkSession: checkSession,
    signInForm: signInForm,
    addNoteForm: addNoteForm,
    getPage: getPage,
    getUserPage: getUserPage,
    updateUser: updateUser
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
