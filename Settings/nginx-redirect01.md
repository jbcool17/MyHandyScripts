#Redirecting(301) http://blog.site.com to http://www.site.com/blog

### Setup hosts file: blog to localhost
/etc/hosts
```shell
127.0.0.1 theblog
```


### Wordpress .env
```shell
WP_HOME=http://site.com/blog/
WP_SITEURL=http://site.com/blog/wp
```


### NGINX SITE CONFIG: theblog-redirect
- redirects blog.site.com to site.com/blog
```shell
server {
        listen 80;
        listen [::]:80;
        server_name blog.site.com;
        return 301 $scheme://site.com/blog$request_uri;
}
```

### NGINX SITE CONFIG | Basic Settings: site.com
- site.com
```shell
server {
	listen 80;
	root /var/www/html/test;
	server_name site.com;

	location /blog {
		proxy_pass http://theblog;
   	}
}
```

### Basic Blog Nginx Config: theblog
- points blog to /blog
```shell
server {
	listen 80;
	
	root /var/www/html/theblog/web; 
	index index.php index.html index.htm;
	
	server_name theblog;

	location / {
        	try_files $uri $uri/ =404;	
   	}

	rewrite ^/blog(.*)$ $1 break;
		
}
```
