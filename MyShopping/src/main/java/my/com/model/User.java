package my.com.model;

public class User {
	private int idUser;
	private String username;
	private String fullname;
	private String salt_p;
	private String hash_p;
	private String dob;
	private String gender;
	private String email;
	private String phone;
	private String address;
	private int role;

	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(String username, String salt_p, String hash_p, int role) {
		super();
		this.username = username;
		this.salt_p = salt_p;
		this.hash_p = hash_p;
		this.role = 0;
	}

	public User(int idUser, String username, String salt_p, String hash_p, int role) {
		super();
		this.idUser = idUser;
		this.username = username;
		this.salt_p = salt_p;
		this.hash_p = hash_p;
		this.role = role;
	}



	public User(int idUser, String username, String fullname, String dob, String gender, String email, String phone,
			String address) {
		super();
		this.idUser = idUser;
		this.username = username;
		this.fullname = fullname;
		this.dob = dob;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.address = address;
	}

	public int getIdUser() {
		return idUser;
	}

	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getSalt_p() {
		return salt_p;
	}

	public void setSalt_p(String salt_p) {
		this.salt_p = salt_p;
	}

	public String getHash_p() {
		return hash_p;
	}

	public void setHash_p(String hash_p) {
		this.hash_p = hash_p;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "User [idUser=" + idUser + ", username=" + username + ", fullname=" + fullname + ", salt_p=" + salt_p
				+ ", hash_p=" + hash_p + ", dob=" + dob + ", gender=" + gender + ", email=" + email + ", phone=" + phone
				+ ", address=" + address + ", role=" + role + "]";
	}
}
