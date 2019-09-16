package vntopica_itlab4;

import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.Scanner;

public class Action {

	public static HashMap<Integer, Student> infor = new HashMap<Integer, Student>();

	static Scanner sc = new Scanner(System.in);

	public static HashMap<Integer, Student> insertSt(HashMap<Integer, Student> infor, int id, String name,
			Date birthDay, String gender, Date dateIn) {
		infor.put(id, new Student(id, name, birthDay, gender, dateIn));
		return infor;
	}

	public static HashMap<Integer, Student> insertSt(HashMap<Integer, Student> infor, int id, String name,
			String birthDay, String gender, String dateIn) throws ParseException {

		infor.put(id, new Student(id, name, birthDay, gender, dateIn));
		return infor;
	}

	public static HashMap<Integer, Student> deleteSt(HashMap<Integer, Student> infor, int id, String name,
			Date birthDay, String gender, Date dateIn) {
		infor.remove(id);
		return infor;
	}
	public static HashMap<Integer, Student> deleteSt(HashMap<Integer, Student> infor, int id, String name,
			String birthDay, String gender, String dateIn) throws ParseException {
		infor.remove(id);
		return infor;
	}

	public static HashMap<Integer, Student> editSt(HashMap<Integer, Student> infor, int id, String name, Date birthDay,
			String gender, Date dateIn) {
		infor.get(id);
		infor.put(id, new Student(id,name,birthDay,gender,dateIn));
		return infor;
	}
	public static HashMap<Integer, Student> editSt(HashMap<Integer, Student> infor, int id, String name, String birthDay,
			String gender, String dateIn) throws ParseException {
		infor.get(id);
		infor.put(id, new Student(id,name,birthDay,gender,dateIn));
		return infor;
		
	}

	public static void findSt(HashMap<Integer, Student> infor, int id, String name, Date birthDay, String gender,
			Date dateIn) {
		System.out.println("Enter Wanted Name:");
		String wantFind = sc.nextLine();
		for (Student student : infor.values()) {
			if (student.getName().equals(wantFind))
				System.out.println(infor.get(id).toString());
		}

	}
}