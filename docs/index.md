# Query Mac API
The project demonstrates the simple API in Python to query Mac address from https://macaddress.io, and return the vendor name associated with Mac address.

The python script accepts 2 arguments:
1. your API key from macaddress.io
2. the target mac address you lookup

## Prerequisites
* Python >= 2.7
* Docker >= 19.0

## Clone the project to local
```
$ git clone https://gitlab.com/lok.bruce/query-mac-api.git
```

## Two ways to run the program:

### 1. Standard CLI
your can simply run it from your Linux terminal
```
$ python macapi.py your_api_key a4:83:e7:7a:0b:8c
Apple, Inc
```

### 2. Run from Docker container
1. first build the light Python image from the Dockerfile
```
$ docker build -t apitest .
```

2. Docker run now
```
$ docker run --rm apitest your_api_key a4:83:e7:8b:0c:9b
Apple, Inc
```

## A sample API return from https://macaddress.io
```
$ curl -s -X GET "https://api.macaddress.io/v1?apiKey=xxxxxxxxxxxxxxxxxxxxxxx&output=json&search=70:81:05:d2:25:0d" | python -mjson.tool
{
    "blockDetails": {
        "assignmentBlockSize": "MA-L",
        "blockFound": true,
        "blockSize": 16777216,
        "borderLeft": "708105000000",
        "borderRight": "708105FFFFFF",
        "dateCreated": "2011-07-26",
        "dateUpdated": "2015-09-27"
    },
    "macAddressDetails": {
        "administrationType": "UAA",
        "applications": [],
        "comment": "",
        "isValid": true,
        "searchTerm": "70:81:05:d2:25:0d",
        "transmissionType": "unicast",
        "virtualMachine": "Not detected",
        "wiresharkNotes": "No details"
    },
    "vendorDetails": {
        "companyAddress": "80 West Tasman Drive San Jose CA 94568 US",
        "companyName": "Cisco Systems, Inc",
        "countryCode": "US",
        "isPrivate": false,
        "oui": "708105"
    }
}
```
