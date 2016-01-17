# GoogleAnalytics-ANE
Google Analytics for AIR Native Extension 
Works fro both Android and iOS builds
same changes are required for both builds

Bridge to track mobile users via google analytics from flash projects.

google skd setup in the jar 
<uses-sdk android:minSdkVersion="8" android:targetSdkVersion="18" />

Usage:
xxxx-app.xml
inside ```<![CDATA[<manifest ...```
add
```<uses-permission android:name="android.permission.INTERNET"/>```

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

You might have to make xxxx-app.xml read only after changes since Flash likes to rebuild that file and might override your changes if the file is not read only.
