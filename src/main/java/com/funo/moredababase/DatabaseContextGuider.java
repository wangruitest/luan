package com.funo.moredababase;

import java.util.logging.Logger;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

public class DatabaseContextGuider extends AbstractRoutingDataSource {

	@Override
	protected Object determineCurrentLookupKey() {
		return MoreDatabaseUtils.getCurRoutingTag(false);
	}

	public Logger getParentLogger() {
		return null;
	}

}
