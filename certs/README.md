# Selfsigned Certificates

Create self signed certificates with an CA for home network or development purpose.

- all steps tested with openssl on Ubuntu Linux in WSL
- steps expect configuration files from this directory

## Create CA once

Create a CA key and a self signed certificate valid for 10 years.

``` sh
openssl req -x509 -newkey rsa:4096 -nodes -keyout ca-key.pem -out ca-cert.pem -config ca-cert.cnf -days 3650
```

Review the created key.

``` sh
openssl rsa -in ca-key.pem -text -noout
```

Review the CA certificate.

``` sh
openssl x509 -in ca-cert.pem  -text -noout
```

Verify the CA against itself.

``` sh
openssl verify -CAfile ca-cert.pem -show_chain  ca-cert.pem
```

Example Output

```` text
ca-cert.pem: OK
Chain:
depth=0: C = DE, ST = Brandenburg, L = Potsdam, O = Antronet Securities, OU = Homebrew Security Core, CN = fritz.box, emailAddress = rbreunung@gmail.com
````

## Create new Service Certificates

Before executing the commands ensure to adapt the `server*.cnf` files to the values of the corresponfing server.

Create private key and CSR in one step.

``` sh
openssl req -new -newkey rsa:2048 -config server-cert-req.cnf -nodes -keyout server-key.pem -out server-req.pem
```

Create a signed certificate with a 365 days valid signature and a random serial number.

``` sh
openssl x509 -req -days 365 -CAcreateserial -extfile server-cert.cnf -in server-req.pem -out server-cert.pem -CA ca-cert.pem -CAkey ca-key.pem
```

Verify the certificate chain.

``` sh
openssl verify -CAfile ca-cert.pem -show_chain server-cert.pem
```

Example Output

``` text
server-cert.pem: OK
Chain:
depth=0: C = DE, ST = Brandenburg, L = Potsdam, O = Antronet Securities, OU = Homebrew Division, CN = localhost, emailAddress = rbreunung@gmail.com (untrusted)
depth=1: C = DE, ST = Brandenburg, L = Potsdam, O = Antronet Securities, OU = Homebrew Security Core, CN = fritz.box, emailAddress = rbreunung@gmail.com
```

## Just a Self Signed Certificate

If everything is to complex, then this is the short way. Only key and self signed certificate. No CA or CSR magic in between.

``` sh
openssl req -x509 -newkey rsa:2048 -nodes -keyout key.pem  -days 365 -out cert.pem -subj '/CN=localhost'
```
