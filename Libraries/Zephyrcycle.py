import sys
import requests
import datetime
import urllib3
from robot.libraries.BuiltIn import BuiltIn


#from actions_toolkit import core


# REQUEST HEADER: to authenticate and authorize api
authtype = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzNGYzNWI4NS0xZjRmLTNhYzktODU4NC0yNDY3OWMxZDkwNDMiLCJjb250ZXh0Ijp7ImJhc2VVcmwiOiJodHRwczpcL1wvamNpcHJvZHVjdHMuYXRsYXNzaWFuLm5ldCIsInVzZXIiOnsiYWNjb3VudElkIjoiNjI2MDYxMzlmZDA2MjcwMDY5YzA4ZTRjIn19LCJpc3MiOiJjb20ua2Fub2FoLnRlc3QtbWFuYWdlciIsImV4cCI6MTY4NDk0NjA1OSwiaWF0IjoxNjUzNDEwMDU5fQ.F8E7oRYFLx9YWt9CbOklpOyCs7CBqhsGIgglCmhectU'
authname = 'application/json'
my_headers = {'Authorization': authtype, 'Content-Type': authname}

def create_cycle():
    env = BuiltIn().get_variables()['${browser}']    
    testcycle = None
    project = 'CLOUDV'
    version = 'Rough Automation Test Cycle'
    folder = 3232657
    
    #Disabling Unverified HTTPS InsecureRequestWarning
    urllib3.disable_warnings()

    #env = sys.platform
    #if env == "win32": env="Windows" 
    #print (folder, project, version)
        
    if testcycle == None:
            now = datetime.datetime.now()
            stringDate = now.strftime("%m/%d/%Y %H:%M")
            cycle_data = {'projectKey': project,
                      'name': version + ' - ' + env + ' - ' + stringDate,
                      'folderId': folder}

            response = requests.post("https://api.zephyrscale.smartbear.com/v2/testcycles", headers=my_headers,
                                 json=cycle_data, verify=False)

            testcycle = response.json()['key']
            print (testcycle + " created")
            #core.set_output("testcycle", testcycle)
            print ("The testcycle ID is when zephyr cycle created :"+testcycle)
            return testcycle

    else:
            return


if __name__ == "__main__":
   create_cycle()