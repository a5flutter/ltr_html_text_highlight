import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RTL HTML Highlight Challenge',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'RTL HTML Highlight Challenge'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _mode = '0';
  String source1 =
      '<ul> <li>في تنفيذ أحكام (المادة السادسة) من النظام: <ul> <li>1) إذا استمر الطرفان في كل من عقد العمل المؤقت أو عقد العمل العرضي في العمل لمدة تجاوزت تسعين يوماً، تحول عقد العمل المؤقت أو عقد العمل العرضي إلى عقد عمل يخضع لجميع أحكام نظام العمل دون النظر لمسمى تأشيرة العمل التي قدم بها العامل - إذا كان وافداً - ومدة الإقامة الممنوحة له بموجبها.<\/li> <li>2) تختص المحاكم العمالية بالنظر في الخلافات التي قد تنشأ بين الطرفين في كل من عقد العمل العرضي، والموسمي، والمؤقت.<\/li><\/ul><\/li><\/ul>';
  String source2 =
      '<ul> <li>في تنفيذ أحكام (المادة السابعة عشرة) من النظام يجب على صاحب العمل تضمين الكشوف والسجلات والملفات التي يحتفظ بها في مكان العمل سواء أكانت ورقية أم الكترونية - البيانات التالية: <ul> <li><strong>1- كشـف أسماء العمال:<\/strong> يحتوي على بيانات بأسـماء عمال المنشـأة، ومهنة كل منهم، وأعمارهم، وجنسياتهم، وأرقام هوياتهم، وأرقام رخص العمل لغير السعوديين وتواريخها.<\/li> <li><strong>2- كشف أجور العمال:<\/strong> يحتوي على بيانات بأجور العمال، وتواريخ استلامهم لها، وما يتم حسمه من الأجر، وسبب الحسم.<\/li> <li><strong>3- سجل قيد الغرامات:<\/strong> يحتوي على بيان باسم العامل، ومقدار أجره، ومقدار الغرامة الموقعة عليه، وسبب وتاريخ إيقاعها.<\/li> <li><strong>4- سجل الحضور والانصراف:<\/strong> يحتوي على وقت حضور العامل للعمل، ووقت انصرافه من مقر العمل، وأي بيانات أخرى يضعها صاحب العمل.<\/li> <li><strong>5- سجل تدريب السعوديين:<\/strong> يحتوي على اسم برنامج التدريب، ونوعه، ومدته، وسنة التدريب، وعدد وأسماء العاملين الذين تم تدريبهم عليه، ونسبتهم من عدد العاملين لديه.<\/li> <li><strong>6- سجل الفحص الطبي للعمال في المنشآت المحتمل إصابة عمالها بالأمراض المهنية:<\/strong> يحتوي على بيان بأسماء العمال الذين تم فحصهم وتاريخ الفحص، ونتائجه.<\/li> <li><strong>7- ملف عمل لكل عامل:<\/strong> يحتوي على بياناته، وعنوانه، ونسخة من عقد العمل، وأي شهادات أو وثائق يقدمها لصاحب العمل.<\/li><\/ul><\/li><\/ul>';

  void _setModeNule() {
    setState(() {
      _mode = '0';
    });
  }

  /*
  (1)
"color": "redHighlight",
"start": "10",
"end": "320",
   */
  void _setModeOne() {
    setState(() {
      _mode = '1';
    });
  }

  /*
  both in (2)
"color": "purbleHighlight",
"start": "179",
"end": "236",

"color": "blueHighlight",
"start": "344",
"end": "362",
   */
  void _setModeTwo() {
    setState(() {
      _mode = '2';
    });
  }

  Map<String, Style> buildStyles() {
    return {
      "li": Style(
        fontFamily: 'serif',
        color: Theme.of(context).colorScheme.onBackground,
      ),
      "ul > li": Style(
        fontFamily: 'serif',
        color: Theme.of(context).colorScheme.onBackground,
      ),
      "strong": Style(
        padding: HtmlPaddings.all(16),
        fontSize: FontSize.larger,
        color: Theme.of(context).colorScheme.onBackground,
      ),
      "mark.heightlightRed":
          Style(backgroundColor: Colors.transparent, color: Colors.redAccent),
      "mark.heightlightPurple": Style(
          backgroundColor: Colors.transparent, color: Colors.purpleAccent),
      "mark.heightlightBlue":
          Style(backgroundColor: Colors.transparent, color: Colors.blueAccent),
    };
  }

  String getSource1() {
    switch (_mode) {
      case '1':
        /*
        "color": "redHighlight",
        "start": "10",
        "end": "320",
         */
        List<String> splitted = [
          source1.substring(0, 10),
          source1.substring(10, 320),
          source1.substring(320, source1.length)
        ];
        return '${splitted[0]}<mark class=\"heightlightRed\">${splitted[1]}<\/mark>${splitted[2]}';
      case '2':
        return source1;
      default:
        return source1;
    }
  }

  String getSource2() {
    switch (_mode) {
      case '1':
        return source2;
      case '2':
        /*
        both in (2)
        "color": "purbleHighlight",
        "start": "179",
        "end": "236",

        "color": "blueHighlight",
        "start": "344",
        "end": "362",
         */
        List<String> splitted = [
          source2.substring(0, 179),
          source2.substring(179, 236),
          source2.substring(236, 344),
          source2.substring(344, 362),
          source2.substring(362, source2.length)
        ];
        return '${splitted[0]}<mark class=\"heightlightPurple\">${splitted[1]}<\/mark>${splitted[2]}<mark class=\"heightlightBlue\">${splitted[3]}<\/mark>${splitted[4]}';
      default:
        return source2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Spacer(),
                  const Text(
                    'Mode: ',
                  ),
                  Text(
                    '$_mode',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Spacer()
                ]),
            SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                primary: true,
                child: Directionality( textDirection: TextDirection.rtl, child: Html(style: buildStyles(), data: getSource1()))),
            SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                primary: true,
                child: Directionality( textDirection: TextDirection.rtl, child: Html(style: buildStyles(), data: getSource2())))
          ],
        ),
      ),
      floatingActionButton: Row(children: [
        SizedBox(
          width: 20,
        ),
        FloatingActionButton(
          onPressed: _setModeNule,
          tooltip: 'Mode 0',
          child: Text('0'),
        ),
        SizedBox(
          width: 10,
        ),
        FloatingActionButton(
          onPressed: _setModeOne,
          tooltip: 'Mode 1',
          child: Text('1'),
        ),
        SizedBox(
          width: 10,
        ),
        FloatingActionButton(
          onPressed: _setModeTwo,
          tooltip: 'Mode 2',
          child: Text('2'),
        )
      ]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
