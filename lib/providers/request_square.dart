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

  Future<String?> check({
    required String companyName,
    required String companyUserName,
    required String companyUserEmail,
    required String companyUserTel,
    required String companyAddress,
  }) async {
    String? error;
    if (companyName == '') return '申込会社名(又は店名)は必須入力です';
    if (companyUserName == '') return '申込担当者名は必須入力です';
    if (companyUserEmail == '') return '申込担当者メールアドレスは必須入力です';
    if (companyUserTel == '') return '申込担当者電話番号は必須入力です';
    if (companyAddress == '') return '住所は必須入力です';
    return error;
  }

  Future<String?> create({
    required String companyName,
    required String companyUserName,
    required String companyUserEmail,
    required String companyUserTel,
    required String companyAddress,
    required String useCompanyName,
    required String useCompanyUserName,
    required DateTime useStartedAt,
    required DateTime useEndedAt,
    required bool useAtPending,
    required bool useFull,
    required bool useChair,
    required int useChairNum,
    required bool useDesk,
    required int useDeskNum,
    required String useContent,
  }) async {
    String? error;
    if (companyName == '') return '申込会社名(又は店名)は必須入力です';
    if (companyUserName == '') return '申込担当者名は必須入力です';
    if (companyUserEmail == '') return '申込担当者メールアドレスは必須入力です';
    if (companyUserTel == '') return '申込担当者電話番号は必須入力です';
    if (companyAddress == '') return '住所は必須入力です';
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
          'useCompanyName': useCompanyName,
          'useCompanyUserName': useCompanyUserName,
          'useStartedAt': useStartedAt,
          'useEndedAt': useEndedAt,
          'useAtPending': useAtPending,
          'useFull': useFull,
          'useChair': useChair,
          'useChairNum': useChairNum,
          'useDesk': useDesk,
          'useDeskNum': useDeskNum,
          'useContent': useContent,
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
