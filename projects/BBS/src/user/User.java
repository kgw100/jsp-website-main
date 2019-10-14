/*�ڹٺ��� : �ϳ��� �����͸� �����ϰ� ó���� �� �ִ� ����� jsp���� �����ϴ� ��*/
package user;

public class User {
	private String userID;
	private String userPassword;
	private String userEmail;
	private String userSalt;
	private String userEmailHash;
	private boolean userEmailChecked;
	private String userKey;

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserSalt() {
		return userSalt;
	}
	public void setUserSalt(String userSalt) {
		this.userSalt = userSalt;
	}
	public String getUserEmailHash() {
		return userEmailHash;
	}
	public void setUserEmailHash(String userEmailHash)
	{
		this.userEmailHash = userEmailHash;
	}
	public boolean isUserEmailChecked()
	{
		return userEmailChecked;
	}
	public void setUserEmailChecked(boolean userEmailChecked)
	{
		this.userEmailChecked = userEmailChecked;
	}
	public void setUserKey(String userKey)
	{
		this.userKey = userKey;
	}
	public String getUserKey()
	{
		return userKey;
	}
}
