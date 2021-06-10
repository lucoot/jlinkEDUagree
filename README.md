# jlinkEDUagree
A script to remove the daily Segger J-Link EDU license agreement pop-up.
<img src="https://i.postimg.cc/GhRYMb8h/jlink.jpg)](https://postimg.cc/rzhKsXNv" width="50%">

## Operation
The agreement stores the date when the user clicks agree. On opening Segger/J-LINK it checks the date and asks the user to agree if the value stored is not today.
On Windows this value is stored in the Registry. On Mac this is stored in an XML settings file.
The script grabs the system date, formats it, and replaces the old date with today's date.

## Installation
Place the script somewhere nice.
### Windows
Use Windows Task Scheduler to create a Basic Task.
Under settings check the box next to "Run task as soon as possible after a scheduled start is missed" to ensure it runs if the computer is sleeping at midnight.

### OS X
Use crontab or launchd to run the script at 12AM or at login each day.
```
0 0 * * * ~/jlinkEDUagreeOSX.sh >/dev/null 2>&1
```
