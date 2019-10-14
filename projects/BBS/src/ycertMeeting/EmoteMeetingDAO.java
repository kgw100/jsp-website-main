package ycertMeeting;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class EmoteMeetingDAO {
	private Connection conn; /* DB�� ������ �� �ֵ��� ���ִ� �ϳ��� ��ü */
	// private PreparedStatement pstmt; BbsDAO�� �������� �Լ��� ����ϱ⶧���� ������ �Լ����� db���ٿ� �־
	// �浿�� �Ͼ�� �ʵ��� ������ �Լ����� �������ֱ�.
	private ResultSet rs; /* ��� ������ ���� �� �ִ� ��ü */

	/* ������ mysql�� �����ϰ� ���ִ� �κ� */
	public EmoteMeetingDAO() {
		try {
			String dbURL = "jdbc:mysql://10.170.0.2:3306/BBS?serverTimezone=Asia/Seoul";
			String dbID = "root";
			String dbPassword = "2788";
			Class.forName("com.mysql.cj.jdbc.Driver");
			/* ������ ������ ���� mysql�� ���� */
			/* ���� �� conn��ü�� ������ ����ȴ�. */
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getDate() {
		String SQL = "SELECT NOW()"; // ������ �ð��� �������� mysql ����
		try {
			// ���� ����Ǿ��ִ� conn��ü�� �̿��Ͽ� sql������ �����غ�ܰ�� �����
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery(); // ������ ���������� ������ ����� ����
			if (rs.next()) { // ����� �ִ°��
				return rs.getString(1); // ������ ��¥�� �״�� ��ȯ
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // �����ͺ��̽� ����
	}

	// �������� ���� �Խù��� bbsID�� �����ͼ� +1 �� ���� ��ȯ
	public int getNext() {
		// bbsID�� �������� �ؼ� ���� �������� ���� �Խñ��� bbsID�� ������
		String SQL = "SELECT bbsID FROM ycertmeeting ORDER BY bbsID DESC";
		try {
			// ���� ����Ǿ��ִ� conn��ü�� �̿��Ͽ� sql������ �����غ�ܰ�� �����
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery(); // ������ ���������� ������ ����� ����
			if (rs.next()) { // ����� �ִ°��
				return rs.getInt(1) + 1; // ������ ��¥�� �״�� ��ȯ
			}
			return 1; // ù ��° �Խù��� ���
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}

	// DB�� �Խñ� ���� ����
	public int write(String bbsTitle, String bbsUserID, String bbsContent, String result, String specialNote, String participant) {
		String SQL = "INSERT INTO ycertmeeting VALUES (?, ?, ?, ?, ?,?,?,?)";
		try {
			// ���� ����Ǿ��ִ� conn��ü�� �̿��Ͽ� sql������ �����غ�ܰ�� �����
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, bbsUserID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setString(6, result);
			pstmt.setString(7, specialNote);
			pstmt.setString(8, participant);
			return pstmt.executeUpdate(); //�����ϸ� ����� ��ȯ
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}

	public ArrayList<EmoteMeeting> getList(int pageNumber) {
		String SQL = "SELECT * FROM ycertmeeting WHERE bbsID < ? ORDER BY bbsID DESC LIMIT 10";
		ArrayList<EmoteMeeting> list = new ArrayList<EmoteMeeting>();
		try {
			// ���� ����Ǿ��ִ� conn��ü�� �̿��Ͽ� sql������ �����غ�ܰ�� �����
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery(); // ������ ���������� ������ ����� ����
			while (rs.next()) {
				EmoteMeeting bbs = new EmoteMeeting();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setBbsUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setResult(rs.getString(6));
				bbs.setSpecialNote(rs.getString(7));
				bbs.setParticipant(rs.getString(8));
				list.add(bbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/* ����¡ ó���ϱ����� �Լ� */
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM ycertmeeting WHERE bbsID < ? ";
		try {
			// ���� ����Ǿ��ִ� conn��ü�� �̿��Ͽ� sql������ �����غ�ܰ�� �����
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery(); // ������ ���������� ������ ����� ����
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	//�Խñ� ������ �����ϱ����� �Լ�
	public EmoteMeeting getBbs(int bbsID) {
		String SQL = "SELECT * FROM ycertmeeting WHERE bbsID = ?";
		try {
			// ���� ����Ǿ��ִ� conn��ü�� �̿��Ͽ� sql������ �����غ�ܰ�� �����
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery(); // ������ ���������� ������ ����� ����
			while (rs.next()) {
				EmoteMeeting bbs = new EmoteMeeting();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setBbsUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setResult(rs.getString(6));
				bbs.setSpecialNote(rs.getString(7));
				bbs.setParticipant(rs.getString(8));
				return bbs;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	//�� ������ ���� �Լ�
	public int update( int bbsID, String bbsTitle,String participant, String bbsContent, String result, String specialNote) {
		String SQL = "UPDATE ycertmeeting SET bbstitle =?, participant=?, bbscontent= ?, result=?, specialNote=? WHERE bbsID = ?";
		try {
			// ���� ����Ǿ��ִ� conn��ü�� �̿��Ͽ� sql������ �����غ�ܰ�� �����
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, participant);
			pstmt.setString(3, bbsContent);
			pstmt.setString(4, result);
			pstmt.setString(5, specialNote);
			pstmt.setInt(6, bbsID);
			return pstmt.executeUpdate(); //�����ϸ� ����� ��ȯ
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}
	
	public int delete(int bbsID) {
		String SQL = "DELETE FROM ycertmeeting WHERE bbsID = ?";
		try {
			// ���� ����Ǿ��ִ� conn��ü�� �̿��Ͽ� sql������ �����غ�ܰ�� �����
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			return pstmt.executeUpdate(); //�����ϸ� ����� ��ȯ
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}
}
