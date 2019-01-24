package countout;

import org.springframework.http.MediaType;

import org.springframework.http.HttpHeaders;
import org.springframework.web.client.RestTemplate;

public class BaseTest {
	protected static RestTemplate getRestTemplate() {
		return new RestTemplate();
	}

	protected static HttpHeaders createHeaders() {
		return new HttpHeaders();
	}
	
	protected String getWebRoot(){
		return "168.1.37.36:8080/cloud";
	}
	
	protected String getInternet() {
	
		return "http://localhost:8080/";
	}
	public static void main(String[] args) {
		HttpHeaders heraders = new HttpHeaders();
		heraders.setAccept(MediaType.parseMediaTypes(MediaType.APPLICATION_JSON_VALUE));;
	}

}
