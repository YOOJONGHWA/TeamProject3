package com.itwillbs.api;

import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Base64;

@Service
public class IamportApi { // getToken 토큰이 있어야 하는 방식
	private static final String API_KEY = "6872874776268842";
    private static final String API_SECRET = "3gady1pSHIpG3BrYi2ZJl6XONosiYXI2Ct1v5UhBRHAfhXXy3NiLFaJU6YQjaeepDG2sl1TCizMxMry9";

    public static void main(String[] args) {
    	
        try {
            // request URL 준비
            String apiUrl = "https://api.iamport.kr/payments/payment"; 	// API endpoint
            String impUid = "your_imp_uid";	// 
            apiUrl += "?imp_uid=" + impUid;

            // HTTP connection
            URL url = new URL(apiUrl);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization", getAuthorizationHeader(API_KEY, API_SECRET));

            // request 보내기, response 들이기
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            // 응답확인
            System.out.println(response.toString());
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    // Authorization header에 using the API key and secret
    private static String getAuthorizationHeader(String apiKey, String apiSecret) {
        String encoded = Base64.getEncoder().encodeToString((apiKey + ":" + apiSecret).getBytes());
        return "Basic " + encoded;
    }

}

