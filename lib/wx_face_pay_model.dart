import 'package:flutter/cupertino.dart';

import 'wx_json_parse_util.dart';

// ignore: non_constant_identifier_names
final String WX_FACE_PAY_SUCCESS = 'SUCCESS';
// ignore: non_constant_identifier_names
final String WX_FACE_PAY_ERROR = 'ERROR';
// ignore: non_constant_identifier_names
final String WX_FACE_PAY_PARAM_ERROR = 'PARAM_ERROR';
// ignore: non_constant_identifier_names
final String WX_FACE_PAY_SYSTEMERROR = 'SYSTEMERROR';

// ignore: non_constant_identifier_names
final String FACE_UNKNOWN = 'FACE_UNKNOWN';
// ignore: non_constant_identifier_names
final String USER_CANCEL = 'USER_CANCEL';

// ignore: non_constant_identifier_names
final String SCAN_PAYMENT = 'SCAN_PAYMENT';

class UsuallyResponse {
  String code;
  String msg;

  UsuallyResponse({this.code, this.msg});

  UsuallyResponse.fromJson(Map<String, dynamic> json) {
    code = json['return_code'] ?? WX_FACE_PAY_ERROR;
    msg = json['return_msg'] ?? "";
  }
}

/// 获取Rawdata
class RawDataRepose {
  String code;
  String msg;
  String rawData;

  RawDataRepose({this.code, this.msg, this.rawData});

  RawDataRepose.fromJson(Map<String, dynamic> json) {
    code = json['return_code'] ?? WX_FACE_PAY_ERROR;
    msg = json['return_msg'] ?? "";
    rawData = json['rawdata'];
  }
}

/// 获取用户信息
class UserInfoRequest {
  String appId;
  String mchId;
  String subAppId;
  String subMchId;
  String storeId;

  // 人脸识别模式。可选值：
  //FACEID-ONCE: 人脸识别(单次模式)
  //FACEID-LOOP: 人脸识别(循环模式)
  String faceAuthType;
  String authInfo;

  // 未授权用户是否跳转授权页面。可选值[0:不跳转授权页面;1:跳转授权页面]
  String authMode;

  UserInfoRequest(
      {@required this.appId,
      @required this.mchId,
      this.subAppId,
      this.subMchId,
      @required this.storeId,
      this.faceAuthType = 'FACEID-ONCE',
      @required this.authInfo,
      this.authMode = '0'});

  Map<String, String> toJson() {
    Map<String, String> data = Map<String, String>();
    data['appid'] = appId;
    data['mch_id'] = mchId;
    data['sub_appid'] = subAppId ?? "";
    data['sub_mch_id'] = subMchId ?? "";
    data['store_id'] = storeId;
    data['face_authtype'] = faceAuthType;
    data['authinfo'] = authInfo;
    data['auth_mode'] = authMode;
    return data;
  }
}

class UserInfoResponse {
  String code;
  String msg;
  String openId;
  String subOpenId;
  String nickName;

  UserInfoResponse(
      {this.code, this.msg, this.openId, this.subOpenId, this.nickName});

  UserInfoResponse.fromJson(Map<String, dynamic> json) {
    code = json['return_code'] ?? WX_FACE_PAY_ERROR;
    msg = json['return_msg'] ?? "";
    openId = json['openid'];
    subOpenId = json['sub_openid'];
    nickName = json['nickname'];
  }
}

/// 获取人脸支付凭证
class FaceCodeRequest {
  String appId;
  String mchId;
  String subAppId;
  String subMchId;
  String storeId;
  String telephone;
  String outTradeNo;
  String totalFee;

  //可选值：
  //FACEPAY: 人脸凭证，常用于人脸支付
  //FACEPAY_DELAY: 延迟支付(提供商户号信息联系微信支付开通权限)
  String faceAuthType;
  String authInfo;

  // 支付成功页是否需要展示人脸识别授权项。展示：1 不展示：0  人脸识别授权项：用户授权后用于1:N识别，可返回用户信息openid，建议商户有自己会员系统时，填1。
  String askFacePermit = "1";

  // 是否展示微信支付成功页，可选值："0"，不展示；"1"，展示
  String askRetPage = '0';

  String faceCodeType = "0";

  // 商户端是否对SDK返回支付结果，可选值："0"，返回支付结果，商户需在确认⽀付结果后调⽤[updateWxpayfacePayResult]通知SDK；"1"，不返回支付结果。如果不填写则默认为"0"。
  String ignoreUpdatePayResult = "1";

  FaceCodeRequest(
      {@required this.appId,
      @required this.mchId,
      this.subAppId,
      this.subMchId,
      @required this.storeId,
      this.telephone,
      @required this.outTradeNo,
      @required this.totalFee,
      this.faceAuthType = 'FACEPAY',
      @required this.authInfo,
      this.askFacePermit = "1",
      this.askRetPage = "0",
      this.faceCodeType = "0",
      this.ignoreUpdatePayResult = "1"});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data["appid"] = appId;
    data["mch_id"] = mchId;
    data["sub_appid"] = subAppId;
    data["sub_mch_id"] = subMchId;
    data["store_id"] = storeId;
    data["telephone"] = telephone;
    data["out_trade_no"] = outTradeNo;
    data["total_fee"] = totalFee;
    data['face_authtype'] = faceAuthType;
    data["authinfo"] = authInfo;
    data["ask_face_permit"] = askFacePermit;
    data["ask_ret_page"] = askRetPage;
    data["face_code_type"] = faceCodeType;
    data["ignore_update_pay_result"] = ignoreUpdatePayResult;
    return data;
  }
}

class FaceCodeResponse {
  String code;
  String msg;

  // 人脸凭证, 用于刷脸支付。
  String faceCode;
  String openId;
  String subOpenId;

  // 获取的face_code，是否使用了请求参数中的telephone
  //可取值：
  //0：表示没有使用telephone；
  //1： 表示使用了telephone；
  int telephoneUsed;

  //用户年年龄信息，使用需要联系微信支付开通权限
  //可取值:
  //0:状态不明确，或权限未开通;
  //1: 成年年人;
  //2: 未成年人
  int underageState;

  FaceCodeResponse.fromJson(Map<String, dynamic> json) {
    code = json['return_code'] ?? WX_FACE_PAY_ERROR;
    msg = json['return_msg'] ?? "";
    faceCode = json['face_code'];
    openId = json['openid'];
    subOpenId = json['sub_openid'];
    telephoneUsed = WXJsonParseUtil.parseInt(json['telephone_used']);
    underageState = WXJsonParseUtil.parseInt(json['underage_state']);
  }
}

// 更新支付结果
class UpdateWxFacePayResultRequest {
  String appId;
  String mchId;
  String subAppId;
  String subMchId;
  String storeId;
  String authInfo;

  /// 支付结果。可取值：
  //SUCCESS: 支付成功
  //ERROR: 支付失败
  //#
  String payResult;

  UpdateWxFacePayResultRequest(
      {@required this.appId,
      @required this.mchId,
      this.subAppId,
      this.subMchId,
      @required this.storeId,
      @required this.authInfo,
      @required this.payResult});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data["appid"] = appId;
    data["mch_id"] = mchId;
    data["sub_appid"] = subAppId;
    data["sub_mch_id"] = subMchId;
    data["store_id"] = storeId;
    data["authinfo"] = authInfo;
    data["payresult"] = payResult;
    return data;
  }
}

// 停止识别(stopWxpayface)
class StopFaceRequest {
  String authInfo;

  StopFaceRequest({@required this.authInfo});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data["authinfo"] = authInfo;
    return data;
  }
}

// 统计上报(reportInfo)
class ReportInfoRequest {
  String item;
  String itemValue;

  ReportInfoRequest({@required this.item, @required this.itemValue});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data["item"] = item;
    data["item_value"] = itemValue;
    return data;
  }
}

// 交易上报(reportOrder)
class ReportOrderRequest {
  String mchId;
  String subMchId;
  String outTradeNo;

  ReportOrderRequest(
      {@required this.mchId, this.subMchId, @required this.outTradeNo});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data["mch_id"] = mchId;
    data["sub_mch_id"] = subMchId;
    data["out_trade_no"] = outTradeNo;
    return data;
  }
}

/// 付款码上报
class ReportPayCodeRequest {
  String authCode;

  ReportPayCodeRequest(this.authCode);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data["auth_code"] = authCode;

    return data;
  }
}

// 运营位控制接口(updateWxpayfaceBannerState)
class UpdateWxpayfaceBannerStateRequest {
  //设置运营位状态:
  //0:可展示运营图片
  //1:不可展示运营图片
  String bannerState;

  UpdateWxpayfaceBannerStateRequest(this.bannerState);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data["banner_state"] = bannerState;

    return data;
  }
}

/// 扫码返回的结果
class CodeScannerResponse {
  String code;
  String msg;
  String content;

  CodeScannerResponse({this.code, this.msg, this.content});

  CodeScannerResponse.fromJson(Map<String, dynamic> json) {
    code = json['return_code'] ?? WX_FACE_PAY_ERROR;
    msg = json['return_msg'] ?? "";
    content = json['code_msg'];
  }
}
