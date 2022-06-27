import 'package:dio/dio.dart' hide Headers;
import 'package:kota_106/Approval/ListApprovalModel.dart';

import 'package:retrofit/http.dart';

import '../Approval/LeaveApproval/LeaveApprovalList/LeaveApprovalListModel.dart';
import '../History/History Activity Record/HistoryActivityRecordList/HistoryActivityRecordModel.dart';
import '../History/History Attendance/HistoryAttendanceList/HistoryAttendanceModel.dart';
import '../History/HistoryLeave/HistoryLeaveList/LeaveHistoryModel.dart';
import '../History/HistoryPermit/HistoryPermitList/PermitHistoryModel.dart';
import '../Login/LoginModel.dart';
import '../Profile/ReligionModel.dart';
import '../Profile/UserModel.dart';
import 'ApiResponse.dart';

part 'ApiService.g.dart';

@RestApi(
    baseUrl:
        "https://0c3b-2001-448a-3045-5919-c20-9d39-97fc-d27a.ap.ngrok.io/api/")
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  @Headers(<String, dynamic>{
    "Content-Type": "application/json",
  })
  @POST('auth/login_mobile')
  Future<ApiResponse<LoginModel>> authentication(
      @Field("email") String email, @Field("password") String password);
  @Headers(<String, dynamic>{
    "Content-Type": "application/json",
  })
  @POST('attendance/checkin_online')
  Future<ApiResponse<String>> checkinOnline(
      @Field("userId") int id,
      @Field("location") String locationNow,
      @Field("photoName") String photoSelfie,
      @Field("checkinTime") String checkinTime,
      @Field("description") String taskList,
      @Header("Authorization") String token);

  @POST('attendance/checkout_online')
  Future<ApiResponse<String>> checkoutOnline(
      @Field("userId") int id,
      @Field("location") String locationNow,
      @Field("checkoutTime") String checkoutTime,
      @Field("description") String completedTask,
      @Header("Authorization") String token);

  @POST('attendance/checkin_offline')
  Future<ApiResponse<String>> checkinOffline(
      @Field("userId") int id,
      @Field("location") String location,
      @Field("checkinTime") String checkinTime,
      @Field("description") String description,
      @Header("Authorization") String token);

  @POST('attendance/checkout_offline')
  Future<ApiResponse<String>> checkoutOffline(
      @Field("UserId") int id,
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
    @Field("userId") int emploeeId,
    @Field("date") String activityRecordTime,
    @Field("photoName") String photoSelfie,
    @Field("description") String taskList,
    @Field("location") String location,
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

  @PUT('user')
  Future<ApiResponse<String>> updateProfile(
    @Field("userId") int id,
    @Field("superiorId") int superiorId,
    @Field("name") String name,
    @Field("religion") String religion,
    @Field("position") String position,
    @Field("gender") String gender,
    @Field("status") String status,
    @Field("joinDate") String joinDate,
    @Field("endDate") String endDate,
    @Field("phoneNumber") String phoneNumber,
    @Field("email") String email,
    @Field("address") String address,
    @Field("city") String city,
    @Field("noKtp") String noKtp,
    @Field("nPWP") String npwp,
    @Field("dateOfBirth") String dateOfBirth,
    @Field("role") String role,
    @Field("password") String password,
    @Field("photoName") String photoName,
    @Header("Authorization") String token,
  );

  @GET('religion')
  Future<ApiResponse<List<ReligionModel>>> getReligion(
    @Header("Authorization") String token,
  );

  @GET('position')
  Future<ApiResponse<List<ReligionModel>>> getPosition(
    @Header("Authorization") String token,
  );

  @POST('refresh')
  Future<ApiResponse<String>> getRefreshToken(
    @Query('refreshToken') int id,
    @Header("Authorization") String token,
  );

  @POST('attendance/check_QRCode_attendance')
  Future<ApiResponse<String>> checkQRCode(
    @Field('typeQRCode') String tipeQRCode,
    @Field('qRCodeValue') String keyword,
    @Header("Authorization") String token,
  );

  @GET('attendance/check_status')
  Future<ApiResponse<String>> checkStatusCheckin(
    @Query("request") String checkInDate,
    @Header("Authorization") String token,
  );

  @POST('submission')
  Future<ApiResponse<String>> submissionForm(
    @Field("userId") int employeeId,
    @Field("overtimeId") int overtimeId,
    @Field("dateSubmit") String dateSubmit,
    @Field("datePerform") String datePerform,
    @Field("startTime") String startTime,
    @Field("endTime") String endTime,
    @Field("submissionType") String submissionType,
    @Field("description") String permitDescription,
    @Field("attachment") String permitAttachment,
    @Header("Authorization") String token,
  );

  @PUT('submission')
  Future<ApiResponse<String>> editSubmissionForm(
    @Field("submissionId") int submissionId,
    @Field("dateSubmit") String submissionDateSubmit,
    @Field("datePerform") String submissionDate,
    @Field("startTime") String submissionStartTime,
    @Field("endTime") String submissionEndTime,
    @Field("description") String submissionDescription,
    @Field("Attachment") String submissionAttachment,
    @Header("Authorization") String token,
  );

  @GET('submission')
  Future<ApiResponse<PermitHistoryModel>> getSubmissionHistory(
    @Query("Filters") String filters,
    @Query("Sorts") String sorts,
    @Query("Page") int page,
    @Query("PageSize") int limit,
    @Header("Authorization") String token,
  );

  @GET('submission/approval')
  Future<ApiResponse<ListApprovalModel>> getApproval(
    @Query("Filters") String filters,
    @Query("Sorts") String sorts,
    @Query("Page") int page,
    @Query("PageSize") int limit,
    @Header("Authorization") String token,
  );

  @PUT('submission/approval')
  Future<ApiResponse<String>> giveDecision(
    @Field("approvalId") int approvalId,
    @Field("userId") int userId,
    @Field("submissionAttributeId") int submissionId,
    @Field("statusApproval") String statusApproval,
    @Field("dateApproval") String dateApproval,
    @Header("Authorization") String token,
  );

  @POST('submission_leave')
  Future<ApiResponse<String>> leaveForm(
    @Field("userId") int id,
    @Field("dateSubmit") String leaveDate,
    @Field("dateStart") String leaveStartDate,
    @Field("dateEnd") String leaveEndDate,
    @Field("type") String leaveType,
    @Field("description") String leaveDescription,
    @Field("attachment") String leaveAttachment,
    @Header("Authorization") String token,
  );

  @PUT('submission_leave')
  Future<ApiResponse<String>> editLeaveForm(
    @Field("submissionLeaveId") int leaveid,
    @Field("dateSubmit") String leaveDate,
    @Field("dateStart") String leaveStartDate,
    @Field("dateEnd") String leaveEndDate,
    @Field("type") String leaveType,
    @Field("description") String leaveDescription,
    @Field("attachment") String leaveAttachment,
    @Header("Authorization") String token,
  );

  @PUT('submission_leave/approval')
  Future<ApiResponse<String>> leaveApproval(
    @Field("approvalId") int approvalId,
    @Field("userId") int employeeId,
    @Field("submissionAttributeId") int submissionAttributeId,
    @Field("statusApproval") String statusApproval,
    @Field("dateApproval") String dateApproval,
    @Header("Authorization") String token,
  );

  @GET('submission_leave')
  Future<ApiResponse<LeaveHistoryModel>> getLeaveHistory(
      @Query("Filters") String filters,
      @Query("Sorts") String sorts,
      @Query("Page") int page,
      @Query("PageSize") int limit,
      @Header("Authorization") String token);


  @GET('submission_leave/approval')
  Future<ApiResponse<LeaveApprovalListModel>> getLeaveApproval(
      @Query("Filters") String filters,
      @Query("Sorts") String sorts,
      @Query("Page") int page,
      @Query("PageSize") int limit,
      @Header("Authorization") String token);
}
