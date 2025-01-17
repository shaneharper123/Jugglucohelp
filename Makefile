JUGGLUCOPATH=/home/jka/src/android/Glucodata

all: html.xml
html2xml: html2xml.cpp
	 g++ -I${JUGGLUCOPATH}/Common/src/main/cpp -I${JUGGLUCOPATH}/Common/src/main/cpp/share -g -std=c++20 $^ -o $@
#	g++ -g -std=c++20 html2xml.cpp -o html2xml


FILES=ringtone.html reminders.html connectionoverview.html addconnection.html locationpermission.html introhelp.html searchhelp.html shortcuthelp.html labelhelp.html settinghelp.html sensorhelp.html kerfstok.html   getlib.html newlabelhelp.html battery.html nutrients.html mealhelp.html colorhelp.html stathelp.html alarmhelp.html flashpermission.html nearbypermission.html watchinfo.html wearosinfo.html about.html disturbhelp.html libreview.html garminconfig.html librenumhelp.html setlibrenumtype.html  floatingconfig.html getaccountidhelp.html Nightscouthelp.html NightPost.html notificationpermission.html staticnum.html talkhelp.html nightnumhelp.html helpexport.html newamount.html healthpermission.html IOB.html  changestart.html camerapermission.html

#html.xml:ringtone.html reminders.html connectionoverview.html addconnection.html locationpermission.html introhelp.html searchhelp.html shortcuthelp.html labelhelp.html settinghelp.html sensorhelp.html kerfstok.html   getlib.html newlabelhelp.html battery.html nutrients.html mealhelp.html colorhelp.html stathelp.html alarmhelp.html flashpermission.html nearbypermission.html watchinfo.html wearosinfo.html about.html disturbhelp.html libreview.html garminconfig.html librenumhelp.html setlibrenumtype.html 


html.xml: Makefile html2xml ${FILES} 
	 ./html2xml ${FILES} > $@

install: html.xml
	mkdir -p ${JUGGLUCOPATH}/Common/src/mobile/res/values
	cp html.xml ${JUGGLUCOPATH}/Common/src/mobile/res/values

helptexts.zip: ${FILES}
	 zip  $@ $^ 

files:
	@echo ${FILES}

links.html:${FILES}
	@sh mklinks.sh $^ > $@
help: helptexts.zip 
	make -C de dehelptexts.zip 
	make -C nl nlhelptexts.zip 
	make -C it ithelptexts.zip 
	make -C pt pthelptexts.zip 
	cp helptexts.zip pt/pthelptexts.zip de/dehelptexts.zip nl/nlhelptexts.zip it/ithelptexts.zip /home/jka/html/j-kaltes.github.io/Juggluco/translation


	
