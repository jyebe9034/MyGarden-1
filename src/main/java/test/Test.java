package test;

import java.util.Calendar;

public class Test {
	public void calendar() {
		//Calendar 객체 생성(추상클래스 이기 때문에 getInstance로 객체를 생성한다.)
		Calendar cal = Calendar.getInstance();

		// 1~12 월
		for(int month=0; month<12; month++) {
			System.out.println(cal.get(Calendar.YEAR));
			// 월 설정
			cal.set(Calendar.MONTH, month);
			System.out.println(cal.get(Calendar.MONTH)+1+"월");

			// 월의 마지막일을 변수 maxDay에 저장
			int maxDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
			cal.set(Calendar.DATE,1);

			// 1일부터 마지막 일 까지
			for(int i=1; i<=maxDay; i++) {
				cal.set(Calendar.DATE, i);

				//주 점프를 하기 위해 오늘이 몇번째 주인지 저장
//				int wom1 = cal.get(Calendar.WEEK_OF_MONTH);

				//day 출력
				System.out.print(cal.get(Calendar.DATE) + " ");
				//오늘과 내일이 몇번째 주인지 비교하기 위해서 다음날을 set
				cal.set(Calendar.DATE, i + 1);
//				int wom2 = cal.get(Calendar.WEEK_OF_MONTH);
			}
			System.out.println();
		}

	}

		public static void main(String[] args) {
			Test t = new Test();
			t.calendar();
		}

}
