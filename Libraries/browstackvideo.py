from robot.libraries.BuiltIn import BuiltIn
import requests
from robot.api import logger
import sys
import datetime
import urllib3
import imp
import json

def browserstackvideo():
    driver = BuiltIn().get_variables()['${browserid}']  
    browserstack_URL = f"https://api-cloud.browserstack.com/automate/sessions/{driver}"
    b_response = requests.get(browserstack_URL, auth=('dharmendra_iZxJCD', 'WL1C9s3WYAfRJb9wTzpz')).json()
    b_videolink = b_response['automation_session']['public_url']
    print (b_videolink)
    print ('printing the driver ID')
    print (driver)
    return b_videolink