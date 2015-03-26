/*
 * Copyright 2012 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.repaskys.actions;


import org.apache.struts2.interceptor.ServletRequestAware;
import javax.servlet.http.HttpServletRequest;
import com.repaskys.services.UrlShortenerService;

/**
 * This class is a Struts2 Action which is used to list each URL and its
 * corresponding shortened code.
 *
 * @author Drew Repasky
 */
public class UrlShortenerDeleteAdminAction implements ServletRequestAware{
	
	private UrlShortenerService urlShortenerService;
	private HttpServletRequest request;

	public UrlShortenerService getUrlShortenerService() {
		return urlShortenerService;
	}

	public void setUrlShortenerService(UrlShortenerService urlShortenerService) {
		this.urlShortenerService = urlShortenerService;
	}

	public String execute() {
		urlShortenerService.deleteUrl(getServletRequest().getParameter("url"));
		return "DELETE";
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public HttpServletRequest getServletRequest() {
		return request;
	}
}
