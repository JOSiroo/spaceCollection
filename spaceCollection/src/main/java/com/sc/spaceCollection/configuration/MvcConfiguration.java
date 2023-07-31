package com.sc.spaceCollection.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

//Configuration을 붙혀서 설정파일임을 알려줘야함
@Configuration
public class MvcConfiguration implements WebMvcConfigurer{

//	@Override
//	public void addInterceptors(InterceptorRegistry registry) {
//		registry.addInterceptor(new LoginInterceptor())
//		.addPathPatterns("/shop/cart/*", "/shop/order/*", //저런 경로를 가진 것들은 인터셉트를 거치고 가도록 설정함
//				"/login/memberEdit","/login/memberOut");
//		
//		registry.addInterceptor(new AdminLoginInterceptor())
//		.excludePathPatterns("/admin/login/adminLogin") //exclude - 제외하고
//		.addPathPatterns("/admin/**");
//	}
}
/*

		
*/

	

	/*
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver 
		= new CommonsMultipartResolver();
		multipartResolver.setDefaultEncoding("UTF-8"); // 파일 인코딩 설정
		multipartResolver.setMaxUploadSizePerFile(2 * 1024 * 1024); // 파일당 업로드 크기 제한 (2MB)
		return multipartResolver;
	}
*/
	

	/*
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/pd_images/**").addResourceLocations("file:///C:/lecture/pd_images/");
		
	}
*/
	
