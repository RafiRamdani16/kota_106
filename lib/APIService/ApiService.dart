import 'package:dio/dio.dart' hide Headers;
import 'package:kota_106/Approval/AfterOvertimeApproval/AfterOvertimeApprovalModel.dart';
import 'package:kota_106/Approval/LeaveApproval/LeaveApprovalList/LeaveApprovalListModel.dart';
import 'package:kota_106/Approval/OvertimeApproval/OvertimeApprovalList/OvertimeApprovalListModel.dart';
import 'package:kota_106/Approval/PermitApproval/PermitApprovalList/PermitApprovalListModel.dart';
import 'package:kota_106/History/History%20After%20Overtime/AfterOvertimeHistoryModel.dart';


import 'package:kota_106/History/History%20Activity%20Record/HistoryActivityRecordList/HistoryActivityRecordModel.dart';
import 'package:kota_106/Approval/LeaveApproval/LeaveApprovalDetail/LeaveApprovalModel.dart';
import 'package:kota_106/Login/LoginModel.dart';
import 'package:kota_106/History/HistoryOvertime/HistoryOvertimeList/OvertimeHistoryModel.dart';
import 'package:kota_106/Approval/PermitApproval/PermitApprovalDetail/PermitApprovalModel.dart';

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
        "https://e438-2001-448a-3048-620d-b4bc-9fb0-d429-7e71.ap.ngrok.io/api/")
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
  Future<ApiResponse<String>> checkQRCode(
    @Field('QRCodeValue') String keyword,
    @Field('typeQRCode') String tipeQRCode,
    @Header("Authorization") String token,
  );

  @GET('attendance/check_status')
  Future<ApiResponse<String>> checkStatusCheckin(
    @Query("request") String checkInDate,
    @Header("Authorization") String token,
  );

  @POST('permit')
  Future<ApiResponse<String>> permitForm(
    @Field("userId") int employeeId,
    @Field("dateSubmit") String permitDateSubmit,
    @Field("datePermit") String permitDate,
    @Field("startTime") String permitStartTime,
    @Field("endTime") String permitEndTime,
    @Field("description") String permitDescription,
    @Field("attachment") String permitAttachment,
    @Header("Authorization") String token,
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
    @Field("UserIdApproval1") int idApprovalAdmin,
    @Field("UserIdApproval2") int idApprovalHR,
    @Field("UserIdApproval3") int idApprovalAtasan,
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
  Future<ApiResponse<PermitApprovalListModel>> getPermitApproval(
    @Query("Filters") String filters,
    @Query("Sorts") String sorts,
    @Query("Page") int page,
    @Query("PageSize") int limit,
    @Header("Authorization") String token,
  );

  @POST('leave')
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
    @Field("UserIdApproval1") int idApprovalAdmin,
    @Field("UserIdApproval2") int idApprovalHR,
    @Field("UserIdApproval3") int idApprovalAtasan,
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
      @Header("Authorization") String token);

  @GET('leave/{id}')
  Future<ApiResponse<LeaveApprovalModel>> getDetailLeave(
    @Path("id") int id,
    @Header("Authorization") String token,
  );

  @GET('leave/approval')
  Future<ApiResponse<LeaveApprovalListModel>> getLeaveApproval(
      @Query("Filters") String filters,
      @Query("Sorts") String sorts,
      @Query("Page") int page,
      @Query("PageSize") int limit,
      @Header("Authorization") String token);

  @POST('overtime')
  Future<ApiResponse<String>> overtimeForm(
    @Field("userId") int id,
    @Field("dateSubmit") String overtimeDateSubmit,
    @Field("dateOvertime") String overtimeDate,
    @Field("startTime") String overtimeStartTime,
    @Field("endTime") String overtimeEndTime,
    @Field("description") String overtimeDescription,
    @Header("Authorization") String token,
  );

  @PUT('overtime')
  Future<ApiResponse<String>> editOvertimeForm(
    @Field("overtimeId") int overtimeid,
    @Field("userId") int id,
    @Field("afterOvertimeId") int afterOvertime,
    @Header("Authorization") String token,
    @Field("dateSubmit") String overtimeDateSubmit,
    @Field("dateOvertime") String overtimeDate,
    @Field("startTime") String overtimeStartTime,
    @Field("endTime") String overtimeEndTime,
    @Field("description") String overtimeDescription,
    @Field("userIdApproval1") int idApprovalAdmin,
    @Field("userIdApproval2") int idApprovalHR,
    @Field("userIdApproval3") int idApprovalAtasan,
    @Field("statusApproval1") String statusApprovalAdmin,
    @Field("statusApproval2") String statusApprovalHR,
    @Field("statusApproval3") String statusApprovalAtasan,
    @Field("dateApproval1") String dateApprovalAdmin,
    @Field("dateApproval2") String dateApprovalHR,
    @Field("dateApproval3") String dateApprovalAtasan,
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
  Future<ApiResponse<OvertimeApprovalListModel>> getOvertimeApproval(
      @Query("Filters") String filters,
      @Query("Sorts") String sorts,
      @Query("Page") int page,
      @Query("PageSize") int limit,
      @Header("Authorization") String token);

  @POST('after_overtime')
  Future<ApiResponse<String>> afterOvertimeForm(
    @Field("overtimeId") int overtimeId,
    @Field("dateSubmit") String afterOvertimeSubmitDate,
    @Field("dateAfterOvertime") String afterOvertimeDate,
    @Field("startTime") String afterOvertimeStartTime,
    @Field("endTime") String afterOvertimeEndTime,
    @Field("description") String afterOvertimeDescription,
    @Field("attachment") String afterOvertimeAttachment,
    @Header("Authorization") String token,
  );

  @PUT('after_overtime')
  Future<ApiResponse<String>> editAfterOvertimeForm(
    @Field("afterOvertimeId") int afterOvertimeid,
    @Header("Authorization") String token,
    @Field("overtimeid") int afterOvertimeId,
    @Field("dateSubmit") String afterOvertimeSubmitDate,
    @Field("dateAfterOvertime") String afterOvertimeDate,
    @Field("startTime") String afterOvertimeStartTime,
    @Field("endTime") String afterOvertimeEndTime,
    @Field("description") String afterOvertimeDescription,
    @Field("attachment") String afterOvertimeAttachment,
    @Field("userIdApproval1") int idApprovalAdmin,
    @Field("userIdApproval2") int idApprovalHR,
    @Field("userIdApproval3") int idApprovalAtasan,
    @Field("statusApproval1") String statusApprovalAdmin,
    @Field("statusApproval2") String statusApprovalHR,
    @Field("statusApproval3") String statusApprovalAtasan,
    @Field("dateApproval1") String dateApprovalAdmin,
    @Field("dateApproval2") String dateApprovalHR,
    @Field("dateApproval3") String dateApprovalAtasan,
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
