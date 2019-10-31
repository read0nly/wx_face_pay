/**
 * @Author: read0nly
 * @GitHub: https://github.com/read0nly
 * @Email: nj.readonly@gmailcom
 * @Description:
 * @Date: 2019/10/31
 */

package com.jie.wx_face_pay;

import android.content.Context;
import android.os.RemoteException;

import com.tencent.wxpayface.IWxPayFaceCallbackAIDL;
import com.tencent.wxpayface.IWxPayfaceCallback;
import com.tencent.wxpayface.WxPayFace;

import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * WxFacePayPlugin
 */
public class WxFacePayPlugin implements MethodCallHandler {
    static Context thisContext;

    /**
     * Plugin registration.
     */
    public static void registerWith(Registrar registrar) {
        thisContext = registrar.context();
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "wx_face_pay");
        channel.setMethodCallHandler(new WxFacePayPlugin());
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        if (call.method.equals("initWxpayface")) {
            initWxpayface(call, result);
        } else if (call.method.equals("getWxpayfaceRawdata")) {
            getWxpayfaceRawdata(call, result);
        } else if (call.method.equals("getWxpayaceCode")) {
            getWxpayfaceCode(call, result);
        } else if (call.method.equals("getWxpayfaceUserInfo")) {
            getWxpayfaceUserInfo(call, result);
        } else if (call.method.equals("updateWxpayfacePayResult")) {
            updateWxpayfacePayResult(call, result);
        } else if (call.method.equals("stopWxpayface")) {
            stopWxpayface(call, result);
        } else if (call.method.equals("releaseWxpayface")) {
            releaseWxpayface(call, result);
        } else if (call.method.equals("reportOrder")) {
            reportOrder(call, result);
        } else if (call.method.equals("reportInfo")) {
            reportInfo(call, result);
        } else if (call.method.equals("updateWxpayfaceBannerState")) {
            updateWxpayfaceBannerState(call, result);
        } else if (call.method.equals("reportPaycode")) {
            reportPaycode(call, result);
        } else if (call.method.equals("startCodeScanner")) {
            startCodeScanner(call, result);
        } else if (call.method.equals("stopCodeScanner")) {
            stopCodeScanner(call, result);
        } else {
            result.notImplemented();
        }

    }

    /// 初始化微信支付SDK
    public void initWxpayface(MethodCall call, final Result result) {
        WxPayFace.getInstance().initWxpayface(thisContext, new IWxPayFaceCallbackAIDL.Stub() {
            @Override
            public void response(Map map) throws RemoteException {
                result.success(map);
            }
        });
    }

    /// 获取rawdata
    public void getWxpayfaceRawdata(MethodCall call, final Result result) {
        WxPayFace.getInstance().getWxpayfaceRawdata(new IWxPayFaceCallbackAIDL.Stub() {
            @Override
            public void response(Map map) throws RemoteException {
                result.success(map);
            }
        });
    }

    /// 获取微信刷脸付用户信息
    public void getWxpayfaceUserInfo(MethodCall call, final Result result) {
        Map<String, String> ben = new HashMap();
        ben.put("appid", call.<String>argument("appid"));
        ben.put("mch_id", call.<String>argument("mch_id"));
        String subAppId = call.<String>argument("sub_appid");
        if (subAppId != null) {
            ben.put("sub_appid", subAppId);
        }
        String subMchId = call.<String>argument("sub_mch_id");
        if (subMchId != null) {
            ben.put("sub_mch_id", subMchId);
        }

        ben.put("store_id", call.<String>argument("store_id"));

        ben.put("face_authtype", call.<String>argument("face_authtype"));
        ben.put("authinfo", call.<String>argument("authinfo"));

        String authMode = call.<String>argument("auth_mode");
        if (authMode != null) {
            ben.put("auth_mode", authMode);
        }


        String askRetPage = call.<String>argument("ask_ret_page");
        if (askRetPage != null) {
            ben.put("ask_ret_page", askRetPage);
        }

        String faceCodeType = call.<String>argument("face_code_type");
        if (faceCodeType != null) {
            ben.put("face_code_type", faceCodeType);
        }

        String ignoreUpdatePayResult = call.<String>argument("ignore_update_pay_result");
        if (ignoreUpdatePayResult != null) {
            ben.put("ignore_update_pay_result", ignoreUpdatePayResult);
        }

        WxPayFace.getInstance().getWxpayfaceUserInfo(ben, new IWxPayFaceCallbackAIDL.Stub() {
            @Override
            public void response(Map map) throws RemoteException {
                result.success(map);
            }
        });
    }

    /// 获取微信刷脸付的face_code
    public void getWxpayfaceCode(MethodCall call, final Result result) {
        Map<String, String> ben = new HashMap();
        ben.put("appid", call.<String>argument("appid"));
        ben.put("mch_id", call.<String>argument("mch_id"));
        String subAppId = call.<String>argument("sub_appid");
        if (subAppId != null) {
            ben.put("sub_appid", subAppId);
        }
        String subMchId = call.<String>argument("sub_mch_id");
        if (subMchId != null) {
            ben.put("sub_mch_id", subMchId);
        }

        ben.put("store_id", call.<String>argument("store_id"));
        String telephone = call.<String>argument("telephone");
        if (telephone != null) {
            ben.put("telephone", telephone);
        }
        ben.put("out_trade_no", call.<String>argument("out_trade_no"));
        ben.put("total_fee", call.<String>argument("total_fee"));
        ben.put("face_authtype", call.<String>argument("face_authtype"));
        ben.put("authinfo", call.<String>argument("authinfo"));
        ben.put("ask_face_permit", call.<String>argument("ask_face_permit"));


        String askRetPage = call.<String>argument("ask_ret_page");
        if (askRetPage != null) {
            ben.put("ask_ret_page", askRetPage);
        }

        String faceCodeType = call.<String>argument("face_code_type");
        if (faceCodeType != null) {
            ben.put("face_code_type", faceCodeType);
        }

        String ignoreUpdatePayResult = call.<String>argument("ignore_update_pay_result");
        if (ignoreUpdatePayResult != null) {
            ben.put("ignore_update_pay_result", ignoreUpdatePayResult);
        }
        WxPayFace.getInstance().getWxpayfaceCode(ben, new IWxPayFaceCallbackAIDL.Stub() {
            @Override
            public void response(Map map) throws RemoteException {
                result.success(map);
            }
        });
    }


    public void updateWxpayfacePayResult(MethodCall call, final Result result) {
        Map<String, String> ben = new HashMap();
        ben.put("appid", call.<String>argument("appId"));
        ben.put("mch_id", call.<String>argument("mchId"));
        ben.put("store_id", call.<String>argument("storeId"));
        ben.put("authinfo", call.<String>argument("authInfo"));
        ben.put("payresult", call.<String>argument("payResult"));
        WxPayFace.getInstance().updateWxpayfacePayResult(ben, new IWxPayFaceCallbackAIDL.Stub() {
            @Override
            public void response(Map map) throws RemoteException {
                result.success(map);
            }
        });
    }

    public void stopWxpayface(MethodCall call, final Result result) {
        Map<String, String> ben = new HashMap();
        ben.put("authinfo", call.<String>argument("authInfo"));
        WxPayFace.getInstance().stopWxpayface(ben, new IWxPayFaceCallbackAIDL.Stub() {
            @Override
            public void response(Map map) throws RemoteException {
                result.success(map);
            }
        });
    }


    public void reportOrder(MethodCall call, final Result result) {
        Map<String, String> ben = new HashMap();
        ben.put("mch_id", call.<String>argument("mchId"));
        String subMchId = call.<String>argument("subMchId");
        if (subMchId != null) {
            ben.put("sub_mch_id", subMchId);
        }
        ben.put("out_trade_no", call.<String>argument("outTradeNo"));

        WxPayFace.getInstance().reportOrder(ben, new IWxPayFaceCallbackAIDL.Stub() {
            @Override
            public void response(Map map) throws RemoteException {
                result.success(map);
            }
        });
    }


    public void reportInfo(MethodCall call, final Result result) {
        Map<String, String> ben = new HashMap();
        ben.put("item", call.<String>argument("item"));
        ben.put("item_value", call.<String>argument("itemValue"));
        WxPayFace.getInstance().reportInfo(ben, new IWxPayFaceCallbackAIDL.Stub() {
            @Override
            public void response(Map map) throws RemoteException {
                result.success(map);
            }
        });
    }

    public void reportPaycode(MethodCall call, final Result result) {
        Map<String, String> ben = new HashMap();
        ben.put("auth_code", call.<String>argument("auth_code"));
        WxPayFace.getInstance().reportPaycode(ben, new IWxPayfaceCallback() {
            @Override
            public void response(Map map) throws RemoteException {
                result.success(map);
            }
        });
    }

    public void updateWxpayfaceBannerState(MethodCall call, final Result result) {
        Map<String, String> map = new HashMap();
        map.put("banner_state", call.<String>argument("bannerState"));
        WxPayFace.getInstance().updateWxpayfaceBannerState(map, new IWxPayfaceCallback() {
            @Override
            public void response(Map info) throws RemoteException {
                result.success(info);
            }
        });
    }

    public void startCodeScanner(MethodCall call, final Result result) {
        WxPayFace.getInstance().startCodeScanner(new IWxPayfaceCallback() {
            @Override
            public void response(Map info) throws RemoteException {
                result.success(info);
            }
        });
    }

    public void stopCodeScanner(MethodCall call, final Result result) {
        WxPayFace.getInstance().stopCodeScanner();
        result.success(null);
    }

    public void releaseWxpayface(MethodCall call, final Result result) {
        WxPayFace.getInstance().releaseWxpayface(thisContext);
        result.success(null);
    }
}
