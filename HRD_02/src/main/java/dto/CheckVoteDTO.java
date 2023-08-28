package dto;

public class CheckVoteDTO {
	String name, birth,age, gender,no,time,confirm;

	public CheckVoteDTO(String name, String birth, String age, String gender, String no, String time, String confirm) {
		super();
		this.name = name;
		this.birth = birth;
		this.age = age;
		this.gender = gender;
		this.no = no;
		this.time = time;
		this.confirm = confirm;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

	
}
