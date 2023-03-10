import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'home.notifer.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal,
          onPressed: () {
            Provider.of<HomeNotifer>(context, listen: false)
                .copyTextToClipBoard(context: context);
          },
          child: const Icon(
            Icons.copy,
            color: Colors.white,
          ),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              RichText(
                text: const TextSpan(
                  text: "Extract",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: ' Text',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ' Google Ml Kit !!',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.yellowAccent,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 75,
                child: Image.asset('assets/images/logo.png'),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.teal),
                    ),
                    child: const Text(
                      'Gallery',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    onPressed: () {
                      Provider.of<HomeNotifer>(context, listen: false)
                          .pickUserImage(
                              context: context, source: ImageSource.gallery);
                    },
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.teal),
                    ),
                    child: const Text(
                      'Camera',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    onPressed: () {
                      Provider.of<HomeNotifer>(context, listen: false)
                          .pickUserImage(
                              context: context, source: ImageSource.camera);
                    },
                  )
                ],
              ),
              Provider.of<HomeNotifer>(context, listen: true).getLoading == true
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 180,
                            width: MediaQuery.of(context).size.width,
                            child: Image.file(
                                Provider.of<HomeNotifer>(context, listen: false)
                                    .getUserImage!),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            Provider.of<HomeNotifer>(context, listen: true)
                                .finalText!,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            textDirection: TextDirection.ltr,
                            maxLines: 8,
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.teal),
                            ),
                            child: const Text(
                              'Extract Text!!',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            onPressed: () async {
                              Provider.of<HomeNotifer>(context, listen: false)
                                  .getImageFromText(context: context);
                            },
                          )
                        ],
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
