package com.example.project.model.member.dto;

import java.util.Date;

public class MemberDTO {
	private String userid;
	private String passwd;
	private String username;
	private String hp;
	private String email;
	private String addr1;//주소 추가
	private String addr2;
	private String addr3;
	private Date join_date;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getAddr3() {
		return addr3;
	}
	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [userid=" + userid + ", passwd=" + passwd + ", username=" + username + ", hp=" + hp
				+ ", email=" + email + ", addr1=" + addr1 + ", addr2=" + addr2 + ", addr3=" + addr3 + ", join_date="
				+ join_date + "]";
	}
	
	public MemberDTO() {
	
	}
	
	
}
