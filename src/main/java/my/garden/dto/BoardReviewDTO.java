package my.garden.dto;

import java.sql.Timestamp;

public class BoardReviewDTO {
	private int br_p_no;
	private int br_no;
	private String br_imagepath;
	private String br_title;
	private String br_name;
	private String br_content;
	private Timestamp br_writedate;
	
	
	public BoardReviewDTO() {
		super();
	}
	public BoardReviewDTO(int br_p_no, int br_no, String br_imagepath, String br_title, String br_name,
			String br_content, Timestamp br_writedate) {
		this.br_p_no = br_p_no;
		this.br_no = br_no;
		this.br_imagepath = br_imagepath;
		this.br_title = br_title;
		this.br_name = br_name;
		this.br_content = br_content;
		this.br_writedate = br_writedate;
	}
	public int getBr_p_no() {
		return br_p_no;
	}
	public void setBr_p_no(int br_p_no) {
		this.br_p_no = br_p_no;
	}
	public int getBr_no() {
		return br_no;
	}
	public void setBr_no(int br_no) {
		this.br_no = br_no;
	}
	public String getBr_imagepath() {
		return br_imagepath;
	}
	public void setBr_imagepath(String br_imagepath) {
		this.br_imagepath = br_imagepath;
	}
	public String getBr_title() {
		return br_title;
	}
	public void setBr_title(String br_title) {
		this.br_title = br_title;
	}
	public String getBr_name() {
		return br_name;
	}
	public void setBr_name(String br_name) {
		this.br_name = br_name;
	}
	public String getBr_content() {
		return br_content;
	}
	public void setBr_content(String br_content) {
		this.br_content = br_content;
	}
	public Timestamp getBr_writedate() {
		return br_writedate;
	}
	public void setBr_writedate(Timestamp br_writedate) {
		this.br_writedate = br_writedate;
	}
	
	
}
