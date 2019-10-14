/*자바빈즈 : 하나의 데이터(게시글)를 관리하고 처리할 수 있는 기법을 jsp에서 구현하는 것*/
package emoteITarticle1;

public class EmoteITarticle1 {
private int bbsID; //글 넘버
private String bbsTitle; //제목
private String bbsUserID; //작성자이름
private String bbsDate; //날짜
private String bbsContent; //내용

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
