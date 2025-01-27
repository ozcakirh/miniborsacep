import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';

class ParametreAyarlari extends StatefulWidget {
  const ParametreAyarlari({super.key, required this.title});

  final String title;

  @override
  State<ParametreAyarlari> createState() => _ParametreAyarlariState();
}

class _ParametreAyarlariState extends State<ParametreAyarlari> {
  //final TextEditingController _cntrlKomOran = TextEditingController();
  final TextEditingController _cntrlKomOran = TextEditingController();
  final TextEditingController _cntrlVergi = TextEditingController();

  Database? _database;

  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  Future<void> _initializeDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'settings.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE settings (id INTEGER PRIMARY KEY, commission REAL, bsmw REAL)');
      },
    );
  }

  Future<void> _saveData(BuildContext context) async {
    final commission = double.tryParse(_cntrlKomOran.text) ?? 0.0;
    final bsmw = double.tryParse(_cntrlVergi.text) ?? 0.0;

    if (_database != null) {
      await _database!.insert(
        'settings',
        {
          'commission': commission,
          'bsmw': bsmw,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veriler başarıyla kaydedildi!')),
      );
    }
  }

  @override
  void dispose() {
    _cntrlKomOran.dispose();
    _cntrlVergi.dispose();
    _database?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        // drawer: Sizer(
        //   builder: (context, orientation, deviceType) {
        //     return const AnaMenuCanli();
        //   },
        // ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.h,
              ),
              const Text(
                'Komisyon Oranı',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2.h),
              TextField(
                controller: _cntrlKomOran,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^[0-9]+(\.[0-9]{0,2})?')),
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Komisyon oranını girin (%)',
                  prefixIcon: const Icon(Icons.percent),
                ),
              ),
              SizedBox(height: 4.h),
              const Text(
                'BSMW Vergisi',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _cntrlVergi,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^[0-9]+(\.[0-9]{0,2})?')),
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'BSMW vergisini girin (%)',
                  prefixIcon: Icon(Icons.money),
                ),
              ),
              //const Spacer(),
              SizedBox(height: 4.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 30.w, //double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add save functionality
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        'ÇIKIŞ',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 35.w, //double.infinity,
                    child: ElevatedButton(
                      // onPressed: () {
                      //   // Add save functionality
                      //   _saveData;
                      // },
                      onPressed: () => _saveData(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        'KAYDET',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        //  Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     //crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           SizedBox(
        //             width: 2.w,
        //           ),
        //           SizedBox(
        //             width: 40.w,
        //             child: Text(
        //               "Komisyon Oranı : ",
        //               style: TextStyle(
        //                   fontSize: 16.sp, fontWeight: FontWeight.bold),
        //             ),
        //           ),
        //           SizedBox(
        //             width: 30.w,
        //             child: TextField(
        //               controller: _cntrlKomOran,
        //               decoration: const InputDecoration(
        //                 labelText: 'Komisyon Oranı Yazınız. 0,002 gibi',
        //                 border: OutlineInputBorder(),
        //               ),
        //               keyboardType: TextInputType.number,
        //               onChanged: (value) {
        //                 //
        //               },
        //               onSubmitted: (value) {
        //                 //
        //               },
        //             ),
        //           ),
        //         ],
        //       ),
        //       SizedBox(
        //         height: 1.h,
        //       ),
        //       ElevatedButton(
        //         onPressed: () {
        //           debugPrint("Tıklandı - Kaydet");
        //         },
        //         child: const Text("KAYDET"),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
