rm *.pem

# 1. Generate CA's private key and self-signed certificate
openssl req -x509 -newkey rsa:4096 -days 365 -nodes -keyout ca-key.pem -out ca-cert.pem \
    -subj "/C=CN/ST=Sichuan/L=Chengdu/O=ZYG/OU=Cloud/CN=*.zyg.cloud/emailAddress=heavenwing@msn.com"

echo "CA's self-signed certificate"
openssl x509 -in ca-cert.pem -noout -text

# 2. Generate web server's private key and certificate signing request (CSR)
openssl req -newkey rsa:4096 -nodes -keyout server-key.pem -out server-req.pem \
    -subj "/C=CN/ST=Sichuan/L=Chengdu/O=ZYG/OU=GRPC/CN=grpc.zyg.cloud/emailAddress=heavenwing@msn.com"

# 3. Use CA's private key to sign web server's CSR and get back the signed certificate
openssl x509 -req -in server-req.pem -days 60 -CA ca-cert.pem -CAkey ca-key.pem -CAcreateserial -out server-cert.pem -extfile server-ext.cnf

echo "Server's signed certificate"
openssl x509 -in server-cert.pem -noout -text

# 4. Generate client's private key and certificate signing request (CSR)
openssl req -new -newkey rsa:4096 -keyout client-key.pem -out client-req.pem -nodes -subj '/CN=My Client'

# 5. Use CA's private key to sign client's CSR and get back the signed certificate
openssl x509 -req -sha256 -days 365 -in client-req.pem -CA ca-cert.pem -CAkey ca-key.pem -set_serial 02 -out client-cert.pem

echo "Client's signed certificate"
openssl x509 -in client-cert.pem -noout -text