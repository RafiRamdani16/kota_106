// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApiService.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??=
        'https://0c3b-2001-448a-3045-5919-c20-9d39-97fc-d27a.ap.ngrok.io/api/';
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
  Future<ApiResponse<String>> updateProfile(
      id,
      superiorId,
      name,
      religion,
      position,
      gender,
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
      token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'userId': id,
      'superiorId': superiorId,
      'name': name,
      'religion': religion,
      'position': position,
      'gender': gender,
      'status': status,
      'joinDate': joinDate,
      'endDate': endDate,
      'phoneNumber': phoneNumber,
      'email': email,
      'address': address,
      'city': city,
      'noKtp': noKtp,
      'nPWP': npwp,
      'dateOfBirth': dateOfBirth,
      'role': role,
      'password': password,
      'photoName': photoName
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<String>>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options, 'user',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<ApiResponse<List<ReligionModel>>> getReligion(token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<List<ReligionModel>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'religion',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<List<ReligionModel>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<ReligionModel>(
              (i) => ReligionModel.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
    return value;
  }

  @override
  Future<ApiResponse<List<ReligionModel>>> getPosition(token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<List<ReligionModel>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'position',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<List<ReligionModel>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map<ReligionModel>(
              (i) => ReligionModel.fromJson(i as Map<String, dynamic>))
          .toList(),
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
  Future<ApiResponse<String>> checkQRCode(tipeQRCode, keyword, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {'typeQRCode': tipeQRCode, 'qRCodeValue': keyword};
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
  Future<ApiResponse<String>> submissionForm(
      employeeId,
      overtimeId,
      dateSubmit,
      datePerform,
      startTime,
      endTime,
      submissionType,
      permitDescription,
      permitAttachment,
      token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'userId': employeeId,
      'overtimeId': overtimeId,
      'dateSubmit': dateSubmit,
      'datePerform': datePerform,
      'startTime': startTime,
      'endTime': endTime,
      'submissionType': submissionType,
      'description': permitDescription,
      'attachment': permitAttachment
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<String>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'submission',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<ApiResponse<String>> editSubmissionForm(
      submissionId,
      submissionDateSubmit,
      submissionDate,
      submissionStartTime,
      submissionEndTime,
      submissionDescription,
      submissionAttachment,
      token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'submissionId': submissionId,
      'dateSubmit': submissionDateSubmit,
      'datePerform': submissionDate,
      'startTime': submissionStartTime,
      'endTime': submissionEndTime,
      'description': submissionDescription,
      'Attachment': submissionAttachment
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<String>>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options, 'submission',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<ApiResponse<PermitHistoryModel>> getSubmissionHistory(
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
                .compose(_dio.options, 'submission',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<PermitHistoryModel>.fromJson(
      _result.data!,
      (json) => PermitHistoryModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ApiResponse<ListApprovalModel>> getApproval(
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
        _setStreamType<ApiResponse<ListApprovalModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'submission/approval',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<ListApprovalModel>.fromJson(
      _result.data!,
      (json) => ListApprovalModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ApiResponse<String>> giveDecision(approvalId, userId, submissionId,
      statusApproval, dateApproval, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'approvalId': approvalId,
      'userId': userId,
      'submissionAttributeId': submissionId,
      'statusApproval': statusApproval,
      'dateApproval': dateApproval
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<String>>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options, 'submission/approval',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<String>.fromJson(
      _result.data!,
      (json) => json as String,
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
                .compose(_dio.options, 'submission_leave',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<ApiResponse<String>> editLeaveForm(leaveid, leaveDate, leaveStartDate,
      leaveEndDate, leaveType, leaveDescription, leaveAttachment, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'submissionLeaveId': leaveid,
      'dateSubmit': leaveDate,
      'dateStart': leaveStartDate,
      'dateEnd': leaveEndDate,
      'type': leaveType,
      'description': leaveDescription,
      'attachment': leaveAttachment
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<String>>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options, 'submission_leave',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<String>.fromJson(
      _result.data!,
      (json) => json as String,
    );
    return value;
  }

  @override
  Future<ApiResponse<String>> leaveApproval(approvalId, employeeId,
      submissionAttributeId, statusApproval, dateApproval, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = {
      'approvalId': approvalId,
      'userId': employeeId,
      'submissionAttributeId': submissionAttributeId,
      'statusApproval': statusApproval,
      'dateApproval': dateApproval
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<String>>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options, 'submission_leave/approval',
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
                .compose(_dio.options, 'submission_leave',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<LeaveHistoryModel>.fromJson(
      _result.data!,
      (json) => LeaveHistoryModel.fromJson(json as Map<String, dynamic>),
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
                .compose(_dio.options, 'submission_leave/approval',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponse<LeaveApprovalListModel>.fromJson(
      _result.data!,
      (json) => LeaveApprovalListModel.fromJson(json as Map<String, dynamic>),
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
