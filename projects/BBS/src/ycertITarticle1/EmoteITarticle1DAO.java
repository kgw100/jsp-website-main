package ycertITarticle1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class EmoteITarticle1DAO {
	private Connection conn; /* DB�� ������ �� �ֵ��� ���ִ� �ϳ��� ��ü */
	// private PreparedStatement pstmt; BbsDAO�� �������� �Լ��� ����ϱ⶧���� ������ �Լ����� db���ٿ� �־
	// �浿�� �Ͼ�� �ʵ��� ������ �Լ����� �������ֱ�.
	private ResultSet rs; /* ��� ������ ���� �� �ִ� ��ü */

	/* ������ mysql�� �����ϰ� ���ִ� �κ� */
	public EmoteITarticle1DAO() {
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
		String SQL = "SELECT bbsID FROM ycertitarticle1 ORDER BY bbsID DESC";
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
		String SQL = "INSERT INTO ycertitarticle1 VALUES (?, ?, ?, ?, ?)";
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

	public ArrayList<EmoteITarticle1> getList(int pageNumber) {
		String SQL = "SELECT * FROM ycertitarticle1 WHERE bbsID < ? ORDER BY bbsID DESC LIMIT 10";
		ArrayList<EmoteITarticle1> list = new ArrayList<EmoteITarticle1>();
		try {
			// ���� ����Ǿ��ִ� conn��ü�� �̿��Ͽ� sql������ �����غ�ܰ�� �����
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery(); // ������ ���������� ������ ����� ����
			while (rs.next()) {
				EmoteITarticle1 bbs = new EmoteITarticle1();
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
		String SQL = "SELECT * FROM ycertitarticle1 WHERE bbsID < ? ";
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
	public EmoteITarticle1 getBbs(int bbsID) {
		String SQL = "SELECT * FROM ycertitarticle1 WHERE bbsID = ?";
		try {
			// ���� ����Ǿ��ִ� conn��ü�� �̿��Ͽ� sql������ �����غ�ܰ�� �����
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery(); // ������ ���������� ������ ����� ����
			while (rs.next()) {
				EmoteITarticle1 bbs = new EmoteITarticle1();
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
		String SQL = "UPDATE ycertitarticle1 SET bbstitle =?, bbscontent= ? WHERE bbsID = ?";
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
		String SQL = "DELETE FROM ycertitarticle1 WHERE bbsID = ?";
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
