//package my.garden.dao;
//
//import java.text.SimpleDateFormat;
//import java.util.ArrayList;
//import java.util.List;
//
//import org.mybatis.spring.SqlSessionTemplate;
//import org.openqa.selenium.By;
//import org.openqa.selenium.WebDriver;
//import org.openqa.selenium.WebElement;
//import org.openqa.selenium.chrome.ChromeDriver;
//import org.openqa.selenium.chrome.ChromeOptions;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//
//import com.google.gson.JsonArray;
//import com.google.gson.JsonElement;
//import com.google.gson.JsonObject;
//import com.google.gson.JsonParser;
//
//import my.garden.dto.getCroppingSeasonDataListDTO;
//import my.garden.dto.getIdentityDataListDTO;
//
//@Repository
//public class FarmDataDAO {
//	
//	private static String key = "7f811021e2144a8881c64f23e705fa1f"; //키값
//	private static String chromeDriverRoute = "C:\\Users\\auswo\\Downloads\\Spring\\Spring_01\\MyGarden_DB\\src\\main\\webapp\\resources\\lib\\chromedriver.exe"; //드라이브 절대경로
//	private static long time = System.currentTimeMillis();
//	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//	
//	@Autowired
//	private SqlSessionTemplate sst;	
//	
//	private WebDriver seleniumSetting() { //셀레니움 초기세팅
//		System.setProperty("webdriver.chrome.driver", chromeDriverRoute);
//		ChromeOptions opt = new ChromeOptions();
//		opt.addArguments("--silent");
//		opt.addArguments("--headless");
//		WebDriver driver = new ChromeDriver(opt);
//		return driver;
//	}
//
//	//한 칼럼 데이터 전체를 리스트에 담아 리턴함
//	public List<getIdentityDataListDTO> selectIdentity() {
//		List<getIdentityDataListDTO> columns = sst.selectList("FarmDataDAO.selectIdentity");
//		return columns;
//	}
//	public List<getCroppingSeasonDataListDTO> selectCropping() {
//		List<getCroppingSeasonDataListDTO> columns = sst.selectList("FarmDataDAO.selectCropping");
//		return columns;
//	}
//	
//	public int getIdentityDataList() { //getIdentityDataList : 아이덴티티정보
//		WebDriver driver = this.seleniumSetting();
//		driver.get("http://www.smartfarmkorea.net/Agree_WS/webservices/ProvideRestService/getIdentityDataList/" + key);
//		WebElement result = driver.findElement(By.xpath("/html/body/pre"));
//		String innerHTML = result.getAttribute("innerHTML");
//		JsonParser parser = new JsonParser();
//		JsonElement root = parser.parse(innerHTML);
//		JsonArray jsonArray = root.getAsJsonArray();
//		JsonObject jsonObject = null;
//		List<getIdentityDataListDTO> lists = new ArrayList();
//		for(int i=0; i<jsonArray.size(); i++) {
//			jsonObject = jsonArray.get(i).getAsJsonObject();
//			String statusCode = jsonObject.get("statusCode").toString();
//			String statusMessage = jsonObject.get("statusMessage").toString();
//			String userId = jsonObject.get("userId").getAsString();
//			String facilityId = jsonObject.get("facilityId").toString();
//			String addressName = jsonObject.get("addressName").toString();
//			String itemCode = jsonObject.get("itemCode").toString();
//			getIdentityDataListDTO dto = new getIdentityDataListDTO(statusCode, statusMessage, userId, facilityId, addressName, itemCode);
//			lists.add(dto);
//		}
//		driver.close();
//		sst.insert("FarmDataDAO.insertGetIdentityDataList", lists);
//		return 1;
//	}
//
//	public int getCroppingSeasonDataList() { //getCroppingSeasonDataList : 작기정보
//		WebDriver driver = this.seleniumSetting();
//		List<getIdentityDataListDTO> columns = this.selectIdentity();
//		String innerHTML = "";
//		for(getIdentityDataListDTO column : columns) {
//			driver.get("http://www.smartfarmkorea.net/Agree_WS/webservices/ProvideRestService/getCroppingSeasonDataList/" + key + "/" + column.getUserId());
//			WebElement result = driver.findElement(By.xpath("/html/body/pre"));
//			innerHTML += (result.getAttribute("innerHTML").substring(1, result.getAttribute("innerHTML").length()-1) + ",");
//		}
//		JsonParser parser = new JsonParser();
//		JsonElement root = parser.parse("["+innerHTML.substring(0, innerHTML.length()-1)+"]");
//		JsonArray jsonArray = root.getAsJsonArray();
//		JsonObject jsonObject = null;
//		List<getCroppingSeasonDataListDTO> lists = new ArrayList();
//		for(int i=0; i<jsonArray.size(); i++) {
//			jsonObject = jsonArray.get(i).getAsJsonObject();
//			String statusCode = jsonObject.get("statusCode").toString();
//			String statusMessage = jsonObject.get("statusMessage").toString();
//			String croppingSerlNo = jsonObject.get("croppingSerlNo").toString();
//			String croppingSeasonName = jsonObject.get("croppingSeasonName").toString();
//			String croppingDate = jsonObject.get("croppingDate").toString();
//			String croppingEndDate = jsonObject.get("croppingEndDate").toString();
//			String croppingSystem = jsonObject.get("croppingSystem").toString();
//			String itemCode = jsonObject.get("itemCode").toString();
//			String cultivationArea = jsonObject.get("cultivationArea").toString();
//			String calCultivationArea = jsonObject.get("calCultivationArea").toString();
//			String plantNum = jsonObject.get("plantNum").toString();
//			String calPlantNum = jsonObject.get("calPlantNum").toString();
//			String stemSlabNum = jsonObject.get("stemSlabNum").toString();
//			String planSlabNum = jsonObject.get("planSlabNum").toString();
//			String plantDensity = jsonObject.get("plantDensity").toString();
//			String standardPlantDensity = jsonObject.get("standardPlantDensity").toString();
//			String floodlightDec = jsonObject.get("floodlightDec").toString();
//			String leafArea = jsonObject.get("leafArea").toString();
//			String stndTemp = jsonObject.get("stndTemp").toString();
//			String stndWeight = jsonObject.get("stndWeight").toString();
//			String stndSolar = jsonObject.get("stndSolar").toString();
//			String stndMeta = jsonObject.get("stndMeta").toString();
//			getCroppingSeasonDataListDTO dto = new getCroppingSeasonDataListDTO(statusCode, statusMessage, croppingSerlNo, croppingSeasonName, croppingDate, croppingEndDate, croppingSystem, itemCode, cultivationArea, calCultivationArea, plantNum, calPlantNum, stemSlabNum, planSlabNum, plantDensity, standardPlantDensity, floodlightDec, leafArea, stndTemp, stndWeight, stndSolar, stndMeta);
//			lists.add(dto);
//		}
//		driver.close();
//		sst.insert("FarmDataDAO.insertGetCroppingSeasonDataList", lists);
//		return 1;
//	}
//
//	public int getManagementData() { //getManagementData : 관리정보
////		WebDriver driver = this.seleniumSetting();
//		List<getIdentityDataListDTO> columns = this.selectIdentity();
//		List<getCroppingSeasonDataListDTO> crops = this.selectCropping();
//		String innerHTML = "";
//		for(getIdentityDataListDTO column : columns) {
//			for(getCroppingSeasonDataListDTO crop : crops) {
//				System.out.println("http://www.smartfarmkorea.net/Agree_WS/webservices/ProvideRestService/getManagementData/" + key + "/" + column.getUserId() + "/" + crop.getCroppingSerlNo());
////				driver.get("http://www.smartfarmkorea.net/Agree_WS/webservices/ProvideRestService/getManagementData/" + key + "/" + column.getUserId() + "/" + crop.getCroppingSerlNo());
////				WebElement result = driver.findElement(By.xpath("/html/body/pre"));
////				innerHTML += (result.getAttribute("innerHTML").substring(1, result.getAttribute("innerHTML").length()-1) + ",");
//			}
//		}
////		JsonParser parser = new JsonParser();
////		JsonElement root = parser.parse("["+innerHTML.substring(0, innerHTML.length()-1)+"]");
////		JsonArray jsonArray = root.getAsJsonArray();
////		JsonObject jsonObject = null;
////		List<getManagementDataDTO> lists = new ArrayList();
////		for(int i=0; i<jsonArray.size(); i++) {
////			jsonObject = jsonArray.get(i).getAsJsonObject();
////			String statusCode = jsonObject.get("statusCode").toString();
////			String statusMessage = jsonObject.get("statusMessage").toString();
////			String manpowerPrice = jsonObject.get("manpowerPrice").toString();
////			String nutrientPrice = jsonObject.get("nutrientPrice").toString();
////			String preventionPrice = jsonObject.get("preventionPrice").toString();
////			String shipmentAmt = jsonObject.get("shipmentAmt").toString();
////			String shipmentPrice = jsonObject.get("shipmentPrice").toString();
////			String maintenancePrice = jsonObject.get("maintenancePrice").toString();
////			String materialsPrice = jsonObject.get("materialsPrice").toString();
////			getManagementDataDTO dto = new getManagementDataDTO(statusCode, statusMessage, manpowerPrice, nutrientPrice, preventionPrice, shipmentAmt, shipmentPrice, maintenancePrice, materialsPrice);
////			lists.add(dto);
////		}
////		driver.close();
////		sst.insert("FarmDataDAO.insertGetManagementData", lists);
//		return 1;
//	}
//	
//	
//}