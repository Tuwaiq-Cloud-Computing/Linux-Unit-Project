# Bash-Weather



## About
- weather.sh gets the current weather from OpenWeather and displays the results to the terminal

  
## Prerequisites
- OpenWeatherMap API key (http://openweathermap.org/appid).
- Bash shell
- curl command-line tool for getting data using HTTP protocol. curl can be found in the curl package on major Linux distributions.
- jq command-line tool for parsing JSON data. jq can be found in the jq package on major Linux distributions.


## How to use
Run weather.sh 
```
./weather2.sh
```
Add your OpenWeatherMap API key to the end of the openweathermap.key file,

```
# Add your OpenWeatherMap API key below (http://openweathermap.org/appid)
```
## Command-line options
`-s` The -s option can be used to specify arguments:


`-jq` a lightweight and flexible command-line JSON processor


`-r` True if file exists and is readable.

 
##### Example
Get the current weather in Riyadh:
```
./weather2.sh Riyadh
```
### Keyboard functions
current_weather()

### Screenshoot

![image](https://github.com/Aishah2030/Linux-Unit-Project/assets/90576780/aca956ca-905b-4747-9a71-da4e2b4efb05)
