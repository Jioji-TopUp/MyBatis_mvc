package com.scbd.common.utl;

import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
 /*
  * 
  * 
  * 屠宰场客户端报文加解密使用（不支持中文）
  * 
  * 
  * 
  */


public class AES {
	
	
	/** 
     * 密钥 
     */  
    public static final String KEY = "A8LV1F4N18SME";  
    
   
  
    private final static String DES = "DES";  
  
    /** 
     * 加密 
     *  
     * @param src 
     *            明文(字节) 
     * @param key 
     *            密钥，长度必须是8的�?�?
     * @return 密文(字节) 
     * @throws Exception 
     */  
    public static byte[] encrypt(byte[] src, byte[] key) throws Exception {  
        // DES算法要求有一个可信任的随机数�? 
        SecureRandom sr = new SecureRandom();  
        // 从原始密匙数据创建DESKeySpec对象  
        DESKeySpec dks = new DESKeySpec(key);  
        // 创建�?��密匙工厂，然后用它把DESKeySpec转换�? 
        // �?��SecretKey对象  
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(DES);  
        SecretKey securekey = keyFactory.generateSecret(dks);  
        // Cipher对象实际完成加密操作  
        Cipher cipher = Cipher.getInstance(DES);  
        // 用密匙初始化Cipher对象  
        cipher.init(Cipher.ENCRYPT_MODE, securekey, sr);  
        // 现在，获取数据并加密  
        // 正式执行加密操作  
        return cipher.doFinal(src);  
    }  
  
    /** 
     * 解密 
     *  
     * @param src 
     *            密文(字节) 
     * @param key 
     *            密钥，长度必须是8的�?�?
     * @return 明文(字节) 
     * @throws Exception 
     */  
    public static byte[] decrypt(byte[] src, byte[] key) throws Exception {  
        // DES算法要求有一个可信任的随机数�? 
        SecureRandom sr = new SecureRandom();  
        // 从原始密匙数据创建一个DESKeySpec对象  
        DESKeySpec dks = new DESKeySpec(key);  
        // 创建�?��密匙工厂，然后用它把DESKeySpec对象转换�? 
        // �?��SecretKey对象  
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(DES);  
        SecretKey securekey = keyFactory.generateSecret(dks);  
        // Cipher对象实际完成解密操作  
        Cipher cipher = Cipher.getInstance(DES);  
        // 用密匙初始化Cipher对象  
        cipher.init(Cipher.DECRYPT_MODE, securekey, sr);  
        // 现在，获取数据并解密  
        // 正式执行解密操作  
        return cipher.doFinal(src);  
    }  
  
    /** 
     * 加密 
     *  
     * @param src 
     *            明文(字节) 
     * @return 密文(字节) 
     * @throws Exception 
     */  
    public static byte[] encrypt(byte[] src) throws Exception {  
        return encrypt(src, KEY.getBytes());  
    }  
  
    /** 
     * 解密 
     *  
     * @param src 
     *            密文(字节) 
     * @return 明文(字节) 
     * @throws Exception 
     */  
    public static byte[] decrypt(byte[] src) throws Exception {  
        return decrypt(src, KEY.getBytes());  
    }  
  
    /** 
     * 加密 
     *  
     * @param src 
     *            明文(字符�? 
     * @return 密文(16进制字符�? 
     * @throws Exception 
     */  
    public final static String encrypt(String src) {  
        try {  
            return byte2hex(encrypt(src.getBytes(), KEY.getBytes()));  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        return null;  
    }  
    
    /** 
     * 指定KEY加密 
     *  
     * @param src 
     *            明文(字符�? 
     * @return 密文(16进制字符�? 
     * @throws Exception 
     */  
    public final static String encrypt(String src,String saltKey) {  
        try {  
            return byte2hex(encrypt(src.getBytes(), saltKey.getBytes()));  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        return null;  
    } 
    
  
    /** 
     * 指定KEY解密 
     *  
     * @param src 
     *            密文(字符�? 
     * @return 明文(字符�? 
     * @throws Exception 
     */  
    public final static String decrypt(String src,String saltKey) {  
        try {  
            return new String(decrypt(hex2byte(src.getBytes()), saltKey.getBytes()));  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        return null;  
    }  
    
    /** 
     * 解密 
     *  
     * @param src 
     *            密文(字符�? 
     * @return 明文(字符�? 
     * @throws Exception 
     */  
    public final static String decrypt(String src) {  
        try {  
        
        	String str = new String(decrypt(hex2byte(src.getBytes()), KEY.getBytes())); 
        	
            return  str;
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        return null;  
    }  
    
  
    /** 
     * 加密 
     *  
     * @param src 
     *            明文(字节) 
     * @return 密文(16进制字符�? 
     * @throws Exception 
     */  
    public static String encryptToString(byte[] src) throws Exception {  
        return encrypt(new String(src));  
    }  
  
    /** 
     * 解密 
     *  
     * @param src 
     *            密文(字节) 
     * @return 明文(字符�? 
     * @throws Exception 
     */  
    public static String decryptToString(byte[] src) throws Exception {  
        return decrypt(new String(src));  
    }  
  
    public static String byte2hex(byte[] b) {  
        String hs = "";  
        String stmp = "";  
        for (int n = 0; n < b.length; n++) {  
            stmp = (java.lang.Integer.toHexString(b[n] & 0XFF));  
            if (stmp.length() == 1)  
                hs = hs + "0" + stmp;  
            else  
                hs = hs + stmp;  
        }  
        return hs.toUpperCase();  
    }  
  
    public static byte[] hex2byte(byte[] b) {  
        if ((b.length % 2) != 0)  
            throw new IllegalArgumentException("长度不是偶数");  
        byte[] b2 = new byte[b.length / 2];  
        for (int n = 0; n < b.length; n += 2) {  
            String item = new String(b, n, 2);  
            b2[n / 2] = (byte) Integer.parseInt(item, 16);  
        }  
        return b2;  
    }  
  
    public static void main(String[] args) {
        try {  
        	//String src = "1&222222";
        	String src = "1&64514bf6-027d-46c4-8532-b697d34cedd2&test";
            //String src = "1&222222&shanghai&point(120 30)";
           
            String crypto = AES.encrypt(src);  
            System.out.println("密文[" + src + "]:" + crypto);  
            //解密
            
            System.out.println("1B1E608D494EA132794D7BF07A7F4B72".length());
            
            System.out.println("解密:"
                    + AES.decrypt("358B6EE3E41ED2EF0E0118F95D1ECE9E4A5AEF911DBEDCBF"));  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    	
    }  

}
