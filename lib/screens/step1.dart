import 'package:flutter/material.dart';
import 'package:miel_work_request_square_web/common/style.dart';
import 'package:miel_work_request_square_web/screens/step2.dart';
import 'package:miel_work_request_square_web/widgets/custom_button.dart';
import 'package:miel_work_request_square_web/widgets/custom_text_field.dart';
import 'package:miel_work_request_square_web/widgets/dotted_divider.dart';
import 'package:miel_work_request_square_web/widgets/form_label.dart';
import 'package:miel_work_request_square_web/widgets/responsive_box.dart';
import 'package:page_transition/page_transition.dart';

class Step1Screen extends StatefulWidget {
  const Step1Screen({super.key});

  @override
  State<Step1Screen> createState() => _Step1ScreenState();
}

class _Step1ScreenState extends State<Step1Screen> {
  TextEditingController companyName = TextEditingController();
  TextEditingController companyUserName = TextEditingController();
  TextEditingController companyUserEmail = TextEditingController();
  TextEditingController companyUserTel = TextEditingController();
  TextEditingController companyAddress = TextEditingController();
  TextEditingController useName = TextEditingController();
  TextEditingController useUserName = TextEditingController();
  TextEditingController useUserTel = TextEditingController();
  TextEditingController usePeriod = TextEditingController();
  TextEditingController useTimezone = TextEditingController();
  bool useFull = false;
  bool useChair = false;
  bool useDesk = false;
  TextEditingController useContent = TextEditingController();
  TextEditingController remarks = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  const Text('以下のフォームにご入力いただき、申込を行なってください。'),
                  const SizedBox(height: 8),
                  FormLabel(
                    '申込会社名(又は店名)',
                    child: CustomTextField(
                      controller: companyName,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）ひろめカンパニー',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '申込担当者名',
                    child: CustomTextField(
                      controller: companyUserName,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）田中太郎',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '申込担当者メールアドレス',
                    child: CustomTextField(
                      controller: companyUserEmail,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）tanaka@hirome.co.jp',
                    ),
                  ),
                  const Text(
                    '※このメールアドレス宛に、返答させていただきます',
                    style: TextStyle(
                      color: kRedColor,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '申込担当者電話番号',
                    child: CustomTextField(
                      controller: companyUserTel,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）090-0000-0000',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '住所',
                    child: CustomTextField(
                      controller: companyAddress,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）高知市はりまや町1丁目ABCビル',
                    ),
                  ),
                  const SizedBox(height: 24),
                  const DottedDivider(),
                  const SizedBox(height: 16),
                  const Text(
                    '使用者情報 (上記と異なる場合のみ入力)',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceHanSansJP-Bold',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '使用会社名(又は店名)',
                    child: CustomTextField(
                      controller: useName,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）ひろめカンパニー',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '使用担当者名',
                    child: CustomTextField(
                      controller: useUserName,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）田中太郎',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '使用担当者電話番号',
                    child: CustomTextField(
                      controller: useUserTel,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）090-0000-0000',
                    ),
                  ),
                  const SizedBox(height: 24),
                  const DottedDivider(),
                  const SizedBox(height: 16),
                  const Text(
                    '使用情報',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceHanSansJP-Bold',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '使用期間',
                    child: CustomTextField(
                      controller: usePeriod,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）令和元年9月20日〜9月27日',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '使用時間帯',
                    child: CustomTextField(
                      controller: useTimezone,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）10:00〜16:00',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '使用区分',
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: kDisabledColor),
                            ),
                          ),
                          child: CheckboxListTile(
                            title: const Text('全面使用'),
                            value: useFull,
                            onChanged: (value) {
                              setState(() {
                                useFull = value ?? false;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: kDisabledColor),
                            ),
                          ),
                          child: CheckboxListTile(
                            title: const Text('折りたたみイス'),
                            subtitle: const Text('150円税抜／1脚／1日'),
                            value: useChair,
                            onChanged: (value) {
                              setState(() {
                                useChair = value ?? false;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: kDisabledColor),
                            ),
                          ),
                          child: CheckboxListTile(
                            title: const Text('折りたたみ机'),
                            subtitle: const Text('300円税抜／1脚／1日'),
                            value: useDesk,
                            onChanged: (value) {
                              setState(() {
                                useDesk = value ?? false;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '使用内容',
                    child: CustomTextField(
                      controller: useContent,
                      textInputType: TextInputType.multiline,
                      maxLines: null,
                      hintText: '例）よさこい祭りのため、屋台を出店したい',
                    ),
                  ),
                  const SizedBox(height: 24),
                  const DottedDivider(),
                  const SizedBox(height: 16),
                  FormLabel(
                    'その他連絡事項',
                    child: CustomTextField(
                      controller: remarks,
                      textInputType: TextInputType.multiline,
                      maxLines: null,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const DottedDivider(),
                  const SizedBox(height: 32),
                  CustomButton(
                    type: ButtonSizeType.lg,
                    label: '入力内容を確認',
                    labelColor: kWhiteColor,
                    backgroundColor: kBlueColor,
                    onPressed: () async {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: Step2Screen(
                            companyName: companyName.text,
                            companyUserName: companyUserName.text,
                            companyUserEmail: companyUserEmail.text,
                            companyUserTel: companyUserTel.text,
                            companyAddress: companyAddress.text,
                            useName: useName.text,
                            useUserName: useUserName.text,
                            useUserTel: useUserTel.text,
                            usePeriod: usePeriod.text,
                            useTimezone: useTimezone.text,
                            useFull: useFull,
                            useChair: useChair,
                            useDesk: useDesk,
                            useContent: useContent.text,
                            remarks: remarks.text,
                          ),
                        ),
                      );
                    },
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
