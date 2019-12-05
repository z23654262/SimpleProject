package com.bookstore.alipay;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016101600699391";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCzUfuSVx5D1Ydlmt4PwDw1ctVax8I2fuOjjsMLL0+0S1HqRpuvKSWqlPSoUIyGYrrQB4BuXr3M6PbUe6MdC1UCncW4+uhh5UQTCfwaDNi83/XiyrVrDwX+T6V4W9AfstmulrhsADsfoe31o/1aqrzZXIFb551S0MXTX4CSme/Uak3AqFSNQVH02jg6oYGG2zNaS8zn0OrNJznf6bqcyaQXcNswwdKYzOnYe/UV4CgDx4bvPyb381dPWYgYFcasOBnCxwX0HYkO+UnyYTT1BwUnzLpl+gLSbX8M84PNmQ7LZ2QgKiIvibdDRpOUwA9rhFRr5luWUwYacmqBcZ8qSHQrAgMBAAECggEAY8TWUmp0JUu1ZFuQ93R+S0KT4ElKDiX1I3f3ns546xgJAG6+ies70LfFk6wVM2PVCo9R7pZ5xXtMcZZEf5Fhf+4mJzA6gNUdVfZ1NE03fYah+MfNvj4CmKbZqqhymGBa6t9ixnwuaQAgNE5EVOCv58OnGWo5Ru1vU5ZMI8TQAf8ejBCBeyObCzLFucCqu8UNw3l3Oj5iPxdZaEZUaTnm9nxI/ILL9UlHhpQKzRB0fQoltAL6aA4ZQzzfpPSNAltSLZfXWMfkqDD0oX+zfL2dgkek9x8oxjV+42GXTK4czASw189vi6yUQrNqLwmnR2weMYSRg6yF2xWqJpfIbHFZgQKBgQD13INf1RtUbM4pUhL/R0o6R2vwyFXWdTFAfVqMiIQrO40ujzPRCQgSc+cSV8xR9CBvXg4SKoRF8JkSFhJwOKjJjWAheIGTnugBpnbj79/ueyuDOE0wYx+DeJwuYcURBmCiD0Dr2I2n3igKf9mKsMoZUtL9Ohr/3UySSXptq5DrawKBgQC6twOhnc5ByDuRkbMMeJdChZQ0pLl76xlSChsbaCzJHHVC/YPO/0H+6gBNMPxBozuZIM/P25r3fv2Mxw7RJdgWW5EjHkI+Yil4af159JU1U/StYexRqdXT63O6ZIYHX4l+X/aiMVonUB2C4Qu9mPRdq8b7XXJ9cObRLMgq9P+KQQKBgQCvLu2pFibAFDsdtC53GOvp9MQTsBuBkMWERw2C/y71wxwI5d6s/nty8oTeTBL4/jMyR1lNVmAjmZjoCzQeJDEYVBUAJGZnsh1sN5mVNnFf8wGBIVfWt3pX6lOWtPF+/QVT0/yVUBs3VpM/T/PI38lRG/PcnU9pqtyJi7Ohe1LqewKBgE6BzUETPTpjmshmXsaLne4WhG5uJJ96Brd8EFHBx7L4CEYWmmla4sDwWxgZ1Lc0j0afiUF4sPwHpUygFhbStr0P20LM4kWguJcs2auBr4swtdyBJABiTMpCYfKpecF35jQA3Y7s+V82THJPdcROn9ES/SOL8yvTYPnqvm9xfFEBAoGBAKe2Pmk66MlsPbSughAMm+q88LV4OtT6lpO+UQSv7smqsn0wXHeL7osNkXqG+dzfUSDnOL7vmjpg30PG1VtRU9+OL+sgn523Zj1M/fWQHE4yWDulCkr/fYwFIqXKrUj4FDH3oJWQR65hzeBPTEPhd7jWu/oFRmAiIDNrtcbFcUpn";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA6oKP8TNh4fYUujke/dLN8BkHMcFLpayFDBEG1OYG1mgKgI8kH81ZRKepXH5MRJY2dKi/PadaBxAHKt3GgWKzW382i74NoVyV5RUgBxcB8KEIvSRVm7fFHB7fumqVXhQECzygS9cWZnFl/nh6O7hs2PFlmjdBV+niNTc6Tr+TGzGVaD/5Z/dDaYpsxTCKrjlHL1kP4z9Y4Za2Ml/imJr/5j73R4cN2KdQ8IW8u3hZTBNSy1007UbaO6d77FyX6p7ungd1X404tKv+6t+TDaas97N98IVo10XQZQmASZvHkiVnTpTLvfOqLaobfo4aqtvWL6UGpHZ9yB+03u9KLWRIsQIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080/bookstore_bs";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/bookstore_bs";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

