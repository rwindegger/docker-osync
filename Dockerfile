FROM alpine:latest

RUN apk --update add bash git openssh && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/* && \
	mkdir -p /tmp && \
	cd /tmp && \
	git clone -b "stable" https://github.com/deajan/osync && \
	cd osync && \
	bash install.sh && \
	cd ~ && \
	rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/* && \
	rm -rf /tmp/*
	
ADD osync.conf /etc/

ENTRYPOINT ["bash osync.sh"]
CMD ["/etc/osync.conf --on-changes"]