<%@ page import="org.springframework.util.DigestUtils" %>
<%@ page import="or.apache.commons.httpclient.HttpClientUtil" %>
<%@ page import="com.alibaba.fastjson.JSONObject" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%
    /*
        手机下载 - 360手机助手
        上线时间 - 2020年1月8号
     */
    String pname = "com.kugou.android.ringtone";
    long ts = System.currentTimeMillis();
    int from = 8977660;
    String sign = null;

    String secretKey = "f384a5b52d9b5e29ae7870d4b9a8d34e";
    String str = secretKey + "from" + from + "pname" + pname + "ts" + ts ;
    sign = DigestUtils.md5DigestAsHex(str.getBytes());

    String url = "http://openbox.mobilem.360.cn/SpeedDownload/register?pname=" + pname +
            "&from=" + from +
            "&ts=" + ts +
            "&sign=" + sign;

    Map<String, String> params = new HashMap<>();
    JSONObject method =  null; // HttpClientUtil.postMethod(url, params);
    if (method.getIntValue("code") == 0) {
        String apkUrl = method.getString("data");
        response.sendRedirect(apkUrl);
    }
%>