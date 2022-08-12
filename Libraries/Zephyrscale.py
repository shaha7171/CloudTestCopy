import imp
from importlib.resources import Resource
import sys
import requests
import datetime
import json
from browstackvideo import browserstackvideo
from robot.libraries.BuiltIn import BuiltIn
from robot.api import logger
import urllib.request


# REQUEST HEADER: to authenticate and authorize api
authtype = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzNGYzNWI4NS0xZjRmLTNhYzktODU4NC0yNDY3OWMxZDkwNDMiLCJjb250ZXh0Ijp7ImJhc2VVcmwiOiJodHRwczpcL1wvamNpcHJvZHVjdHMuYXRsYXNzaWFuLm5ldCIsInVzZXIiOnsiYWNjb3VudElkIjoiNjI2MDYxMzlmZDA2MjcwMDY5YzA4ZTRjIn19LCJpc3MiOiJjb20ua2Fub2FoLnRlc3QtbWFuYWdlciIsImV4cCI6MTY4NDk0NjA1OSwiaWF0IjoxNjUzNDEwMDU5fQ.F8E7oRYFLx9YWt9CbOklpOyCs7CBqhsGIgglCmhectU'
authname = 'application/json'
my_headers = {'Authorization': authtype, 'Content-Type': authname}



def zephyr_result():
     
        zephyr=  BuiltIn().get_variables()['${Zephyr}']

                
        if zephyr == "on":
            #env = sys.platform
            #if env == "win32": env="Windows" 
            
            driver = BuiltIn().get_variables()['${browserid}']  
            print ('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
            print ("Driver ID "+driver)
            USERNAME = BuiltIn().get_variables()['${USERNAME}']
            ACCESS_KEY = BuiltIn().get_variables()['${ACCESS_KEY}']
            print ("Test UserName "+USERNAME)
            print ("Test AccessKey "+ACCESS_KEY)

            #browserstack_URL = f"http://api-cloud.browserstack.com/automate/sessions/{driver}"
            #b_response = requests.get(browserstack_URL, auth=(USERNAME, ACCESS_KEY)).json()
            #b_videolink = b_response['automation_session']['public_url']
            #print (b_videolink)
           

            env = BuiltIn().get_variables()['${browser}']
            result = BuiltIn().get_variables()['${TESTSTATUS}']
            tc_number = BuiltIn().get_variables()['${TESTNAME}'].split(':')[0].lstrip().split(' ')[0]
            fail_msg = BuiltIn().get_variables()['${TESTMESSAGE}']
            project=  BuiltIn().get_variables()['${project}']
            testcycle = BuiltIn().get_variables()['${testcycle}']
            
           
            
                 
            logger.info(testcycle)
            
            if result == "PASS":
                data2 = {'projectKey': project,
                 'testCaseKey': tc_number,
                 'testCycleKey': testcycle,
                 'environmentName': env,
                 'executedById': '62606139fd06270069c08e4c',
                 'assignedToId': '62606139fd06270069c08e4c',
                 'comment': 'Automated by robot framework',
                 #'comment': f'Browserstack Link: <br> {b_videolink}',
                 'statusName': 'Pass',
                 'customFields': {'Execution Notes': 'All Steps Passed! '}
                 }
               
               
            if result == "FAIL":
                data2 = {'projectKey': project,
                 'testCaseKey': tc_number,
                 'testCycleKey':testcycle ,
                 'environmentName': env,
                 'executedById': '62606139fd06270069c08e4c',
                 'assignedToId': '62606139fd06270069c08e4c',
                 'comment': 'Automated by robot framework',
                 #'comment': f'Browserstack Link: <br> {b_videolink}',
                 'statusName': 'Fail',
                 'customFields': {'Execution Notes': fail_msg }
                 }

        
            response = requests.post("https://api.zephyrscale.smartbear.com/v2/testexecutions", headers=my_headers,
                                json=data2, verify=False) 
                
            
            #print ("The testcycle ID test teardown :"+testcycle)
            #print ("The project test teardown :"+project)
            #print ("The tc number test teardown :"+tc_number)
            #print ("The results test teardown :"+result)
            #json_data = json.loads(response.text)
            #print (json_data)



                
     

