# certbot
半自动化的Let's Encrypt证书申请和更新docker，该工具主要是为在Let's Encrypt上申请通配符或者多域名证书。

以申请通配符域名证书为例：

docker run -itd image_id
docker exec -it container_id sh
进入docker之后，执行下面命令
certbot certonly  -d *.your.domain --manual --preferred-challenges dns --server https://acme-v02.api.letsencrypt.org/directory
