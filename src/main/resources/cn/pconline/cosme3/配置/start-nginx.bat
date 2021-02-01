@ECHO OFF
cd D:\nginx-1.4.3
set NGINX_HOME=D:\nginx-1.4.3
set NGINX_CONF=conf/nginx_cosme_ssl.conf
start nginx.exe -c %NGINX_CONF%
ping 127.0.0.1 -n 1>NUL
echo Starting nginx
echo .
echo .
echo .
ping 127.0.0.1 >NUL
EXIT