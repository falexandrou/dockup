FROM alpine
MAINTAINER Fotis Alexandrou <fotis@ezploy.io>, Borja Burgos <borja@tutum.co>, Mia Iversen <mia@chillfox.com>

RUN apk update && apk add groff py-pip
RUN pip install awscli

ADD backup.sh /bin/backup
ADD restore.sh /bin/restore

RUN chmod +x /bin/backup
RUN chmod +x /bin/restore

ENV S3_BUCKET_NAME docker-backups.example.com
ENV AWS_ACCESS_KEY_ID **DefineMe**
ENV AWS_SECRET_ACCESS_KEY **DefineMe**
ENV AWS_DEFAULT_REGION us-east-1
ENV PATHS_TO_BACKUP /paths/to/backup
ENV BACKUP_NAME backup
ENV RESTORE false