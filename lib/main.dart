import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:revotion/Widget.dart';
import 'package:revotion/constants.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo', theme: ThemeData(), home: MyBleApp());
  }
}

class MyBleApp extends StatefulWidget {
  const MyBleApp({super.key});

  @override
  State<MyBleApp> createState() => _MyBleAppState();
}

class _MyBleAppState extends State<MyBleApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.black,
      home: StreamBuilder<BluetoothState>(
          stream: FlutterBlue.instance.state,
          initialData: BluetoothState.unknown,
          builder: ((context, snapshot) {
            final state = snapshot.data;
            if (state == BluetoothState.on) {
              return RefreshIndicator(
                onRefresh: () async {
                  return Future<void>.delayed(const Duration(seconds: 3));
                },
                child: HomPage(),
              );
            }
            return Scaffold(
              backgroundColor: Colors.lightBlue,
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.bluetooth_disabled,
                      size: 200.0,
                      color: Colors.white54,
                    ),
                    Text(
                      'Bluetooth Adapter is off.',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .subtitle1
                          ?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            );
          })),
    );
  }
}

class HomPage extends StatefulWidget {
  const HomPage({super.key});

  @override
  State<HomPage> createState() => _HomPageState();
}

class _HomPageState extends State<HomPage> {
  String error = "";
  List<String> errorlog = [];
  //List<int> value11 = [];
  bool getdata = false;

  //List<dynamic> geleseValus = [];
  //List<dynamic> notifyValus = [];
  final String SERVICE_UUID = "ca30c812-3ed5-44ea-961e-196a8c601de7";
  final String CHARACTERISTIC_UUID = "1db9a7de-135f-4509-b226-bd19d42126fd";
  final String TARGET_DEVICE_NAME = "Phone Alert Status";
  FlutterBlue flutterBlue = FlutterBlue.instance; // * Instance de FlutterBlue
  late StreamSubscription<ScanResult> scanSubScription; // * StreamSubscription
  late BluetoothDevice targetDevice; // * Device
  late BluetoothCharacteristic targetCharacteristic; // * Characteristiques
  //TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    startScan();
  }

  startScan() {
    setState(() {});

    scanSubScription = flutterBlue.scan().listen((scanResult) {
      if (scanResult.device.name == TARGET_DEVICE_NAME) {
        //print('DEVICE found');

        stopScan();
        setState(() {});

        targetDevice = scanResult.device;

        connectToDevice();

        Timer(Duration(seconds: 3), () async {
          List<BluetoothDevice> connectedDevices =
              await flutterBlue.connectedDevices;
          if (!connectedDevices.contains(targetDevice)) {
            await targetDevice.connect();
            discoverServices();
          }

          //discoverServices();

          discoverServices();
        });
      } else {}
    }, onDone: () {
      stopScan();
    });
  }

  stopScan() {
    flutterBlue.stopScan();
    scanSubScription.cancel();
  }

  disconnectFromDevice() {
    if (targetDevice == null) return;

    targetDevice.disconnect();

    setState(() {});
  }

  connectToDevice() async {
    if (targetDevice == null) return;

    setState(() {});
    List<BluetoothDevice> connectedDevices = await flutterBlue.connectedDevices;
    if (!connectedDevices.contains(targetDevice)) {
      await targetDevice.connect();
    }

    setState(() {});
  }

  notify() async {
    await targetCharacteristic.setNotifyValue(true);
    targetCharacteristic.value.listen((value) {
      //notifyValus.add(value);

      setState(() {});
    });
  }

  discoverServices() async {
    if (targetDevice == null) return;

    if (true) {
      List<BluetoothService> services = await targetDevice.discoverServices();
      services.forEach((service) {
        if (service.uuid.toString() == SERVICE_UUID) {
          service.characteristics.forEach((characteristic) async {
            if (characteristic.uuid.toString() == CHARACTERISTIC_UUID) {
              targetCharacteristic = characteristic;
              if (characteristic.properties.read) {
                await characteristic.read();
                //value11 = await characteristic.read();
                //geleseValus.add(value11);
              }

              if (true) {
                await targetCharacteristic.setNotifyValue(true);
                targetCharacteristic.value.listen((value) {
                  print('noooooooooooooooooovvvvvvvv  ' +
                      erorrs[''].toString().length.toString() +
                      value.toString());

                  print(String.fromCharCodes(value));
                  error = String.fromCharCodes(value);

                  errorlog.add(error);

                  //notifyValus.add(value);
                  //value11 = value;
                  setState(() {
                    getdata = true;
                  });
                });
              }

              if (characteristic.properties.write) {
                //   await characteristic.write([0x12, 0x34]);
              }

              setState(() {});
            }
          });
        }
      });
    }
  }

  read() async {
    if (targetCharacteristic.properties.read) {
      //value11 = await targetCharacteristic.read();
      //geleseValus.add(value11);
      setState(() {});
    }
  }

  write() async {
    if (targetCharacteristic.properties.write) {
      await targetCharacteristic.write([12, 34, 56]);
    }
    setState(() {});
  }

  bool error_in_errorslist(String err) {
    if (erorrs.containsKey(err)) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 251, 250, 250),
          centerTitle: true,
          title: const Text(
            'R e v o t i o n',
            style: TextStyle(
              fontFamily: gilroyBold,
              fontSize: 60,
              color: kTextColor,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              showAnimatedDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  double size = MediaQuery.of(context).size.width / 2;
                  return SizedBox(
                      width: size,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 100, 400, 0),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 1),
                            ),
                          ],
                          color: kPrimaryColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(''),
                      ));
                },
                animationType: DialogTransitionType.slideFromLeftFade,
                curve: Curves.fastOutSlowIn,
                duration: Duration(seconds: 1),
              );
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: InkWell(
                child: Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 1),
                        ),
                      ],
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Text('LOG BLE'),
                        ),
                        !getdata
                            ? CircularProgressIndicator()
                            : Column(
                                children: errorlog.map((e) {
                                  return ErrorLog(error: e);
                                }).toList(),
                              ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    )),
                onTap: () {
                  showAnimatedDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return SizedBox(
                          child: Container(
                              margin:
                                  const EdgeInsets.fromLTRB(60, 200, 60, 60),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                                color: kPrimaryColor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      ElevatedButton.icon(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        icon:
                                            const Icon(Icons.arrow_left_sharp),
                                        label:
                                            const Icon(Icons.arrow_left_sharp),
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor: Colors.transparent,
                                        ),
                                      ),
                                      const Text(
                                        'Detail Menu',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: gilroyBold,
                                          fontSize: 40,
                                          color: kTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    child: Column(
                                        children: errorlog.map(((e) {
                                      return Text('');
                                    })).toList()),
                                  ),
                                ],
                              )));
                    },
                    animationType: DialogTransitionType.slideFromBottomFade,
                    curve: Curves.fastOutSlowIn,
                    duration: Duration(seconds: 1),
                  );
                },
              ),
            ),
            InkWell(
                onTap: (() {
                  errorlog = [];
                  error = '';
                  setState(() {});
                }),
                child: Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 1),
                      ),
                    ],
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "delete log",
                    style: TextStyle(fontSize: 18, fontFamily: gilroySemibold),
                  ),
                )),
          ],
        ));
  }
}
