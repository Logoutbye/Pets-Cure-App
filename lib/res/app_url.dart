class AppUrl {
  static var baseUrl = 'https://reqres.in';
  static var loginEndPoint = baseUrl + '/api/login';
  static var registorEndPoint = baseUrl + '/api/register';

  // pets cure app apis
  static var petsCureBaseUrl = 'https://kawiishapps.com/api/';
  static var allDoctorsUrl = petsCureBaseUrl + 'doc';

  static var allHospitalsUrl = petsCureBaseUrl + 'hosp';
  static var allPetsMarketUrl = petsCureBaseUrl + 'pets';

  static var AddPetUsingPostApiUrl = petsCureBaseUrl + 'postpets';

  static var signUpUserUrl = petsCureBaseUrl + 'postsignup';

  static var forgotPasswordUrl = petsCureBaseUrl + 'forgotpassword/';

  static var signInUrl = petsCureBaseUrl + 'signin/';

  static var getUserById = petsCureBaseUrl + 'getuserbyid/';

  static var updateUSerProfileImage = petsCureBaseUrl + 'updateprofileimage/';

  static var updateUSerProfileinfo = petsCureBaseUrl + 'updateuserinfo/';

  static var getAllPetsByUserId = petsCureBaseUrl + 'getallpetsbyuserid/';

  static var deletePetPostByUser = petsCureBaseUrl + 'deletepetpostbyuser/';
}
