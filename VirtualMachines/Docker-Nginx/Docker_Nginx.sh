# Generate Files
mkdir source
echo "Nginx Docker Test Home Page!" >> source/index.html

echo "FROM nginx" > Dockerfile
echo "COPY source /usr/share/nginx/html" >> Dockerfile
echo "" >> Dockerfile
echo "EXPOSE 80" >> Dockerfile

# Build Image from Dockerfile
docker build -t ngninx-image01 .

# Run Container at port 80
docker run --name test-site01 -d -p 80:80 ngninx-image01

# Turns on Logs, ctrl+c to quit
docker logs -f test-site01
