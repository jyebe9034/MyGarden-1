package my.garden.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import my.garden.dto.CartDTO;

@RunWith(SpringJUnit4ClassRunner.class)//해당 클래스는 스프링 클래스임을 알려주는 코드
@WebAppConfiguration//해당 클래스는 스프링일 뿐만 아니라 웹 기반의 클래스이다(네이티브가 아님을 의미)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})//context파일 연결
public class ShoppingControllerTest {

	@Autowired
	private ShoppingController sc;
	
	@Autowired
	private WebApplicationContext wac;
	
	private MockMvc mockMvc;
	
	@Autowired
	CartDTO dto;

	@Before // @Test메소드들을 실행하기 전에 실행할 코드
	public void mockSetup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();
	}
	
	@Test
	public void testToOrder() throws Exception{
		this.mockMvc.perform(post("order")//MockHttpServletRequestBuilder 임포트
				.param("c_p_title", "샐러드")
				.param("c_p_no", "1001"))
				.andDo(print()).andExpect(status().isOk());//200번대(문제 없음)를 기대한다
		//is3xxRedirection()); : 이런 결과가 나오길 기대한다
			
		//sc.toOrder(dto);
	}

}
