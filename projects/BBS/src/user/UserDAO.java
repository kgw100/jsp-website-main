/*DAO : ������ ���ٰ�ü (������ DB�� ������ �ؼ� DB�� �������ų� ������ �ִ� Ŭ����)*/
package user;

import java.sql.Connection;
import java.sql.DriverManager; /*mysql�� ������ �� �ֵ��� �Ű�ü ������ ���ִ� ���̺귯��*/
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//import java.sql.SQLException;

public class UserDAO {
	private Connection conn=null; 
	private PreparedStatement pstmt=null;
	private ResultSet rs=null; 
	

	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://10.170.0.2:3306/BBS?serverTimezone=Asia/Seoul";
			String dbID = "root"; //mysql id
			String dbPassword = "2788";		//mysql ��й�ȣ
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			/* ������ ������ ���� mysql�� ���� */
			/* ���� �� conn��ü�� ������ ����ȴ�. */
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	/*������ �α����� �õ��ϴ� �Լ�*/
	public int login(String userID, String userPassword) {
		 /*������ ������ ���� mysql�� ����*/
		/*���� ���̺��� �ش� ������� ��й�ȣ�� ������ ��*/
		String SQL ="select userpassword from user where userid = ?";
		try {
			/*PreparedStatement�� ������ sql������ DB�� �����ϴ� �������� �ν��Ͻ��� ������*/
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, userID); //���� sql������ ?�ڸ��� �μ��� ���� userID�� �־���
			rs=pstmt.executeQuery(); //������ ��� �־��ֱ�
			if (rs.next()) { //로그인 확인 
				if(rs.getString(1).equals(userPassword)) //��й�ȣ�� ��ġ�Ѵٸ�
					return 1; //로그인 성공 
				else
					return 0;
			}
			return -1; //아이디 존재하지 않음 
		}catch (Exception e){
			e.printStackTrace();
		}
		return -2; //데이터베이스 오류 
	}
	public String getSaltById(String userID)
	{
		
		String SQL = "select salt from user where userid=?";
		String error = "-1";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs=pstmt.executeQuery();
			String salt="";
			if(rs.next())
			{
				salt= rs.getString(1);
			}
			return salt;
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return error;
		
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO user VALUES (?, ?, ?, ?, ?, false)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			//pstmt.setString(2, SHA256Util.getEncrypt(user.getUserPassword(),user.getUserSalt()));
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserEmail());
			pstmt.setString(4, user.getUserSalt());
			pstmt.setString(5, user.getUserEmailHash());
			return pstmt.executeUpdate(); //���������� ������ �ϸ� 0�̻��� ���� ��ȯ��
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //회원가입 실패 
	}
	public String getUserEmail(String userID) {
		String SQL = "SELECT userEmail FROM user WHERE userid = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				return rs.getString(1); // 이메일 주소 반환
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; // 데이터베이스 오류
	}
	public boolean getUserEmailChecked(String userID) {
		String SQL = "SELECT userEmailChecked FROM user WHERE userid = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				return rs.getBoolean(1); // 이메일 등록 여부 반환
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false; // 데이터베이스 오류
	}
	public boolean setUserEmailChecked(String userID) {
		String SQL = "UPDATE user SET userEmailChecked = true WHERE userid = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.executeUpdate();
			return true; // 이메일 등록 설정 성공
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false; // 이메일 등록 설정 실패
	}
	public int search(String userID)
	{
		String SQL = "SELECT * from user WHERE userid= ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) //아이디가 존재하면 
			return -1; 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		} 
		return 1; //아이디가 존재하지 않음 
	}
	//salt를 추가 3.28 
	//이메일 인증 추가 4.14 
	//이미 가입된 회원 조사 기능 추가 4.15

}
