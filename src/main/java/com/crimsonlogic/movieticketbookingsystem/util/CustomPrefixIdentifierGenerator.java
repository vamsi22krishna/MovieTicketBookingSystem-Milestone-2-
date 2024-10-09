package com.crimsonlogic.movieticketbookingsystem.util;

import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.Configurable;
import org.hibernate.id.IdentifierGenerator;
import java.io.Serializable;
import java.text.DecimalFormat;
import java.util.Properties;
import java.util.Random;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicInteger;

public class CustomPrefixIdentifierGenerator implements IdentifierGenerator, Configurable {
	private String prefix;
	private static final Random random = new Random();

	@Override
	public void configure(org.hibernate.type.Type type, Properties params,
			org.hibernate.service.ServiceRegistry serviceRegistry) {
		prefix = params.getProperty("prefix");
	}

	@Override
	public Serializable generate(SharedSessionContractImplementor session, Object object) throws HibernateException {
		int number = 10000 + random.nextInt(90000);

		String formattedNumber = new DecimalFormat("0000").format(number);

		return prefix + formattedNumber;

	}

}