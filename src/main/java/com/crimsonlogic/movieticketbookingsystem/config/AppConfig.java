package com.crimsonlogic.movieticketbookingsystem.config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;


//define  configuration settings 
@Configuration
@EnableWebMvc
@ComponentScan(basePackages= {"com.crimsonlogic.movieticketbookingsystem"})
public class AppConfig {

	@Bean
	public InternalResourceViewResolver resolver() {
		InternalResourceViewResolver viewResolver=new InternalResourceViewResolver();
        viewResolver.setViewClass(JstlView.class);
        viewResolver.setPrefix("/WEB-INF/views/");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
        
	}
	//reading the resources folder
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
	        registry
	          .addResourceHandler("/resources/**")
	          .addResourceLocations("/resources/"); 
	        
	        registry.addResourceHandler("/movieticketbookingsystem/postures/**")
	          .addResourceLocations("classpath:/webapp/postures/");
	}
	 @Bean
	    public CommonsMultipartResolver multipartResolver() {
	        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
	        multipartResolver.setMaxUploadSize(10485760); // 10MB
	        return multipartResolver;
	    }
}
