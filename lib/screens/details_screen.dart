import 'package:covid_19/widget/reuseable_row.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String name, imgUrl;
  final int totalCases, totalRecovered, active, critical, todayRecovered, test, death;
  const DetailsScreen({super.key, required this.name, required this.imgUrl, required this.totalCases, required this.totalRecovered, required this.active, required this.critical, required this.todayRecovered, required this.test, required this.death});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08, left: 20, right: 20),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.06,),
                      ReuseableRow(
                        title: 'Cases', 
                        value: widget.totalCases.toString(),
                        ),
                      ReuseableRow(
                        title: 'Recovered', 
                        value: widget.totalRecovered.toString(),
                        ),
                      ReuseableRow(
                        title: 'Deaths', 
                        value: widget.death.toString(),
                        ),
                      ReuseableRow(
                        title: 'Critical', 
                        value: widget.critical.toString(),
                        ),
                      ReuseableRow(
                        title: 'Today Recovered', 
                        value: widget.todayRecovered.toString(),
                        ),
                      ReuseableRow(
                        title: 'Active', 
                        value: widget.active.toString(),
                        ),
                      ReuseableRow(
                        title: 'Test', 
                        value: widget.test.toString(),
                        ),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  widget.imgUrl
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}