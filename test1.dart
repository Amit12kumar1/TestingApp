import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashboardPage(),

      debugShowCheckedModeBanner: false,

    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      //  debugShowCheckedModeBanner: false,
        title: Text('App testing'),

       // backgroundColor:Colors.black,

      ),

      body: Padding(

        padding: const EdgeInsets.all(16.0),
        child: Column(

          children: [
            Row(
              children: [
                Expanded(
                  child: DashboardCard(
                    title: 'Total Views',
                    value: '265K',
                    icon: Icons.show_chart,
                  ),
                ),
                Expanded(
                  child: DashboardCard(

                    title: 'General',
                    value: 'Image,Video',
                    icon: Icons.photo_library,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: DashboardCard(
                    title: 'Notification',
                    value: 'all',
                    icon: Icons.notifications,
                  ),

                ),
                Expanded(
                  child: DashboardCard(
                    title: 'Revenue',
                    value: '\$16K',
                    icon: Icons.attach_money,
                    chart: false,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: DashboardCard(
                    title: 'Shop Items',
                    value: '173',
                    icon: Icons.shopping_cart,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final bool chart;

  DashboardCard({required this.title, required this.value, required this.icon, this.chart = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 50,color: Colors.amber,),
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.deepOrangeAccent),
                ),
              ],
            ),
            SizedBox(height: 110),
            if (chart)
              Container(
                height: 100,
                child: Placeholder(), // Placeholder for the chart
              )
            else
              Text(
                value,
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold,color: Colors.blue),
              ),
          ],
        ),
      ),
    );

  }
}