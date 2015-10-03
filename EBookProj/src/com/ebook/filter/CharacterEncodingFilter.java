package com.ebook.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharacterEncodingFilter implements Filter {

	private String encoding;
	private boolean ignore = true;
	
	public void destroy() {
		encoding = null;
	}

	public void doFilter(ServletRequest request, ServletResponse respons,
			FilterChain chain) throws IOException, ServletException {
		if (ignore) {
			request.setCharacterEncoding(encoding);
		}
		chain.doFilter(request, respons);
	}

	public void init(FilterConfig config) throws ServletException {
		String configEncoding = config.getInitParameter("encoding");
		String configIgnore = config.getInitParameter("ignore");
		encoding = (configEncoding == null) ? encoding : configEncoding;
		ignore = (configIgnore == null) ? ignore : (configIgnore.equals("yes") ? true : false); 
	}

}
