<div align="center">
<h1>공간 대여 플랫폼 SpaceCollection</h1>
</div>
 
<h2>📅 개발 기간 및 작업 관리</h2>

<h4>💡 기획 의도</h4>
- 공간대여를 중개하는 온라인 플랫폼을 구축 사용자, 공간을 제공자들을 연결하여 쉽고 편리하게 공간을 대여할 수 있는 시스템 
사용자들이 다양한 목적에 맞는 공간을 쉽게 찾고 예약하여, 공간 제공자들이 자신의 공간을 효율적으로 운영하고 수익을 창출 실현

## ✍️ 프로젝트 기간
<div align="center"><img src="https://github.com/JOSiroo/spaceCollection/assets/135147602/200ef23d-1cb4-4119-be82-133329a5884b"></div>
<br>

## 📚 DB 설계
<div align="center"><img src="https://github.com/JOSiroo/spaceCollection/assets/135147602/a83726cf-ba3e-40af-a8ae-a7090b5ad229"></div>
<br>


## 🖥️ 개발환경
<div align="center"><img src="https://github.com/JOSiroo/spaceCollection/assets/135147602/a1ab0069-ad32-4c74-b65b-a9c3a21be505"></div>
<br>

## 🎇 사용된 API  
<div align="center"><img src="https://github.com/JOSiroo/spaceCollection/assets/135147602/32227c50-021d-4309-82d7-a1ce2fdb2a89"></div>
<br>

## 🛠 라이브러리

## 👨‍👩‍👧‍👦 팀원소개 및 업무분담
<div align="center"><img src="https://github.com/JOSiroo/spaceCollection/assets/135147602/c6f08bdb-1cd2-46da-9357-7eeb4f546deb"></div>
<br>

## ✴️ 주요 페이지 소개
    
    1. 사용자
       1-1 메인페이지
       1-2 이용약관
       
    2. 호스트
       2-1 메인페이지
    
    3. 관리자
       3-1 메인페이지
<br>

https://github.com/eunjung15/space_pj3/assets/135147602/5499c4ab-d86a-4fba-b744-4fdd8e3bdbca
<p> 1-1 메인페이지
<p>- 사용자 메인 페이지
<p>- 해당 페이지 이동
<p>- 실시간 위치 날씨 표시
<p>- 최신 등록 공간, 리뷰 9개 출력
<p>- 누적 등록 공간, 예약, 사용자 출력 
<p>- 관리자와 실시간 1:1 채팅

https://github.com/eunjung15/space_pj3/assets/135147602/5c57f0a3-46ce-4a16-a374-d3e976990fe6
<p> 1-2 게시판페이지
<p>- 사용자 게시판 페이지(이벤트, 공지사항, 이용약관 등..)
<p>- 공지사항 게시판 검색 및 페이징
<p>- 이벤트 게시판 댓글 입력, 수정, 삭제

https://github.com/eunjung15/backup_semipj2/assets/135147602/4055f39a-caf1-4ff5-a64f-bcbbd2cabd53
<p> 1-3 쿠폰페이지
<p>- 마이 쿠폰함에서 중복 일련번호 또는 일련번호 형식이 맞지 않을 시 등록 불가
<p>- 쿠폰 룰렛을 이용하여 영문/숫자 조합 12자리 랜덤 쿠폰 발급
<p>- 한 아이디당 1일 쿠폰은 한 번만 발급 가능
<p>- 쿠폰 발급시 자동 저장되어 마이쿠폰함에 조회 가능



<div align="center">
<kbd><img src="https://github.com/JOSiroo/spaceCollection/assets/124752869/099a6692-8b6e-4811-a217-266232eada23" alt="대체 텍스트" style="border: 20px solid black;"></kbd>
</div>

<p> 3. 관리자

![일반로그인](https://github.com/JOSiroo/spaceCollection/assets/137861436/0dcac29f-037c-4039-a47a-bc9de114711e)
<p> 3-1 로그인 구현
<p>- SHA-256을 사용한 비밀번호 암호화를 통한 보안성 강화

![카카오로그인](https://github.com/JOSiroo/spaceCollection/assets/137861436/00594506-2a5f-41d5-9d6b-87d91f8acfe6)
<p> 3-2 카카오 로그인 구현
<p>- 일반 계정을 통해 사전등록된 카카오 계정에 대해 로그인 기능 구현
 
![통계 캡처](https://github.com/JOSiroo/spaceCollection/assets/137861436/2b54dffe-6108-4acf-96f1-71582b299813)
<p> 3-3 메인페이지
<p>- 현재 예약상태, 공간 등록 상태, 주요 뉴스 출력
<p>- 각종 통계 자료를 일별, 월별, 년별로 비교하여 출력

![네이버 뉴스](https://github.com/JOSiroo/spaceCollection/assets/137861436/2295b923-3e97-40be-8948-721c99ecc1cd)
<p> 3-4 네이버 뉴스 api를 사용한 뉴스 검색 기능 구현
<p>- 숙박업 영업에 영향이 큰 감염병을 기본 키워드로 뉴스 검색
<p>- ajax를 활용하여 다른 키워드로 뉴스 검색 가능

![정렬변경](https://github.com/JOSiroo/spaceCollection/assets/137861436/11ffb60f-2b67-4246-a159-b806779a495c)
<p> 3-5 공간별 기준에 따른 정렬변경 기능 구현
<p>- 화면 로딩 시 예약 금액을 기준으로 정렬
<p>- 예약 건수, 이용 인원, 예약 금액 클릭 시 각 기준에 따라 정렬

 ![게시판 생성](https://github.com/JOSiroo/spaceCollection/assets/137861436/a55d606a-dd38-4c94-a277-180505a5d285)
<p> 3-6 동적 게시판 생성, 수정, 비활성 기능 구현
<p>- 게시판의 성격에 따라 각종 기능 사용 여부를 체크하여 특정 기능을 활성 또는 비활성 할 수 있음
<p>- 게시판의 개수가 10개가 초과될 경우, 페이징 기능 구현

![게시물 작성 및 다운로드](https://github.com/JOSiroo/spaceCollection/assets/137861436/ba68f123-79af-4398-9d50-ec81e7980030)
<p> 3-7 게시물 생성, 수정, 삭제 기능 구현
<p>- CKEditer api를 사용하여 텍스트 입력 및 이미지 업로드 기능 구현
<p>- 게시판 설정에 따라 첨부파일 다운로드 가능
<p>- 게시판 설정에 따라 댓글 작성 가능
<p>- 체크 박스를 사용하여 여러 게시물 한번에 삭제 가능
<p>- 게시물 제목, 작성자에 따라 검색 가능

![댓글 ajax](https://github.com/JOSiroo/spaceCollection/assets/137861436/a1daa0b8-0f6d-4c78-8738-715b7222628e)
<p> 3-8 ajax를 활용한 댓글 페이징 구현
<p>- 페이지 로딩 시 초기 5개의 댓글이 보여지며 '댓글 더 보기' 클릭 시 ajax를 활용하여 추가 댓글 로딩
<p>- 더 이상 불러올 댓글이 없을 경우 '댓글 더 보기' 버튼 숨김

![공간카테고리](https://github.com/JOSiroo/spaceCollection/assets/137861436/9baa361d-b4e0-46c8-a2ff-db8e2a8eaa1c)
<p> 3-9 공간카테고리 등록 기능 구현
<p>- 공간카테고리 등록 기능 구현
<p>- 체크 박스를 사용하여 여러 카테고리 활성/비활성 전환 가능
 
![공간승인](https://github.com/JOSiroo/spaceCollection/assets/137861436/7beaf047-cb12-4d61-b9e4-84e8b4a7a6e8)
<p> 3-10 공간 승인 기능 구현
<p>- 호스트가 공간을 등록할 경우, 관리자가 작성 내용을 확인 후 승인 여부 결정
<p>- 공간 승인 여부는 spring-boot-starter-mail 라이브러리를 사용하여 네이버 SMTP 서버를 통해 이메일 발송
<p>- 거절 시 거절 사유 선택 가능
<p>- 체크 박스를 활용하여 일괄 승인/거절 가능
<p>- ajax 방식으로 페이징 처리
<p>- ajax 방식으로 공간승인과 승인 내역을 tab을 통해 전환 가능
<p>- 승인 내역 선택 시, 세부 승인 내역 확인 및 사업자등록증 다운로드 가능
<p>- 공간 번호, 타입, 공간명, 신청인으로 검색 가능

![엑셀저장](https://github.com/JOSiroo/spaceCollection/assets/137861436/20b7d511-78f9-4ae3-a420-40c5263f2ce2)
<p> 3-11 회원 및 공간 관련 엑셀 다운로드 기능 구현
<p>- poi라이브러리를 사용하여 엑셀 다운로드 기능 구현
<p>- 다운로드를 원하는 항목을 선택하여 다운로드 가능

![공간관리](https://github.com/JOSiroo/spaceCollection/assets/137861436/9a4dfa0f-bfe3-4328-b80b-810f2b6c53f3)
<p> 3-12 공간 관리 기능 구현
<p>- 승인된 공간의 정보, 공간 관리자 정보, 세부 공간 정보 등 확인 가능
<p>- ajax 방식으로 페이징 처리

![회원 검색 및 내역 조회](https://github.com/JOSiroo/spaceCollection/assets/137861436/ec63cd00-4898-43d2-ab16-b32dd968f4cd)
<p> 3-13 회원 검색 및 세부 조회 기능 구현
<p>- 아이디 또는 이름으로 검색 가능
<p>- 체크 박스를 사용하여 일괄 탈퇴 가능
<p>- 회원 정보, 예약 내역, 리뷰 내역 등 회원 정보 및 활동 내역 확인 가능
<p>- 각 내역은 ajax 방식으로 페이징 처리
<p>- 각 내역마다 검색 기능 구현
 
![회원 탈퇴](https://github.com/JOSiroo/spaceCollection/assets/137861436/5ce4a544-0adb-4a1a-8830-f9ab0fd1b9d9)
<p> 3-14 회원 탈퇴 기능 구현
<p>- 회원 탈퇴 처리 시, 해당 회원의 아이디로 로그인 불가
<p>- 정보는 사라지지 않으며 회원복구 시 로그인 가능








 













