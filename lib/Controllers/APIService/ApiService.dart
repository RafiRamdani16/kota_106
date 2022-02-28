import 'package:dio/dio.dart' hide Headers;


import 'package:retrofit/http.dart';

import 'ApiResponse.dart';

part 'ApiService.g.dart';

@RestApi(baseUrl: "http://128f-180-245-166-90.ngrok.io/api/")
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;
  @Headers(<String, dynamic>{
    "Content-Type": "application/json",
  })
  @POST('auth/login')
  Future<ApiResponse> login(
      @Field("email") String email, @Field("password") String password);

  @POST('attendance/checkin_online')
  Future<ApiResponse> checkinOnline(
      @Field("userId") int id,
      @Field("scheduleId") int scheduleId,
      @Field("location") String location,
      @Field("photoName") String photoName,
      @Field("checkinTime") String checkinTime,
      @Field("description") String description,
      @Header("Authorization") String token);

  @POST('attendance/checkout_online')
  Future<ApiResponse> checkoutOnline(
      @Field("userId") int id,
      @Field("scheduleId") int scheduleId,
      @Field("location") String location,
      @Field("checkoutTime") String checkoutTime,
      @Field("description") String description,
      @Header("Authorization") String token);

  @GET('history/attendance')
  Future<ApiResponse> getHistoryAttendance(
    @Query("page") int page,
    @Query("limit") int limit,
    @Header("Authorization") String token
  );
}
