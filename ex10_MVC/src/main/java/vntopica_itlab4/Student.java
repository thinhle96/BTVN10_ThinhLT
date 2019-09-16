package vntopica_itlab4;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Student {
	private int id;
	private String name;
	private Date birthDay;
	private String gender;
	private Date dateIn;
	private static SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	
	public Student(int id, String name, Date birthDay, String gender, Date dateIn) {
		super();
		this.id=id;
		this.name = name;
		this.birthDay = birthDay;
		this.gender = gender;
		this.dateIn = dateIn;
	}

	public Student(int id, String name, String birthDay, String gender, String dateIn) throws ParseException {
		super();
		this.id=id;
		this.name = name;
		this.birthDay = sdf.parse(birthDay);;
		this.gender = gender;
		this.dateIn = sdf.parse(dateIn);
	}
	
	public int getID() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public Date getBirthDay() {
		return birthDay;
	}
	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}
	public void setBirthday(String birthDay) throws ParseException {
		this.birthDay = sdf.parse(birthDay);
	}
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public Date getDayIn() {
		return dateIn;
	}
	public void setDayIn(Date dateIn) {
		this.dateIn = dateIn;
	}
	public void setDateIn(String dateIn) throws ParseException {
		this.dateIn = sdf.parse(dateIn);
	}
	
	public String toString() {
		return id + " " + name + " " + sdf.format(birthDay) + " " + gender + " " + sdf.format(dateIn);
	}

}
