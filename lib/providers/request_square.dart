import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:miel_work_request_square_web/models/user.dart';
import 'package:miel_work_request_square_web/services/fm.dart';
import 'package:miel_work_request_square_web/services/request_square.dart';
import 'package:miel_work_request_square_web/services/user.dart';

class RequestSquareProvider with ChangeNotifier {
  final RequestSquareService _squareService = RequestSquareService();
  final UserService _userService = UserService();
  final FmService _fmService = FmService();

  Future<String?> create({
    required String companyName,
    required String companyUserName,
    required String companyUserEmail,
    required String companyUserTel,
    required String companyAddress,
    required String useName,
    required String useUserName,
    required String useUserTel,
    required String usePeriod,
    required String useTimezone,
    required bool useFull,
    required bool useChair,
    required bool useDesk,
    required String useContent,
    required String remarks,
  }) async {
    String? error;
    if (companyName == '') return '会社名は必須入力です';
    if (companyUserName == '') return '担当者名は必須入力です';
    if (companyUserEmail == '') return '担当者メールアドレスは必須入力です';
    if (companyUserTel == '') return '担当者電話番号は必須入力です';
    try {
      await FirebaseAuth.instance.signInAnonymously().then((value) {
        String id = _squareService.id();
        _squareService.create({
          'id': id,
          'companyName': companyName,
          'companyUserName': companyUserName,
          'companyUserEmail': companyUserEmail,
          'companyUserTel': companyUserTel,
          'companyAddress': companyAddress,
          'useName': useName,
          'useUserName': useUserName,
          'useUserTel': useUserTel,
          'usePeriod': usePeriod,
          'useTimezone': useTimezone,
          'useFull': useFull,
          'useChair': useChair,
          'useDesk': useDesk,
          'useContent': useContent,
          'remarks': remarks,
          'approval': 0,
          'approvedAt': DateTime.now(),
          'approvalUsers': [],
          'createdAt': DateTime.now(),
        });
      });
      //通知
      List<UserModel> sendUsers = [];
      sendUsers = await _userService.selectList();
      if (sendUsers.isNotEmpty) {
        for (UserModel user in sendUsers) {
          _fmService.send(
            token: user.token,
            title: '社外申請',
            body: 'よさこい広場使用の申込がありました',
          );
        }
      }
    } catch (e) {
      error = '申込に失敗しました';
    }
    return error;
  }
}
