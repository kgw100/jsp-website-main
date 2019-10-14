package ycertCommunity2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class EmoteCommunity2DAO {
	private Connection conn; /* DB�� ������ �� �ֵ��� ���ִ� �ϳ��� ��ü */
	// private PreparedStatement pstmt; BbsDAO�� �������� �Լ��� ����ϱ⶧���� ������ �Լ����� db���ٿ� �־
	// �浿�� �Ͼ�� �ʵ��� ������ �Լ����� �������ֱ�.
	private ResultSet rs; /* ��� ������ ���� �� �ִ� ��ü */

	/* ������ mysql�� �����ϰ� ���ִ� �κ� */
	public EmoteCommunity2DAO() {
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
		String SQL = "SELECT bbsID FROM ycertcommunity2 ORDER BY bbsID DESC";
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
	public int write(String bbsTitle, String bbsUserID, String bbsContent) {
		String SQL = "INSERT INTO ycertcommunity2 VALUES (?, ?, ?, ?, ?)";
		try {
			// ���� ����Ǿ��ִ� conn��ü�� �̿��Ͽ� sql������ �����غ�ܰ�� �����
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, bbsUserID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			return pstmt.executeUpdate(); //�����ϸ� ����� ��ȯ
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}

	public ArrayList<EmoteCommunity2> getList(int pageNumber) {
		String SQL = "SELECT * FROM ycertcommunity2 WHERE bbsID < ? ORDER BY bbsID DESC LIMIT 10";
		ArrayList<EmoteCommunity2> list = new ArrayList<EmoteCommunity2>();
		try {
			// ���� ����Ǿ��ִ� conn��ü�� �̿��Ͽ� sql������ �����غ�ܰ�� �����
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery(); // ������ ���������� ������ ����� ����
			while (rs.next()) {
				EmoteCommunity2 bbs = new EmoteCommunity2();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setBbsUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				list.add(bbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/* ����¡ ó���ϱ����� �Լ� */
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM ycertcommunity2 WHERE bbsID < ? ";
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
	public EmoteCommunity2 getBbs(int bbsID) {
		String SQL = "SELECT * FROM ycertcommunity2 WHERE bbsID = ?";
		try {
			// ���� ����Ǿ��ִ� conn��ü�� �̿��Ͽ� sql������ �����غ�ܰ�� �����
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery(); // ������ ���������� ������ ����� ����
			while (rs.next()) {
				EmoteCommunity2 bbs = new EmoteCommunity2();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setBbsUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				return bbs;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	//�� ������ ���� �Լ�
	public int update( int bbsID, String bbsTitle, String bbsContent) {
		String SQL = "UPDATE ycertcommunity2 SET bbsTitle =?, bbsContent= ? WHERE bbsID = ?";
		try {
			// ���� ����Ǿ��ִ� conn��ü�� �̿��Ͽ� sql������ �����غ�ܰ�� �����
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContent);
			pstmt.setInt(3, bbsID);
			return pstmt.executeUpdate(); //�����ϸ� ����� ��ȯ
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}
	
	public int delete(int bbsID) {
		String SQL = "DELETE FROM ycertcommunity2 WHERE bbsID = ?";
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
