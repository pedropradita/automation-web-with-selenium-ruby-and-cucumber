how to run in windows

if you already use ruby run this steps
1. open command prompt, move to this folder
2. run "cucumber"
3*. run "cucumber -f html -o report.html" 

if you dont use ruby run this steps
1. install ruby
2. add Environment Variable for Ruby, with this steps : right click My Computer > click Properties > click Advance system settings > click Environment Variables > click PATH > click Edit > input ex : C:\Ruby24-x64\bin
3. open command prompt
4. run "gem install selenium-webdriver"
5. run "gem install cucumber"
6. run "gem install bundler"
7. run "gem install rspec"
8. move command prompt to this folder
9. run "cucumber"
10*. run "cucumber -f html -o report.html" 

*for generate html report