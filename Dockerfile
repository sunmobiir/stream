FROM archlinux/archlinux
RUN pacman -Sy
RUN yes |  pacman --noconfirm -S sudo
RUN yes | sudo pacman --noconfirm -S gstreamer  gst-plugins-base-libs gst-libav gst-plugins-base gst-plugins-good gst-plugin-rswebrtc gst-plugin-webrtchttp
RUN yes | sudo pacman --noconfirm -S pulseaudio xorg-server-xvfb openbox 	chromium

RUN yes | sudo pacman --noconfirm -S dbus
RUN yes | sudo pacman --noconfirm -S noto-fonts
RUN ls
RUN usermod -a -G audio root
COPY openbox.xml /etc/openbox.xml
COPY policies.json /etc/chromium/policies/managed/policies.json
COPY tini /tini
RUN chmod +x /tini
COPY openbox.xml /root/.config/openbox/rc.xml
COPY openbox.xml /home/.config/openbox/rc.xml
RUN mkdir /work && cd /work


#RUN mkdir /work/dist
#COPY nekoroom /work/
#COPY neko17 /work/
#COPY nekoCommand.sh /work/nekosh.sh
#RUN sudo chmod +x /work/nekosh.sh



WORKDIR /work
#COPY x.sh /work
#RUN sudo chmod +x /work/x.sh
#COPY preferences.json /work/preferences.json
CMD ["/work/x.sh"]
