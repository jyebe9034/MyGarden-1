package my.garden.dto;

public class getIdentityDataListDTO {
	String statusCode;
	String statusMessage;
	String userId;
	String facilityId;
	String addressName;
	String itemCode;
	public getIdentityDataListDTO(String statusCode, String statusMessage, String userId, String facilityId,
			String addressName, String itemCode) {
		super();
		this.statusCode = statusCode;
		this.statusMessage = statusMessage;
		this.userId = userId;
		this.facilityId = facilityId;
		this.addressName = addressName;
		this.itemCode = itemCode;
	}
	public getIdentityDataListDTO() {
		super();
	}
	public String getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}
	public String getStatusMessage() {
		return statusMessage;
	}
	public void setStatusMessage(String statusMessage) {
		this.statusMessage = statusMessage;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getFacilityId() {
		return facilityId;
	}
	public void setFacilityId(String facilityId) {
		this.facilityId = facilityId;
	}
	public String getAddressName() {
		return addressName;
	}
	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
}
