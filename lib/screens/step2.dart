import 'package:flutter/material.dart';
import 'package:miel_work_request_square_web/common/functions.dart';
import 'package:miel_work_request_square_web/common/style.dart';
import 'package:miel_work_request_square_web/providers/request_square.dart';
import 'package:miel_work_request_square_web/screens/step3.dart';
import 'package:miel_work_request_square_web/widgets/custom_button.dart';
import 'package:miel_work_request_square_web/widgets/dotted_divider.dart';
import 'package:miel_work_request_square_web/widgets/form_label.dart';
import 'package:miel_work_request_square_web/widgets/form_value.dart';
import 'package:miel_work_request_square_web/widgets/link_text.dart';
import 'package:miel_work_request_square_web/widgets/responsive_box.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Step2Screen extends StatefulWidget {
  final String companyName;
  final String companyUserName;
  final String companyUserEmail;
  final String companyUserTel;
  final String companyAddress;
  final String useCompanyName;
  final String useCompanyUserName;
  final DateTime useStartedAt;
  final DateTime useEndedAt;
  final bool useAtPending;
  final bool useFull;
  final bool useChair;
  final int useChairNum;
  final bool useDesk;
  final int useDeskNum;
  final String useContent;

  const Step2Screen({
    required this.companyName,
    required this.companyUserName,
    required this.companyUserEmail,
    required this.companyUserTel,
    required this.companyAddress,
    required this.useCompanyName,
    required this.useCompanyUserName,
    required this.useStartedAt,
    required this.useEndedAt,
    required this.useAtPending,
    required this.useFull,
    required this.useChair,
    required this.useChairNum,
    required this.useDesk,
    required this.useDeskNum,
    required this.useContent,
    super.key,
  });

  @override
  State<Step2Screen> createState() => _Step2ScreenState();
}

class _Step2ScreenState extends State<Step2Screen> {
  @override
  Widget build(BuildContext context) {
    final squareProvider = Provider.of<RequestSquareProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 24),
              const Text(
                'よさこい広場使用申込フォーム',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SourceHanSansJP-Bold',
                ),
              ),
              const SizedBox(height: 24),
              ResponsiveBox(
                children: [
                  const Text('以下の申込内容で問題ないかご確認ください。'),
                  const SizedBox(height: 8),
                  const SizedBox(height: 16),
                  const DottedDivider(),
                  const SizedBox(height: 16),
                  const Text(
                    '申込者情報',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceHanSansJP-Bold',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '申込会社名(又は店名)',
                    child: FormValue(widget.companyName),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '申込担当者名',
                    child: FormValue(widget.companyUserName),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '申込担当者メールアドレス',
                    child: FormValue(widget.companyUserEmail),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '申込担当者電話番号',
                    child: FormValue(widget.companyUserTel),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '住所',
                    child: FormValue(widget.companyAddress),
                  ),
                  const SizedBox(height: 16),
                  const DottedDivider(),
                  const SizedBox(height: 16),
                  const Text(
                    '使用者情報 (申込者情報と異なる場合のみ)',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceHanSansJP-Bold',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '使用会社名(又は店名)',
                    child: FormValue(widget.useCompanyName),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '使用者名',
                    child: FormValue(widget.useCompanyUserName),
                  ),
                  const SizedBox(height: 16),
                  const DottedDivider(),
                  const SizedBox(height: 16),
                  const Text(
                    '使用情報',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceHanSansJP-Bold',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '使用予定日時',
                    child: FormValue(
                      widget.useAtPending
                          ? '未定'
                          : '${dateText('yyyy年MM月dd日 HH:mm', widget.useStartedAt)}〜${dateText('yyyy年MM月dd日 HH:mm', widget.useEndedAt)}',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '使用区分',
                    child: Column(
                      children: [
                        widget.useFull
                            ? const ListTile(
                                title: Text('全面使用'),
                              )
                            : Container(),
                        widget.useChair
                            ? const ListTile(
                                title: Text('折りたたみイス'),
                                subtitle: Text('150円(税抜)／1脚・1日'),
                              )
                            : Container(),
                        widget.useDesk
                            ? const ListTile(
                                title: Text('折りたたみ机'),
                                subtitle: Text('300円(税抜)／1脚・1日'),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '使用内容',
                    child: FormValue(widget.useContent),
                  ),
                  const SizedBox(height: 16),
                  const DottedDivider(),
                  const SizedBox(height: 32),
                  CustomButton(
                    type: ButtonSizeType.lg,
                    label: '上記内容で申し込む',
                    labelColor: kWhiteColor,
                    backgroundColor: kBlueColor,
                    onPressed: () async {
                      String? error = await squareProvider.create(
                        companyName: widget.companyName,
                        companyUserName: widget.companyUserName,
                        companyUserEmail: widget.companyUserEmail,
                        companyUserTel: widget.companyUserTel,
                        companyAddress: widget.companyAddress,
                        useCompanyName: widget.useCompanyName,
                        useCompanyUserName: widget.useCompanyUserName,
                        useStartedAt: widget.useStartedAt,
                        useEndedAt: widget.useEndedAt,
                        useAtPending: widget.useAtPending,
                        useFull: widget.useFull,
                        useChair: widget.useChair,
                        useChairNum: widget.useChairNum,
                        useDesk: widget.useDesk,
                        useDeskNum: widget.useDeskNum,
                        useContent: widget.useContent,
                      );
                      if (error != null) {
                        if (!mounted) return;
                        showMessage(context, error, false);
                        return;
                      }
                      if (!mounted) return;
                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: const Step3Screen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: LinkText(
                      label: '入力に戻る',
                      color: kBlueColor,
                      onTap: () => Navigator.pop(context),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
