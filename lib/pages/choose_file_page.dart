import 'dart:io';

import 'package:file_cryptor/file_cryptor.dart';
import 'package:file_encrypt/pages/result_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:filesystem_picker/filesystem_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ChooseFilePage extends StatefulWidget {
  static const routeName = 'choose-file';

  @override
  State<ChooseFilePage> createState() => _ChooseFilePageState();
}

enum FileStatus { NOFILE, PROCESSING, DONE }

class _ChooseFilePageState extends State<ChooseFilePage> {
  FileStatus fileStatus = FileStatus.NOFILE;

  FileCryptor fileCryptor = FileCryptor(
    key: "Your 32 bit key.................",
    iv: 16,
    dir: "",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Fayl tanlash'),
      ),
      body: Builder(
        builder: (_) {
          if (fileStatus == FileStatus.NOFILE) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: TextButton(
                  child: Text(
                    "Fayl tanlash",
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                  onPressed: chooseFile,
                ),
              ),
            );
          }
          if (fileStatus == FileStatus.PROCESSING) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  void chooseFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        setState(() {
          fileStatus = FileStatus.PROCESSING;
        });
        File chosenFile = File(result.files.single.path!);
        Directory? directory = await getDownloadsDirectory();
        File encryptedFile = await fileCryptor.encrypt(
          inputFile: chosenFile.path,
          outputFile:
              "${directory!.path}/${chosenFile.path.split('/').last}.aes",
        );
        setState(() {
          fileStatus = FileStatus.NOFILE;
        });
        Navigator.of(context).pushNamed(ResultPage.routeName);
      }
    } catch (e) {
      setState(() {
        fileStatus = FileStatus.NOFILE;
      });
    }
  }
}
