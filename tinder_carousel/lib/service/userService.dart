
import 'dart:convert';

import 'package:tinder_carousel/model/User.dart';
import 'package:tinder_carousel/model/dataObject.dart';
import 'package:tinder_carousel/model/models.dart';

 class UserApi {
   Future<ApiResponse<ListResponse<User>>> getUser() async {
     try {
       Map<String, dynamic> response = responseJson;
       return ApiResponse(
         ListResponse<User>(
           response,
           "results",
               (item) => User.fromJson(item),
         ),
         200,
       );
     } catch (e) {
       return ApiResponse(null, 404);
     }
   }

   Future<ApiResponse<SingleResponse<User>>> getUserSingle() async {
     try {
       Map<String, dynamic> response = singleUserResponse;
       return ApiResponse(
         SingleResponse<User>(
           response,
           "single",
               (item) => User.fromJson(item),
         ),
         200,
       );
     } catch (e) {
       return ApiResponse(null, 404);
     }
   }
 }