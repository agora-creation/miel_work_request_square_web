import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:flutter/material.dart';
import 'package:miel_work_request_square_web/common/functions.dart';
import 'package:miel_work_request_square_web/models/user.dart';
import 'package:miel_work_request_square_web/services/fm.dart';
import 'package:miel_work_request_square_web/services/mail.dart';
import 'package:miel_work_request_square_web/services/request_square.dart';
import 'package:miel_work_request_square_web/services/user.dart';
import 'package:path/path.dart' as p;

class RequestSquareProvider with ChangeNotifier {
  final RequestSquareService _squareService = RequestSquareService();
  final UserService _userService = UserService();
  final MailService _mailService = MailService();
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
    required List<PlatformFile> pickedAttachedFiles,
  }) async {
    String? error;
    if (companyName == '') return '申込会社名(又は店名)は必須入力です';
    if (companyUserName == '') return '申込担当者名は必須入力です';
    if (companyUserEmail == '') return '申込担当者メールアドレスは必須入力です';
    if (companyUserTel == '') return '申込担当者電話番号は必須入力です';
    if (companyAddress == '') return '住所は必須入力です';
    try {
      await FirebaseAuth.instance.signInAnonymously().then((value) async {
        String id = _squareService.id();
        List<String> attachedFiles = [];
        if (pickedAttachedFiles.isNotEmpty) {
          int i = 0;
          for (final file in pickedAttachedFiles) {
            String ext = p.extension(file.name);
            storage.UploadTask uploadTask;
            storage.Reference ref = storage.FirebaseStorage.instance
                .ref()
                .child('requestInterview')
                .child('/${id}_$i$ext');
            uploadTask = ref.putData(file.bytes!);
            await uploadTask.whenComplete(() => null);
            String url = await ref.getDownloadURL();
            attachedFiles.add(url);
          }
        }
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
          'attachedFiles': attachedFiles,
          'approval': 0,
          'approvedAt': DateTime.now(),
          'approvalUsers': [],
          'createdAt': DateTime.now(),
        });
        String useAtText = '';
        if (useAtPending) {
          useAtText = '未定';
        } else {
          useAtText =
              '${dateText('yyyy/MM/dd HH:mm', useStartedAt)}〜${dateText('yyyy/MM/dd HH:mm', useEndedAt)}';
        }
        String useClassText = '';
        if (useFull) {
          useClassText = '''
全面使用
        ''';
        }
        if (useChair) {
          useClassText = '''
折りたたみイス：$useChairNum脚
        ''';
        }
        if (useDesk) {
          useClassText = '''
折りたたみ机：$useDeskNum台
        ''';
        }
        String attachedFilesText = '';
        if (attachedFiles.isNotEmpty) {
          for (final file in attachedFiles) {
            attachedFilesText += '$file\n';
          }
        }
        String message = '''
★★★このメールは自動返信メールです★★★

よさこい広場使用申込が完了いたしました。
以下申込内容を確認し、ご返信させていただきますので今暫くお待ちください。
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
■申込者情報
【申込会社名(又は店名)】$companyName
【申込担当者名】$companyUserName
【申込担当者メールアドレス】$companyUserEmail
【申込担当者電話番号】$companyUserTel
【住所】$companyAddress

■使用者情報 (申込者情報と異なる場合のみ)
【使用会社名(又は店名)】$useCompanyName
【使用者名】$useCompanyUserName

■使用情報
【使用予定日時】$useAtText
【使用区分】
$useClassText
【使用内容】
$useContent
【添付ファイル】
$attachedFilesText

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      ''';
        _mailService.create({
          'id': _mailService.id(),
          'to': companyUserEmail,
          'subject': '【自動送信】よさこい広場使用申込完了のお知らせ',
          'message': message,
          'createdAt': DateTime.now(),
          'expirationAt': DateTime.now().add(const Duration(hours: 1)),
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
