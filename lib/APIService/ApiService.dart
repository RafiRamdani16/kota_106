import 'package:dio/dio.dart' hide Headers;
import 'package:kota_106/Approval/AfterOvertimeApproval/AfterOvertimeApprovalModel.dart';
import 'package:kota_106/History/History%20After%20Overtime/AfterOvertimeHistoryModel.dart';
import 'package:kota_106/Submission/AfterOvertime/AfterOvertimeModel.dart';

import 'package:kota_106/History/History%20Activity%20Record/HistoryActivityRecordList/HistoryActivityRecordModel.dart';
import 'package:kota_106/Approval/LeaveApproval/LeaveApprovalDetail/LeaveApprovalModel.dart';
import 'package:kota_106/Login/LoginModel.dart';
import 'package:kota_106/History/HistoryOvertime/HistoryOvertimeList/OvertimeHistoryModel.dart';
import 'package:kota_106/Approval/PermitApproval/PermitApprovalDetail/PermitApprovalModel.dart';
import 'package:kota_106/Submission/Permit/PermitModel.dart';
import 'package:kota_106/Profile/UserModel.dart';
import 'package:retrofit/http.dart';
import '../../History/HistoryLeave/HistoryLeaveList/LeaveHistoryModel.dart';
import '../../History/HistoryPermit/HistoryPermitList/PermitHistoryModel.dart';
import '../Approval/OvertimeApproval/OvertimeApprovalDetail/OvertimeApprovalModel.dart';
import '../History/History Attendance/HistoryAttendanceList/HistoryAttendanceModel.dart';
import 'ApiResponse.dart';

part 'ApiService.g.dart';

@RestApi(
    baseUrl:
        "https://bbbe-2001-448a-304c-3893-1d52-5ff3-6470-a748.ngrok.io/api/")
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  @Headers(<String, dynamic>{
    "Content-Type": "application/json",
  })
  @POST('auth/login')
  Future<ApiResponse<LoginModel>> authentication(
      @Field("email") String email, @Field("password") String password);

  @POST('attendance/checkin_online')
  Future<ApiResponse<String>> checkinOnline(
      @Field("userId") int id,
      @Field("checkinTime") String checkinTime,
      @Field("description") String taskList,
      @Field("photoName") String photoSelfie,
      @Field("location") String locationNow,
      @Header("Authorization") String token);

  @POST('attendance/checkout_online')
  Future<ApiResponse<String>> checkoutOnline(
      @Field("userId") int id,
      @Field("checkoutTime") String checkoutTime,
      @Field("description") String completedTask,
      @Field("location") String locationNow,
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
    @Field("description") String taskList,
    @Field("photoName") String photoSelfie,
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
  Future<ApiResponse<UserModel>> updateProfile(
    @Path("Userid") int id,
    @Field("Name") String name,
    @Field("Religion") String religion,
    @Field("Position") String position,
    @Field("CurrentSalary") int currentSalary,
    @Field("Status") String status,
    @Field("JoinDate") String joinDate,
    @Field("EndDate") String endDate,
    @Field("PhoneNumber") String phoneNumber,
    @Field("Email") String email,
    @Field("Address") String address,
    @Field("City") String city,
    @Field("NoKtp") String noKtp,
    @Field("NPWP") String npwp,
    @Field("DateOfBirth") String dateOfBirth,
    @Field("Role") String role,
    @Field("Password") String password,
    @Field("PhotoName") String photoName,
    @Field("SuperiorId") int superiorId,
    @Header("Authorization") String token,
  );

  @POST('refresh')
  Future<ApiResponse<String>> getRefreshToken(
    @Query('refreshToken') int id,
    @Header("Authorization") String token,
  );

  @POST('attendance/check_QRCode_attendance')
  Future<ApiResponse<String>> checkQRCodeO(
    @Query('keyword') String keyword,
    @Header("Authorization") String token,
  );

  @POST('permit')
  Future<ApiResponse<String>> permitForm(
    @Field("userId") int employeeId,
    @Header("Authorization") String token,
    @Field("DateSubmit") String permitDateSubmit,
    @Field("DatePermit") String permitDate,
    @Field("StartTime") String permitStartTime,
    @Field("EndTime") String permitEndTime,
    @Field("Description") String permitDescription,
    @Field("Attachment") String permitAttachment,
  );

  @PUT('permit')
  Future<ApiResponse<String>> editPermitForm(
    @Field("PermitId") int permitId,
    @Field("userId") int employeeId,
    @Header("Authorization") String token,
    @Field("DateSubmit") String permitDateSubmit,
    @Field("DatePermit") String permitDate,
    @Field("StartTime") String permitStartTime,
    @Field("EndTime") String permitEndTime,
    @Field("Description") String permitDescription,
    @Field("Attachment") String permitAttachment,
    @Field("UserIdApproval1") String idApprovalAdmin,
    @Field("UserIdApproval2") String idApprovalHR,
    @Field("UserIdApproval3") String idApprovalAtasan,
    @Field("StatusApproval1") String statusApprovalAdmin,
    @Field("StatusApproval2") String statusApprovalHR,
    @Field("StatusApproval3") String statusApprovalAtasan,
    @Field("DateApproval1") String dateApprovalAdmin,
    @Field("DateApproval2") String dateApprovalHR,
    @Field("DateApproval3") String dateApprovalAtasan,
  );

  @GET('permit')
  Future<ApiResponse<PermitHistoryModel>> getPermitHistory(
    @Query("Filters") String filters,
    @Query("Sorts") String sorts,
    @Query("Page") int page,
    @Query("PageSize") int limit,
    @Header("Authorization") String token,
  );

  @GET('permit/{id}')
  Future<ApiResponse<PermitApprovalModel>> getDetailPermit(
    @Path("id") int id,
    @Header("Authorization") String token,
  );

  @GET('permit/approval')
  Future<ApiResponse<PermitApprovalModel>> getPermitApproval(
    @Query("Filters") String filters,
    @Query("Sorts") String sorts,
    @Query("Page") int page,
    @Query("PageSize") int limit,
    @Header("Authorization") String token,
  );

  @POST('leave')
  Future<ApiResponse<String>> leaveForm(
    @Field("UserId") int id,
    @Header("Authorization") String token,
    @Field("DateSubmit") String leaveDate,
    @Field("DateStart") String leaveStartDate,
    @Field("DateEnd") String leaveEndDate,
    @Field("Type") String leaveType,
    @Field("Description") String leaveDescription,
    @Field("Attachment") String leaveAttachment,
  );

  @PUT('leave')
  Future<ApiResponse<String>> editLeaveForm(
    @Field("LeaveId") int leaveid,
    @Field("UserId") int id,
    @Header("Authorization") String token,
    @Field("DateSubmit") String leaveDate,
    @Field("DateStart") String leaveStartDate,
    @Field("DateEnd") String leaveEndDate,
    @Field("Type") String leaveType,
    @Field("Description") String leaveDescription,
    @Field("Attachment") String leaveAttachment,
    @Field("UserIdApproval1") String idApprovalAdmin,
    @Field("UserIdApproval2") String idApprovalHR,
    @Field("UserIdApproval3") String idApprovalAtasan,
    @Field("StatusApproval1") String statusApprovalAdmin,
    @Field("StatusApproval2") String statusApprovalHR,
    @Field("StatusApproval3") String statusApprovalAtasan,
    @Field("DateApproval1") String dateApprovalAdmin,
    @Field("DateApproval2") String dateApprovalHR,
    @Field("DateApproval3") String dateApprovalAtasan,
  );

  @GET('leave')
  Future<ApiResponse<LeaveHistoryModel>> getLeaveHistory(
    @Query("Filters") String filters,
    @Query("Sorts") String sorts,
    @Query("Page") int page,
    @Query("PageSize") int limit,
  );

  @GET('leave/{id}')
  Future<ApiResponse<LeaveApprovalModel>> getDetailLeave(
    @Path("id") int id,
    @Header("Authorization") String token,
  );

  @GET('leave/approval')
  Future<ApiResponse<LeaveApprovalModel>> getLeaveApproval(
    @Query("Filters") String filters,
    @Query("Sorts") String sorts,
    @Query("Page") int page,
    @Query("PageSize") int limit,
  );

  @POST('overtime')
  Future<ApiResponse<String>> overtimeForm(
    @Field("UserId") int id,
    @Header("Authorization") String token,
    @Field("DateSubmit") String overtimeDateSubmit,
    @Field("DateOvertime") String overtimeDate,
    @Field("StartTime") String overtimeStartTime,
    @Field("EndTime") String overtimeEndTime,
    @Field("Description") String overtimeDescription,
  );

  @PUT('overtime')
  Future<ApiResponse<String>> editOvertimeForm(
    @Field("OvertimeId") int overtimeid,
    @Field("UserId") int id,
    @Field("AfterOvertimeId") int afterOvertime,
    @Header("Authorization") String token,
    @Field("DateSubmit") String overtimeDateSubmit,
    @Field("DateOvertime") String overtimeDate,
    @Field("StartTime") String overtimeStartTime,
    @Field("EndTime") String overtimeEndTime,
    @Field("Description") String overtimeDescription,
    @Field("UserIdApproval1") String idApprovalAdmin,
    @Field("UserIdApproval2") String idApprovalHR,
    @Field("UserIdApproval3") String idApprovalAtasan,
    @Field("StatusApproval1") String statusApprovalAdmin,
    @Field("StatusApproval2") String statusApprovalHR,
    @Field("StatusApproval3") String statusApprovalAtasan,
    @Field("DateApproval1") String dateApprovalAdmin,
    @Field("DateApproval2") String dateApprovalHR,
    @Field("DateApproval3") String dateApprovalAtasan,
  );

  @GET('overtime')
  Future<ApiResponse<OvertimeHistoryModel>> getOvertimeHistory(
      @Query("Filters") String filters,
      @Query("Sorts") String sorts,
      @Query("Page") int page,
      @Query("PageSize") int limit,
      @Header("Authorization") String token);

  @GET('overtime/{id}')
  Future<ApiResponse<OvertimeApprovalModel>> getDetailOvertime(
    @Path("id") int id,
    @Header("Authorization") String token,
  );

  @GET('overtime/approval')
  Future<ApiResponse<OvertimeApprovalModel>> getOvertimeApproval(
      @Query("Filters") String filters,
      @Query("Sorts") String sorts,
      @Query("Page") int page,
      @Query("PageSize") int limit,
      @Header("Authorization") String token);

  @POST('after_overtime')
  Future<ApiResponse<String>> afterOvertimeForm(
    @Field("UserId") int id,
    @Header("Authorization") String token,
    @Field("id") int afterOvertimeId,
    @Field("DateSubmit") String afterOvertimeSubmitDate,
    @Field("DateAfterOvertime") String afterOvertimeDate,
    @Field("StartTime") String afterOvertimeStartTime,
    @Field("EndTime") String afterOvertimeEndTime,
    @Field("Description") String afterOvertimeDescription,
    @Field("Attachment") String afterOvertimeAttachment,
  );

  @PUT('after_overtime')
  Future<ApiResponse<String>> editAfterOvertimeForm(
    @Field("AfterOvertimeId") int afterOvertimeid,
    @Header("Authorization") String token,
    @Field("Overtimeid") int afterOvertimeId,
    @Field("DateSubmit") String afterOvertimeSubmitDate,
    @Field("DateAfterOvertime") String afterOvertimeDate,
    @Field("StartTime") String afterOvertimeStartTime,
    @Field("EndTime") String afterOvertimeEndTime,
    @Field("Description") String afterOvertimeDescription,
    @Field("Attachment") String afterOvertimeAttachment,
    @Field("UserIdApproval1") String idApprovalAdmin,
    @Field("UserIdApproval2") String idApprovalHR,
    @Field("UserIdApproval3") String idApprovalAtasan,
    @Field("StatusApproval1") String statusApprovalAdmin,
    @Field("StatusApproval2") String statusApprovalHR,
    @Field("StatusApproval3") String statusApprovalAtasan,
    @Field("DateApproval1") String dateApprovalAdmin,
    @Field("DateApproval2") String dateApprovalHR,
    @Field("DateApproval3") String dateApprovalAtasan,
  );

  @GET('after_overtime')
  Future<ApiResponse<AfterOvertimeHistoryModel>> getAfterOvertimeHistory(
      @Query("Filters") String filters,
      @Query("Sorts") String sorts,
      @Query("Page") int page,
      @Query("PageSize") int limit,
      @Header("Authorization") String token);

  @GET('after_overtime/{id}')
  Future<ApiResponse<AfterOvertimeApprovalModel>> getDetailAfterOvertime(
    @Path("id") int id,
    @Header("Authorization") String token,
  );

  @GET('after_overtime/approval')
  Future<ApiResponse<AfterOvertimeHistoryModel>> getAfterOvertimeApproval(
      @Query("Filters") String filters,
      @Query("Sorts") String sorts,
      @Query("Page") int page,
      @Query("PageSize") int limit,
      @Header("Authorization") String token);
}
