import 'package:dio/dio.dart' hide Headers;

import 'package:kota_106/Models/HistoryActivityRecordModel.dart';
import 'package:kota_106/Models/HistoryAttendanceModel.dart';
import 'package:kota_106/Models/LoginModel.dart';
import 'package:kota_106/Models/ScheduleModel.dart';
import 'package:kota_106/Models/UserModel.dart';

import 'package:retrofit/http.dart';

import 'ApiResponse.dart';

part 'ApiService.g.dart';

@RestApi(
    baseUrl:
        "https://0502-2001-448a-3023-30f1-fc92-3822-10f9-782c.ngrok.io/api/")
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
  Future<ApiResponse<String>> pencatatanKehadiranAwalDikantor(
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
      @Header("Authorization") String token);

  @POST('activity_record')
  Future<ApiResponse<String>> activityRecord(
    @Field("userId") int id,
    @Field("location") String location,
    @Field("date") String date,
    @Field("description") String description,
    @Field("photoName") String photoName,
    @Header("Authorization") String token,
  );

  @GET('activity_record')
  Future<ApiResponse<HistoryActivityRecordModel>> getHistoryActivityRecord(
      @Query("Filters") String filters,
      @Query("Sorts") String sorts,
      @Query("Page") int page,
      @Query("PageSize") int limit,
      @Header("Authorization") String token);

  @GET('user/{id}')
  Future<ApiResponse<UserModel>> getProfile(
    @Path("id") int id,
    @Header("Authorization") String token,
  );

  @GET('schedule/{id}')
  Future<ApiResponse<ScheduleModel>> getSchedule(
    @Path("id") int id,
    @Header("Authorization") String token,
  );

  @POST('refresh')
  Future<ApiResponse<String>> getRefreshToken(
    @Query('refreshToken') int id,
    @Header("Authorization") String token,
  );
}
