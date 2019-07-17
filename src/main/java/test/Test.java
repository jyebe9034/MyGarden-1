package test;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Test {
	public void test(){
		ArrayList<Integer> list = new ArrayList();
		String yyyy = null;
		String mm = null;
		int dd = 0;
		//Calendar
		Calendar cal = Calendar.getInstance();

		// 1~12
		for(int month=0; month<12; month++) {
			yyyy = cal.get(Calendar.YEAR)+""; //연도
			cal.set(Calendar.MONTH, month);
			mm = cal.get(Calendar.MONTH)+1+""; //달
			int maxDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
			cal.set(Calendar.DATE,1);
			for(int i=1; i<=maxDay; i++) {
				cal.set(Calendar.DATE, i);
				dd = cal.get(Calendar.DATE); //날짜
				cal.set(Calendar.DATE, i + 1);
			}
			list.add(dd); //각 달의 마지막 날짜
		}
		for(int i : list) {
			System.out.println(i);
		}
	}
	
	
	public void calendar() {
		//Calendar
		Calendar cal = Calendar.getInstance();

		// 1~12
		for(int month=0; month<12; month++) {
			int yyyy = cal.get(Calendar.YEAR);
			System.out.println(cal.get(Calendar.YEAR));
			
			cal.set(Calendar.MONTH, month);
			int mm = cal.get(Calendar.MONTH)+1;
			System.out.println(mm+"-month-");

			// maxDay
			int maxDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
			cal.set(Calendar.DATE,1);

			for(int i=1; i<=maxDay; i++) {
				cal.set(Calendar.DATE, i);

				//day
				int dd = cal.get(Calendar.DATE);
				System.out.print(dd + " ");
				
				cal.set(Calendar.DATE, i + 1);
			}
			System.out.println();
		}

	}

		public static void main(String[] args) {
			Test t = new Test();
//			t.calendar();
			t.test();
		}

}
