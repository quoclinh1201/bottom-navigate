import 'package:flutter/material.dart';

// void main() => runApp(HomeScreen());

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
           const SliverAppBar(
            title: HomeTitle(),
            // title: HomeHeader("../../assets/title.png"),
            centerTitle: true,
            expandedHeight: 100,
            backgroundColor: Color(0xff38ab44),
            bottom: PreferredSize(
              preferredSize: Size(30, 30),
              child: Location()
            )
          )
        ],
        body: ListView.separated(
          padding: const EdgeInsets.all(12),
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemCount: 25,
          itemBuilder: (context, index) => buildCard(index + 1)
        )
    );
  }

  buildCard(int i) {
    return ListTile(
      title: Text("Item " + i.toString())
    );
  }
}


class HomeTitle extends StatelessWidget {
  const HomeTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.only(top: 25),
        child: Text(
          "Football For Everyone",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.black
          )
        )
    );
  }
}

class Location extends StatelessWidget {
  const Location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
            Icon(Icons.location_on, color: Colors.black),
            SizedBox(width: 10),
            Text("603/17 Phạm Văn Chiêu", style: TextStyle(color: Colors.black))
            ]),
          const Icon(Icons.favorite, color: Colors.red)
        ]
      ),
    );
  }
}