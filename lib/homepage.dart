import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  final Widget child;

  HomePage({Key key, this.child}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<charts.Series<DisBarra, String>> _seriesData;
  List<charts.Series<Task, String>> _seriesPieData;
  List<charts.Series<Sales, int>> _seriesLineData;
  List<charts.Series<DisBurbuja, int>> _seriesBubbleData;
  _generateData() {
    final hombresData = [
      new DisBarra('Vision', 112613),
      new DisBarra('Oido', 37240),
      new DisBarra('Voz', 16595),
      new DisBarra('Caminar', 64271),
      new DisBarra('Brazos', 23001),
      new DisBarra('Intelecto', 19968),
      new DisBarra('Mente', 14126),
    ];

    final mujeresData = [
      new DisBarra('Vision', 138851),
      new DisBarra('Oido', 33469),
      new DisBarra('Voz', 12818),
      new DisBarra('Caminar', 76109),
      new DisBarra('Brazos', 25858),
      new DisBarra('Intelecto', 15448),
      new DisBarra('Mente', 12845),
    ];

    var piedata = [
      new Task('Work', 35.8, Color(0xff3366cc)),
      new Task('Eat', 8.3, Color(0xff990099)),
      new Task('Commute', 10.8, Color(0xff109618)),
      new Task('TV', 15.6, Color(0xfffdbe19)),
      new Task('Sleep', 19.2, Color(0xffff9900)),
      new Task('Other', 10.3, Color(0xffdc3912)),
    ];

    var linesalesdata = [
      new Sales(0, 45),
      new Sales(1, 56),
      new Sales(2, 55),
      new Sales(3, 60),
      new Sales(4, 61),
      new Sales(5, 70),
    ];
    var linesalesdata1 = [
      new Sales(0, 35),
      new Sales(1, 46),
      new Sales(2, 45),
      new Sales(3, 50),
      new Sales(4, 51),
      new Sales(5, 60),
    ];
    final visionBData = [
      new DisBurbuja(14471, 0),
      new DisBurbuja(30661, 15),
      new DisBurbuja(117509, 30),
      new DisBurbuja(22374, 60),
      new DisBurbuja(34089, 65),
      new DisBurbuja(28368, 75),
      new DisBurbuja(3992, 90),
    ];

    final oidoBData = [
      new DisBurbuja(3339, 2),
      new DisBurbuja(4983, 17),
      new DisBurbuja(20643, 32),
      new DisBurbuja(5409, 60),
      new DisBurbuja(12858, 67),
      new DisBurbuja(19258, 77),
      new DisBurbuja(4219, 92),
    ];

    final vozBData = [
      new DisBurbuja(7331, 4),
      new DisBurbuja(4810, 19),
      new DisBurbuja(8359, 34),
      new DisBurbuja(1210, 61),
      new DisBurbuja(2469, 69),
      new DisBurbuja(4126, 79),
      new DisBurbuja(1108, 94),
    ];

    final caminarBData = [
      new DisBurbuja(4749, 6),
      new DisBurbuja(8350, 21),
      new DisBurbuja(48919, 36),
      new DisBurbuja(13790, 61),
      new DisBurbuja(26710, 71),
      new DisBurbuja(32221, 81),
      new DisBurbuja(5641, 96),
    ];

    final brazosBData = [
      new DisBurbuja(2202, 8),
      new DisBurbuja(3953, 23),
      new DisBurbuja(19530, 38),
      new DisBurbuja(4766, 62),
      new DisBurbuja(8216, 72),
      new DisBurbuja(8588, 83),
      new DisBurbuja(1604, 98),
    ];

    final intelectoBData = [
      new DisBurbuja(9571, 10),
      new DisBurbuja(11395, 25),
      new DisBurbuja(10867, 40),
      new DisBurbuja(766, 62),
      new DisBurbuja(1204, 73),
      new DisBurbuja(1331, 85),
      new DisBurbuja(282, 100),
    ];

    final mentalBData = [
      new DisBurbuja(2624, 12),
      new DisBurbuja(4957, 27),
      new DisBurbuja(11258, 42),
      new DisBurbuja(1429, 62),
      new DisBurbuja(2476, 74),
      new DisBurbuja(3514, 87),
      new DisBurbuja(713, 102),
    ];
    
    _seriesData.add(
      charts.Series(
        domainFn: (DisBarra disbarra, _) => disbarra.discapacidad,
        measureFn: (DisBarra disbarra, _) => disbarra.cantidad,
        id: 'Hombres',
        data: hombresData,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (DisBarra disbarra, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff2296F3)),
      ), 
    );

    _seriesData.add(
      charts.Series(
        domainFn: (DisBarra disbarra, _) => disbarra.discapacidad,
        measureFn: (DisBarra disbarra, _) => disbarra.cantidad,
        id: 'Mujeres',
        data: mujeresData,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (DisBarra disbarra, _) =>
           charts.ColorUtil.fromDartColor(Color(0xff90CBF9)),
      ),
    );
    _seriesPieData.add(
      charts.Series(
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Air Pollution',
        data: piedata,
         labelAccessorFn: (Task row, _) => '${row.taskvalue}',
      ),
    );

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'Air Pollution',
        data: linesalesdata,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff109618)),
        id: 'Air Pollution',
        data: linesalesdata1,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );

    _seriesBubbleData.add(
      charts.Series(
        id: 'Vision',
        // Providing a color function is optional.
        colorFn: (DisBurbuja sales, _) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (DisBurbuja sales, _) => sales.edad,
        measureFn: (DisBurbuja sales, _) => sales.cantidad,
        // Providing a radius function is optional.
        radiusPxFn: (DisBurbuja sales, _) {
          if(sales.cantidad > 9999) {
            return (sales.cantidad / 10000) * 2;
          }
          else{
            return (sales.cantidad/1000);
          }
        },
        data: visionBData,
      ),
    );

    _seriesBubbleData.add(
      charts.Series(
        id: 'Oido',
        // Providing a color function is optional.
        colorFn: (DisBurbuja sales, _) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (DisBurbuja sales, _) => sales.edad,
        measureFn: (DisBurbuja sales, _) => sales.cantidad,
        // Providing a radius function is optional.
        radiusPxFn: (DisBurbuja sales, _) {
          if(sales.cantidad > 9999) {
            return (sales.cantidad / 10000) * 2;
          }
          else{
            return (sales.cantidad/1000);
          }
        },
        data: oidoBData,
      ),
    );

    _seriesBubbleData.add(
      charts.Series(
        id: 'Voz',
        // Providing a color function is optional.
        colorFn: (DisBurbuja sales, _) => charts.MaterialPalette.yellow.shadeDefault,
        domainFn: (DisBurbuja sales, _) => sales.edad,
        measureFn: (DisBurbuja sales, _) => sales.cantidad,
        // Providing a radius function is optional.
        radiusPxFn: (DisBurbuja sales, _) {
          if(sales.cantidad > 9999) {
            return (sales.cantidad / 10000) * 2;
          }
          else{
            return (sales.cantidad/1000);
          }
        },
        data: vozBData,
      ),
    );

    _seriesBubbleData.add(
      charts.Series(
        id: 'Caminar',
        // Providing a color function is optional.
        colorFn: (DisBurbuja sales, _) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (DisBurbuja sales, _) => sales.edad,
        measureFn: (DisBurbuja sales, _) => sales.cantidad,
        // Providing a radius function is optional.
        radiusPxFn: (DisBurbuja sales, _) {
          if(sales.cantidad > 9999) {
            return (sales.cantidad / 10000) * 2;
          }
          else{
            return (sales.cantidad/1000);
          }
        },
        data: caminarBData,
      ),
    );

    _seriesBubbleData.add(
      charts.Series(
        id: 'Brazos',
        // Providing a color function is optional.
        colorFn: (DisBurbuja sales, _) => charts.MaterialPalette.purple.shadeDefault,
        domainFn: (DisBurbuja sales, _) => sales.edad,
        measureFn: (DisBurbuja sales, _) => sales.cantidad,
        // Providing a radius function is optional.
        radiusPxFn: (DisBurbuja sales, _) {
          if(sales.cantidad > 9999) {
            return (sales.cantidad / 10000) * 2;
          }
          else{
            return (sales.cantidad/1000);
          }
        },
        data: brazosBData,
      ),
    );

    _seriesBubbleData.add(
      charts.Series(
        id: 'Intelectual',
        // Providing a color function is optional.
        colorFn: (DisBurbuja sales, _) => charts.MaterialPalette.deepOrange.shadeDefault,
        domainFn: (DisBurbuja sales, _) => sales.edad,
        measureFn: (DisBurbuja sales, _) => sales.cantidad,
        // Providing a radius function is optional.
        radiusPxFn: (DisBurbuja sales, _) {
          if(sales.cantidad > 9999) {
            return (sales.cantidad / 10000) * 2;
          }
          else{
            return (sales.cantidad/1000);
          }
        },
        data: intelectoBData,
      ),
    );

    _seriesBubbleData.add(
      charts.Series(
        id: 'Mental',
        // Providing a color function is optional.
        colorFn: (DisBurbuja sales, _) => charts.MaterialPalette.cyan.shadeDefault,
        domainFn: (DisBurbuja sales, _) => sales.edad,
        measureFn: (DisBurbuja sales, _) => sales.cantidad,
        // Providing a radius function is optional.
        radiusPxFn: (DisBurbuja sales, _) {
          if(sales.cantidad > 9999) {
            return (sales.cantidad / 10000) * 2;
          }
          else{
            return (sales.cantidad/1000);
          }
        },
        data: mentalBData,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesData = List<charts.Series<DisBarra, String>>();
    _seriesPieData = List<charts.Series<Task, String>>();
    _seriesLineData = List<charts.Series<Sales, int>>();
    _seriesBubbleData = List<charts.Series<DisBurbuja,int>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff1976d2),
            //backgroundColor: Color(0xff308e1c),
            bottom: TabBar(
              indicatorColor: Color(0xff9962D0),
              tabs: [
                Tab(
                  icon: Icon(FontAwesomeIcons.solidChartBar),
                ),
                Tab(icon: Icon(FontAwesomeIcons.chartPie)),
                Tab(icon: Icon(FontAwesomeIcons.chartLine)),
              ],
            ),
            title: Text('Flutter Charts'),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                            'Discapacidad en Costa Rica por tipo',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                        Expanded(
                          child: charts.BarChart(
                            _seriesData,
                            animate: false,
                            barGroupingType: charts.BarGroupingType.grouped,
                            behaviors: [new charts.SeriesLegend(outsideJustification: charts.OutsideJustification.endDrawArea,
                              horizontalFirst: false,
                              desiredMaxRows: 2,
                              cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                              entryTextStyle: charts.TextStyleSpec(
                                  color: charts.MaterialPalette.black,
                                  fontFamily: 'Georgia',
                                  fontSize: 11),
                            )
                            ],

                            animationDuration: Duration(seconds: 5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                            'Time spent on daily tasks',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                            SizedBox(height: 10.0,),
                        Expanded(
                          child: charts.PieChart(
                            _seriesPieData,
                            animate: true,
                            animationDuration: Duration(seconds: 5),
                             behaviors: [
                            new charts.DatumLegend(
                              outsideJustification: charts.OutsideJustification.endDrawArea,
                              horizontalFirst: false,
                              desiredMaxRows: 2,
                              cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                              entryTextStyle: charts.TextStyleSpec(
                                  color: charts.MaterialPalette.purple.shadeDefault,
                                  fontFamily: 'Georgia',
                                  fontSize: 11),
                            )
                          ],
                           defaultRenderer: new charts.ArcRendererConfig(
                              arcWidth: 100,
                             arcRendererDecorators: [
          new charts.ArcLabelDecorator(
              labelPosition: charts.ArcLabelPosition.inside)
        ])),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                            'Sales for the first 5 years',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                        Expanded(

                          child: charts.ScatterPlotChart(
                            _seriesBubbleData,
                            animate: true,
                            domainAxis: new charts.NumericAxisSpec(
                              renderSpec: new charts.SmallTickRendererSpec(
                                //tickLengthPx: 14,
                              ),
                            ),
                            behaviors: [new charts.SeriesLegend(outsideJustification: charts.OutsideJustification.endDrawArea,
                              horizontalFirst: false,
                              desiredMaxRows: 2,
                              cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                              entryTextStyle: charts.TextStyleSpec(
                                  color: charts.MaterialPalette.black,
                                  fontFamily: 'Georgia',
                                  fontSize: 11),
                            )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Pollution {
  String place;
  int year;
  int quantity;

  Pollution(this.year, this.place, this.quantity);
}

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}

class Sales {
  int yearval;
  int salesval;

  Sales(this.yearval, this.salesval);
}

class DisBarra {
  final String discapacidad;
  final int cantidad;

  DisBarra(this.discapacidad, this.cantidad);
}
class DisBurbuja {
  final int cantidad;
  final int edad;

  DisBurbuja(this.cantidad, this.edad);
}