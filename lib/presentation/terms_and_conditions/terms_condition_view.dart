import 'package:flutter/material.dart';
import 'package:flutter_super_html_viewer/flutter_super_html_viewer.dart';
import 'package:round_app/core/app_export.dart';
import 'package:webview_flutter/webview_flutter.dart' as wf;

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeUtils.width,
      height: SizeUtils.height * 0.5,
      child: wf.WebView(
        initialUrl: 'https://www.iubenda.com/termini-e-condizioni/53657342',
        javascriptMode: wf.JavascriptMode.unrestricted,
      ),
    );
  }
}

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeUtils.width,
      height: SizeUtils.height * 0.5,
      child: wf.WebView(
        initialUrl: 'https://www.iubenda.com/privacy-policy/53657342',
        javascriptMode: wf.JavascriptMode.unrestricted,
      ),
    );
  }
}

class CoockieScreen extends StatelessWidget {
  const CoockieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: SizeUtils.height,
        width: SizeUtils.width,
        child: HtmlContentViewer(
            htmlContent:
                '<body style="height: 700px;"><script type="text/javascript">var _iub = _iub || [];_iub.csConfiguration = {"askConsentAtCookiePolicyUpdate":true,"enableTcf":true,"floatingPreferencesButtonDisplay":"bottom-right","googleAdditionalConsentMode":true,"perPurposeConsent":true,"siteId":3627129,"tcfPurposes":{"2":"consent_only","7":"consent_only","8":"consent_only","9":"consent_only","10":"consent_only","11":"consent_only"},"whitelabel":false,"cookiePolicyId":55376023,"lang":"it", "banner":{ "acceptButtonCaptionColor":"#FFFFFF","acceptButtonColor":"#0073CE","acceptButtonDisplay":true,"backgroundColor":"#FFFFFF","closeButtonRejects":true,"customizeButtonCaptionColor":"#4D4D4D","customizeButtonColor":"#DADADA","customizeButtonDisplay":true,"explicitWithdrawal":true,"listPurposes":true,"ownerName":false,"position":"float-top-center","showTitle":false,"textColor":"#000000" }};</script><script type="text/javascript" src="https://cs.iubenda.com/autoblocking/3627129.js"></script><script type="text/javascript" src="//cdn.iubenda.com/cs/tcf/stub-v2.js"></script><script type="text/javascript" src="//cdn.iubenda.com/cs/tcf/safe-tcf-v2.js"></script><script type="text/javascript" src="//cdn.iubenda.com/cs/iubenda_cs.js" charset="UTF-8" async></script></body>',
            initialContentHeight: MediaQuery.of(context).size.height),
      ),
    );
  }
}
