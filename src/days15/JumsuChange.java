package days15;

public class JumsuChange {
	
	public static String getGrade(String pKor) {
		String grade = "";
		int kor = Integer.parseInt(pKor);
		switch (kor/10) {
		case 10:case 9:
			grade = "수";
			break;
		case 8 :
			grade = "우";
			break;
		case 7:
			grade = "미";
			break;

		default:
			grade = "가";
			break;
		}
		return grade;
	}
	
	public static int getLength(int[] m ) {
		return m.length;
	}

}
