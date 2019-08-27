pknc.pkg: install.sh pknc.m4 pknc.rb postinstall.m4 preinstall.m4 uninstall.m4
	./install.sh

install: pknc.pkg
	sudo /usr/sbin/installer -pkg ./pknc.pkg -target /

uninstall:
	sudo /usr/local/share/pknc/uninstall
clean:
	rm -rf payload Scripts

reallyclean: clean
	rm -f pknc.pkg
test:
	./install.sh -d
