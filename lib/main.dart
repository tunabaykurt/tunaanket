import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const FirstPage(),
    );
  }
}

class Anket {
  String soru;
  List<String> cevaplar = [];

  Anket(this.soru, this.cevaplar);
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: Text(
          "Tuna'nın Anketi :)",
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width > 600 ? 30.0 : 20.0),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Bu ankete göre sana iyi gelebilecek şeyleri buluyoruz",
                  style: TextStyle(
                      fontSize:
                          MediaQuery.of(context).size.width > 600 ? 25.0 : 18.0,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Önce takma isim oluştur",
                  style: TextStyle(
                      fontSize:
                          MediaQuery.of(context).size.width > 600 ? 25.0 : 18.0,
                      color: Colors.black),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: SizedBox(
                    height: 40.0, width: 300.0, child: CupertinoTextField()),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Onayla"),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

List<Anket> anketler = [
  Anket("Cinsiyetini seç", ["Kadın", "Erkek", "Ne hissediyorsan"]),
  Anket("Yaş aralığını seç", ["18 altı", "18-24", "25-34", "35-44"]),
  Anket("Şu anda kendini nasıl hissediyorsun",
      ["yorgun", "mutsuz", "yalnız", "karmaşık"]),
  Anket("En son seni mutlu eden şey neydi",
      ["ailen", "arkadaşların", "sevgilin", "internet arkadaşın"]),
  Anket("Sorunlarını çekinmeden anlatabileceğin kaç kişi var",
      ["bir kişi", "iki,üç kişi", "dört,beş kişi", "sorunlarımı paylaşmam"]),
  Anket("Bir seçeneğin olsa hangisini tercih ederdin",
      ["geçmişe dönmek", "geleceğe gitmek", "anın tadını çıkarmak"]),
  Anket("Günde kaç saat uyuyorsun", ["5-6", "7-8", "9-10", "12+"]),
  Anket("Çok bunaldığında ne yaparsın", [
    "dışarı çıkar müzik dinlerim",
    "arkadaşlarımla konuşurum",
    "not tutarım",
    "uyurum"
  ]),
  Anket("Son olarak sorunlarınla nasıl başa çıkıyorsun", [
    "kendi kendine geçmesini bekleyerek",
    "arkadaşlarımdan yardım alarak",
    "düşünmekle vakit kaybetmeyip hemen harekete geçerek"
  ]),
];

//"Tebrikler anketi tamamladın e-posta hesabını buraya yazman yeterli :)"
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _phase;
  @override
  void initState() {
    super.initState();
    _phase = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: Text(
          "Tuna'nın Anketi :)",
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width > 600 ? 30.0 : 20.0),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: MediaQuery.of(context).size.width > 600 ? 1 : 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                          child: Text(
                        anketler[_phase].soru,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width > 600
                                ? 25.0
                                : 18.0,
                            color: Colors.white),
                      )),
                    )),
              )),
          Expanded(
              flex: 7,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width > 600
                      ? anketler[_phase].cevaplar.length
                      : 2,
                ),
                itemCount: anketler[_phase].cevaplar.length,
                itemBuilder: (context, index) {
                  return TextButton(
                    onPressed: () {
                      if (_phase < anketler.length - 1) {
                        setState(() {
                          _phase++;
                        });
                      } else if (_phase == anketler.length - 1) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LastPage(),
                            ));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.green),
                        child: Center(
                            child: Text(
                          anketler[_phase].cevaplar[index],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width > 600
                                  ? 25.0
                                  : 18.0),
                          textAlign: TextAlign.center,
                        )),
                      ),
                    ),
                  );
                },
              ))
        ],
      ),
    );
  }
}

class LastPage extends StatelessWidget {
  const LastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: Text(
          "Tuna'nın Anketi :)",
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width > 600 ? 30.0 : 20.0),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Tebrikler anketi tamamladın e-posta hesabını buraya yazman yeterli :)",
                  style: TextStyle(
                      fontSize:
                          MediaQuery.of(context).size.width > 600 ? 25.0 : 18.0,
                      color: Colors.black),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: SizedBox(
                    height: 40.0, width: 300.0, child: CupertinoTextField()),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const HomePage(),
                  //     ));
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Onayla"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
