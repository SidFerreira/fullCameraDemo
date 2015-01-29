#!/bin/sh


pluginPath="./plugins/br.com.ferreiraz.fullcamera/"
pathConfig="${pluginPath}plugin.xml"
pathConfigHeader="${pluginPath}plugin-header.xml"

iosPathConfig="${pluginPath}plugin-ios.xml"

androidPathConfig="${pluginPath}plugin-android.xml"
androidPathSources="${pluginPath}src/android/sources"
androidPathResources="${pluginPath}src/android/resources"

androidPathFullcamera="${pluginPath}src/android/fullcamera"
androidPathEcogallery="${androidPathFullcamera}/ecogallery"
androidPathLibs="${androidPathFullcamera}/libs"

rm -rf ${androidPathFullcamera}

mkdir -p ${androidPathLibs}
mkdir -p ${androidPathEcogallery}

cp -a ./../FullCamAndroid/app/src/main/   ${androidPathFullcamera}
cp -a ./../FullCamAndroid/ecogallery/src/main/   ${androidPathEcogallery}
cp -a ./../FullCamAndroid/app/libs/*   ${androidPathLibs}

mv ${androidPathFullcamera}/java ${androidPathFullcamera}/src
mv ${androidPathEcogallery}/java ${androidPathEcogallery}/src


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
echo "" >> ${androidPathConfig}
echo "    </platform>" >> ${androidPathConfig}

cat ${pathConfigHeader} > ${pathConfig}
echo "" >> ${pathConfig}
cat ${androidPathConfig} >> ${pathConfig}
echo "" >> ${pathConfig}
echo "</plugin>" >> ${pathConfig}
