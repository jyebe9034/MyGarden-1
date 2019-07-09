package my.garden.dto;

public class getCultivateDataListDTO {
	private String statusCode;
	private String statusMessage;
	private String measDate;
	private String userId;
	private String itemCode;
	private String sampleNum;
	private String growLength;
	private String flowerTop;
	private String stemDiameter;
	private String leavesLength;
	private String leavesWidth;
	private String leavesNum;
	private String flowerPosition;
	private String fruitsPosition;
	private String fruitsNum;
	private String harvestPosition;
	private String ped;
	private String solarCorrection;
	private String fruitsWeight;
	public getCultivateDataListDTO(String statusCode, String statusMessage, String measDate, String userId,
			String itemCode, String sampleNum, String growLength, String flowerTop, String stemDiameter,
			String leavesLength, String leavesWidth, String leavesNum, String flowerPosition, String fruitsPosition,
			String fruitsNum, String harvestPosition, String ped, String solarCorrection, String fruitsWeight) {
		super();
		this.statusCode = statusCode;
		this.statusMessage = statusMessage;
		this.measDate = measDate;
		this.userId = userId;
		this.itemCode = itemCode;
		this.sampleNum = sampleNum;
		this.growLength = growLength;
		this.flowerTop = flowerTop;
		this.stemDiameter = stemDiameter;
		this.leavesLength = leavesLength;
		this.leavesWidth = leavesWidth;
		this.leavesNum = leavesNum;
		this.flowerPosition = flowerPosition;
		this.fruitsPosition = fruitsPosition;
		this.fruitsNum = fruitsNum;
		this.harvestPosition = harvestPosition;
		this.ped = ped;
		this.solarCorrection = solarCorrection;
		this.fruitsWeight = fruitsWeight;
	}
	public getCultivateDataListDTO() {
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
	public String getMeasDate() {
		return measDate;
	}
	public void setMeasDate(String measDate) {
		this.measDate = measDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public String getSampleNum() {
		return sampleNum;
	}
	public void setSampleNum(String sampleNum) {
		this.sampleNum = sampleNum;
	}
	public String getGrowLength() {
		return growLength;
	}
	public void setGrowLength(String growLength) {
		this.growLength = growLength;
	}
	public String getFlowerTop() {
		return flowerTop;
	}
	public void setFlowerTop(String flowerTop) {
		this.flowerTop = flowerTop;
	}
	public String getStemDiameter() {
		return stemDiameter;
	}
	public void setStemDiameter(String stemDiameter) {
		this.stemDiameter = stemDiameter;
	}
	public String getLeavesLength() {
		return leavesLength;
	}
	public void setLeavesLength(String leavesLength) {
		this.leavesLength = leavesLength;
	}
	public String getLeavesWidth() {
		return leavesWidth;
	}
	public void setLeavesWidth(String leavesWidth) {
		this.leavesWidth = leavesWidth;
	}
	public String getLeavesNum() {
		return leavesNum;
	}
	public void setLeavesNum(String leavesNum) {
		this.leavesNum = leavesNum;
	}
	public String getFlowerPosition() {
		return flowerPosition;
	}
	public void setFlowerPosition(String flowerPosition) {
		this.flowerPosition = flowerPosition;
	}
	public String getFruitsPosition() {
		return fruitsPosition;
	}
	public void setFruitsPosition(String fruitsPosition) {
		this.fruitsPosition = fruitsPosition;
	}
	public String getFruitsNum() {
		return fruitsNum;
	}
	public void setFruitsNum(String fruitsNum) {
		this.fruitsNum = fruitsNum;
	}
	public String getHarvestPosition() {
		return harvestPosition;
	}
	public void setHarvestPosition(String harvestPosition) {
		this.harvestPosition = harvestPosition;
	}
	public String getPed() {
		return ped;
	}
	public void setPed(String ped) {
		this.ped = ped;
	}
	public String getSolarCorrection() {
		return solarCorrection;
	}
	public void setSolarCorrection(String solarCorrection) {
		this.solarCorrection = solarCorrection;
	}
	public String getFruitsWeight() {
		return fruitsWeight;
	}
	public void setFruitsWeight(String fruitsWeight) {
		this.fruitsWeight = fruitsWeight;
	}
}
