# SETAP-Student-Finance-Tracker
-Communal house buying app\
-Put money into 'pot'\
-Shows how much each person has put in\
-Shows and compares the prices of different items\
-Voting system

## Authors
UP2028084 - Ramandeep Kaur, UP2028084\
UP2015765 - Tom Gill, WarStoryTideTurner\
UP2024896 - Karol Lubicz-Gruzewski, Kvrolix\
UP2057450 - Tanisk Pandey, TaniskP\
UP2065667 - Christopher Laming, ChrisNeedsCoffee\
UP2006563 - Jeremy Desrosiers, kijilas\
UP2047589 - David Skelton, Diggydave123

## Content


## Features


## Design/Implementation Rationale


## Sources


## Installation and Use

Getting started

You need to first of all install visual studio code using the below link
https://code.visualstudio.com/download 
On the download page you can select hte appropriate version of visual studio code for your operating system (windows, macOS or Linux) once you have downloaded the installation file you can run it to install Visual Studio Code on your computer.

You need to have the dart SDK installed to use Flutter Dart is a programming language that Flutter uses and its is requied for building and running Flutter applications it includes the Dart compiler and core libraries that allow you to run dart code on your machine. You can download and install the Dart SDK from the officlal website:
https://dart.dev/get-dart.

You need to also install the Flutter SDK: https://flutter.dev/docs/get-started/install
Open Visual Studio code then go to the file explorer which is found on the left hand side of the screen then type in Flutter and download the Flutter extension and click install. you can do the same to install dart as well by typing in dart and install dart and its extension

Set up an Android or IOS emulator or connect a physcial device to your computer you can find instructions on this with the below link:
https://flutter.dev/docs/get-started/install

You can also get Android Studio with the below link:
https://developer.android.com/studio.

How to get project to your visual studio code:
1) clone the repository 
git clone https://github.com/WarStoryTideTurner/SETAP-Student-Finance-Tracker.git

The below dependencies have been used in this project:
google_maps_flutter
flutter sdk
flutter cupertino icons

The google maps APIK key for android the project:
# android/app/src/main/AndroidManifest.xml
<manifest>
  <application>
    <meta-data
        android:name="com.google.android.geo.API_KEY"
        android:value="YOUR_API_KEY_HERE" />
  </application>
</manifest>

and for ios:
# ios/Runner/AppDelegate.swift
GMSServices.provideAPIKey("YOUR_API_KEY_HERE")

## Built with

Why Flutter, dart was used?
It has fast development Flutter and Dart offer a hot reload feature that allows us developers to see changes in the app's UI in real time this make the development process faster and more efficient. It is also cross platform allowing us to write the code once and deploy it on multiple platforms meaning we can create mobile applications for both Android and IOS platforms using the same code base. Also provide many customisable widgets overall its the best option because of its speed cross platforms capabilities and customisable widgets as this will make it easier for landlords property managers and tenants to track rent payments and communicate with each other.

Database used:
mySQL

Why mySQL was used?
MySQL is an open source database meaning that it is free to use and can be customised to fit specific needs of the application. It is also scalable in the long term and can handle large amounts of data for example the inbox screens making it a good choice for applications that require a lot of data storage it is designed to be fast and efficient which is important for mobile applications so it can run smooothly and quickly. It also has a robust security system that provides multiple levels of protection for data stored in the database, which is important for applications that store sensitive data. Finally it is compatible with a wide range of programming languages and platforms overall it is a reliable secure and efficient database system


