# Check It!  
  Check It! is an android application in which users can create, update and delete checklists, after creating an account for themselves.  
  
```
This repository contains the front end code of the application.
```

  
## General Features:  
 - Unlimited of checklists can be created.  
 - Each checklist can have as many items as the user wishes.  
 - All the checklists can be updated at any time.   
 - Items in a checklist as well as an entire checklist can be deleted anytime.   
 - All the data will be stored against an account rather than a local host. So, the app can be used on various devices simultaneously.  
  
## Tech Stack:   
- Frontend Development: Flutter  
- Server Side Development:  NestJs  
- API: Rest API  
- Database: MongoDB   
  
## How to Use:
 
**Step 1:**
>[Install Flutter](https://flutter.dev/docs/get-started/install)

**Step 2:**
>Download or clone this repository by using the link given below. 
```
https://github.com/PriyaDebo/Check-It.git
```
**Step 3:**
>Go to project root and execute the following command in console to get the required dependencies:
```
flutter pub get 
```
**Step 4:**

```To run the app in Android Studio follow these steps:```
>- [Setup Android Studio for Flutter project.](https://flutter.dev/docs/get-started/editor?tab=androidstudio#androidstudio)
>- Go to **File > Open** and select the project folder from the location where it is downloaded.
>- Locate the main Android Studio toolbar.
 >- In the target selector, select an Android device for running the app. If none are listed as available, select Tools > AVD Manager and create one there.
 >- Click the run icon in the toolbar, or invoke the menu item Run > Run.
 >
```To run the app in Visual Studio Code follow these steps:```
>- [Setup Visual Studio Code for Flutter project.](https://flutter.dev/docs/get-started/editor?tab=vscode#vscode)
>- Go to **File > Open Folder** and select the project folder from the location where it is downloaded.
>- Locate the VS Code status bar (the blue bar at the bottom of the window).
>- Select a device from the Device Selector area. If no device is available and you want to use a device simulator, click  No Devices  and launch a simulator.
>-  Invoke  Run > Start Debugging  or press  F5.   Wait for the app to launch — progress is printed in the  Debug Console  view.
>
```After the app build completes, you’ll see the app on your device.```

**Step 5:**
>To successfully run the app, you need to install and run the server side of the application too. To do the same head to the following repository and follow the steps as mentioned there.
><br>([PriyaDebo/Check-It-Back-End (github.com)](https://github.com/PriyaDebo/Check-It-Back-End))

**Step 6:**
>Also, make sure that the emulator or the device and the server side of the application is running under the same internet connection. 
>Check the ip address of your device and 
```
	1. Open the file lib/client/list_service.dart
	2. Find the following code in line 10
	     final uriLink = "http://192.168.0.108:3000/checklists";
	3. Modify it with the ip configuration:
	     final uriLink = "http://<ip address>:3000/checklists;
```
```
	1. Open the file lib/client/user_service.dart
	2. Find the following code in line 9
	     final uriLink = "http://192.168.0.108:3000/users";
	3. Modify the ip address to match your ip address:
	     final uriLink = "http://<ip address>:3000/users;
```
>After completing the above steps, build the application for one more time.

## Folder Structure:
Here is the folder structure I have been using in this project:
```
android/
assets/
|- icons
|- images
lib/
|- all components/
|- client/
|- models/
|- operations/
|- screens/
|- constants.dart
|- main.dart
test/
```
## Conclusion

I will be happy to answer any questions that you may have regarding this project, and if you want to lend a hand with the project then please feel free to submit an issue and/or pull request.


