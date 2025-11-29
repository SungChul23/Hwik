import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'privacy_policy_model.dart';
export 'privacy_policy_model.dart';

class PrivacyPolicyWidget extends StatefulWidget {
  const PrivacyPolicyWidget({super.key});

  static String routeName = 'PrivacyPolicy';
  static String routePath = '/privacyPolicy';

  @override
  State<PrivacyPolicyWidget> createState() => _PrivacyPolicyWidgetState();
}

class _PrivacyPolicyWidgetState extends State<PrivacyPolicyWidget> {
  late PrivacyPolicyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacyPolicyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: PopScope(
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).mainBlack,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () async {
                HapticFeedback.lightImpact();
                context.safePop();
              },
            ),
            title: Container(
              decoration: BoxDecoration(
                color: Color(0xFFFF8C42),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: Color(0x33000000),
                    offset: Offset(
                      0.0,
                      2.0,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(24.0),
                border: Border.all(
                  color: Color(0x33FFFFFF),
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '개인정보 처리방침',
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleLargeFamily,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            fontSize: 24.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .titleLargeIsCustom,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2.0,
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).mainBlack,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            controller: _model.columnController,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  '개인정보 처리방침',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        font: GoogleFonts
                                                            .notoSans(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .mainWhite,
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFF1E1E1E),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(
                                                    0.0,
                                                    2.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(30.0),
                                                bottomRight:
                                                    Radius.circular(30.0),
                                                topLeft: Radius.circular(30.0),
                                                topRight: Radius.circular(30.0),
                                              ),
                                              border: Border.all(
                                                color: Color(0x33FFFFFF),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 10.0, 10.0, 10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      '팀 람다람쥐는 이용자의 개인정보를 중요하게 생각하며, 「개인정보 보호법」 및 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 등 관련 법령을 준수합니다. 팀 람다람쥐는 본 개인정보 처리방침을 통해 이용자의 개인정보가 어떠한 목적과 방식으로 수집·이용되고, 어떤 조치가 취해지고 있는지를 명확히 안내드립니다.\n\n제1조 (수집하는 개인정보 항목)\n\n팀 람다람쥐는 서비스 제공을 위해 아래와 같은 개인정보를 수집합니다.\n\n회원가입 및 서비스 이용 시: 이메일, 닉네임, 비밀번호(암호화 처리), 성별, 학습 언어, 선호 음성(선택사항)\n\n서비스 이용 과정에서 자동 수집되는 정보: 기기 정보(운영체제, 모델명, 앱 버전, 브라우저 타입), 접속 IP, 이용 시간, 쿠키, 서비스 이용 기록\n\nAI 분석 기능 이용 시: 음성 녹음 파일(학습용 발화 데이터), 촬영 이미지 및 텍스트 추출 데이터, 분석 결과(번역문, 피드백, 추천 문장 등)\n\n제2조 (개인정보의 수집 및 이용 목적)\n\n팀 람다람쥐는 수집한 개인정보를 다음의 목적을 위해 이용합니다.\n\n서비스 제공: 외국어 발음 교정, 문장 피드백, AI 분석 결과 제공, 맞춤형 학습 콘텐츠 추천\n\n회원관리: 본인 확인, 계정 보호, 부정 이용 방지, 학습 기록 관리\n\n서비스 개선 및 신규 기능 개발: AI 모델 고도화, 통계 분석, 오류 탐지\n\n법적 의무 준수: 이용자 문의 대응, 분쟁 해결, 법령상 보관 의무 이행\n\n제3조 (개인정보의 보유 및 이용 기간)\n\n팀 람다람쥐는 이용자의 개인정보를 수집 및 이용 목적이 달성될 때까지 보유하며, 목적 달성 후에는 즉시 파기합니다.\n\n단, 다음의 경우에는 아래 기간 동안 보관합니다.\n\n법령에 따라 보존할 필요가 있는 경우:\n\n통신사실확인자료 3개월\n\n소비자 불만 및 분쟁 처리 기록 3년\n\n로그 기록(익명화 데이터) 6개월\n\n제4조 (개인정보의 제3자 제공)\n\n팀 람다람쥐는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 다음의 경우에는 예외로 합니다.\n\n이용자가 사전에 동의한 경우\n\n법령에 따라 수사기관 등의 요청이 있는 경우\n\n제5조 (개인정보 처리의 위탁)\n\n팀 람다람쥐는 안정적인 서비스 운영을 위해 다음과 같이 개인정보 처리를 위탁할 수 있습니다.\n\nAmazon Web Services, Inc. (AWS): 클라우드 서버 및 데이터 저장 (Lambda, S3, DynamoDB 등)\n\n팀 람다람쥐는 위탁 계약 시 개인정보가 안전하게 처리되도록 관리·감독합니다.\n\n제6조 (개인정보의 파기 절차 및 방법)\n\n개인정보의 보유기간이 경과하거나 처리 목적이 달성된 경우, 해당 정보를 즉시 파기합니다.\n\n전자적 파일 형태의 정보는 복구가 불가능한 기술적 방법으로 삭제하며, 종이 문서는 분쇄 또는 소각하여 파기합니다.\n\n제7조 (이용자의 권리와 행사 방법)\n\n이용자는 언제든지 자신의 개인정보를 열람, 정정, 삭제, 처리정지 요청할 수 있습니다.\n\n관련 요청은 앱 내 설정 메뉴 또는 이메일(kimsam0923@naver.com)로 가능합니다.\n\n팀 람다람쥐는 본인 확인 후 지체 없이 필요한 조치를 취합니다.\n\n제8조 (개인정보 자동 수집 장치의 설치·운영 및 거부)\n\n팀 람다람쥐는 쿠키(Cookie)를 사용하여 이용자의 접속 환경을 분석하고 맞춤형 서비스를 제공합니다.\n\n이용자는 웹 브라우저 설정을 통해 쿠키 저장을 거부할 수 있습니다. 단, 일부 서비스 이용에 제한이 발생할 수 있습니다.\n\n제9조 (개인정보의 안전성 확보 조치)\n\n팀 람다람쥐는 개인정보 보호를 위해 다음과 같은 기술적·관리적 대책을 시행하고 있습니다.\n\n데이터 암호화 저장 (AES-256, HTTPS 통신 적용)\n\nAWS IAM 기반 접근 권한 최소화\n\n정기적 보안 점검 및 로그 모니터링\n\n백업 데이터의 분리 저장 및 암호화 관리\n\n내부 직원의 보안 교육 및 접근 기록 관리\n\n제10조 (아동의 개인정보 보호)\n\n본 서비스는 만 14세 이상 이용자를 대상으로 합니다. 팀 람다람쥐는 14세 미만 아동의 개인정보를 고의로 수집하지 않으며, 만약 해당 사실이 확인될 경우 즉시 파기 조치합니다.\n\n제11조 (개인정보 보호책임자)\n\n팀 람다람쥐는 개인정보 처리와 관련된 불만, 신고, 문의 사항을 처리하기 위해 다음과 같이 개인정보 보호책임자를 지정합니다.\n\n이름: 김성철\n\n직책: 개인정보 보호책임자\n\n이메일: kimsam0923@naver.com\n\n제12조 (개인정보 처리방침의 변경)\n\n본 방침은 법령, 서비스 정책, 기술적 변화에 따라 변경될 수 있습니다.\n\n변경사항은 앱 내 공지사항 또는 홈페이지를 통해 사전 고지합니다.\n\n본 방침의 최신 버전은 앱 내 “개인정보 처리방침” 메뉴에서 확인할 수 있습니다.\n\n부칙 본 개인정보 처리방침은 2025년 10월 19일부터 시행됩니다.',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                font: GoogleFonts
                                                                    .notoSans(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .mainWhite,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 10.0)),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 20.0)),
                                ),
                              ]
                                  .divide(SizedBox(height: 24.0))
                                  .addToStart(SizedBox(height: 30.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
