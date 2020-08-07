class RegistrationModel {
  String _profileImageLocalPath;
  String _attachmentLocalPath;
  String _personalInformation;

  RegistrationModel(
      {String profileImageLocalPath,
      String attachmentLocalPath,
      String personalInformation}) {
    this._profileImageLocalPath = profileImageLocalPath;
    this._attachmentLocalPath = attachmentLocalPath;
    this._personalInformation = personalInformation;
  }

  String get profileImageLocalPath => _profileImageLocalPath;
  set profileImageLocalPath(String profileImageLocalPath) =>
      _profileImageLocalPath = profileImageLocalPath;
  String get attachmentLocalPath => _attachmentLocalPath;
  set attachmentLocalPath(String attachmentLocalPath) =>
      _attachmentLocalPath = attachmentLocalPath;
  String get personalInformation => _personalInformation;
  set personalInformation(String personalInformation) =>
      _personalInformation = personalInformation;

  RegistrationModel.fromJson(Map<String, dynamic> json) {
    _profileImageLocalPath = json['profile_image_local_path'];
    _attachmentLocalPath = json['attachment_local_path'];
    _personalInformation = json['personal_information'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile_image_local_path'] = this._profileImageLocalPath;
    data['attachment_local_path'] = this._attachmentLocalPath;
    data['personal_information'] = this._personalInformation;
    return data;
  }
}
