import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
  home: new HomePage(),
));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _result = [];
  List<String> _strings = List.from({
    "a",
    "ab",
    "abc",
    "abcd",
    "abcde",
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> statelessStrings = <Widget>[];
    List<Widget> statefulStrings = <Widget>[];
    _strings.forEach((s) {
      statelessStrings.add(Text(s));
      statefulStrings.add(SampleWidget(s));
    });

    List<Widget> statelessResult = <Widget>[];
    List<Widget> statefulResult = <Widget>[];
    _result.forEach((s) {
      statelessResult.add(Text(s));
      statefulResult.add(SampleWidget(s));
    });

    return Scaffold(
        appBar: AppBar(
          title: Text('API docs suggestion'),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text("[builder] Search works with stateless widgets"),
                Container(
                    height: 120,
                    child: _result.length != 0
                        ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: _result.length,
                      itemBuilder: (context, i) => Text(_result[i]),
                    )
                        : ListView.builder(
                      shrinkWrap: true,
                      itemCount: _strings.length,
                      itemBuilder: (context, i) => Text(_strings[i]),
                    )),
                Text("[builder] Search do not works with stateful widgets"),
                Container(
                    height: 120,
                    child: _result.length != 0
                        ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: _result.length,
                      itemBuilder: (context, i) => SampleWidget(_result[i]),
                    )
                        : ListView.builder(
                      shrinkWrap: true,
                      itemCount: _strings.length,
                      itemBuilder: (context, i) => SampleWidget(_strings[i]),
                    )),
                Text(
                    "[explicit List<Widget> children] Search works with stateless widgets"),
                Container(
                    height: 120,
                    child: _result.length != 0
                        ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: _result.length,
                      itemBuilder: (context, i) => Text(_result[i]),
                    )
                        : ListView.builder(
                      shrinkWrap: true,
                      itemCount: _strings.length,
                      itemBuilder: (context, i) => Text(_strings[i]),
                    )),
                Text(
                    "[explicit List<Widget> children] Search do not works with stateful widgets"),
                Container(
                    height: 120,
                    child: _result.length != 0
                        ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: _result.length,
                      itemBuilder: (context, i) => SampleWidget(_result[i]),
                    )
                        : ListView.builder(
                      shrinkWrap: true,
                      itemCount: _strings.length,
                      itemBuilder: (context, i) => SampleWidget(_strings[i]),
                    )),
                ListTile(
                  leading: Icon(Icons.search),
                  title: TextField(
                    onChanged: onSearchTextChanged,
                  ),
                )
              ],
            )));
  }

  onSearchTextChanged(String search) {
    _result.clear();

    for (String s in _strings) {
      if (s.contains(search)) _result.add(s);
    }

    setState(() {});
  }
}

class SampleWidget extends StatefulWidget {
  final String str;
  SampleWidget(this.str);
  @override
  _SampleWidgetState createState() => _SampleWidgetState(str);
}

class _SampleWidgetState extends State<SampleWidget> {
  final String str;
  _SampleWidgetState(this.str);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(str),
    );
  }
}
