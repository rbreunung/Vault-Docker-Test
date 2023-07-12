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

