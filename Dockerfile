FROM kibana:5.5.2

COPY kibana.zip /thePlugin/

RUN kibana-plugin install file:///thePlugin/kibana.zip

RUN mkdir /config && \
    mv /usr/share/kibana/plugins/logtrail/logtrail.json /config/logtrail.json && \
    ln -s /config/logtrail.json /usr/share/kibana/plugins/logtrail/logtrail.json
COPY logtrail.json /config/