FROM confluentinc/cp-kafka-connect:5.2.2

RUN apt-get update && \
	apt-get install -y --force-yes python3 python3-pip && \
	pip3 install requests datadog
