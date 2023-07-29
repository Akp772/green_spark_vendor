class ChangePasswordRequestModel {
  String? currentPassword;
  String? newPassword;
  String? newPasswordConfirm;

  ChangePasswordRequestModel(
      {this.currentPassword, this.newPassword, this.newPasswordConfirm});

  ChangePasswordRequestModel.fromJson(Map<String, dynamic> json) {
    currentPassword = json['current_password'];
    newPassword = json['new_password'];
    newPasswordConfirm = json['new_password_confirm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_password'] = currentPassword;
    data['new_password'] = newPassword;
    data['new_password_confirm'] = newPasswordConfirm;
    return data;
  }
}
