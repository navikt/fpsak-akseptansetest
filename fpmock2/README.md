

mvn -U -B -Drevision=1.0 -DinstallAtEnd=true -Dfile.encoding=UTF-8 -Djava.security.egd=file:///dev/urandom clean install

docker build --pull -t repo.adeo.no:5443/fpmock2 .


