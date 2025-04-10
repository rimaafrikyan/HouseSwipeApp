// import 'dart:convert'; 
// import 'package:http/http.dart' as http; 

// class ApiService {

//   static const String baseUrl = '';


//   static Future<Map<String, dynamic>> signUp(
//       String fullName, String email, String password) async {
   
//     await Future.delayed(Duration(seconds: 2)); 
//     return {
//       'success': true,
//       'message': 'User registered successfully',
//       'data': {
//         'id': 1,
//         'fullName': fullName,
//         'email': email,
//       }
//     };
//   }

 
//   static Future<Map<String, dynamic>> signIn(String email, String password) async {
    
//     await Future.delayed(Duration(seconds: 2)); 
//     if (email == 'test@.com' && password == 'password123') {
//       return {
//         'success': true,
//         'message': 'Login successful',
//         'data': {
//           'id': 1,
//           'fullName': 'John',
//           'email': email,
//         }
//       };
//     } else {
//       return {
//         'success': false,
//         'message': 'Invalid email or password',
//       };
//     }
//   }
// }