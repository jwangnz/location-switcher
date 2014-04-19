install:
	if [ -f ~/Library/LaunchAgents/tsing.update-location.plist ]; then \
		launchctl remove tsing.update-location; \
	fi;
	cp tsing.update-location.plist ~/Library/LaunchAgents
	cp update-location.sh ~/bin
	launchctl load -w ~/Library/LaunchAgents/tsing.update-location.plist

