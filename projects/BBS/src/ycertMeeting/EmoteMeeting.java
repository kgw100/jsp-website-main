package ycertMeeting;

public class EmoteMeeting {
	private int bbsID; //글 넘버
	private String bbsTitle; //회의 주제
	private String bbsUserID; //작성자이름
	private String bbsDate; //날짜
	private String bbsContent; //회의내용
	private String result;//회의결과
	private String specialNote;//특기사항
	private String participant; //회의 참여자

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
