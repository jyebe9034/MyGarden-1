package my.garden.dto;

import org.springframework.stereotype.Component;

@Component
public class ShopListDTO {
	private int s_orderno;
	private String s_email;
	private int s_p_no;
	private String s_p_imagepath;
	private String s_p_title;
	private int s_p_count;
	private int s_p_price;
	private int s_total_price;	
	private String s_m_zipcode;
	private String s_m_address1;
	private String s_m_address2;
	private String s_statement;
	private String s_reviewok;
	
	public ShopListDTO() {
	}

	public ShopListDTO(int s_orderno, String s_email, int s_p_no, String s_p_imagepath, String s_p_title, int s_p_count,
			int s_p_price, int s_total_price, String s_m_zipcode, String s_m_address1, String s_m_address2,
			String s_statement, String s_reviewok) {
		this.s_orderno = s_orderno;
		this.s_email = s_email;
		this.s_p_no = s_p_no;
		this.s_p_imagepath = s_p_imagepath;
		this.s_p_title = s_p_title;
		this.s_p_count = s_p_count;
		this.s_p_price = s_p_price;
		this.s_total_price = s_total_price;
		this.s_m_zipcode = s_m_zipcode;
		this.s_m_address1 = s_m_address1;
		this.s_m_address2 = s_m_address2;
		this.s_statement = s_statement;
		this.s_reviewok = s_reviewok;
	}

	public int getS_orderno() {
		return s_orderno;
	}

	public void setS_orderno(int s_orderno) {
		this.s_orderno = s_orderno;
	}

	public String getS_email() {
		return s_email;
	}

	public void setS_email(String s_email) {
		this.s_email = s_email;
	}

	public int getS_p_no() {
		return s_p_no;
	}

	public void setS_p_no(int s_p_no) {
		this.s_p_no = s_p_no;
	}

	public String getS_p_imagepath() {
		return s_p_imagepath;
	}

	public void setS_p_imagepath(String s_p_imagepath) {
		this.s_p_imagepath = s_p_imagepath;
	}

	public String getS_p_title() {
		return s_p_title;
	}

	public void setS_p_title(String s_p_title) {
		this.s_p_title = s_p_title;
	}

	public int getS_p_count() {
		return s_p_count;
	}

	public void setS_p_count(int s_p_count) {
		this.s_p_count = s_p_count;
	}

	public int getS_p_price() {
		return s_p_price;
	}

	public void setS_p_price(int s_p_price) {
		this.s_p_price = s_p_price;
	}

	public int getS_total_price() {
		return s_total_price;
	}

	public void setS_total_price(int s_total_price) {
		this.s_total_price = s_total_price;
	}

	public String getS_m_zipcode() {
		return s_m_zipcode;
	}

	public void setS_m_zipcode(String s_m_zipcode) {
		this.s_m_zipcode = s_m_zipcode;
	}

	public String getS_m_address1() {
		return s_m_address1;
	}

	public void setS_m_address1(String s_m_address1) {
		this.s_m_address1 = s_m_address1;
	}

	public String getS_m_address2() {
		return s_m_address2;
	}

	public void setS_m_address2(String s_m_address2) {
		this.s_m_address2 = s_m_address2;
	}

	public String getS_statement() {
		return s_statement;
	}

	public void setS_statement(String s_statement) {
		this.s_statement = s_statement;
	}

	public String getS_reviewok() {
		return s_reviewok;
	}

	public void setS_reviewok(String s_reviewok) {
		this.s_reviewok = s_reviewok;
	}

	
	
	
}
