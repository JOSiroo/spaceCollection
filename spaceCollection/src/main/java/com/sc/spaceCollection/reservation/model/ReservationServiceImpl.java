package com.sc.spaceCollection.reservation.model;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.sc.spaceCollection.spaceDetail.model.SpaceDetailDAO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReservationServiceImpl implements ReservationService{
	private final static Logger logger = LoggerFactory.getLogger(ReservationServiceImpl.class);
	private final ReservationDAO reservationDao;
	private final SpaceDetailDAO sdDao;
	
	
	@Override
	public int insertReservation(ReservationVO vo) {
		return reservationDao.insertReservation(vo);
	}

	@Override
	public Object selectReservationByDayAndNum(int sdNum, String reserveStartDay) {
		ReservationVO vo = new ReservationVO();
		vo.setSdNum(sdNum);
		vo.setReserveStartDay(reserveStartDay);
		vo = reservationDao.selectReservationByDayAndNum(vo);
		
		if(vo != null) {
			return vo;
		}else {
			return "noData";
		}
	}

	@Override
	public Map<String, Object> showReservation(int reservationNum, String userId) {
		ReservationVO vo = new ReservationVO();
		vo.setReservationNum(reservationNum);
		vo.setUserId(userId);
		logger.info("vo = {}", vo);
		return reservationDao.showReservation(vo);
	}

	@Override
	public List<Map<String, Object>> reservationList(String userId) {
		return reservationDao.reservationList(userId);
	}
	
	
	public void refundPayment(String tid, int cancelAmount,int cancelTaxFreeAmount) {
		   try {
	            String url = "https://kapi.kakao.com/v1/payment/cancel"; // 환불 요청 API 엔드포인트
	            URL apiUrl = new URL(url);
	            HttpURLConnection connection = (HttpURLConnection) apiUrl.openConnection();

	            // Request 설정
	            connection.setRequestMethod("POST");
	            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
	            connection.setRequestProperty("Authorization", "KakaoAK " + "6afc3a38f30f57120f210311ccabf472");
	            connection.setDoOutput(true);

	            // Request Body 생성
	            String parameters = "cid=TC0ONETIME"
	                    + "&tid=" + tid
	                    + "&cancel_amount=" + cancelAmount
	                    + "&cancel_tax_free_amount=" + cancelTaxFreeAmount;
	            
	            byte[] postData = parameters.getBytes(StandardCharsets.UTF_8);

	            // 데이터 전송
	            try (DataOutputStream wr = new DataOutputStream(connection.getOutputStream())) {
	                wr.write(postData);
	            }

	            // 응답 처리
	            int responseCode = connection.getResponseCode();
	            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
	            String inputLine;
	            StringBuilder response = new StringBuilder();
	            while ((inputLine = in.readLine()) != null) {
	                response.append(inputLine);
	            }
	            in.close();

	            // response를 처리하는 로직 추가
	            // 예: 성공적으로 환불되었는지 확인하거나 에러 처리
	            System.out.println("Response Code: " + responseCode);
	            System.out.println("Response Data: " + response.toString());
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}

	@Override
	public int canceledReservation(String reservationUid) {
		return reservationDao.canceledReservation(reservationUid);
	}

	@Override
	public Map<String, Object> reservationReview(int reservationNum) {
		return reservationDao.reservationReview(reservationNum);
	}
	
}
