import 'package:flutter/material.dart';
import 'model.dart';
import 'animal_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  static List<String> animalName = [
    'Cow',
    'Zebra',
    'Giraffe',
    'Koala',
    'Hedgehog',
    'Panda',
    'Lion',
    'Bear',
    'Penguin',
    'Elephant',
  ];

  static List<String> animalImagePath = [
    'image/1.png',
    'image/2.png',
    'image/3.png',
    'image/4.png',
    'image/5.png',
    'image/6.png',
    'image/7.png',
    'image/8.png',
    'image/9.png',
    'image/10.png',
  ];

  static List<String> animalLocation = [
    'Natural Park1',
    'Natural Park2',
    'Natural Park3',
    'Natural Park4',
    'Natural Park5',
    'Natural Park6',
    'Natural Park7',
    'Natural Park8',
    'Natural Park9',
    'Natural Park10',
  ];

  final List<Animal> animalData = List.generate(
      animalLocation.length,
      (index) => Animal(
          animalName[index], animalLocation[index], animalImagePath[index]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
      ),
      body: ListView.builder(
        itemCount: animalData.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                animalData[index].name,
              ),
              leading: SizedBox(
                height: 50,
                width: 50,
                child: Image.asset(animalData[index].imgPath),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AnimalPage(
                          animal: animalData[index],
                        )));
                debugPrint(animalData[index].name);
              },
            ),
          );
        },
      ),
    );
  }
}
