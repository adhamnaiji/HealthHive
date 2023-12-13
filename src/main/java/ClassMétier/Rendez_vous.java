package ClassMétier;

public class Rendez_vous {
	private int id;
	private int idmedcin;
	private int iduser;
	private String date;
	private String time;
	private int tel;
	private String mail;
	private String message;
	public Rendez_vous(int id, int idmedcin, int iduser, String date, String time, int tel, String mail,
			String message) {
		super();
		this.idmedcin = idmedcin;
		this.iduser = iduser;
		this.date = date;
		this.time = time;
		this.tel = tel;
		this.mail = mail;
		this.message = message;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getIdmedcin() {
		return idmedcin;
	}
	public void setIdmedcin(int idmedcin) {
		this.idmedcin = idmedcin;
	}
	public int getIduser() {
		return iduser;
	}
	public void setIduser(int iduser) {
		this.iduser = iduser;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getTel() {
		return tel;
	}
	public void setTel(int tel) {
		this.tel = tel;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	







}
