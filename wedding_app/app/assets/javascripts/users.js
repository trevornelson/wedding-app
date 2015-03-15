function User(params) {
  this.status = params['status'];
  this.username = params['username'];
  this.name = params['name'];
  this.street_address = params['street_address'];
  this.city = params['city'];
  this.state = params['state'];
  this.zip_code = params['zip_code'];
  this.invited_plus_one = params['invited_plus_one'];
  this.number_in_party = params['number_in_party'];
}

User.prototype.toggleAttending = function(){
  if (this.status == 'NoResponse' || this.status == 'NotAttending') {
    this.status == 'Attending'
  } else if (this.status == 'Attending') {
    this.status == 'NotAttending'
  }
}
