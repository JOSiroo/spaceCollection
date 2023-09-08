package com.sc.spaceCollection.reservation.model;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
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

import com.sc.spaceCollection.common.SearchVO;
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
		List<ReservationVO> list = reservationDao.selectReservationByDayAndNum(vo);
		
		if(list != null) {
			return list;
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
	public List<Map<String, Object>> reservationList(String userId, int page) {
		
		int startRow = (page-1) * 5 + 1; 
		int endRow = page*5;
		return reservationDao.reservationList(userId, startRow, endRow);
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

	@Override
	public boolean isReviewd(int reservationNum, String userId) {
		int cnt = reservationDao.isReviewd(reservationNum, userId);
		if(cnt > 0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public List<Map<String, Object>> selectReservationAll(SearchVO vo) {
		List<Map<String, Object>> reservationList = reservationDao.selectReservationAll(vo);
		for(Map<String, Object> map : reservationList) {
			map.put("RESERVER_PAY_DAY", (map.get("RESERVER_PAY_DAY")+"").substring(0, 10));
		}
		
		return reservationList;
	}

	@Override
	public int getTotalRecord(SearchVO vo) {
		return reservationDao.getTotalRecord(vo);
	}

	@Override
	public int countReservationList(String userId) {
		return reservationDao.countReservationList(userId);
	}

	@Override
	public int getReservationCntByInterverStandard(String intervalStandard) {
		return reservationDao.getReservationCntByInterverStandard(intervalStandard);
	}
	
	@Override
	public int getReservationCntByInterverStandard2(String intervalStandard) {
		return reservationDao.getReservationCntByInterverStandard2(intervalStandard);
	}

	@Override
	public int getReservationMoneyByInterverStandard(String intervalStandard) {
		return reservationDao.getReservationMoneyByInterverStandard(intervalStandard);
	}

	@Override
	public int getReservationMoneyByInterverStandard2(String intervalStandard) {
		return reservationDao.getReservationMoneyByInterverStandard2(intervalStandard);
	}

	@Override
	public Map<String, Object> getReservationTypeByInterverStandard(String intervalStandard) {
		List<Map<String, Object>> list = reservationDao.getReservationTypeByInterverStandard(intervalStandard);
		
		String standard = "";
		String str = "";
		
		if(intervalStandard == null || intervalStandard.isEmpty()) {
			standard = "Today";
			str = "전일";
		}else if(intervalStandard.equals("month")){
			standard = "This Week";
			str = "전월";
		}else if(intervalStandard.equals("year")) {
			standard = "This Year";
			str = "전년";
		}
		
		DecimalFormat df = new DecimalFormat("#,###");
		
		int total = 0;
		
		for(Map<String, Object> map : list) {
			total += Integer.parseInt(map.get("RESERVATIONCNT")+"");
		}
		
		String totalTrans = df.format(total);
		
		double percent = 0;
		
		for(int i=0; i<list.size(); i++) {
			Map<String, Object> map = list.get(i);
			
			try {
				percent = Math.round(Double.parseDouble(map.get("RESERVATIONCNT")+"")/total*10)/10;
				logger.info("ssss {}, {}",map.get("RESERVATIONCNT"), total);
			} catch (ArithmeticException e) {
				percent = 0;
			}
			
			map.put("percent", percent);
			logger.info("map={}, zzzztotal = {}", map, total);
		}
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("standard", standard);
		map.put("str", str);
		map.put("list", list);
		map.put("total", totalTrans);
		
		logger.info("정상적으로 돌았음");
		return map;
	}
	
	
}
