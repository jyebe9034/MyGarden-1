package my.garden.dto;

import java.sql.Timestamp;

public class BoardFreeDTO {
	private int bf_no;
	private String bf_title;
	private String bf_writer;
	private String bf_content;
	private int bf_viewcount;
	private Timestamp bf_writedate;
	private int bf_recommend;
	private String bf_stringdate;
	private int bf_cmtcount;
	
	public BoardFreeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardFreeDTO(int bf_no, String bf_title, String bf_writer, String bf_content, int bf_viewcount,
			Timestamp bf_writedate, int bf_recommend, String bf_stringdate, int bf_cmtcount) {
		super();
		this.bf_no = bf_no;
		this.bf_title = bf_title;
		this.bf_writer = bf_writer;
		this.bf_content = bf_content;
		this.bf_viewcount = bf_viewcount;
		this.bf_writedate = bf_writedate;
		this.bf_recommend = bf_recommend;
		this.bf_stringdate = bf_stringdate;
		this.bf_cmtcount = bf_cmtcount;
	}

	public int getBf_no() {
		return bf_no;
	}

	public void setBf_no(int bf_no) {
		this.bf_no = bf_no;
	}

	public String getBf_title() {
		return bf_title;
	}

	public void setBf_title(String bf_title) {
		this.bf_title = bf_title;
	}

	public String getBf_writer() {
		return bf_writer;
	}

	public void setBf_writer(String bf_writer) {
		this.bf_writer = bf_writer;
	}

	public String getBf_content() {
		return bf_content;
	}

	public void setBf_content(String bf_content) {
		this.bf_content = bf_content;
	}

	public int getBf_viewcount() {
		return bf_viewcount;
	}

	public void setBf_viewcount(int bf_viewcount) {
		this.bf_viewcount = bf_viewcount;
	}

	public Timestamp getBf_writedate() {
		return bf_writedate;
	}

	public void setBf_writedate(Timestamp bf_writedate) {
		this.bf_writedate = bf_writedate;
	}

	public int getBf_recommend() {
		return bf_recommend;
	}

	public void setBf_recommend(int bf_recommend) {
		this.bf_recommend = bf_recommend;
	}

	public String getBf_stringdate() {
		return bf_stringdate;
	}

	public void setBf_stringdate(String bf_stringdate) {
		this.bf_stringdate = bf_stringdate;
	}

	public int getBf_cmtcount() {
		return bf_cmtcount;
	}

	public void setBf_cmtcount(int bf_cmtcount) {
		this.bf_cmtcount = bf_cmtcount;
	}
	
}
