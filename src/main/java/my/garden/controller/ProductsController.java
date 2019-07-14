package my.garden.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import my.garden.dto.ProductsDTO;
import my.garden.service.ProductsService;

@Controller
public class ProductsController {

	@Autowired
	private HttpSession session;

	@Autowired
	private ProductsService pservice;

	@RequestMapping("insertProducts")
	public String insertProducts(ProductsDTO dto) {
		String resourcePath = session.getServletContext().getRealPath("/resources");

		try {
			File newFile = new File(resourcePath + "/products/" + System.currentTimeMillis() + "_" + dto.getImage().getName());
			dto.getImage().transferTo(newFile);
			dto.setP_imagepath("/resources/products/" + newFile.getName());
			try {
				int result = pservice.insertProductsService(dto);
				System.out.println("insertResult : " + result);
				return "products/productsAdd";
			}catch(Exception e) {
				e.printStackTrace();
				return "error";
			}
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	@RequestMapping(value={"fruit", "vegatable", "egg", "grain", "source"})
	public String selectFruitsList(Model model, String category) {
		System.out.println(category);
		int start = 1;
		int end = start+5;
		try {
			List<ProductsDTO> result = pservice.selectProductsListByCategoryService(start, end, category);
			model.addAttribute("result", result);
			model.addAttribute("category",category);
			return "products/productsList";
		}catch(Exception e) {
			e.printStackTrace();
			return "products/productsList";
		}
	}

	@RequestMapping("productsList")
	public String selectFirstList(Model model){
		int start = 1;
		int end = start+5;
		try {
			List<ProductsDTO> result = pservice.selectProductsListByPageService(start, end);
			model.addAttribute("result", result);
			model.addAttribute("category", "all");
			return "products/productsList";
		}catch(Exception e) {
			e.printStackTrace();
			return "products/productsList";
		}
	}

	@ResponseBody
	@RequestMapping("selectProductsByPage")
	public List<ProductsDTO> selectProductsListByPage(int page, String category){
		int end = page*6;
		int start = end-5;
		try {
			if(category.equals("all")) {
				return pservice.selectProductsListByPageService(start, end);
			}else {
				return pservice.selectProductsListByCategoryService(start, end, category);
			}
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping("productsRead")
	public String toProductsRead(int pnumber, Model model) {
		try{
			ProductsDTO dto = pservice.selectOneProductService(pnumber);
			model.addAttribute("result", dto);
			return "products/productsRead";
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
