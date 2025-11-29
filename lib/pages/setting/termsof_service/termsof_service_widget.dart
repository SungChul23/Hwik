import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'termsof_service_model.dart';
export 'termsof_service_model.dart';

class TermsofServiceWidget extends StatefulWidget {
  const TermsofServiceWidget({super.key});

  static String routeName = 'TermsofService';
  static String routePath = '/termsofService';

  @override
  State<TermsofServiceWidget> createState() => _TermsofServiceWidgetState();
}

class _TermsofServiceWidgetState extends State<TermsofServiceWidget> {
  late TermsofServiceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsofServiceModel());

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
                      '서비스 이용약관',
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
                                                  '서비스 이용약관',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLargeFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .mainWhite,
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLargeIsCustom,
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
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
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
                                                      '본 약관은 “휙!”(이하 “서비스”)를 제공하는 팀 람다람쥐와 이용자 간의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다. 이용자는 본 약관에 동의함으로써 서비스 이용계약이 성립되며, 팀 람다람쥐의 정책을 준수해야 합니다.\n\n제1조 (목적)\n\n이 약관은 팀 람다람쥐가 제공하는 “휙!” 서비스의 이용과 관련하여 팀 람다람쥐와 이용자의 권리, 의무, 책임 및 기타 필요한 사항을 규정함을 목적으로 합니다.\n\n제2조 (정의)\n\n“서비스”란 이용자가 사진 촬영, 음성 녹음, 인공지능(AI) 분석 기능을 통해 외국어 학습, 발음 교정, 문장 피드백 등을 받을 수 있는 모바일 및 웹 애플리케이션을 말합니다.\n\n“이용자”란 본 약관에 동의하고 서비스를 이용하는 모든 회원 및 비회원을 말합니다.\n\n“콘텐츠”란 이용자가 서비스 내에서 생성하거나 팀 람다람쥐가 제공하는 텍스트, 이미지, 음성, 영상, 데이터 등을 포함합니다.\n\n“회원”이란 서비스에 가입하여 지속적으로 이용할 수 있는 자를 말합니다.\n\n제3조 (약관의 효력 및 변경)\n\n본 약관은 서비스 내 또는 연결화면에 게시함으로써 효력을 발생합니다.\n\n팀 람다람쥐는 관련 법령을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.\n\n팀 람다람쥐가 약관을 변경할 경우, 적용일자 및 변경 사유를 명시하여 공지합니다.\n\n이용자가 변경된 약관에 동의하지 않을 경우 서비스 이용을 중단하고 탈퇴할 수 있습니다.\n\n제4조 (서비스의 제공 및 변경)\n\n팀 람다람쥐는 다음과 같은 서비스를 제공합니다.\n\n사진 기반 외국어 문장 인식 및 번역\n\n음성 녹음 및 발음 피드백\n\nAI 언어 학습 콘텐츠 추천\n\n기타 팀 람다람쥐가 정하는 부가 서비스\n\n팀 람다람쥐는 기술적 필요 또는 정책상 사유로 서비스의 일부 또는 전부를 변경할 수 있으며, 중요한 변경 사항은 사전 공지합니다.\n\n팀 람다람쥐는 다음 각 호의 경우 서비스 제공을 일시 중단할 수 있습니다.\n\n설비의 보수, 점검, 교체 등 불가피한 사유가 있을 경우\n\n통신 두절, 천재지변 등 불가항력적 사유가 있을 경우\n\n제5조 (회원가입 및 관리)\n\n회원가입은 이용자가 팀 람다람쥐가 정한 절차에 따라 동의하고 개인정보를 입력함으로써 이루어집니다.\n\n회원은 자신의 계정을 제3자에게 양도하거나 대여할 수 없습니다.\n\n회원 정보가 변경될 경우, 즉시 수정해야 하며 이를 소홀히 하여 발생한 불이익에 대해 팀 람다람쥐는 책임지지 않습니다.\n\n제6조 (이용자의 의무)\n\n이용자는 다음 각 호의 행위를 하여서는 안 됩니다.\n\n타인의 정보 도용 또는 허위 정보 입력\n\n서비스 내 불법 복제, 배포, 해킹 시도\n\n음란물, 욕설, 폭력적 표현 등의 게시물 업로드\n\nAI 분석 결과를 변조하거나 상업적으로 이용하는 행위\n\n팀 람다람쥐의 서비스 운영을 방해하는 행위\n\n제7조 (저작권의 귀속 및 이용제한)\n\n서비스에 대한 저작권 및 지식재산권은 팀 람다람쥐에 귀속됩니다.\n\n이용자가 서비스 내에 게시한 콘텐츠의 저작권은 본인에게 귀속되나, 팀 람다람쥐는 서비스 개선 및 홍보를 위해 이를 사용할 수 있습니다.\n\n이용자는 팀 람다람쥐의 사전 동의 없이 서비스 내 자료를 복제, 배포, 변경, 상업적으로 이용할 수 없습니다.\n\n제8조 (개인정보 보호)\n\n팀 람다람쥐는 관련 법령에 따라 이용자의 개인정보를 보호하며, 그 구체적인 내용은 별도의 「개인정보 처리방침」에 따릅니다.\n\n개인정보 처리방침은 서비스 내에서 언제든지 확인할 수 있습니다.\n\n제9조 (서비스의 제한 및 정지)\n\n팀 람다람쥐는 이용자가 본 약관을 위반할 경우 사전 통보 없이 서비스 이용을 제한하거나 회원 자격을 정지시킬 수 있습니다.\n\n팀 람다람쥐는 긴급한 시스템 점검 또는 법적 조치가 필요한 경우 서비스 제공을 일시 중단할 수 있습니다.\n\n제10조 (책임의 한계)\n\n팀 람다람쥐는 천재지변, 통신 장애 등 불가항력적 사유로 인한 손해에 대해 책임을 지지 않습니다.\n\n팀 람다람쥐는 AI 분석 결과의 정확성, 완전성, 신뢰성에 대해 보장하지 않으며, 해당 결과를 근거로 한 의사결정에 대한 법적 책임을 부담하지 않습니다.\n\n이용자의 부주의 또는 제3자 행위로 인한 손해에 대해 팀 람다람쥐는 책임을 지지 않습니다.\n\n제11조 (계약 해지 및 탈퇴)\n\n이용자는 언제든지 서비스 내 설정 메뉴를 통해 회원탈퇴를 신청할 수 있습니다.\n\n팀 람다람쥐는 이용자가 약관을 위반한 경우 사전 통보 없이 계약을 해지할 수 있습니다.\n\n제12조 (분쟁 해결 및 관할)\n\n본 약관에 따른 분쟁은 대한민국 법률에 따릅니다.\n\n팀 람다람쥐와 이용자 간 분쟁이 발생할 경우, 상호 협의하여 원만히 해결함을 원칙으로 합니다.\n\n협의로 해결되지 않을 경우, 서울중앙지방법원을 전속 관할 법원으로 합니다.\n\n제13조 (고객센터 및 연락처)\n\n상호명: 팀 람다람쥐\n\n대표자: 김성철\n\n이메일: kimsam0923@naver.com\n\n주소: (추후 명시 예정)\n\n부칙 본 약관은 2025년 10월 19일부터 시행됩니다',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelLarge
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .mainWhite,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeIsCustom,
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
