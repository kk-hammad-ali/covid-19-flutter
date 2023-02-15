import 'package:covid_19/widget/reuseable_row.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatScreen extends StatefulWidget {
  const WorldStatScreen({super.key});

  @override
  State<WorldStatScreen> createState() => _WorldStatScreenState();
}

class _WorldStatScreenState extends State<WorldStatScreen> with TickerProviderStateMixin{

  late final AnimationController _animationController;
  @override
  void initState() {
      _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  final colorList = const [
    Color(0xFF4285F4),
    Color(0xFF1AA268),
    Color(0xFFDE5246)
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              PieChart(
                dataMap: const {
                  "Total": 300,
                  "Recoverd" :23,
                  "Death": 212,
                },
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                legendOptions: const LegendOptions(
                  legendPosition: LegendPosition.left
                ),
                animationDuration: const Duration(milliseconds: 1200),
                chartType: ChartType.ring,
                colorList: colorList,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.08),
                child: Card(
                  child: Column(
                    children: const [
                      ReuseableRow(title: 'Total', value: '200',),
                      ReuseableRow(title: 'Total', value: '200',),
                      ReuseableRow(title: 'Total', value: '200',),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF1AA260),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: const Center(
                  child: Text('Track Counties', style: TextStyle(
                    fontSize: 25,
                    color: Colors.white
                  ),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

