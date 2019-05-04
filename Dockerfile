FROM node:latest

RUN npm install -g json-server
USER 0
WORKDIR /home/node

EXPOSE 3000
ADD run.sh /home/node
ADD db.json /home/node
ADD gsutil /home/node/gsutil
ADD Syncbackup.sh /home/node
RUN chmod 777 -R .
ENTRYPOINT ["bash", "run.sh"]
CMD ["db.json"]
