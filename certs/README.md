# Vault Certificates

## Development

Create self signed certificates for development purpose.

### Ubuntu Linux

Create a simple self signed certificate without additional CA.

``` sh
# create interactive a certificate
openssl req -x509 -newkey rsa:4096 -keyout key.pem -noenc -out cert.pem -sha256 -days 365
# create non encrypted key from encrypred key (only if you created without -noenc for password)
openssl rsa -in certs/key.pem -out certs/key2.pem
```