import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:wx_face_pay/wx_face_pay_model.dart';

class WxFacePay {
  static const MethodChannel _channel = const MethodChannel('wx_face_pay');

  /// 初始化(initWxpayface)
  //**接口作用：**对人脸SDK进行初始化
  static Future<UsuallyResponse> initWxpayface() async {
    final result = await _channel.invokeMethod("initWxpayface");

    UsuallyResponse model;

    try {
      Map<String, dynamic> json = Map<String, dynamic>.from(result);
      model = UsuallyResponse.fromJson(json);
    } catch (e) {
      debugPrint(e.toString());
    }
    return model;
  }

  /// 获取数据 (getWxpayfaceRawdata)
  static Future<RawDataRepose> getWxpayfaceRawdata() async {
    final result = await _channel.invokeMethod("getWxpayfaceRawdata");
    RawDataRepose model;
    try {
      Map<String, dynamic> json = Map<String, dynamic>.from(result);
      model = RawDataRepose.fromJson(json);
    } catch (e) {
      debugPrint(e.toString());
    }
    return model;
  }

  /// 获取用户信息(getWxpayfaceUserInfo)
  //**作用：**通过人脸识别获取用户信息。
  //该接口与[人脸识别 getWxpayfaceCode](#人脸识别 getWxpayfaceCode)的区别：
  //
  //不需要输入手机号；
  //无法用于订单支付；
  //UI交互不同。
  static Future<UserInfoResponse> getWxpayfaceUserInfo(
      UserInfoRequest request) async {
    final result =
        await _channel.invokeMethod("getWxpayfaceUserInfo", request.toJson());

    UserInfoResponse model;

    try {
      Map<String, dynamic> json = Map<String, dynamic>.from(result);
      model = UserInfoResponse.fromJson(json);
    } catch (e) {
      debugPrint(e.toString());
    }
    return model;
  }

  /// 人脸支付凭证(getWxpayfaceCode)
  //**作用：**启动人脸APP主界面入口，开启人脸识别，获取支付凭证或用户信息。
  //**支持版本：**1.0及以上
  static Future<FaceCodeResponse> getWxpayaceCode(
      FaceCodeRequest request) async {
    final result =
        await _channel.invokeMethod("getWxpayaceCode", request.toJson());

    FaceCodeResponse model;

    try {
      Map<String, dynamic> json = Map<String, dynamic>.from(result);
      model = FaceCodeResponse.fromJson(json);
    } catch (e) {
      debugPrint(e.toString());
    }
    return model;
  }

  /// 更新支付结果(updateWxpayfacePayResult)
  //作用： 商户侧确认支付结果后通知人脸SDK 更新支付结果，用户确认支付结果后返回wxpayfaceCallBack，刷脸支付界面关闭。
  //
  //**支持版本：**1.0及以上
  //
  //注意： 从1.14.296开始，回调时机改为刷脸支付界面关闭后触发回调。
  static Future<UsuallyResponse> updateWxpayfacePayResult(
      UpdateWxFacePayResultRequest request) async {
    final result = await _channel.invokeMethod(
        "updateWxpayfacePayResult", request.toJson());

    UsuallyResponse model;

    try {
      Map<String, dynamic> json = Map<String, dynamic>.from(result);
      model = UsuallyResponse.fromJson(json);
    } catch (e) {
      debugPrint(e.toString());
    }
    return model;
  }

  /// 停止识别(stopWxpayface)
  //作用： 用于停止[获取用户信息 getWxpayfaceUserInfo](#获取用户信息 getWxpayfaceUserInfo)发起的人脸识别，以及隐藏所有的人脸标识展示。
  //
  //**支持版本：**1.13及以上
  //
  //#
  static Future<UsuallyResponse> stopWxpayface(StopFaceRequest request) async {
    final result =
        await _channel.invokeMethod("stopWxpayface", request.toJson());

    UsuallyResponse model;

    try {
      Map<String, dynamic> json = Map<String, dynamic>.from(result);
      model = UsuallyResponse.fromJson(json);
    } catch (e) {
      debugPrint(e.toString());
    }
    return model;
  }

  /// 统计上报(reportInfo)
  //接口作用： 实现点击上报，计数上报，耗时上报
  static Future<UsuallyResponse> reportInfo(ReportInfoRequest request) async {
    final result = await _channel.invokeMethod("reportInfo", request.toJson());

    UsuallyResponse model;

    try {
      Map<String, dynamic> json = Map<String, dynamic>.from(result);
      model = UsuallyResponse.fromJson(json);
    } catch (e) {
      debugPrint(e.toString());
    }
    return model;
  }

  /// 交易上报(reportOrder)
  //接口作用： 设备产生的非刷脸支付交易，都必须调用此接口上报交易信息, 建议每笔非刷脸支付交易发生后，都调用该接口。
  static Future<UsuallyResponse> reportOrder(ReportOrderRequest request) async {
    final result = await _channel.invokeMethod("reportOrder", request.toJson());

    UsuallyResponse model;

    try {
      Map<String, dynamic> json = Map<String, dynamic>.from(result);
      model = UsuallyResponse.fromJson(json);
    } catch (e) {
      debugPrint(e.toString());
    }
    return model;
  }

  /// 付款码上报 reportPaycode
  //**接口作用：**设备获取到微信付款码，而无法获取到商户号和订单号的可以通过此接口做交易上报 **支持版本：**2.11及以上
  static Future<UsuallyResponse> reportPaycode(
      ReportPayCodeRequest request) async {
    final result =
        await _channel.invokeMethod("reportPaycode", request.toJson());

    UsuallyResponse model;

    try {
      Map<String, dynamic> json = Map<String, dynamic>.from(result);
      model = UsuallyResponse.fromJson(json);
    } catch (e) {
      debugPrint(e.toString());
    }
    return model;
  }

  /// 运营位控制接口(updateWxpayfaceBannerState)
  //作用： 设置微信支付运营图片状态，默认可展示，可修改为(可展示/不可展示)两种状态
  //支持版本： 1.16及以上
  static Future<UsuallyResponse> updateWxpayfaceBannerState(
      UpdateWxpayfaceBannerStateRequest request) async {
    final result = await _channel.invokeMethod(
        "updateWxpayfaceBannerState", request.toJson());

    UsuallyResponse model;

    try {
      Map<String, dynamic> json = Map<String, dynamic>.from(result);
      model = UsuallyResponse.fromJson(json);
    } catch (e) {
      debugPrint(e.toString());
    }
    return model;
  }

  /// 启动扫码(startCodeScanner)
  //作用： 微信人脸sdk启动摄像头进入扫码模式
  //支持版本： 2.0及以上
  //备注：
  //该方法注册的回调接口在stopCodeScanner之前，扫码成功都会回调。
  //该方法可以多次调用，但是扫码结果只会回调最后一次注册的回调.
  //扫码模式和刷脸互斥，一旦开始刷脸则SDK会退出扫码模式，扫码回调失效，如果需要扫码功能，需要刷脸结束后再次调用该方法启动扫码。
  //#
  static Future<CodeScannerResponse> startCodeScanner() async {
    final result = await _channel.invokeMethod("startCodeScanner");

    CodeScannerResponse model;

    try {
      Map<String, dynamic> json = Map<String, dynamic>.from(result);
      model = CodeScannerResponse.fromJson(json);
    } catch (e) {
      debugPrint(e.toString());
    }
    return model;
  }

  /// 停止扫码(stopCodeScanner)
  //作用： 微信人脸sdk停止摄像头扫码，退出扫码模式

  //支持版本： 2.0及以上
  static Future stopCodeScanner() => _channel.invokeMethod("stopCodeScanner");

  /// 释放资源(releaseWxpayface)
  //作用： 释放人脸服务，断开连接。
  //
  //支持版本： 1.0及以上
  static Future releaseWxpayface() => _channel.invokeMethod("releaseWxpayface");
}
