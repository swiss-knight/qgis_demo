# Testing QGIS server

First, make sure to copy the two samples files:

```sh
cp .env.sample .env` 
cp conf/pg_service.conf.sample conf/pg_service.conf
```
Then, adjust the values that are currently `CHANGEME` to suit your local environment.

Finally build and run the app by executing:

```
./reset.sh
```

(make sure this script is executable).

Keep an eye on the database logs during testing.
