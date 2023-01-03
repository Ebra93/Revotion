import 'package:flutter/material.dart';

// list of colors that we use in our app
const kBackgroundColor = Colors.white;
const kPrimaryColor = Color(0xffEEEEEE);
const kSecondaryColor = Color(0xffF6F6F6);
const kTextColor = Colors.black;
const kTextLightColor = Color.fromARGB(136, 231, 7, 7);
const ksearchColor = Color.fromRGBO(0, 0, 0, 0.4);

/// list of padding that we use in our app
const kDefaultPadding = 20.0;
const kPadding = 35.0;

/// list of fonts that we use in our app
const gilroyBold = "Gilroy-Bold";
const gilroySemibold = "Gilroy-Semibold";

Map<String, Map<String, String>> erorrs = {
  "1001": {
    "Reason": "Memory error, power cycle req",
    "Catagory": "User error codes",
    "wo": "Brain"
  },
  "1002": {
    "Reason": "Technical error, power cycle req",
    "Catagory": "User error codes",
    "wo": "Brain"
  },
  "1003": {
    "Reason": "No network connection",
    "Catagory": "User error codes",
    "wo": "Brain"
  },
  "1004": {
    "Reason": "No GPS connection",
    "Catagory": "User error codes",
    "wo": "Brain"
  },
  "1005": {
    "Reason": "Node not available",
    "Catagory": "User error codes",
    "wo": "Brain"
  },
  "1100": {"Reason": "", "Catagory": "Backend error codes", "wo": "Brain"},
  "1101": {
    "Reason": "Communication timeouts",
    "Catagory": "Backend error codes",
    "wo": "Brain"
  },
  "1102": {
    "Reason": "File error",
    "Catagory": "Backend error codes",
    "wo": "Brain"
  },
  "1103": {
    "Reason": "GNSS error",
    "Catagory": "Backend error codes",
    "wo": "Brain"
  },
  "1104": {
    "Reason": "IP error",
    "Catagory": "Backend error codes",
    "wo": "Brain"
  },
  "1105": {
    "Reason": "HTTP error",
    "Catagory": "Backend error codes",
    "wo": "Brain"
  },
  "1200": {"Reason": "", "Catagory": "BLE error codes", "wo": "Brain"},
  "1201": {
    "Reason": "Error setting advertisement data",
    "Catagory": "BLE error codes",
    "wo": "Brain"
  },
  "1202": {
    "Reason": "Error enabling advertisement",
    "Catagory": "BLE error codes",
    "wo": "Brain"
  },
  "1203": {
    "Reason": "Error initialising security",
    "Catagory": "BLE error codes",
    "wo": "Brain"
  },
  "1204": {
    "Reason": "Device disconnect error",
    "Catagory": "BLE error codes",
    "wo": "Brain"
  },
  "1205": {
    "Reason": "More than 3 devices",
    "Catagory": "BLE error codes",
    "wo": "Brain"
  },
  "2000": {"Reason": "", "Catagory": "Switch", "wo": "Nodes"},
  "2000": {"Reason": "", "Catagory": "Switch", "wo": "Nodes"},
  "2001": {
    "Reason": "Efuse error",
    "Catagory": "User error codes",
    "wo": "Nodes"
  },
  "2101": {"Reason": "", "Catagory": "Dev", "wo": "Nodes"},
  "3000": {"Reason": "", "Catagory": "Temperature", "wo": "Nodes"},
  "3001": {
    "Reason": "Sensor not connected",
    "Catagory": "User error codes",
    "wo": "Nodes"
  },
  "3002": {
    "Reason": "Lower limit temperature warning",
    "Catagory": "User error codes",
    "wo": "Nodes"
  },
  "3003": {
    "Reason": "Upper limit temperature warning",
    "Catagory": "User error codes",
    "wo": "Nodes"
  },
  "4000": {"Reason": "Ambient", "Catagory": "User error codes", "wo": "Nodes"},
  "5000": {"Reason": "Battery", "Catagory": "User error codes", "wo": "Nodes"},
  "5001": {
    "Reason": "Temperature sensor not connected",
    "Catagory": "User error codes",
    "wo": "Nodes"
  },
  "5002": {
    "Reason": "Lower limit SOC warning (<20%)",
    "Catagory": "User error codes",
    "wo": "Nodes"
  },
  "5003": {
    "Reason": "Lower limit SOC error (<10%)",
    "Catagory": "User error codes",
    "wo": "Nodes"
  },
  "5004": {
    "Reason": "Battery temperature warning (>60°C)",
    "Catagory": "User error codes",
    "wo": "Nodes"
  },
  "5005": {
    "Reason": "Battery temperature error (>90°C)",
    "Catagory": "User error codes",
    "wo": "Nodes"
  },
  "5006": {
    "Reason": "Fuse warning -> Min. one fuse not connected",
    "Catagory": "User error codes",
    "wo": "Nodes"
  },
  "6001": {
    "Reason": "Sensor not connected",
    "Catagory": "User error codes",
    "wo": "Nodes"
  },
  "6002": {
    "Reason": "Lower limit level warning",
    "Catagory": "User error codes",
    "wo": "Nodes"
  },
  "6003": {
    "Reason": "Upper limit level warning",
    "Catagory": "User error codes",
    "wo": "Nodes"
  },
  "6000": {"Reason": "", "Catagory": "Level", "wo": "Nodes"},
};
