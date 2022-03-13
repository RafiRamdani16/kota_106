import 'package:dio/dio.dart' hide Headers;
import 'package:kota_106/Models/HistoryAttendanceModel.dart';
import 'package:kota_106/Models/LoginModel.dart';


import 'package:retrofit/http.dart';

import 'ApiResponse.dart';

part 'ApiService.g.dart';

@RestApi(baseUrl: "http://c090-125-163-95-61.ngrok.io/api/")
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;
  @Headers(<String, dynamic>{
    "Content-Type": "application/json",
  })
  @POST('auth/login')
  Future<ApiResponse<LoginModel>> login(
      @Field("email") String email, @Field("password") String password);

  @POST('attendance/checkin_online')
  Future<ApiResponse<String>> checkinOnline(
      @Field("userId") int id,
      @Field("scheduleId") int scheduleId,
      @Field("location") String location,
      @Field("photoName") String photoName,
      @Field("checkinTime") String checkinTime,
      @Field("description") String description,
      @Header("Authorization") String token);

  @POST('attendance/checkout_online')
  Future<ApiResponse<String>> checkoutOnline(
      @Field("userId") int id,
      @Field("scheduleId") int scheduleId,
      @Field("location") String location,
      @Field("checkoutTime") String checkoutTime,
      @Field("description") String description,
      @Header("Authorization") String token);

   @POST('attendance/checkin_offline')
  Future<ApiResponse<String>> checkinOffline(
      @Field("userId") int id,
      @Field("scheduleId") int scheduleId,
      @Field("location") String location,
      @Field("checkinTime") String checkinTime,
      @Field("description") String description,
      @Header("Authorization") String token);
      
  @POST('attendance/checkout_offline')
  Future<ApiResponse<String>> checkoutOffline(
      @Field("userId") int id,
      @Field("scheduleId") int scheduleId,
      @Field("location") String location,
      @Field("checkoutTime") String checkoutTime,
      @Field("description") String description,
      @Header("Authorization") String token);

  @GET('attendance')
  Future<ApiResponse<HistoryAttendanceModel>> getHistoryAttendance(
    @Query("Filters") String filters,
    @Query("Sorts") String sorts,
    @Query("Page") int page,
    @Query("PageSize") int limit,
    @Header("Authorization") String token
  );
}
