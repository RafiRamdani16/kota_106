// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApiService.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??=
        'https://e438-2001-448a-3048-620d-b4bc-9fb0-d429-7e71.ap.ngrok.io/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ApiResponse<LoginModel>> authentication(email, password) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Content-Type': 'application/json'};
    _headers.removeWhere((k, v) => v == null);
    final _data = {'email': email, 'password': password};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<LoginModel>>(Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                contentType: 'application/json')
            .compose(_dio.options, 'auth/login_mobile',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<LoginModel>.fromJson(
      _result.data!,
      (json) => LoginModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ApiResponse<String>> checkinOnline(
      id, locationNow, photoSelfie, checkinTime, taskList, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': 'application/json',
      r'Authorization': token
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'userId': id,
      'location': locationNow,
      'photoName': photoSelfie,
      'checkinTime': checkinTime,
      'description': taskList
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<String>>(Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                contentType: 'application/json')
            .compose(_dio.options, 'attendance/checkin_online',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<ApiResponse<String>> checkoutOnline(
      id, locationNow, checkoutTime, completedTask, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'userId': id,
      'location': locationNow,
      'checkoutTime': checkoutTime,
      'description': completedTask
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<String>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'attendance/checkout_online',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<ApiResponse<String>> checkinOffline(
      id, location, checkinTime, description, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'userId': id,
      'location': location,
      'checkinTime': checkinTime,
      'description': description
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<String>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'attendance/checkin_offline',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<ApiResponse<String>> checkoutOffline(
      id, location, checkoutTime, description, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'UserId': id,
      'location': location,
      'checkoutTime': checkoutTime,
      'description': description
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<String>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'attendance/checkout_offline',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<ApiResponse<HistoryAttendanceModel>> getHistoryAttendance(
      filters, sorts, page, limit, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'Filters': filters,
      r'Sorts': sorts,
      r'Page': page,
      r'PageSize': limit
    };
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<HistoryAttendanceModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'attendance',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<HistoryAttendanceModel>.fromJson(
      _result.data!,
      (json) => HistoryAttendanceModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ApiResponse<String>> activityRecord(emploeeId, activityRecordTime,
      photoSelfie, taskList, location, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'userId': emploeeId,
      'date': activityRecordTime,
      'photoName': photoSelfie,
      'description': taskList,
      'location': location
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<String>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'activity_record',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<ApiResponse<HistoryActivityRecordModel>> getHistoryActivityRecord(
      filters, sorts, page, limit, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'Filters': filters,
      r'Sorts': sorts,
      r'Page': page,
      r'PageSize': limit
    };
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<HistoryActivityRecordModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'activity_record',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<HistoryActivityRecordModel>.fromJson(
      _result.data!,
      (json) =>
          HistoryActivityRecordModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ApiResponse<UserModel>> getProfile(id, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<UserModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'user/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<UserModel>.fromJson(
      _result.data!,
      (json) => UserModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ApiResponse<UserModel>> updateProfile(
      id,
      name,
      religion,
      position,
      currentSalary,
      status,
      joinDate,
      endDate,
      phoneNumber,
      email,
      address,
      city,
      noKtp,
      npwp,
      dateOfBirth,
      role,
      password,
      photoName,
      superiorId,
      token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'Name': name,
      'Religion': religion,
      'Position': position,
      'CurrentSalary': currentSalary,
      'Status': status,
      'JoinDate': joinDate,
      'EndDate': endDate,
      'PhoneNumber': phoneNumber,
      'Email': email,
      'Address': address,
      'City': city,
      'NoKtp': noKtp,
      'NPWP': npwp,
      'DateOfBirth': dateOfBirth,
      'Role': role,
      'Password': password,
      'PhotoName': photoName,
      'SuperiorId': superiorId
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<UserModel>>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options, 'user',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<UserModel>.fromJson(
      _result.data!,
      (json) => UserModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ApiResponse<String>> getRefreshToken(id, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'refreshToken': id};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<String>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'refresh',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<ApiResponse<String>> checkQRCode(keyword, tipeQRCode, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {'QRCodeValue': keyword, 'typeQRCode': tipeQRCode};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<String>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'attendance/check_QRCode_attendance',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<ApiResponse<String>> checkStatusCheckin(checkInDate, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'request': checkInDate};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<String>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'attendance/check_status',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<ApiResponse<String>> permitForm(
      employeeId,
      permitDateSubmit,
      permitDate,
      permitStartTime,
      permitEndTime,
      permitDescription,
      permitAttachment,
      token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'userId': employeeId,
      'dateSubmit': permitDateSubmit,
      'datePermit': permitDate,
      'startTime': permitStartTime,
      'endTime': permitEndTime,
      'description': permitDescription,
      'attachment': permitAttachment
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<String>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'permit',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<ApiResponse<String>> editPermitForm(
      permitId,
      employeeId,
      token,
      permitDateSubmit,
      permitDate,
      permitStartTime,
      permitEndTime,
      permitDescription,
      permitAttachment,
      idApprovalAdmin,
      idApprovalHR,
      idApprovalAtasan,
      statusApprovalAdmin,
      statusApprovalHR,
      statusApprovalAtasan,
      dateApprovalAdmin,
      dateApprovalHR,
      dateApprovalAtasan) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'PermitId': permitId,
      'userId': employeeId,
      'DateSubmit': permitDateSubmit,
      'DatePermit': permitDate,
      'StartTime': permitStartTime,
      'EndTime': permitEndTime,
      'Description': permitDescription,
      'Attachment': permitAttachment,
      'UserIdApproval1': idApprovalAdmin,
      'UserIdApproval2': idApprovalHR,
      'UserIdApproval3': idApprovalAtasan,
      'StatusApproval1': statusApprovalAdmin,
      'StatusApproval2': statusApprovalHR,
      'StatusApproval3': statusApprovalAtasan,
      'DateApproval1': dateApprovalAdmin,
      'DateApproval2': dateApprovalHR,
      'DateApproval3': dateApprovalAtasan
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<String>>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options, 'permit',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<ApiResponse<PermitHistoryModel>> getPermitHistory(
      filters, sorts, page, limit, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'Filters': filters,
      r'Sorts': sorts,
      r'Page': page,
      r'PageSize': limit
    };
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<PermitHistoryModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'permit',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<PermitHistoryModel>.fromJson(
      _result.data!,
      (json) => PermitHistoryModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ApiResponse<PermitApprovalModel>> getDetailPermit(id, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<PermitApprovalModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'permit/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<PermitApprovalModel>.fromJson(
      _result.data!,
      (json) => PermitApprovalModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ApiResponse<PermitApprovalListModel>> getPermitApproval(
      filters, sorts, page, limit, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'Filters': filters,
      r'Sorts': sorts,
      r'Page': page,
      r'PageSize': limit
    };
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<PermitApprovalListModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'permit/approval',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<PermitApprovalListModel>.fromJson(
      _result.data!,
      (json) => PermitApprovalListModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ApiResponse<String>> leaveForm(id, leaveDate, leaveStartDate,
      leaveEndDate, leaveType, leaveDescription, leaveAttachment, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'userId': id,
      'dateSubmit': leaveDate,
      'dateStart': leaveStartDate,
      'dateEnd': leaveEndDate,
      'type': leaveType,
      'description': leaveDescription,
      'attachment': leaveAttachment
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<String>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'leave',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<ApiResponse<String>> editLeaveForm(
      leaveid,
      id,
      token,
      leaveDate,
      leaveStartDate,
      leaveEndDate,
      leaveType,
      leaveDescription,
      leaveAttachment,
      idApprovalAdmin,
      idApprovalHR,
      idApprovalAtasan,
      statusApprovalAdmin,
      statusApprovalHR,
      statusApprovalAtasan,
      dateApprovalAdmin,
      dateApprovalHR,
      dateApprovalAtasan) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'LeaveId': leaveid,
      'UserId': id,
      'DateSubmit': leaveDate,
      'DateStart': leaveStartDate,
      'DateEnd': leaveEndDate,
      'Type': leaveType,
      'Description': leaveDescription,
      'Attachment': leaveAttachment,
      'UserIdApproval1': idApprovalAdmin,
      'UserIdApproval2': idApprovalHR,
      'UserIdApproval3': idApprovalAtasan,
      'StatusApproval1': statusApprovalAdmin,
      'StatusApproval2': statusApprovalHR,
      'StatusApproval3': statusApprovalAtasan,
      'DateApproval1': dateApprovalAdmin,
      'DateApproval2': dateApprovalHR,
      'DateApproval3': dateApprovalAtasan
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<String>>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options, 'leave',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<ApiResponse<LeaveHistoryModel>> getLeaveHistory(
      filters, sorts, page, limit, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'Filters': filters,
      r'Sorts': sorts,
      r'Page': page,
      r'PageSize': limit
    };
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<LeaveHistoryModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'leave',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<LeaveHistoryModel>.fromJson(
      _result.data!,
      (json) => LeaveHistoryModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ApiResponse<LeaveApprovalModel>> getDetailLeave(id, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<LeaveApprovalModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'leave/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<LeaveApprovalModel>.fromJson(
      _result.data!,
      (json) => LeaveApprovalModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ApiResponse<LeaveApprovalListModel>> getLeaveApproval(
      filters, sorts, page, limit, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'Filters': filters,
      r'Sorts': sorts,
      r'Page': page,
      r'PageSize': limit
    };
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<LeaveApprovalListModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'leave/approval',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<LeaveApprovalListModel>.fromJson(
      _result.data!,
      (json) => LeaveApprovalListModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ApiResponse<String>> overtimeForm(id, overtimeDateSubmit, overtimeDate,
      overtimeStartTime, overtimeEndTime, overtimeDescription, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'userId': id,
      'dateSubmit': overtimeDateSubmit,
      'dateOvertime': overtimeDate,
      'startTime': overtimeStartTime,
      'endTime': overtimeEndTime,
      'description': overtimeDescription
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<String>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'overtime',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<ApiResponse<String>> editOvertimeForm(
      overtimeid,
      id,
      afterOvertime,
      token,
      overtimeDateSubmit,
      overtimeDate,
      overtimeStartTime,
      overtimeEndTime,
      overtimeDescription,
      idApprovalAdmin,
      idApprovalHR,
      idApprovalAtasan,
      statusApprovalAdmin,
      statusApprovalHR,
      statusApprovalAtasan,
      dateApprovalAdmin,
      dateApprovalHR,
      dateApprovalAtasan) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'overtimeId': overtimeid,
      'userId': id,
      'afterOvertimeId': afterOvertime,
      'dateSubmit': overtimeDateSubmit,
      'dateOvertime': overtimeDate,
      'startTime': overtimeStartTime,
      'endTime': overtimeEndTime,
      'description': overtimeDescription,
      'userIdApproval1': idApprovalAdmin,
      'userIdApproval2': idApprovalHR,
      'userIdApproval3': idApprovalAtasan,
      'statusApproval1': statusApprovalAdmin,
      'statusApproval2': statusApprovalHR,
      'statusApproval3': statusApprovalAtasan,
      'dateApproval1': dateApprovalAdmin,
      'dateApproval2': dateApprovalHR,
      'dateApproval3': dateApprovalAtasan
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<String>>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options, 'overtime',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<ApiResponse<OvertimeHistoryModel>> getOvertimeHistory(
      filters, sorts, page, limit, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'Filters': filters,
      r'Sorts': sorts,
      r'Page': page,
      r'PageSize': limit
    };
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<OvertimeHistoryModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'overtime',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<OvertimeHistoryModel>.fromJson(
      _result.data!,
      (json) => OvertimeHistoryModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ApiResponse<OvertimeApprovalModel>> getDetailOvertime(
      id, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<OvertimeApprovalModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'overtime/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<OvertimeApprovalModel>.fromJson(
      _result.data!,
      (json) => OvertimeApprovalModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ApiResponse<OvertimeApprovalListModel>> getOvertimeApproval(
      filters, sorts, page, limit, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'Filters': filters,
      r'Sorts': sorts,
      r'Page': page,
      r'PageSize': limit
    };
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<OvertimeApprovalListModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'overtime/approval',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<OvertimeApprovalListModel>.fromJson(
      _result.data!,
      (json) =>
          OvertimeApprovalListModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ApiResponse<String>> afterOvertimeForm(
      overtimeId,
      afterOvertimeSubmitDate,
      afterOvertimeDate,
      afterOvertimeStartTime,
      afterOvertimeEndTime,
      afterOvertimeDescription,
      afterOvertimeAttachment,
      token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'overtimeId': overtimeId,
      'dateSubmit': afterOvertimeSubmitDate,
      'dateAfterOvertime': afterOvertimeDate,
      'startTime': afterOvertimeStartTime,
      'endTime': afterOvertimeEndTime,
      'description': afterOvertimeDescription,
      'attachment': afterOvertimeAttachment
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<String>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'after_overtime',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<ApiResponse<String>> editAfterOvertimeForm(
      afterOvertimeid,
      token,
      afterOvertimeId,
      afterOvertimeSubmitDate,
      afterOvertimeDate,
      afterOvertimeStartTime,
      afterOvertimeEndTime,
      afterOvertimeDescription,
      afterOvertimeAttachment,
      idApprovalAdmin,
      idApprovalHR,
      idApprovalAtasan,
      statusApprovalAdmin,
      statusApprovalHR,
      statusApprovalAtasan,
      dateApprovalAdmin,
      dateApprovalHR,
      dateApprovalAtasan) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'afterOvertimeId': afterOvertimeid,
      'overtimeid': afterOvertimeId,
      'dateSubmit': afterOvertimeSubmitDate,
      'dateAfterOvertime': afterOvertimeDate,
      'startTime': afterOvertimeStartTime,
      'endTime': afterOvertimeEndTime,
      'description': afterOvertimeDescription,
      'attachment': afterOvertimeAttachment,
      'userIdApproval1': idApprovalAdmin,
      'userIdApproval2': idApprovalHR,
      'userIdApproval3': idApprovalAtasan,
      'statusApproval1': statusApprovalAdmin,
      'statusApproval2': statusApprovalHR,
      'statusApproval3': statusApprovalAtasan,
      'dateApproval1': dateApprovalAdmin,
      'dateApproval2': dateApprovalHR,
      'dateApproval3': dateApprovalAtasan
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<String>>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options, 'after_overtime',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<ApiResponse<AfterOvertimeHistoryModel>> getAfterOvertimeHistory(
      filters, sorts, page, limit, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'Filters': filters,
      r'Sorts': sorts,
      r'Page': page,
      r'PageSize': limit
    };
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<AfterOvertimeHistoryModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'after_overtime',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<AfterOvertimeHistoryModel>.fromJson(
      _result.data!,
      (json) =>
          AfterOvertimeHistoryModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ApiResponse<AfterOvertimeApprovalModel>> getDetailAfterOvertime(
      id, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<AfterOvertimeApprovalModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'after_overtime/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<AfterOvertimeApprovalModel>.fromJson(
      _result.data!,
      (json) =>
          AfterOvertimeApprovalModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ApiResponse<AfterOvertimeHistoryModel>> getAfterOvertimeApproval(
      filters, sorts, page, limit, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'Filters': filters,
      r'Sorts': sorts,
      r'Page': page,
      r'PageSize': limit
    };
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<AfterOvertimeHistoryModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'after_overtime/approval',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<AfterOvertimeHistoryModel>.fromJson(
      _result.data!,
      (json) =>
          AfterOvertimeHistoryModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
