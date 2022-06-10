// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApiService.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??=
        'https://bbbe-2001-448a-304c-3893-1d52-5ff3-6470-a748.ngrok.io/api/';
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
            .compose(_dio.options, 'auth/login',
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
      id, checkinTime, taskList, photoSelfie, locationNow, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'userId': id,
      'checkinTime': checkinTime,
      'description': taskList,
      'photoName': photoSelfie,
      'location': locationNow
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<String>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
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
      id, checkoutTime, completedTask, locationNow, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'userId': id,
      'checkoutTime': checkoutTime,
      'description': completedTask,
      'location': locationNow
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
      taskList, photoSelfie, location, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'userId': emploeeId,
      'date': activityRecordTime,
      'description': taskList,
      'photoName': photoSelfie,
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
  Future<ApiResponse<String>> checkQRCodeO(keyword, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'keyword': keyword};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
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
  Future<ApiResponse<String>> permitForm(
      employeeId,
      token,
      permitDateSubmit,
      permitDate,
      permitStartTime,
      permitEndTime,
      permitDescription,
      permitAttachment) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'userId': employeeId,
      'DateSubmit': permitDateSubmit,
      'DatePermit': permitDate,
      'StartTime': permitStartTime,
      'EndTime': permitEndTime,
      'Description': permitDescription,
      'Attachment': permitAttachment
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
      employeeId,
      token,
      permitDateSubmit,
      permitDate,
      permitStartTime,
      permitEndTime,
      permitDescription,
      permitAttachment) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'userId': employeeId,
      'DateSubmit': permitDateSubmit,
      'DatePermit': permitDate,
      'StartTime': permitStartTime,
      'EndTime': permitEndTime,
      'Description': permitDescription,
      'Attachment': permitAttachment
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
  Future<ApiResponse<String>> leaveForm(id, token, leaveDate, leaveStartDate,
      leaveEndDate, leaveType, leaveDescription, leaveAttachment) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'UserId': id,
      'DateSubmit': leaveDate,
      'DateStart': leaveStartDate,
      'DateEnd': leaveEndDate,
      'Type': leaveType,
      'Description': leaveDescription,
      'Attachment': leaveAttachment
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
      id,
      token,
      leaveDate,
      leaveStartDate,
      leaveEndDate,
      leaveType,
      leaveDescription,
      leaveAttachment) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'UserId': id,
      'DateSubmit': leaveDate,
      'DateStart': leaveStartDate,
      'DateEnd': leaveEndDate,
      'Type': leaveType,
      'Description': leaveDescription,
      'Attachment': leaveAttachment
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
  Future<ApiResponse<String>> overtimeForm(
      id,
      token,
      overtimeDateSubmit,
      overtimeDate,
      overtimeStartTime,
      overtimeEndTime,
      overtimeDescription) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'UserId': id,
      'DateSubmit': overtimeDateSubmit,
      'DateOvertime': overtimeDate,
      'StartTime': overtimeStartTime,
      'EndTime': overtimeEndTime,
      'Description': overtimeDescription
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
      id,
      token,
      overtimeDateSubmit,
      overtimeDate,
      overtimeStartTime,
      overtimeEndTime,
      overtimeDescription) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'UserId': id,
      'DateSubmit': overtimeDateSubmit,
      'DateOvertime': overtimeDate,
      'StartTime': overtimeStartTime,
      'EndTime': overtimeEndTime,
      'Description': overtimeDescription
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
  Future<ApiResponse<String>> afterOvertimeForm(
      id,
      token,
      afterOvertimeId,
      afterOvertimeSubmitDate,
      afterOvertimeDate,
      afterOvertimeStartTime,
      afterOvertimeEndTime,
      afterOvertimeDescription,
      afterOvertimeAttachment) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'UserId': id,
      'id': afterOvertimeId,
      'DateSubmit': afterOvertimeSubmitDate,
      'DateAfterOvertime': afterOvertimeDate,
      'StartTime': afterOvertimeStartTime,
      'EndTime': afterOvertimeEndTime,
      'Description': afterOvertimeDescription,
      'Attachment': afterOvertimeAttachment
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
      id,
      token,
      afterOvertimeId,
      afterOvertimeSubmitDate,
      afterOvertimeDate,
      afterOvertimeStartTime,
      afterOvertimeEndTime,
      afterOvertimeDescription,
      afterOvertimeAttachment) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'UserId': id,
      'id': afterOvertimeId,
      'DateSubmit': afterOvertimeSubmitDate,
      'DateAfterOvertime': afterOvertimeDate,
      'StartTime': afterOvertimeStartTime,
      'EndTime': afterOvertimeEndTime,
      'Description': afterOvertimeDescription,
      'Attachment': afterOvertimeAttachment
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
