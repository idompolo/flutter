class Extra {
  String? startAt = '';
  String? endAt = '';
  int? expireMonth = 0;
  bool? vbankResult = true;
  List<int>? quotas;

  String? appScheme = '';
  String? appSchemeHost = '';

  String? locale = 'ko';

  int? popup = 0;
  int? quick_popup = 0;
  String? dispCashResult = 'Y';
  int? escrow = 0;
  bool? iosCloseButton = false;

  String? offer_period = ''; //결제창 제공기간에 해당하는 string 값, 지원하는 PG만 적용됨

  String? theme = 'purple'; //통합 결제창 색상 지정 (purple, red, custom 지정 가능 )
  String? custom_background = ''; //theme가 custom인 경우 배경 색 지정 가능 ( ex: #f2f2f2 )
  String? custom_font_color = ''; //theme가 custom인 경우 폰트색 지정 가능 ( ex: #333333 )

  Extra();

  Extra.fromJson(Map<String, dynamic> json) {
    startAt = json["start_at"];
    endAt = json["end_at"];
    expireMonth = json["expire_month"];
    vbankResult = json["vbank_result"];
    quotas = json["quotas"];

    appScheme = json["app_scheme"];
    appSchemeHost = json["app_scheme_host"];

    locale = json["locale"];

    popup = json["popup"];
    quick_popup = json["quick_popup"];
    dispCashResult = json["disp_cash_result"];
    escrow = json["escrow"];
    iosCloseButton = json["iosCloseButton"];

    offer_period = json["offer_period"];
    theme = json["theme"];
    custom_background = json["custom_background"];
    custom_font_color = json["custom_font_color"];
  }

  Map<String, dynamic> toJson() => {
        "start_at": this.startAt,
        "end_at": this.endAt,
        "expire_month": this.expireMonth,
        "vbank_result": this.vbankResult,
        "quotas": this.quotas,
        "app_scheme": this.appScheme,

        "app_scheme_host": this.appSchemeHost,
        "locale": this.locale,
        "popup": this.popup,
        "quick_popup": this.quick_popup,
        "disp_cash_result": this.dispCashResult,
        "escrow": this.escrow,
        "iosCloseButton": this.iosCloseButton,
        "offer_period": this.offer_period,
        "theme": this.theme,
        "custom_background": this.custom_background,
        "custom_font_color": this.custom_font_color,
      };

  String getQuotas() {
    if (quotas == null || quotas!.isEmpty) return '';
    String result = '';
    for (int quota in quotas!) {
      if (result.length > 0) result += ',';
      result += quota.toString();
    }
    return result;
  }

  String toString() {
    return "{start_at: '${reVal(startAt)}', end_at: '${reVal(endAt)}', expire_month: ${reVal(expireMonth)}, vbank_result: ${reVal(vbankResult)}," +
        "quotas: '${getQuotas()}', app_scheme: '${reVal(appScheme)}', app_scheme_host: '${reVal(appSchemeHost)}', locale: '${reVal(locale)}'," +
        "offer_period: '${reVal(offer_period)}', theme: '${reVal(appScheme)}', theme: '${reVal(appSchemeHost)}', custom_background: '${reVal(custom_background)}', custom_font_color: '${reVal(custom_font_color)}'," +
        "popup: ${reVal(popup)}, quick_popup: ${reVal(quick_popup)}, disp_cash_result: '${reVal(dispCashResult)}', escrow: ${reVal(escrow)}, iosCloseButton: $iosCloseButton}";
  }

  String reVal(dynamic value) {
    if (value is String) {
      if (value.isEmpty) {
        return '';
      }
      return value.replaceAll("\"", "'").replaceAll("'", "\\'");
    } else {
      return value.toString();
    }
  }
}
