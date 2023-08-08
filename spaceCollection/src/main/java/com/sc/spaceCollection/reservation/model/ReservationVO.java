package com.sc.spaceCollection.reservation.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReservationVO {
	private int reservationNum;
	private int userNum;
	private int sdNum;
	private Timestamp reservationStartDay;
	private Timestamp reservationStartHour;
	private Timestamp reservationFinishDay;
	private Timestamp reservationFinishHour;
	private int reservePrice;
	private Timestamp reservationPayDay;
	private int paymentNum;
}
