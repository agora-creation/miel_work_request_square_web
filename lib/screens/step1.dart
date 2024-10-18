import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:miel_work_request_square_web/common/custom_date_time_picker.dart';
import 'package:miel_work_request_square_web/common/functions.dart';
import 'package:miel_work_request_square_web/common/style.dart';
import 'package:miel_work_request_square_web/models/request_square.dart';
import 'package:miel_work_request_square_web/providers/request_square.dart';
import 'package:miel_work_request_square_web/screens/step2.dart';
import 'package:miel_work_request_square_web/services/request_square.dart';
import 'package:miel_work_request_square_web/widgets/attached_file_list.dart';
import 'package:miel_work_request_square_web/widgets/custom_button.dart';
import 'package:miel_work_request_square_web/widgets/custom_checkbox.dart';
import 'package:miel_work_request_square_web/widgets/custom_text_field.dart';
import 'package:miel_work_request_square_web/widgets/datetime_range_form.dart';
import 'package:miel_work_request_square_web/widgets/dotted_divider.dart';
import 'package:miel_work_request_square_web/widgets/form_label.dart';
import 'package:miel_work_request_square_web/widgets/responsive_box.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path/path.dart' as p;
import 'package:provider/provider.dart';

class Step1Screen extends StatefulWidget {
  const Step1Screen({super.key});

  @override
  State<Step1Screen> createState() => _Step1ScreenState();
}

class _Step1ScreenState extends State<Step1Screen> {
  RequestSquareService squareService = RequestSquareService();
  TextEditingController companyName = TextEditingController();
  TextEditingController companyUserName = TextEditingController();
  TextEditingController companyUserEmail = TextEditingController();
  TextEditingController companyUserTel = TextEditingController();
  TextEditingController companyAddress = TextEditingController();
  TextEditingController useCompanyName = TextEditingController();
  TextEditingController useCompanyUserName = TextEditingController();
  DateTime useStartedAt = DateTime.now();
  DateTime useEndedAt = DateTime.now();
  bool useAtPending = false;
  bool useFull = false;
  bool useChair = false;
  TextEditingController useChairNum = TextEditingController(text: '0');
  bool useDesk = false;
  TextEditingController useDeskNum = TextEditingController(text: '0');
  TextEditingController useContent = TextEditingController();
  List<PlatformFile> pickedAttachedFiles = [];

  void _getPrm() async {
    String? id = Uri.base.queryParameters['id'];
    if (id == null) return;
    RequestSquareModel? square = await squareService.selectData(id);
    if (square == null) return;
    companyName.text = square.companyName;
    companyUserName.text = square.companyUserName;
    companyUserEmail.text = square.companyUserEmail;
    companyUserTel.text = square.companyUserTel;
    companyAddress.text = square.companyAddress;
    useCompanyName.text = square.useCompanyName;
    useCompanyUserName.text = square.useCompanyUserName;
    useStartedAt = square.useStartedAt;
    useEndedAt = square.useEndedAt;
    useAtPending = square.useAtPending;
    useFull = square.useFull;
    useChair = square.useChair;
    useChairNum.text = square.useChairNum.toString();
    useDesk = square.useDesk;
    useDeskNum.text = square.useDeskNum.toString();
    useContent.text = square.useContent;
    setState(() {});
  }

  @override
  void initState() {
    useStartedAt = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      10,
      0,
      0,
    );
    useEndedAt = useStartedAt.add(
      const Duration(hours: 2),
    );
    _getPrm();
    super.initState();
  }

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
                  const Text('以下のフォームにご入力いただき、申込を行なってください。'),
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
                    required: true,
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
                    required: true,
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
                    required: true,
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
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceHanSansJP-Bold',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '申込担当者電話番号',
                    required: true,
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
                    required: true,
                    child: CustomTextField(
                      controller: companyAddress,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                    ),
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
                    child: CustomTextField(
                      controller: useCompanyName,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）明神水産',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '使用者名',
                    child: CustomTextField(
                      controller: useCompanyUserName,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）田中二郎',
                    ),
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
                    child: DatetimeRangeForm(
                      startedAt: useStartedAt,
                      startedOnTap: () async =>
                          await CustomDateTimePicker().picker(
                        context: context,
                        init: useStartedAt,
                        title: '使用予定開始日時を選択',
                        onChanged: (value) {
                          setState(() {
                            useStartedAt = value;
                          });
                        },
                      ),
                      endedAt: useEndedAt,
                      endedOnTap: () async =>
                          await CustomDateTimePicker().picker(
                        context: context,
                        init: useEndedAt,
                        title: '使用予定終了日時を選択',
                        onChanged: (value) {
                          setState(() {
                            useEndedAt = value;
                          });
                        },
                      ),
                      pending: useAtPending,
                      pendingOnChanged: (value) {
                        setState(() {
                          useAtPending = value ?? false;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '使用区分',
                    child: Column(
                      children: [
                        CustomCheckbox(
                          label: '全面使用',
                          value: useFull,
                          onChanged: (value) {
                            setState(() {
                              useFull = value ?? false;
                            });
                          },
                          child: Container(),
                        ),
                        CustomCheckbox(
                          label: '折りたたみイス',
                          subLabel: '150円(税抜)／1脚・1日',
                          value: useChair,
                          onChanged: (value) {
                            setState(() {
                              useChair = value ?? false;
                            });
                          },
                          child: CustomTextField(
                            label: '脚数',
                            controller: useChairNum,
                            textInputType: TextInputType.text,
                            maxLines: 1,
                            enabled: useChair,
                          ),
                        ),
                        CustomCheckbox(
                          label: '折りたたみ机',
                          subLabel: '300円(税抜)／1台・1日',
                          value: useDesk,
                          onChanged: (value) {
                            setState(() {
                              useDesk = value ?? false;
                            });
                          },
                          child: CustomTextField(
                            label: '台数',
                            controller: useDeskNum,
                            textInputType: TextInputType.text,
                            maxLines: 1,
                            enabled: useDesk,
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
                      maxLines: 5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const DottedDivider(),
                  const SizedBox(height: 16),
                  FormLabel(
                    '添付ファイル',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomButton(
                          type: ButtonSizeType.sm,
                          label: 'ファイル選択',
                          labelColor: kWhiteColor,
                          backgroundColor: kGreyColor,
                          onPressed: () async {
                            final result = await FilePicker.platform.pickFiles(
                              type: FileType.any,
                            );
                            if (result == null) return;
                            pickedAttachedFiles.addAll(result.files);
                            setState(() {});
                          },
                        ),
                        const SizedBox(height: 4),
                        Column(
                          children: pickedAttachedFiles.map((file) {
                            return AttachedFileList(
                              fileName: p.basename(file.name),
                              onTap: () {
                                pickedAttachedFiles.remove(file);
                                setState(() {});
                              },
                              isClose: true,
                            );
                          }).toList(),
                        ),
                      ],
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
                      String? error = await squareProvider.check(
                        companyName: companyName.text,
                        companyUserName: companyUserName.text,
                        companyUserEmail: companyUserEmail.text,
                        companyUserTel: companyUserTel.text,
                        companyAddress: companyAddress.text,
                      );
                      if (error != null) {
                        if (!mounted) return;
                        showMessage(context, error, false);
                        return;
                      }
                      if (!mounted) return;
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
                            useCompanyName: useCompanyName.text,
                            useCompanyUserName: useCompanyUserName.text,
                            useStartedAt: useStartedAt,
                            useEndedAt: useEndedAt,
                            useAtPending: useAtPending,
                            useFull: useFull,
                            useChair: useChair,
                            useChairNum: int.parse(useChairNum.text),
                            useDesk: useDesk,
                            useDeskNum: int.parse(useDeskNum.text),
                            useContent: useContent.text,
                            pickedAttachedFiles: pickedAttachedFiles,
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
