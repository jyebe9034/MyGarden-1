package my.garden.dto;

public class ImageFreeDTO {
	private int img_bf_no;
	private String img_path;
	
	public ImageFreeDTO() {
		super();
	}
	public ImageFreeDTO(int img_bf_no, String img_path) {
		super();
		this.img_bf_no = img_bf_no;
		this.img_path = img_path;
	}
	public int getImg_bf_no() {
		return img_bf_no;
	}
	public void setImg_bf_no(int img_bf_no) {
		this.img_bf_no = img_bf_no;
	}
	public String getImg_path() {
		return img_path;
	}
	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
}
