-- 5강
-- 유틸리티는 굉장히 중요한 내용은 아니지만 사용가능
-- forward reverse 기능을 통해서 그림을 모델로 내보낼수도, 반대로 모델을 그림으로 그릴수도
-- local host는 자기자신 , but 그 화면에서 오른쪽 버튼을 누르고 add connection을 통해서 수정가능합니다.

-- SSL 탭 보안접속을 위한 창, 많이 쓰지는 않음
-- ADVANCED 통해서 시간 등 세부사항 조정도 가능

-- workbench 구성 요소
-- 스키마탭 (관련 테이블 등을 확인 가능합니다 !)

memberdbCREATE TABLE `memberdb` (
  `memberid` char(8) NOT NULL,
  `membername` char(5) NOT NULL,
  `memberAddress` char(23) DEFAULT NULL,
  PRIMARY KEY (`memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- member tbl 클릵해서 마우스 우클릭, send to sql 누르고 crreate 어쩌구 누르면 이렇게 생성가능
-- 디폴트 이후는 생성가능
-- 같은 방법으로 인서트문도 생성가능

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_memberdb` AS select `memberdb`.`memberid` AS `memberid`,`memberdb`.`memberAddress` AS `memberaddress` from `memberdb`;

-- view 도 생성 가능한 모습 !

-- instance 탭
-- 현재 가동되는 것에 대한 관리가 가능합니다.

-- 성능 탭 

-- ADMINISTRAION 탭  (서버 변수 확인, 데이터 내보내기 가져오기, 사용자의 생성 삭제 등
-- 서버상태, 클라이언트 내용등을 확인 가능하네요 ! , 관리도 가능

-- 쿼리창 사용 (워크벤치 상단의 + 사용, 스키마탭, 파일에서 뉴쿼리탭)
-- 마우스 드래그 방식을 통해서 사용도 가능
-- 대소문자를 구분을 하지 않지만 그래도 대문자로 일괄변결할 수 있어
-- edit -> 포맷 -> lower/ upper case


USE employees ; 
SELECT * FROM titles ;

-- 요거 다 보고 싶으면 limit to 100 rows 요거 위에 조정해
-- EDIT 요기서 폰트나 글자크기도 수정가능


USE employees ; 
SELECT * FROM employees ;

-- 이렇게 해서 나오는 표에서 직접 mary를 검색하고 저장 버튼을 통해 저장도 가능합니다 !!

-- 리눅스 사용시 접급방식, 그동안은 윈도우상에 워크벤치 깔아서 가용하고 서버와 클라이언트가 같은 것 ! 
-- 그동안은 방화벽의 영향을 받지 않았는데 실무 환경을 서버를 따로두고 자기 컴퓨터에는 클라이언트 !! 
-- 즉 해당하는 포트를 열어줘야지 해결가능합니다 

-- 이 부분 다운 및 접속은 강의만 시청하겠습니다.
-- 가상머신깔구 + 를 통해서 추가하고 리눅스 환결으로 접근가능합니다 

-- 사용자 관리 , 그동안은 root 사용자로 들어갔는데 이는 모든 권한을 가지고 있어 현업에서는 사용하지 않음
-- 그래서 현업에서는 동일한 권한이 아니라 다른 것을 ! 

-- administration 들어가서 user amd privilige 여기서 add 통해서 사용자 추가가능합니다
-- 만들어보자 !! 팀장님은 DBA 를통해 모든 권한을
-- 사장님은 select 를 통해서 읽기 권한만 주기
-- 직원은 select pri 어쩌구 통해 직접 선택을 해줘야해요

-- 그리고 각각의 방법으로 로그인 하면 확인 가능합니다 !! 