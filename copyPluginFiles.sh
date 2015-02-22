#!/bin/sh

reverseDomain="br.com.ferreiraz.fullcamera"
pluginPath="./plugins/${reverseDomain}/"
pathConfig="${pluginPath}plugin.xml"
pathConfigHeader="${pluginPath}plugin-header.xml"

iosPathConfig="${pluginPath}plugin-ios.xml"

androidPath="${pluginPath}src/android"

androidPathConfig="${pluginPath}plugin-android.xml"
androidPathSources="${pluginPath}src/android/sources"
androidPathResources="${pluginPath}src/android/resources"

androidPathFullcamera="${androidPath}/fullcamera"
androidPathLibs="${androidPathFullcamera}/libs"

androidPathEcogallery="${androidPath}/ecogallery"

androidPathMediaChooserlib="${androidPath}/mediaChooserlib"
androidPathMediaChooserlibLibs="${androidPathMediaChooserlib}/libs"

rm -rf ${androidPath}

mkdir -p ${androidPathLibs}
mkdir -p ${androidPathMediaChooserlibLibs}
mkdir -p ${androidPathEcogallery}

cp -a ./../FullCamAndroid/fullCamera/src/main/   ${androidPathFullcamera}
cp -a ./../FullCamAndroid/fullCamera/libs/*   ${androidPathLibs}
mv ${androidPathFullcamera}/java ${androidPathFullcamera}/src

cp -a ./../FullCamAndroid/ecogallery/src/main/   ${androidPathEcogallery}
mv ${androidPathEcogallery}/java ${androidPathEcogallery}/src

cp -a ./../FullCamAndroid/mediaChooserlib/src/main/   ${androidPathMediaChooserlib}
cp -a ./../FullCamAndroid/mediaChooserlib/libs/*   ${androidPathMediaChooserlibLibs}

mv ${androidPathMediaChooserlib}/java ${androidPathMediaChooserlib}/src


echo "    <platform name=\"android\">" > ${androidPathConfig}
echo "        <config-file target=\"res/xml/config.xml\" parent=\"/*\">" >> ${androidPathConfig}
echo "            <feature name=\"FullCamera\">" >> ${androidPathConfig}
echo "                <param name=\"android-package\" value=\"br.com.ferreiraz.fullCameraLauncher.FullCameraLauncher\"/>" >> ${androidPathConfig}
echo "            </feature>" >> ${androidPathConfig}
echo "        </config-file>" >> ${androidPathConfig}
echo "" >> ${androidPathConfig}
echo "        <source-file src=\"launchers/FullCameraLauncher.java\" target-dir=\"src/br/com/ferreiraz/fullCameraLauncher\" />" >> ${androidPathConfig}
echo "" >> ${androidPathConfig}
echo "        <config-file target=\"AndroidManifest.xml\" parent=\"/manifest\">" >> ${androidPathConfig}
echo "            <uses-permission android:name=\"android.permission.CAMERA\" />" >> ${androidPathConfig}
echo "            <uses-permission android:name=\"android.permission.WRITE_EXTERNAL_STORAGE\" />" >> ${androidPathConfig}
echo "            <uses-permission android:name=\"android.permission.RECORD_AUDIO\" />" >> ${androidPathConfig}
echo "            <uses-feature android:name=\"android.hardware.camera\" />" >> ${androidPathConfig}
echo "            <uses-feature android:name=\"android.hardware.camera.autofocus\" />" >> ${androidPathConfig}
echo "        </config-file>" >> ${androidPathConfig}
echo "" >> ${androidPathConfig}
echo "        <config-file target=\"AndroidManifest.xml\" parent=\"/manifest/application\">" >> ${androidPathConfig}
echo "        <activity" >> ${androidPathConfig}
echo "            android:theme=\"@android:style/Theme.Light.NoTitleBar\"" >> ${androidPathConfig}
echo "            android:name=\"br.com.ferreiraz.fullcamera.FullCameraActivity\"" >> ${androidPathConfig}
echo "            android:label=\"@string/full_camera\" >" >> ${androidPathConfig}
echo "        </activity>" >> ${androidPathConfig}
echo "        </config-file>" >> ${androidPathConfig}
echo "" >> ${androidPathConfig}
echo "        <framework src=\"src/android/fullcamera\" custom=\"true\" />" >> ${androidPathConfig}
echo "        <framework src=\"src/android/ecogallery\" custom=\"true\" />" >> ${androidPathConfig}
echo "        <framework src=\"src/android/mediaChooserlib\" custom=\"true\" />" >> ${androidPathConfig}
echo "        <info>" >> ${androidPathConfig}
echo "        You need to install __Google Play Services__ from the `Android Extras` section using the Android SDK manager (run `android`)." >> ${androidPathConfig}
echo "        You need to add the following line to the `local.properties`:" >> ${androidPathConfig}
echo "        android.library.reference.1=PATH_TO_ANDROID_SDK/sdk/extras/google/google_play_services/libproject/google-play-services_lib" >> ${androidPathConfig}
echo "        </info>" >> ${androidPathConfig}
echo "        <hook type=\"before_build\" src=\"scripts/fixProjectProperties.js\" />" >> ${androidPathConfig}
echo "" >> ${androidPathConfig}
echo "    </platform>" >> ${androidPathConfig}

cat ${pathConfigHeader} > ${pathConfig}
echo "" >> ${pathConfig}
cat ${androidPathConfig} >> ${pathConfig}
echo "" >> ${pathConfig}
echo "</plugin>" >> ${pathConfig}
