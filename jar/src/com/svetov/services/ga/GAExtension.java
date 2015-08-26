package com.svetov.services.ga;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;

public class GAExtension implements FREExtension {

	@Override
	public FREContext createContext(String arg0) {
		return new GAContext();
	}

	@Override
	public void dispose() {
		// TODO Auto-generated method stub

	}

	@Override
	public void initialize() {
		// TODO Auto-generated method stub

	}

}
