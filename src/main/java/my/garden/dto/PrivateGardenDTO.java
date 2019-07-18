package my.garden.dto;

import java.sql.Timestamp;

public class PrivateGardenDTO {
	
	private String g_email;
	private String g_name;
	private Timestamp g_enrolldate;
	private String g_hurb;
	private int g_temper;
	private int g_humid;
	private int g_water;
	private int g_light;
	private String g_process;
	private String g_consume;
	
	public PrivateGardenDTO() {}
	public PrivateGardenDTO(String g_email, String g_name, Timestamp g_enrolldate, String g_hurb, int g_temper,
			int g_humid, int g_water, int g_light, String g_process, String g_consume) {
		super();
		this.g_email = g_email;
		this.g_name = g_name;
		this.g_enrolldate = g_enrolldate;
		this.g_hurb = g_hurb;
		this.g_temper = g_temper;
		this.g_humid = g_humid;
		this.g_water = g_water;
		this.g_light = g_light;
		this.g_process = g_process;
		this.g_consume = g_consume;
	}
	
	public String getG_email() {
		return g_email;
	}
	public void setG_email(String g_email) {
		this.g_email = g_email;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public Timestamp getG_enrolldate() {
		return g_enrolldate;
	}
	public void setG_enrolldate(Timestamp g_enrolldate) {
		this.g_enrolldate = g_enrolldate;
	}
	public String getG_hurb() {
		return g_hurb;
	}
	public void setG_hurb(String g_hurb) {
		this.g_hurb = g_hurb;
	}
	public int getG_temper() {
		return g_temper;
	}
	public void setG_temper(int g_temper) {
		this.g_temper = g_temper;
	}
	public int getG_humid() {
		return g_humid;
	}
	public void setG_humid(int g_humid) {
		this.g_humid = g_humid;
	}
	public int getG_water() {
		return g_water;
	}
	public void setG_water(int g_water) {
		this.g_water = g_water;
	}
	public int getG_light() {
		return g_light;
	}
	public void setG_light(int g_light) {
		this.g_light = g_light;
	}
	public String getG_process() {
		return g_process;
	}
	public void setG_process(String g_process) {
		this.g_process = g_process;
	}
	public String getG_consume() {
		return g_consume;
	}
	public void setG_consume(String g_consume) {
		this.g_consume = g_consume;
	}
}
