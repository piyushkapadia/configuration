# importing the modules
import sys
import requests
from bs4 import BeautifulSoup

# total arguments
n = len(sys.argv)

if n < 2:
    # exits the program
    sys.exit("URL must be provided as argument")    
    # target url
url = sys.argv[1]
title_list = []

try:
    # making requests instance
    reqs = requests.get(url)
    
    # using the BeaitifulSoup module
    soup = BeautifulSoup(reqs.text, 'html.parser')


    # Displaying the title
    for title in soup.find_all('title'):
        title_list.append(title.get_text())
except OSError as error:
    print("OS error: {0}".format(error))
except MissingSchema as error:
    print("Missing Schema error: {0}".format(error))
except BaseException as error:
    print("Base error: {0}".format(error))


if len(title_list) > 0:
    print(title_list[0])
else:
    print("No Title Found")
