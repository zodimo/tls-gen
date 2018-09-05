I have created a docker Image that will clone the master repo of [michaelklishin/tls-gen](https://github.com/michaelklishin/tls-gen).
The following environment variables are available:

### For the Setup:

|Variable|description|Default value| Example |
|-|-|-|-|
| GEN_TYPE | Possible values : basic or separate_intermediates or separate_intermediates as the build options in the tls-gen repo |basic|`-e GEN_TYPE basic`|
| OUTPUTDIR | Path were to copy files for easy bind options | /opt/output |`-e OUTPUTDIR /opt/output`|

##### Certificate specific variables

|Variable|description|Default value| Example |
|-|-|-|-|
| CA_CERTIFICATE | name and path ( relative to OUTPUTDIR or full path ) | ca_certificate.pem | `-e CA_CERTIFICATE ca_certificate.pem` |
| CA_KEY | name and path ( relative to OUTPUTDIR or full path ) | ca_key.pem | `-e CA_KEY ca_key.pem` |
| CLIENT_CERTIFICATE | name and path ( relative to OUTPUTDIR or full path ) | client_certificate.pem | `-e CLIENT_CERTIFICATE client_certificate.pem` |
| CLIENT_KEY_PEM | name and path ( relative to OUTPUTDIR or full path ) | client_key.pem | `-e CLIENT_CERTIFICATE client_certificate.pem` |
| CLIENT_KEY_P12 | name and path ( relative to OUTPUTDIR or full path ) | client_key.p12 | `-e CLIENT_KEY_P12 client_key.p12` |
| SERVER_CERTIFICATE | name and path ( relative to OUTPUTDIR or full path ) | server_certificate.pem | `-e SERVER_CERTIFICATE server_certificate.pem` |
| SERVER_KEY_PEM | name and path ( relative to OUTPUTDIR or full path ) | server_key.pem | `-e SERVER_KEY_PEM server_key.pem` |
| SERVER_KEY_P12 | name and path ( relative to OUTPUTDIR or full path ) | server_key.p12 | `-e SERVER_KEY_P12 server_key.p12` |

##### The following two option is only relevant with -e GEN_TYPE separate_intermediates
|Variable|description|Default value| Example |
|-|-|-|-|
| CHAINED_CLIENT_CA_CERTIFICATE | name and path ( relative to OUTPUTDIR or full path ) | chained_client_ca_certificate.pem | `-e CHAINED_CLIENT_CA_CERTIFICATE chained_client_ca_certificate.pem` |
| CHAINED_SERVER_CA_CERTIFICATE | name and path ( relative to OUTPUTDIR or full path ) | chained_server_ca_certificate.pem | `-e CHAINED_SERVER_CA_CERTIFICATE chained_server_ca_certificate.pem` |

##### The following option is only relevant with -e GEN_TYPE two_shared_intermediates
|Variable|description|Default value| Example |
|-|-|-|-|
| ENV CHAINED_CA_CERTIFICATE | name and path ( relative to OUTPUTDIR or full path ) | chained_ca_certificate.pem | `-e CHAINED_CA_CERTIFICATE chained_ca_certificate.pem` |

### For the "Make" process 
Defaults as defined in the respective make files.

|Variable|Default value|
|-|-|
| CN | $(shell hostname) |
| CLIENT_ALT_NAME | $(shell hostname) |
| SERVER_ALT_NAME | $(shell hostname) |
| NUMBER_OF_PRIVATE_KEY_BITS | 2048 |
| DAYS_OF_VALIDITY | 3650 |
| ECC_CURVE | "prime256v1" |
| USE_ECC | false |
| PASSWORD | '' |
| REGEN | true |

for more options check out [michaelklishin/tls-gen](https://github.com/michaelklishin/tls-gen)

### Example :
`
docker container run --rm -v $(pwd):/opt/output -e GEN_TYPE=two_shared_intermediates zodimo/tls-gen
`