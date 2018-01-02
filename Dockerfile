FROM alpine:latest

RUN apk --update add bash rsync inotify-tools git openssh && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/* && \
	mkdir -p /opt && \
	cd /opt && \
	git clone -b "stable" https://github.com/deajan/osync
	
ADD osync.conf /etc/

ENTRYPOINT ["/opt/osync/osync.sh"]
CMD ["/etc/osync.conf", "--on-changes"]