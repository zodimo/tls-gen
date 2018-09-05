 have created a docker Image that will clone the master repo of [michaelklishin/tls-gen](https://github.com/michaelklishin/tls-gen).
The following environment variables are available:

###For the Setup:
GEN_TYPE : Possible values : basic or separate_intermediates or separate_intermediates as the build options in the tls-gen repo
e.g `-e GEN_TYPE basic`

OUTPUTDIR : Path were to copy files for easy bind options, default is /opt/output
e.g `-e OUTPUTDIR /opt/output`

CA_CERTIFICATE : name and path ( relative to OUTPUTDIR or full path ) , default : ca_certificate.pem
e.g `-e CA_CERTIFICATE ca_certificate.pem`
CA_KEY : name and path ( relative to OUTPUTDIR or full path ) , default : ca_key.pem
e.g `-e CA_KEY ca_key.pem`
CLIENT_CERTIFICATE : name and path ( relative to OUTPUTDIR or full path ) , default : client_certificate.pem
e.g `-e CLIENT_CERTIFICATE client_certificate.pem`
CLIENT_KEY_PEM : name and path ( relative to OUTPUTDIR or full path ) , default : client_key.pem
e.g `-e CLIENT_CERTIFICATE client_certificate.pem`
CLIENT_KEY_P12 : name and path ( relative to OUTPUTDIR or full path ) , default : client_key.p12
e.g `-e CLIENT_KEY_P12 client_key.p12`
SERVER_CERTIFICATE : name and path ( relative to OUTPUTDIR or full path ) , default : server_certificate.pem
e.g `-e SERVER_CERTIFICATE server_certificate.pem`
SERVER_KEY_PEM : name and path ( relative to OUTPUTDIR or full path ) , default : server_key.pem
e.g `-e SERVER_KEY_PEM server_key.pem`
SERVER_KEY_P12 : name and path ( relative to OUTPUTDIR or full path ) , default : server_key.p12
e.g `-e SERVER_KEY_P12 server_key.p12`

#####The following two option is only relevant with -e GEN_TYPE separate_intermediates

CHAINED_CLIENT_CA_CERTIFICATE : name and path ( relative to OUTPUTDIR or full path ) , default :chained_client_ca_certificate.pem
e.g `-e CHAINED_CLIENT_CA_CERTIFICATE chained_client_ca_certificate.pem`
CHAINED_SERVER_CA_CERTIFICATE : name and path ( relative to OUTPUTDIR or full path ) , default : chained_server_ca_certificate.pem
e.g `-e CHAINED_SERVER_CA_CERTIFICATE chained_server_ca_certificate.pem`

#####The following option is only relevant with -e GEN_TYPE two_shared_intermediates
ENV CHAINED_CA_CERTIFICATE : name and path ( relative to OUTPUTDIR or full path ) , default : chained_ca_certificate.pem
e.g `-e CHAINED_CA_CERTIFICATE chained_ca_certificate.pem`

###For the "Make" process :

CN : Default is $(shell hostname)
CLIENT_ALT_NAME : Default is $(shell hostname)
SERVER_ALT_NAME : Default is $(shell hostname)
NUMBER_OF_PRIVATE_KEY_BITS : Default is 2048
DAYS_OF_VALIDITY : Default is 3650
ECC_CURVE : Default is "prime256v1"
USE_ECC: Default is false
PASSWORD : Default is ''
REGEN : Default is true

for more options check out https://github.com/michaelklishin/tls-gen

###Example :
`
docker container run --rm -v $(pwd):/opt/output -e GEN_TYPE=two_shared_intermediates zodimo/tls-gen
`