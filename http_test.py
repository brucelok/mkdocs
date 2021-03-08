# the script to test http://127.0.0.1:8000 if the MkDocs service is up
# lok.bruce@gmail.com
import sys
import urllib2
from urllib2 import URLError, HTTPError

url = 'http://127.0.0.1:8000'
response = urllib2.Request(url)

try:
    data = urllib2.urlopen(response)
    status_code = data.getcode()
    the_page = data.read()
    print(url + ", status code: " + str(status_code))

except HTTPError, err:
    print (err.code, err.reason)
    sys.exit(2)

except URLError as err:
    print (err.reason)
    sys.exit(2)
