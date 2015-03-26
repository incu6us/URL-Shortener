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
package com.repaskys.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.transaction.TransactionException;

import com.repaskys.domain.ShortUrl;
import com.repaskys.repositories.UrlRepository;

/**
 * This class is for saving and finding ShortUrl instances. It can also be used
 * to expand a short code into a full URL. The implementation uses a Spring Data
 * JPA repository.
 *
 * @author Drew Repasky
 */
public class UrlShortenerServiceImpl implements UrlShortenerService {

	private static final Logger LOGGER = LoggerFactory.getLogger(UrlShortenerServiceImpl.class);

	@Autowired
	private UrlRepository urlRepository;

	@Autowired
	private Validator validator;

	public ShortUrl wasUrlAlreadyShortened(String fullUrl) {
		return urlRepository.findByFullUrl(fullUrl);
	}

	public List<String> validateShortUrl(ShortUrl shortUrl) {
		List<String> violations = new ArrayList<String>();
		Set<ConstraintViolation<ShortUrl>> constraintViolations = validator.validate(shortUrl);
		for (ConstraintViolation<ShortUrl> constraintViolation : constraintViolations) {
			violations.add(constraintViolation.getMessage());
		}
		return violations;
	}

	public String saveUrl(ShortUrl shortUrl) {
		LOGGER.trace("trying to save URL...");
		String errorMessage = "";

		// FIXME these cryptic exception messages will be bubbled up to the user
		try {
			// insert a new record
			urlRepository.save(shortUrl);

		} catch (DataAccessException ex) {
			LOGGER.error("DataAccessException when saving ShortUrl", ex);
			errorMessage = ex.getMessage();
		} catch (TransactionException ex) {
			// when we can't connect to the database, it throws a
			// CannotCreateTransactionException
			LOGGER.error("TransactionException when saving ShortUrl", ex);
			errorMessage = ex.getMessage();
		} catch (RuntimeException ex) {
			// we need the generic catch all, so that the raw exception stack
			// trace doesn't make it all the way back to the user
			LOGGER.error("RuntimeException when saving ShortUrl", ex);
			errorMessage = ex.getMessage();
		}
		return errorMessage;
	}

	public Iterable<ShortUrl> findAll() {
		return urlRepository.findAll();
	}

	public String expandShortUrl(String shortCode) {
		Long id = ShortUrl.shortCodeToId(shortCode);
		ShortUrl shortUrl = urlRepository.findOne(id);
		return (shortUrl != null) ? shortUrl.getFullUrl() : "";
	}

	public String deleteUrl(String fullUrl) {
		String errorMessage = "";
		try {
			urlRepository.delete(urlRepository.findByFullUrl(fullUrl).getId());
		} catch (DataAccessException ex) {
			LOGGER.error("DataAccessException when saving ShortUrl", ex);
			errorMessage = ex.getMessage();
		} catch (TransactionException ex) {
			// when we can't connect to the database, it throws a
			// CannotCreateTransactionException
			LOGGER.error("TransactionException when saving ShortUrl", ex);
			errorMessage = ex.getMessage();
		} catch (RuntimeException ex) {
			// we need the generic catch all, so that the raw exception stack
			// trace doesn't make it all the way back to the user
			LOGGER.error("RuntimeException when saving ShortUrl", ex);
			errorMessage = ex.getMessage();
		}
		return errorMessage;
	}
}
