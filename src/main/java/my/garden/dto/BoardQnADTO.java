package my.garden.dto;

import java.sql.Timestamp;

public class BoardQnADTO {
	private int bq_p_no;
	private int bq_no;
	private String bq_checkedSecret;
	private String bq_title;
	private String bq_writer;
	private String bq_content;
	private Timestamp bq_writedate;
	private String bq_imagepath1;
	private String bq_imagepath2;
	private String bq_imagepath3;
	
	
	public BoardQnADTO() {
		super();
	}


	public BoardQnADTO(int bq_p_no, int bq_no, String bq_checkedSecret, String bq_title, String bq_writer,
			String bq_content, Timestamp bq_writedate, String bq_imagepath1, String bq_imagepath2,
			String bq_imagepath3) {
		this.bq_p_no = bq_p_no;
		this.bq_no = bq_no;
		this.bq_checkedSecret = bq_checkedSecret;
		this.bq_title = bq_title;
		this.bq_writer = bq_writer;
		this.bq_content = bq_content;
		this.bq_writedate = bq_writedate;
		this.bq_imagepath1 = bq_imagepath1;
		this.bq_imagepath2 = bq_imagepath2;
		this.bq_imagepath3 = bq_imagepath3;
	}


	public int getBq_p_no() {
		return bq_p_no;
	}


	public void setBq_p_no(int bq_p_no) {
		this.bq_p_no = bq_p_no;
	}


	public int getBq_no() {
		return bq_no;
	}


	public void setBq_no(int bq_no) {
		this.bq_no = bq_no;
	}


	public String getBq_checkedSecret() {
		return bq_checkedSecret;
	}


	public void bq_checkedSecret(String bq_checkedSecret) {
		this.bq_checkedSecret = bq_checkedSecret;
	}


	public String getBq_title() {
		return bq_title;
	}


	public void setBq_title(String bq_title) {
		this.bq_title = bq_title;
	}


	public String getBq_writer() {
		return bq_writer;
	}


	public void setBq_writer(String bq_writer) {
		this.bq_writer = bq_writer;
	}


	public String getBq_content() {
		return bq_content;
	}


	public void setBq_content(String bq_content) {
		this.bq_content = bq_content;
	}


	public Timestamp getBq_writedate() {
		return bq_writedate;
	}


	public void setBq_writedate(Timestamp bq_writedate) {
		this.bq_writedate = bq_writedate;
	}


	public String getBq_imagepath1() {
		return bq_imagepath1;
	}


	public void setBq_imagepath1(String bq_imagepath1) {
		this.bq_imagepath1 = bq_imagepath1;
	}


	public String getBq_imagepath2() {
		return bq_imagepath2;
	}


	public void setBq_imagepath2(String bq_imagepath2) {
		this.bq_imagepath2 = bq_imagepath2;
	}


	public String getBq_imagepath3() {
		return bq_imagepath3;
	}


	public void setBq_imagepath3(String bq_imagepath3) {
		this.bq_imagepath3 = bq_imagepath3;
	}


	
}
