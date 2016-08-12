SOFTWARE NEEDED TO RUN UNDER WINDOWS:
*********************************************************************************************

1. Install Ruby: ruby 2.2.4p230 (2015-12-16 revision 53155) [x64-mingw32]
2. Install Ruby Development Kit: DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe
3. Execute in DevKit folder: ruby dk.rb init, then execute ruby dk.rb install
4. Install Cucumber: open cmd prompt and execute: gem install cucumber
5. Install gem selenium-cucumber: open cmd prompt and execute: gem install selenium-cucumber
6. Install gem rest-client: gem install rest-client
7. Install gem json: gem install json
8. Install gem rspec: gem install rspec
9. Install PhantomJS: phantomjs-2.1.1-windows.
   You have to add to the PATH the directory of the executable.
10. Install chromerdriver.exe (http://chromedriver.storage.googleapis.com/index.html?path=2.10/) into bin folder of Ruby22-x64


SOFTWARE NEEDED TO RUN UNDER MAC (from terminal):
*********************************************************************************************
1. Install H2 Datebase: brew install h2
2. Install RVM: rvm install 2.1.1
3. Check the Ruby install: rvm list 
4. If you doesn't have Ruby 2.2.4, then install: rvm install 2.2.4
5. Set Ruby 2.2.4 as current and default: rvm --default use 2.2.4
6. Install gem selenium-cucumber: gem install selenium-cucumber
7. Install gem rest-client: gem install rest-client 2.0.0
8. Install gem json: gem install json 2.0.1
9. Install gem rspec: gem install rspec 3.5.0
10. Install PhantomJS: brew install phantomjs 2.1.1
11. Install chromerdriver.exe: brew install chromedriver 2.21
12. Install Liquidbase : brew install liquidbase 


HOW TO RUN THE TESTS:
*********************************************************************************************

- First, you have to know the BROWSER that you want to use to run the tests. 
- BROWSER can be: 'phantomjs' or 'chrome'.
- ORIGIN can be: 'QA' or 'local'.
  QA runs againts: 'http://staffing-qa.nisumlatam.com:8080' and local runs againts 'http://127.0.0.1:8080'

- If you want to run local the test local you need to execute the next steps:
1. In the terminal: get into the folder for the project, example: cd workspace/Staffing/Interviews
2. Then execute the command: gradle
3. Wait the compile finish (with Building 93% works fine too)
6. Then you can run the test

If you have Mac yo need to do this steps for each test
1. Open another terminal
2. In the terminal: get into the folder for the project, example: cd workspace/Staffing/Staffing-automat
3. Execute the next command: cd features
4. Execute just one time the command: cucumber --init
5. Execute each tests following the steps for local.
  
  
TO RUN THE TESTS IN LOCAL YOU NEED TO DO THIS FIRST:
*********************************************************************************************

- Download the Interviews Project from GitLab https://gitlab.nisumlatam.com/open-projects/interviews
- Open a terminal or the prompt (Mac or Windows)
- Go to the path from Interview's project 
- Execute the command : gradle (this going to take a while... maybe an hour in building)
- Once this is finish you can start your local tests, in the terminal or prompt you can see IP that you have assigned, example: Local: http://127.0.0.1:8080
and External: http://172.17.100.182:8080


IF YOU WANT TO RUN THE TESTS WITH PHANTOMJS IN QA:
**********************************************************************************************

Execute in this order:
1. File: cleanData.features
   INSTRUCTIONS: Open prompt, enter into the repository that contains the features folder. 
   ENTER: cucumber features/cleanData.feature BROWSER=phantomjs ORIGIN=QA
   EXPECTED RESULTS: 1 scenario (1 passed)
                     13 steps (13 passed)
					
2. File: deleteUsers.features
   INSTRUCTIONS: Open prompt, enter into the repository that contains the features folder. 
   ENTER: cucumber features/deleteUsers.feature BROWSER=phantomjs ORIGIN=QA
   EXPECTED RESULTS: 1 scenario (1 passed)
                     4 steps (4 passed)
   
2. File: createUsers.features
   INSTRUCTIONS: Open prompt, enter into the repository that contains the features folder. 
   ENTER: cucumber features/createUsers.feature BROWSER=phantomjs ORIGIN=QA
   EXPECTED RESULT: 1 scenario (1 passed)
                    4 steps (4 passed)
   
3. File: createExercisesProfile.features
   INSTRUCTIONS: Open prompt, enter into the repository that contains the features folder. 
   ENTER: cucumber features/createExercisesProfile.feature BROWSER=phantomjs ORIGIN=QA
   EXPECTED RESULT: 1 scenario (1 passed)
                    10 steps (10 passed)
                    
4. File: addcandidateAsHR.features
   INSTRUCTIONS: Open prompt, enter into the repository that contains the features folder. 
   ENTER: cucumber features/addcandidateAsHR.feature BROWSER=phantomjs ORIGIN=QA
   EXPECTED RESULTS: 1 scenario (1 passed)
                     6 steps (6 passed)
	   
5. File: addScheduleAsHR.features
   INSTRUCTIONS: Open prompt, enter into the repository that contains the features folder. 
   ENTER: cucumber features/addScheduleAsHR.feature BROWSER=phantomjs ORIGIN=QA
   EXPECTED RESULTS: 1 scenario (1 passed)
                     5 steps (5 passed)
   
6. File: candidate_flow.features
   INSTRUCTIONS: Open prompt, enter into the repository that contains the features folder. 
   ENTER: cucumber features/candidate_flow.feature BROWSER=phantomjs ORIGIN=QA
   EXPECTED RESULTS: 1 scenario (1 passed)
                     3 steps (3 passed)
   
7. File: evaluatorResultsFlow.features
   INSTRUCTIONS: Open prompt, enter into the repository that contains the features folder. 
   ENTER: cucumber features/evaluatorResultsFlow.feature BROWSER=phantomjs ORIGIN=QA
   EXPECTED RESULTS: 1 scenario (1 passed)
                     6 steps (6 passed)

8. File: cleanData.features
   INSTRUCTIONS: Open prompt, enter into the repository that contains the features folder. 
   ENTER: cucumber features/cleanData.feature BROWSER=phantomjs ORIGIN=QA
   EXPECTED RESULTS: 1 scenario (1 passed)
                     13 steps (13 passed)
					
9. File: deleteUsers.features
   INSTRUCTIONS: Open prompt, enter into the repository that contains the features folder. 
   ENTER: cucumber features/deleteUsers.feature BROWSER=phantomjs ORIGIN=QA
   EXPECTED RESULTS: 1 scenario (1 passed)
                     4 steps (4 passed)

				 

IF YOU WANT TO RUN THE TESTS WITH CHROME IN LOCAL:
**********************************************************************************************

Execute in this order:
1. File: cleanData.features
   INSTRUCTIONS: Open prompt, enter into the repository that contains the features folder. 
   ENTER: cucumber features/cleanData.feature BROWSER=chrome ORIGIN=local
   EXPECTED RESULTS: 1 scenario (1 passed)
                     13 steps (13 passed)
					
2. File: deleteUsers.features
   INSTRUCTIONS: Open prompt, enter into the repository that contains the features folder. 
   ENTER: cucumber features/deleteUsers.feature BROWSER=chrome ORIGIN=local
   EXPECTED RESULTS: 1 scenario (1 passed)
                     4 steps (4 passed)
   
2. File: createUsers.features
   INSTRUCTIONS: Open prompt, enter into the repository that contains the features folder. 
   ENTER: cucumber features/createUsers.feature BROWSER=chrome ORIGIN=local
   EXPECTED RESULT: 1 scenario (1 passed)
                    4 steps (4 passed)
   
3. File: createExercisesProfile.features
   INSTRUCTIONS: Open prompt, enter into the repository that contains the features folder. 
   ENTER: cucumber features/createExercisesProfile.feature BROWSER=chrome ORIGIN=local
   EXPECTED RESULT: 1 scenario (1 passed)
                    12 steps (12 passed)
                    
4. File: addcandidateAsHR.features
   INSTRUCTIONS: Open prompt, enter into the repository that contains the features folder. 
   ENTER: cucumber features/addcandidateAsHR.feature BROWSER=chrome ORIGIN=local
   EXPECTED RESULTS: 1 scenario (1 passed)
                     6 steps (6 passed)
	   
5. File: addScheduleAsHR.features
   INSTRUCTIONS: Open prompt, enter into the repository that contains the features folder. 
   ENTER: cucumber features/addScheduleAsHR.feature BROWSER=chrome ORIGIN=local
   EXPECTED RESULTS: 1 scenario (1 passed)
                     5 steps (5 passed)
   
6. File: candidate_flow.features
   INSTRUCTIONS: Open prompt, enter into the repository that contains the features folder. 
   ENTER: cucumber features/candidate_flow.feature BROWSER=chrome ORIGIN=local
   EXPECTED RESULTS: 1 scenario (1 passed)
                     3 steps (3 passed)
   
7. File: evaluatorResultsFlow.features
   INSTRUCTIONS: Open prompt, enter into the repository that contains the features folder. 
   ENTER: cucumber features/evaluatorResultsFlow.feature BROWSER=chrome ORIGIN=local
   EXPECTED RESULTS: 1 scenario (1 passed)
                     6 steps (6 passed)

8. File: cleanData.features
   INSTRUCTIONS: Open prompt, enter into the repository that contains the features folder. 
   ENTER: cucumber features/cleanData.feature BROWSER=chrome ORIGIN=local
   EXPECTED RESULTS: 1 scenario (1 passed)
                     13 steps (13 passed)
					
9. File: deleteUsers.features
   INSTRUCTIONS: Open prompt, enter into the repository that contains the features folder. 
   ENTER: cucumber features/deleteUsers.feature BROWSER=chrome ORIGIN=local
   EXPECTED RESULTS: 1 scenario (1 passed)
                     4 steps (4 passed)
					 
					 

ADITIONAL INFORMATION ABOUT THE TESTS:
*************************************************************************************************************************************************************
1. createUsers.features: Create 3 users: automatedhr2, automatedic2 and automatedeva2.
2. createExercisesProfile.features: Create 4 demo exercises and create ProfileOneOfEach2.
3. addcandidateAsHR.features: Add the candidate to the app. Then search candidate to validate correct add.
4. addScheduleAsHR.features: Add a schedule interview for the candidate created previously as HR.
5. candidate_flow.features: The candidate check his email and submit answer of the exam.
6. evaluatorResultsFlow.features: The evaluator check his email and add score and feedback to the result of exam. Then search result to validate correct add.


For this tests are used the following data:

File addcandidateAsHR.features:
|name|surname|email|redmineid|phone|skypeid|
|David|Bowie|davidbow@yopmail.com|2000|36363636|5000|

File addScheduleAsHR.features
|candidate|profile|evaluator|
|David Bowie|Profile OneOfEach2|Evaluator2 Automation role|

File candidate_flow.features:
davidbow@yopmail.com

File evaluatorResultsFlow.features:
|candidate|email|
|David Bowie|davidbow@yopmail.com|

PhantomJS use "127.0.0.1" port 8910




