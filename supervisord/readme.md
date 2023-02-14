cd docker/supervisord
docker build -t mysupervisord .
docker run -p 22 -p 80 -t -i mysupervisord
