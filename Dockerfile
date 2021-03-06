#��� �������� ������
FROM golang:1.10

#������� �����, ��� ����� ���� ���������
RUN mkdir -p /go/src/eekrupin.com/app-hello-docker

#���� � �����
WORKDIR /go/src/eekrupin.com/app-hello-docker

#�������� ��� ����� �� �������� ���� � ����� Docker �� ����� ������� � ���� ����� ����� ������
COPY . /go/src/eekrupin.com/app-hello-docker

#��������� ��������� ������ ����� ������, ������� ������������� �������� docker
#RUN go-wrapper download
RUN go get -d -v ./...

#������������ ��� ������ � ���� ���������
#RUN go-wrapper install
RUN go install -v ./...

#��������� ���� ��������� ����� ��� �� ������, ����� �� �������� �� �� ����������������� �����
#-web - ��� ��������, ������������ ����� ��������� ��� �������, ����� ���������� ����� ���� ������� ������
#go-wrapper ��������� set -x ��� ����, ����� ��������� � stderr ��� ��������� ����� ��������� � ������ �� ������� 
CMD ["go-wrapper", "run", "-web"]

#������������ ���� ����� ��������� ������ ������
EXPOSE 8000