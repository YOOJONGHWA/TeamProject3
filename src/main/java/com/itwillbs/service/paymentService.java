package com.itwillbs.service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import lombok.Data;
import org.springframework.beans.factory.annotation.Value;

import javax.net.ssl.HttpsURLConnection;
import java.io.*;
import java.net.URL;
import java.util.Map;

public class paymentService {
		
	@Value("${imp_key}")
	private String impKey;

	@Value("${imp_secret}")
	private String impSecret;
	
	@Data
	private class Response {
		private PaymentInfo response;
	}
	
	@Data
	private class PaymentInfo {
		private int amount;
	}
	
	// 결제api 토큰 발급
	public String getToken(String impKey, String impSecret) throws IOException {

		HttpsURLConnection conn = null;

		URL url = new URL("https://api.iamport.kr/payment/getToken");

		conn = (HttpsURLConnection) url.openConnection();

		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setDoOutput(true);
		
		JsonObject json = new JsonObject();

		json.addProperty("imp_key", impKey);
		json.addProperty("imp_secret", impSecret);
		
		// System.out.println();과 유사, 처리속도가 빠름
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		
		bw.write(json.toString());
		bw.flush();
		bw.close();
		
		// Scanner와 유사, 처리속도가 빠름
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
		
		Gson gson = new Gson();

		String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();
		System.out.println(response);

		String token = gson.fromJson(response, Map.class).get("access_token").toString();

		br.close();
		conn.disconnect();

		return token;
	}//

}
