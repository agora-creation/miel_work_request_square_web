import 'package:flutter/material.dart';
import 'package:miel_work_request_square_web/common/style.dart';
import 'package:miel_work_request_square_web/widgets/custom_button.dart';
import 'package:miel_work_request_square_web/widgets/custom_text_field.dart';
import 'package:miel_work_request_square_web/widgets/dotted_divider.dart';
import 'package:miel_work_request_square_web/widgets/form_label.dart';
import 'package:miel_work_request_square_web/widgets/responsive_box.dart';

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
  TextEditingController mediaName = TextEditingController();
  TextEditingController programName = TextEditingController();
  TextEditingController castInfo = TextEditingController();
  TextEditingController featureContent = TextEditingController();
  TextEditingController publishedAt = TextEditingController();
  TextEditingController interviewedAt = TextEditingController();
  TextEditingController interviewedUserName = TextEditingController();
  TextEditingController interviewedUserTel = TextEditingController();
  TextEditingController interviewedTime = TextEditingController();
  bool interviewedReserved = false;
  TextEditingController interviewedShopName = TextEditingController();
  TextEditingController interviewedVisitors = TextEditingController();
  TextEditingController interviewedContent = TextEditingController();
  TextEditingController locationAt = TextEditingController();
  TextEditingController locationUserName = TextEditingController();
  TextEditingController locationUserTel = TextEditingController();
  TextEditingController locationVisitors = TextEditingController();
  TextEditingController locationContent = TextEditingController();
  TextEditingController insertedAt = TextEditingController();
  TextEditingController insertedUserName = TextEditingController();
  TextEditingController insertedUserTel = TextEditingController();
  TextEditingController insertedTime = TextEditingController();
  bool insertedReserved = false;
  TextEditingController insertedShopName = TextEditingController();
  TextEditingController insertedVisitors = TextEditingController();
  TextEditingController insertedContent = TextEditingController();
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
                    '会社名',
                    child: CustomTextField(
                      controller: companyName,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）ひろめカンパニー',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '担当者名',
                    child: CustomTextField(
                      controller: companyUserName,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）田中太郎',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '担当者メールアドレス',
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
                    '担当者電話番号',
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
                      controller: mediaName,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）TV放送・WEB配信',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '番組・雑誌名',
                    child: CustomTextField(
                      controller: programName,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）ABC放送『ひろめ市場へ行こう！』',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '出演者情報',
                    child: CustomTextField(
                      controller: castInfo,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）ひろめ太郎、ひろめ花子',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '特集内容・備考',
                    child: CustomTextField(
                      controller: featureContent,
                      textInputType: TextInputType.multiline,
                      maxLines: null,
                      hintText: '例）賑わうひろめ市場の様子と高知の名物料理特集',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    'OA・掲載予定日',
                    child: CustomTextField(
                      controller: publishedAt,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）令和元年11月1日10時から放送予定',
                    ),
                  ),
                  const SizedBox(height: 24),
                  const DottedDivider(),
                  const SizedBox(height: 16),
                  const Text(
                    '取材当日情報',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceHanSansJP-Bold',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '予定日時',
                    child: CustomTextField(
                      controller: interviewedAt,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）令和元年9月30日14:00〜16:00',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '担当者名',
                    child: CustomTextField(
                      controller: interviewedUserName,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）山田二郎',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '担当者電話番号',
                    child: CustomTextField(
                      controller: interviewedUserTel,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）090-0000-0000',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '取材時間',
                    child: CustomTextField(
                      controller: interviewedTime,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）2時間程度',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '席の予約',
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: kDisabledColor),
                          bottom: BorderSide(color: kDisabledColor),
                        ),
                      ),
                      child: CheckboxListTile(
                        title: const Text('必要な場合はチェックを入れてください'),
                        value: interviewedReserved,
                        onChanged: (value) {
                          setState(() {
                            interviewedReserved = value ?? false;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '取材店舗',
                    child: CustomTextField(
                      controller: interviewedShopName,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）明神丸、黒潮物産',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '訪問人数',
                    child: CustomTextField(
                      controller: interviewedVisitors,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText:
                          '例）タレント2名(ひろめ太郎・ひろめくん)、スタッフ4名、カメラマン1名、ディレクター1名、AD2名',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '取材内容・備考',
                    child: CustomTextField(
                      controller: interviewedContent,
                      textInputType: TextInputType.multiline,
                      maxLines: null,
                      hintText:
                          '例）ひろめ太郎とゲストのひろめくんが館内を散策する様子とカツオのたたきや芋けんぴを食べる様子',
                    ),
                  ),
                  const SizedBox(height: 24),
                  const DottedDivider(),
                  const SizedBox(height: 16),
                  const Text(
                    'ロケハン情報',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceHanSansJP-Bold',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '予定日時',
                    child: CustomTextField(
                      controller: locationAt,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）令和元年9月20日14:00〜15:00',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '担当者名',
                    child: CustomTextField(
                      controller: locationUserName,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）田中太郎',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '担当者電話番号',
                    child: CustomTextField(
                      controller: locationUserTel,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）090-0000-0000',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '訪問人数',
                    child: CustomTextField(
                      controller: locationVisitors,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）2名',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    'ロケハン内容・備考',
                    child: CustomTextField(
                      controller: locationContent,
                      textInputType: TextInputType.multiline,
                      maxLines: null,
                      hintText: '例）9/17(火)〜9/20(金)のいずれかの日程で14:00〜15:00',
                    ),
                  ),
                  const SizedBox(height: 24),
                  const DottedDivider(),
                  const SizedBox(height: 16),
                  const Text(
                    'インサート撮影情報',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceHanSansJP-Bold',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '予定日時',
                    child: CustomTextField(
                      controller: insertedAt,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）令和元年10月1日14:00〜15:00',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '担当者名',
                    child: CustomTextField(
                      controller: insertedUserName,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）山田太郎',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '担当者電話番号',
                    child: CustomTextField(
                      controller: insertedUserTel,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）090-0000-0000',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '撮影時間',
                    child: CustomTextField(
                      controller: insertedTime,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）1時間程度',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '席の予約',
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: kDisabledColor),
                          bottom: BorderSide(color: kDisabledColor),
                        ),
                      ),
                      child: CheckboxListTile(
                        title: const Text('必要な場合はチェックを入れてください'),
                        value: insertedReserved,
                        onChanged: (value) {
                          setState(() {
                            insertedReserved = value ?? false;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '取材店舗',
                    child: CustomTextField(
                      controller: insertedShopName,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）明神丸、黒潮物産',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '訪問人数',
                    child: CustomTextField(
                      controller: insertedVisitors,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）3名',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '撮影内容・備考',
                    child: CustomTextField(
                      controller: insertedContent,
                      textInputType: TextInputType.multiline,
                      maxLines: null,
                      hintText: '例）ひろめ市場の内観・外観、カツオのたたきを焼いている映像',
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
                      // Navigator.push(
                      //   context,
                      //   PageTransition(
                      //     type: PageTransitionType.rightToLeft,
                      //     child: Step2Screen(
                      //       companyName: companyName.text,
                      //       companyUserName: companyUserName.text,
                      //       companyUserEmail: companyUserEmail.text,
                      //       companyUserTel: companyUserTel.text,
                      //       mediaName: mediaName.text,
                      //       programName: programName.text,
                      //       castInfo: castInfo.text,
                      //       featureContent: featureContent.text,
                      //       publishedAt: publishedAt.text,
                      //       interviewedAt: interviewedAt.text,
                      //       interviewedUserName: interviewedUserName.text,
                      //       interviewedUserTel: interviewedUserTel.text,
                      //       interviewedTime: interviewedTime.text,
                      //       interviewedReserved: interviewedReserved,
                      //       interviewedShopName: interviewedShopName.text,
                      //       interviewedVisitors: interviewedVisitors.text,
                      //       interviewedContent: interviewedContent.text,
                      //       locationAt: locationAt.text,
                      //       locationUserName: locationUserName.text,
                      //       locationUserTel: locationUserTel.text,
                      //       locationVisitors: locationVisitors.text,
                      //       locationContent: locationContent.text,
                      //       insertedAt: insertedAt.text,
                      //       insertedUserName: insertedUserName.text,
                      //       insertedUserTel: insertedUserTel.text,
                      //       insertedTime: insertedTime.text,
                      //       insertedReserved: insertedReserved,
                      //       insertedShopName: insertedShopName.text,
                      //       insertedVisitors: insertedVisitors.text,
                      //       insertedContent: insertedContent.text,
                      //       remarks: remarks.text,
                      //     ),
                      //   ),
                      // );
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
