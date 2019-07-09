package my.garden.dto;

public class getManagementDataDTO {
	private String statusCode; 
	private String statusMessage; 
	private String manpowerPrice; 
	private String nutrientPrice; 
	private String preventionPrice; 
	private String shipmentAmt; 
	private String shipmentPrice; 
	private String maintenancePrice; 
	private String materialsPrice;
	public getManagementDataDTO(String statusCode, String statusMessage, String manpowerPrice, String nutrientPrice,
			String preventionPrice, String shipmentAmt, String shipmentPrice, String maintenancePrice,
			String materialsPrice) {
		super();
		this.statusCode = statusCode;
		this.statusMessage = statusMessage;
		this.manpowerPrice = manpowerPrice;
		this.nutrientPrice = nutrientPrice;
		this.preventionPrice = preventionPrice;
		this.shipmentAmt = shipmentAmt;
		this.shipmentPrice = shipmentPrice;
		this.maintenancePrice = maintenancePrice;
		this.materialsPrice = materialsPrice;
	}
	public getManagementDataDTO() {
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
	public String getManpowerPrice() {
		return manpowerPrice;
	}
	public void setManpowerPrice(String manpowerPrice) {
		this.manpowerPrice = manpowerPrice;
	}
	public String getNutrientPrice() {
		return nutrientPrice;
	}
	public void setNutrientPrice(String nutrientPrice) {
		this.nutrientPrice = nutrientPrice;
	}
	public String getPreventionPrice() {
		return preventionPrice;
	}
	public void setPreventionPrice(String preventionPrice) {
		this.preventionPrice = preventionPrice;
	}
	public String getShipmentAmt() {
		return shipmentAmt;
	}
	public void setShipmentAmt(String shipmentAmt) {
		this.shipmentAmt = shipmentAmt;
	}
	public String getShipmentPrice() {
		return shipmentPrice;
	}
	public void setShipmentPrice(String shipmentPrice) {
		this.shipmentPrice = shipmentPrice;
	}
	public String getMaintenancePrice() {
		return maintenancePrice;
	}
	public void setMaintenancePrice(String maintenancePrice) {
		this.maintenancePrice = maintenancePrice;
	}
	public String getMaterialsPrice() {
		return materialsPrice;
	}
	public void setMaterialsPrice(String materialsPrice) {
		this.materialsPrice = materialsPrice;
	}
}
