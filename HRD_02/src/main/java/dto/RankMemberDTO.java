package dto;

public class RankMemberDTO {
	String no, name, total;

	public RankMemberDTO(String no, String name, String total) {
		super();
		this.no = no;
		this.name = name;
		this.total = total;
	}

	@Override
	public String toString() {
		return "RankMemberDTO [no=" + no + ", name=" + name + ", total=" + total + "]";
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}
}
