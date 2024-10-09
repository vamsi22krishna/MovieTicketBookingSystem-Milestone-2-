package com.crimsonlogic.movieticketbookingsystem.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;



public class SpringMvcDispatcherServletInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {
		// TODO Auto-generated method stub
		return new Class[] {AppPersistentContext.class};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] {
				AppConfig.class
		};
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] {
			     "/"//context path not specified so package name
			};
	}

}
