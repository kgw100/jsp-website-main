package ycertMeeting;

public class EmoteMeeting {
	private int bbsID; //�� �ѹ�
	private String bbsTitle; //ȸ�� ����
	private String bbsUserID; //�ۼ����̸�
	private String bbsDate; //��¥
	private String bbsContent; //ȸ�ǳ���
	private String result;//ȸ�ǰ��
	private String specialNote;//Ư�����
	private String participant; //ȸ�� ������

	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getSpecialNote() {
		return specialNote;
	}
	public void setSpecialNote(String specialNote) {
		this.specialNote = specialNote;
	}
	public String getParticipant() {
		return participant;
	}
	public void setParticipant(String participant) {
		this.participant = participant;
	}
	public int getBbsID() {
		return bbsID;
	}
	public void setBbsID(int bbsID) {
		this.bbsID = bbsID;
	}
	public String getBbsTitle() {
		return bbsTitle;
	}
	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
	}
	public String getBbsUserID() {
		return bbsUserID;
	}
	public void setBbsUserID(String bbsUserID) {
		this.bbsUserID = bbsUserID;
	}
	public String getBbsDate() {
		return bbsDate;
	}
	public void setBbsDate(String bbsDate) {
		this.bbsDate = bbsDate;
	}
	public String getBbsContent() {
		return bbsContent;
	}
	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}
}
