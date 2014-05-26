#!/usr/bin/env python3
import sys
import datetime
import urllib.request
import requests
from xml.dom.minidom import parseString
import os
import hashlib
import zlib
import re

debug = False
if 'debug' in sys.argv:
    debug = True
img_path = os.path.expanduser('~/.background.jpg')


def setbg():
    os.system('nitrogen --restore &>/dev/null 2>&1')


def printd(msg):
    if debug:
        print(msg)


def nasalarge():
    main_url = 'http://www.nasa.gov/rss/dyn/lg_image_of_the_day.rss'
    printd('Getting: ' + main_url)
    rss = urllib.request.urlopen(main_url).read()
    try:
        xml = parseString(rss)
    except:
        rss = zlib.decompress(rss, 15+32)
        xml = parseString(rss)
    img_url = xml.getElementsByTagName('enclosure')[0].getAttribute('url')
    printd('Getting: ' + img_url)
    return img_url


def astro():
    main_url = 'http://apod.nasa.gov/apod/astropix.html'
    printd('Getting: ' + main_url)
    html = requests.get(main_url).text
    try:
        href = re.findall('a href ?= ?"(.*\.(?:jpg|png))"', html, re.IGNORECASE)[0]
    except IndexError:
        printd('No pictures today')
        return
    if 'http' in href:
        img_url = href
    else:
        img_url = 'http://apod.nasa.gov/apod/' + href
    printd('Getting: ' + img_url)
    return img_url

if 'update' in sys.argv:

    try:
        with open(img_path, 'rb') as f:
            oldhash = hashlib.md5(f.read()).hexdigest()
    except:
        oldhash = ""

    if 'please' in sys.argv or not os.path.isfile(img_path) \
            or datetime.datetime.now() \
            - datetime.datetime.fromtimestamp(os.stat(img_path).st_mtime)\
            > datetime.timedelta(hours=12):
        img_url = astro()
        if not img_url:
            printd('No image url. Exiting...')
            sys.exit(0)
        new_img = urllib.request.urlopen(img_url).read()
        if hashlib.md5(new_img).hexdigest() != oldhash:
            with open(img_path, 'wb') as f:
                f.write(new_img)
        else:
            printd('Same image')
    else:
        printd('Image too new')

    setbg()
