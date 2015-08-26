package com.svetov.services.ga;

import java.util.HashMap;
import java.util.Map;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;

public class GAContext extends FREContext {

	@Override
	public void dispose() {
		// TODO Auto-generated method stub

	}

	@Override
	public Map<String, FREFunction> getFunctions() {
		Map<String, FREFunction> map= new HashMap<String, FREFunction>();
		
		map.put("trackView", new TrackViewFunction());
		map.put("trackEvent", new TrackEventFunction());
		
		return map;
	}

}
