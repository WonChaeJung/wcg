package com.ytcares.common;

public final class YTCaresConstants {
	/**
	 * YTCares일반상수
	 * @author YTCares
	 */
	public static final class Common {
		public static final String ytcares_req_flag = "com.ytcares.invalid.request";
		/**
		 * 서비스수행결과(예외포함) 메세지 오브젝트 바인드 키(맵오브젝트)
		 * com.ytcares.message.obj
		 */
		public static final String ytcares_msg_obj 	= "com.ytcares.message.obj";
		/**
		 * 서비스수행결과(예외포함) 메세지키
		 * com.ytcares.message
		 */
		public static final String ytcares_msg 		= "com.ytcares.message";
		/**
		 * 서비스수행시의 예외오브젝트 키
		 * com.ytcares.throwable
		 */
		public static final String ytcares_throwable= "com.ytcares.throwable";
		/**
		 * 관리자아이디
		 */
		public static final String admin_id			= "admin";
		/**
		 * 로그인시 세션영역에 바인딩되는 유저빈의 키값
		 * com.ytcares.user.bean
		 */
		public static final String session_user_bean= "com.ytcares.user.bean";
	}
	
	/**
	 * YTCares 유저로그 액세스타입
	 * @author YTCares
	 */
	public static final class AcssType {
		/** 로그인 01 */
		public static final String login 			= "01";
		/** 로그아웃 02 */
		public static final String logout 			= "02";
		/** 중복로그인에 의한 강제 로그아웃 03 */
		public static final String logout_by_dup	= "03";
		/** 세션타임아웃  04 */
		public static final String session_timeout	= "04";
		/** 동영상스트리밍 05 */
		public static final String streaming		= "05";
		/** 상품조회 06 */
		public static final String inq_csmt			= "06";
	}
	/**
	 * YTCares 서버메세지 타입
	 * @author YTCares
	 */
	public static final class MsgType {
		/** 메세지 타입 alert */
		public static final String alert			= "alert";
		/** 메세지 타입 confirm */
		public static final String confirm			= "confirm";
		/** 메세지 타입 prompt */
		public static final String prompt			= "prompt";
	}
	/**
	 * YTCares 회원등급
	 * @author YTCares
	 */
	public static final class Grade {
		/** 회원등급 관리자 1 */
		public static final String admin			= "1";
		/** 회원등급 총판 2 */
		public static final String sup_agency		= "2";
		/** 회원등급 부총판 3 */
		public static final String sub_agency		= "3";
		/** 회원등급 가맹점 4 */
		public static final String agency			= "4";
		/** 회원등급 정회원 8 */
		public static final String member			= "8";
		/** 회원등급 일반회원 9 */
		public static final String user				= "9";
	}
	/**
	 * 권한체크용 서비스메소드 prefix
	 * @author YTCares
	 */
	public static final class AuthPrefix {
		/** 관리자권한  서비스메소드명 admin */
		public static final String admin			= "admin";
		/** 총판, 부총판권한  서비스메소드명 member */
		public static final String member			= "member";
		/** 로그인필수  서비스메소드명 user */
		public static final String user				= "user";
	}
	/**
	 * 조회쿼리 고정파라미터
	 * @author YTCares
	 */
	public static final class Sql {
		/** 페이지번호 pageNum */
		public static final String pageNum			= "pageNum";
		/** 페이지사이즈 pageSize */
		public static final String pageSize			= "pageSize";
		/** 시작행번호 start */
		public static final String start			= "start";
		/** 끝행번호 end */
		public static final String end				= "end";
	}
	/**
	 * 미용상품종류
	 * @author YTCares
	 */
	public static final class CsmtKind {
		/** BOOK */
		public static final String Book				= "BK";
		/** CHEMICAL */
		public static final String Chemical 		= "CH";
		/** GOODS */
		public static final String Goods			= "GD";
	}
	
	/**
	 * 게시판카테고리
	 * @author YTCares
	 */
	public static final class BCategory {
		/** 공지사항, FAQ등 공통게시판 01 */
		public static final String site				= "01";
		/** E-Learning 온라인강좌 02 */
		public static final String elearning		= "02";
		/** 회사소개, 교수소개, 커리큘럼, 찾아오시는 길 03 */
		public static final String introduce		= "03";
		
		/**
		 * 사이트공통 게시판 서브카테고리 
		 */
		public static final class Site {
			/** 공지사항 01 */
			public static final String notice		= "01";
			/** FAQ 02 */
			public static final String faq			= "02";
		}
		/**
		 * 회사소개, 교수소개, 커리큘럼, 찾아오시는 길 서브카테고리
		 */
		public static final class Intro {
			/** 인사말 01 */
			public static final String message		= "01";
			/** 교수소개 02 */
			public static final String professor	= "02";
			/** 커리큘럼 03 */
			public static final String curriculum	= "03";
			/** 찾아오시는 길 04 */
			public static final String way			= "04";
		}
		
		/**
		 * 온라인강좌 서브카테고리
		 */
		public static final class Eleanrning {
			/** 커트 01 */
			public static final String cut			= "01";
			/** 퍼머 02 */
			public static final String perm			= "02";
			/** 드라이 03 */
			public static final String dry			= "03";
		}
	}
	
	/**
	 * 구매상태코드
	 */
	public static final class PrchsStat {
		/** 구매신청 1 */
		public static final String prchs_req		= "1";
		/** 입금대기 2 */
		public static final String standby_pay		= "2";
		/** 배송중 3 */
		public static final String under_deliver	= "3";
		/** 배송완료 4 */
		public static final String finished_deliver	= "4";
		/** 구매완료 5 */
		public static final String finished_prchs	= "5";
		/** 구매취소 9 */
		public static final String cancel_prchs		= "9";
	}
}
