#!/bin/bash
###########################################################################
if [ -z $1 ]; then
    echo "usage: movetranslations.sh USERNAME"
    exit
fi
###########################################################################
username=$1
###########################################################################
root=$(pwd)
base="/android"
languages=("af" "ar" "ca" "cs" "da" "de" "el" "es-ES" "fa" "fi" "fr" "hi" "hu" "it" "ja" "ko" "nl" "no"     "pl" "pt-BR"  "ro" "ru" "sr" "sv-SE"  "th" "tr" "uk" "vi" "zh-CN"  "zh-HK"  "zh-TW")
values=(   "af" "ar" "ca" "cs" "da" "de" "el" "es"    "fa" "fi" "fr" "hi" "hu" "it" "ja" "ko" "nl" "nb-rNO" "pl" "pt-rBR" "ro" "ru" "sr" "sv-rSE" "th" "tr" "uk" "vi" "zh-rCN" "zh-rHK" "zh-rTW")
###########################################################################
core=${base}/frameworks/base/core/res/res/values
settings=${base}/packages/apps/Settings/res/values
systemui=${base}/frameworks/base/packages/SystemUI/res/values
telephony=${base}/packages/services/Telephony/res/values
screencast=${base}/packages/apps/Screencast/app/src/main/res/values
###########################################################################
cd ${base}
. build/envsetup.sh
cd ${root}
###########################################################################
for i in ${!languages[*]}; do
    #######################################################################
    echo "${languages[$i]}: [core]"
    mkdir -p ${core}-${values[$i]}/
    cp ${languages[$i]}/core/*.xml ${core}-${values[$i]}/
    #######################################################################
    echo "${languages[$i]}: [DeviceControl]"
    mkdir -p ${devicecontrol}-${values[$i]}/
    cp ${languages[$i]}/DeviceControl/*.xml ${devicecontrol}-${values[$i]}/
    #######################################################################
    echo "${languages[$i]}: [Settings]"
    mkdir -p ${settings}-${values[$i]}/
    cp ${languages[$i]}/Settings/*.xml ${settings}-${values[$i]}/
    #######################################################################
    echo "${languages[$i]}: [SystemUI]"
    mkdir -p ${systemui}-${values[$i]}/
    cp ${languages[$i]}/SystemUI/*.xml ${systemui}-${values[$i]}/
    #######################################################################
    echo "${languages[$i]}: [CustomLauncher3]"
    mkdir -p ${customlauncher}-${values[$i]}/
    cp ${languages[$i]}/CustomLauncher3/*.xml ${customlauncher}-${values[$i]}/
    #######################################################################
    echo "${languages[$i]}: [Telephony]"
    mkdir -p ${telephony}-${values[$i]}/
    cp ${languages[$i]}/services/Telephony/*.xml ${telephony}-${values[$i]}/
    #######################################################################
    echo "${languages[$i]}: [Screencast]"
    mkdir -p ${screencast}-${values[$i]}/
    cp ${languages[$i]}/Screencast/*.xml ${screencast}-${values[$i]}/
    #######################################################################
done
###########################################################################
cd ${base}/frameworks/base/
git add core/res/res/
git add packages/SystemUI/res/
git commit -m "automatic translation import"
addgerrit ${username}
gerritupload
###########################################################################
cd ${base}/packages/apps/DeviceControl/
git add app/src/main/res/
git commit -m "automatic translation import"
addgerrit ${username}
gerritupload
###########################################################################
cd ${base}/packages/apps/Settings/
git add res/
git commit -m "automatic translation import"
addgerrit ${username}
gerritupload
###########################################################################
cd ${base}/packages/services/Telephony/
git add res/
git commit -m "automatic translation import"
addgerrit ${username}
gerritupload
###########################################################################
cd ${base}/packages/apps/Screencast/
git add app/src/main/res/
git commit -m "automatic translation import"
addgerrit ${username}
gerritupload
###########################################################################
cd "${root}"
echo "DONE"
###########################################################################
