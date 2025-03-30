version: 0.1
log:
  fields:
    service: registry
storage:
  cache:
    blobdescriptor: inmemory
  s3:
    region: ap-southeast-1
    bucket: bsentika3-razer-registry-test
    accesskey: $S3_ACCESS_KEY
    secretkey: $S3_SECRET_KEY
http:
  addr: :5000
  headers:
    X-Content-Type-Options: [nosniff]
auth:
  htpasswd:
    realm: basic-realm
    path: /etc/htpasswd-registry
health:
  storagedriver:
    enabled: true
    interval: 10s
    threshold: 3