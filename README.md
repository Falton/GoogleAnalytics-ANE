# GoogleAnalytics-ANE
Google Analytics for AIR Native Extension 

Bridge to track mobile users via google analytics from flash projects.

google skd setup in the jar 
<uses-sdk android:minSdkVersion="8" android:targetSdkVersion="18" />

Usage:
xxxx-app.xml
add inside manifest
```
<application>
	<meta-data android:name="com.google.android.gms.games.APP_ID" android:value="\ APPLICATION_ID" />
	<activity android:name="com.freshplanet.googleplaygames.SignInActivity" android:theme="@android:style/Theme.Translucent.NoTitleBar.Fullscreen" />
	</application>
```
change APPLICATION_ID to your value should be about 11 digit long number, make sure there is a space between \ and your number

add the folowing after ```</android>``` tag
```
  <extensions>
    <extensionID>com.svetov.services.ga</extensionID>
  </extensions>
```
in code
```
import com.svetov.services.ga.GAInterface;
GAInterface.getInstance().trackingId = "UA-XXXXXXX-X";       // once in the beggining of the application

GAInterface.getInstance().trackView("VIEW NAME");
GAInterface.getInstance().trackEvent("Category", "Action", "Lable", value)
```

