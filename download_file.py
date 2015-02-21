import os, sys, re, requests
import urllib2, urllib
from BeautifulSoup import BeautifulSoup, SoupStrainer

# Supported file formats
FORMATS = ['mp3', 'png', 'jpg']

# Colors
HEADER = '\033[95m'
OKBLUE = '\033[94m'
OKGREEN = '\033[92m'
WARNING = '\033[93m'
FAIL = '\033[91m'
ENDC = '\033[0m'
BOLD = '\033[1m'
UNDERLINE = '\033[4m'

# Usage policy
USAGE = OKGREEN + \
        "##########################################################\n" + \
        "#                    File downloader                     #\n" + \
        "##########################################################\n" + \
        "[x] Download files of a given format from a webpage\n" + \
        "[x] File should accessible by a direct download link (no redirection)\n"+ \
        "[x] Supported file formats: " + str(FORMATS) + "\n\n" + \
        "Usage: \n" + "\tdownload_file" + " <URL> <format>" + ENDC + "\n"

# Checks if the file already exists in the current directory
def if_file_exists(file_name):
    return os.path.isfile(file_name)

# Downloads the given url
def download_file(url):
    try:
        file_name = urllib.unquote(url.split('/')[-1]).decode('utf8')

        if if_file_exists(file_name):
            return False

        u = urllib2.urlopen(url)
        f = open(file_name, 'wb')
        meta = u.info()
        file_size = int(meta.getheaders("Content-Length")[0])
        print ("%s[Downloading]: %s Bytes: %s %s" % \
                 (OKBLUE, file_name, file_size, ENDC))

        file_size_dl = 0
        block_sz = 8192
        while True:
            buffer = u.read(block_sz)
            if not buffer:
                break

            file_size_dl += len(buffer)
            f.write(buffer)
            status = "%s %5d  [%3.2f%%]%s" % \
                (OKBLUE, file_size_dl, \
                file_size_dl * 100. / file_size, ENDC)

            status = status + chr(8)*(len(status)+1)
            print status,

        f.close()
        return True

    except requests.exceptions.RequestException as e:
        sys.exit("%s Exception %s %s" % (FAIL, e, ENDC))

# Fetches URLs of given format from the webpage source
def get_urls(source, format):
    dom = BeautifulSoup(source, parseOnlyThese=SoupStrainer('a'))
    reg = "\." + format + "$"
    tags = dom.findAll(href=re.compile(reg))
    url_list = []
    for url in tags:
        url_list.append(url.get('href'))
    return url_list

# Coordinates download 
def download_all(url, format):
    file_url_list = []
    try:
        r = requests.get(url)
        url_list = get_urls(r.text, format)
        for url in url_list:
            if (download_file(url)):
                print ("%s%s [Successfully downloaded]%s" % \
                        (OKGREEN, \
                        urllib.unquote(url.split('/')[-1]).decode('utf8'), \
                        ENDC))
            else:
                print ("%sFile %s [Already Exist]%s" % \
                        (WARNING,
                        urllib.unquote(url.split('/')[-1]).decode('utf8'), \
                        ENDC))
    except requests.exceptions.RequestException as e:
        sys.exit("%s Exception %s %s" % (FAIL, e, ENDC))
        

if len(sys.argv) < 3:
    sys.exit(USAGE)
 
else:
    url = sys.argv[1]
    format = sys.argv[2]

    # Check for file format support
    if format in FORMATS:
        download_all(url, format)
    else:
        sys.exit(USAGE)
