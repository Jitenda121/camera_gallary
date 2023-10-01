import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

// ignore: camel_case_types
class obito extends StatefulWidget {
  const obito({super.key});

  @override
  State<obito> createState() => _obitoState();
}

// ignore: camel_case_types
class _obitoState extends State<obito> {
  File? pickedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 110, 76),
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: false,
        leading: Icon(Icons.arrow_back),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Stack(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 110,
                  backgroundImage: pickedImage != null
                      ? FileImage(
                          pickedImage!) // Use FileImage to create an ImageProvider from the File
                      : null, // Set backgroundImage to null when _image is null
                  child: pickedImage == null
                      ? const Icon(
                          Icons.person,
                          size: 150,
                        )
                      : null, // Don't need a child widget when backgroundImage is used
                ),
              ],
            ),
            Positioned(
              top: 155,
              left: 260,
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      // shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.vertical(
                      //         top: Radius.circular(20.0))),
                      builder: (BuildContext context) {
                        return Container(
                          height: 300,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 7,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "Profile photo",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 27),
                                    ),
                                    SizedBox(
                                      width: 200,
                                    ),
                                    Icon(
                                      Icons.delete,
                                      size: 30,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 40.0),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 40,
                                          backgroundColor: Colors.grey,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: InkWell(
                                              onTap: () async {
                                                Navigator.pop(context);
                                                await getImage(
                                                    ImageSource.camera);
                                              },
                                              child: Icon(
                                                Icons.camera_alt,
                                                size: 30,
                                                color: Color.fromARGB(
                                                    255, 3, 110, 76),
                                              ),
                                            ),
                                            radius: 39,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Camera",
                                          style: TextStyle(fontSize: 20),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 40,
                                          backgroundColor: Colors.grey,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: InkWell(
                                              onTap: () async {
                                                await getImage(
                                                    ImageSource.gallery);
                                                Navigator.pop(context);
                                              },
                                              child: Icon(
                                                Icons.browse_gallery_rounded,
                                                size: 30,
                                                color: Color.fromARGB(
                                                    255, 3, 110, 76),
                                              ),
                                            ),
                                            radius: 39,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Gallery",
                                          style: TextStyle(fontSize: 20),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 40,
                                          backgroundColor: Colors.grey,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Icon(
                                                Icons.cancel,
                                                size: 33,
                                                color: Color.fromARGB(
                                                    255, 3, 110, 76),
                                              ),
                                            ),
                                            radius: 39,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Cancel",
                                          style: TextStyle(fontSize: 20),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      });
                },
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 13, 186, 131),
                  radius: 30,
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ]),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                  width: 430,
                  height: 120,
                  color: Colors.white,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Column(children: [
                          Icon(
                            Icons.person,
                            size: 30,
                            color: Color.fromARGB(93, 4, 4, 4),
                          ),
                        ]),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: ,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 120, 118, 118),
                              //fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "Jitendra Yadav",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "This is not your username or pin.This name",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 120, 118, 118),
                            ),
                          ),
                          Text(
                            "will be visible to your WhatsApp contacts.",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 120, 118, 118),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.edit,
                              size: 30,
                              color: Colors.green,
                            )
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          ),
          Divider(),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: 430,
                height: 100,
                color: Colors.white,
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.perm_device_information_rounded,
                            size: 30,
                            color: Color.fromARGB(93, 4, 4, 4),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "About",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 120, 118, 118),
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "If you don't fight,you can't win.",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 27,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, right: 10.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.edit,
                            size: 30,
                            color: Colors.green,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Divider(),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: 430,
                height: 100,
                color: Colors.white,
                child: Row(children: [
                  SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.phone,
                          size: 30,
                          color: Color.fromARGB(255, 120, 118, 118),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Phone",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 120, 118, 118),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "+91 9372911595",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  )
                ]),
              )
            ],
          )
        ],
      ),
    );
  }

  Future getImage(ImageSource sources) async {
    try {
      final image = await ImagePicker().pickImage(source: sources);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        pickedImage = imageTemporary;
      });
    } on PlatformException {
      // ignore: avoid_print
      print("failed to pick image");
    }
  }
}
