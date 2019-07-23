package my.garden.dto;

public class ChatDTO {

	private String name;
	private String message;
	
	public ChatDTO() {}
	public ChatDTO(String name, String message) {
		super();
		this.name = name;
		this.message = message;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
}
