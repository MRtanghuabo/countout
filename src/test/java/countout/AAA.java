package countout;

import java.util.HashMap;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.countout.service.impl.MessageServiceImpl;


public class AAA extends BaseTest {
	
	protected ApplicationContext context;
	
	@Before
	public void init(){
		context = new ClassPathXmlApplicationContext("spring/applicationContext.xml");
	}

	@Test
	public void AAA() {
		MessageServiceImpl service = (MessageServiceImpl) this.context.getBean("messageServiceImpl");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", "bbb");
		service.queryMessage(map);
	}
}
