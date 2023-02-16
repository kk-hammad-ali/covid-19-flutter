import 'package:covid_19/services/stat_services.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    StatServices statServices = StatServices();

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                onChanged: (value){
                  setState(() {
                    
                  });
                },
                controller: searchController,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    hintText: 'Search with country name',
                    hintStyle: const TextStyle(fontSize: 18),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
            ),
            Expanded(
                child: FutureBuilder(
              future: statServices.countriesList(),
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                if (!snapshot.hasData) {
                  return Shimmer.fromColors(
                    highlightColor: Colors.green.shade100,
                    baseColor: Colors.green.shade700,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Container(
                            height: 50,
                            width: 80,
                            color: Colors.white,
                          ),
                          title: Container(
                            height: 10,
                            width: 80,
                            color: Colors.white,
                          ),
                          subtitle: Container(
                            height: 10,
                            width: 80,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      String name = snapshot.data![index]['country'];
                      if(searchController.text.isEmpty){
                        return Column(
                        children: [
                          ListTile(
                            leading: Image(
                              height: 50,
                              width: 50,
                              image: NetworkImage(
                                snapshot.data![index]['countryInfo']['flag'],
                              ),
                            ),
                            title: Text(
                              snapshot.data![index]['country'],
                              style: const TextStyle(fontSize: 20,),
                            ),
                            subtitle: Text(
                              snapshot.data![index]['cases'].toString(),
                              style: const TextStyle(fontSize: 18),
                            ),
                          )
                        ],
                      );
                      }else if(name.toLowerCase().contains(
                        searchController.text.toLowerCase()
                      )){
                        return Column(
                        children: [
                          ListTile(
                            leading: Image(
                              height: 50,
                              width: 50,
                              image: NetworkImage(
                                snapshot.data![index]['countryInfo']['flag'],
                              ),
                            ),
                            title: Text(
                              snapshot.data![index]['country'],
                              style: const TextStyle(fontSize: 20,),
                            ),
                            subtitle: Text(
                              snapshot.data![index]['cases'].toString(),
                              style: const TextStyle(fontSize: 18),
                            ),
                          )
                        ],
                      );
                      }else{
                        return Container();
                      }
                      
                    },
                  );
                }
              },
            ))
          ],
        ),
      ),
    );
  }
}
