class BaseReq {
  final String loginReq = 'api/v0.3/login';
  final String registerReq = 'api/v0.3/register';
  final String existedPhoneReq = 'api/v0.3/check-exits-username';
  final String chatReq = 'api/v0.3/chatapi/list-chat-rooms';
  final String message = 'api/v0.3/chatapi/get-messages';
  final String sendMessage = 'api/v0.3/chatapi/send-message';
  final String sendImage = 'chatapi/send-message';
  final String getListDoctor = 'api/v0.3/appointment/list-doctor';
  final String getDetailDoctor = 'api/v0.3/appointment/detail-doctor/';
  final String getListProvince = 'api/v0.3/province/get-list';
  final String getListSpeciality = 'api/v0.3/speciality/get-list';
  final String getListClinic = 'api/v0.3/appointment/list-clinic';
  final String getDetailClinic = 'api/v0.3/appointment/detail-clinic';
}
