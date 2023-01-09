import 'package:flutter/material.dart';

class Stories extends StatefulWidget {
  const Stories({super.key});

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainWidget(),
    );
  }

  Widget mainWidget() {
    return Column(
      children: [
        headerWidget(),
        imageWidget(),
        storiesWidget(),
      ],
    );
  }

  Widget headerWidget() {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.09,
      decoration: const BoxDecoration(color: Colors.amber),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.deepPurpleAccent,
                size: 30,
              ),
            ),
            const Text(
              "Uygulama",
              style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 30),
            ),
            const Icon(
              Icons.settings,
              color: Colors.deepPurpleAccent,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget imageWidget() {
    return Center(
      child: Image.asset(
        'assets/images/armut.jpg',
        width: 300,
        height: 300,
        alignment: Alignment.center,
      ),
    );
  }

  Widget storiesWidget() {
    return const Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
              "Sude ailesini asla üzmek istemeyen bir çocukmuş. Onların bu kadar üzülmesSude ailesini asla üzmek istemeyen bir çocukmuş. Onların bu kadar üzülmesSude ailesini asla üzmek istemeyen bir çocukmuş. Onların bu kadar üzülmesSude ailesini asla üzmek istemeyen bir çocukmuş. Onların bu kadar üzülmesSude ailesini asla üzmek istemeyen bir çocukmuş. Onların bu kadar üzülmesini istememiş ve derslerine asılmaya karar vermiş. Her gün düzenli bir şekilde ödevlerini yapmaya daha sonra da derslerini tekrar etmeye başlamış. Bu sayede okulda ki başarısı da yükselmiş.Sude ailesini asla üzmek istemeyen bir çocukmuş. Onların bu kadar üzülmesini istememiş ve derslerine asılmaya karar vermiş. Her gün düzenli bir şekilde ödevlerini yapmaya daha sonra da derslerini tekrar etmeye başlamış. Bu sayede okulda ki başarısı da yükselmiş.Sude ailesini asla üzmek istemeyen bir çocukmuş. Onların bu kadar üzülmesini istememiş ve derslerine asılmaya karar vermiş. Her gün düzenli bir şekilde ödevlerini yapmaya daha sonra da derslerini tekrar etmeye başlamış. Bu sayede okulda ki başarısı da yükselmişSude ailesini asla üzmek istemeyen bir çocukmuş. Onların bu kadar üzülmesini istememiş ve derslerine asılmaya karar vermiş. Her gün düzenli bir şekilde ödevlerini yapmaya daha sonra da derslerini tekrar etmeye başlamış. Bu sayede okulda ki başarısı da yükselmiş.Sude ailesini asla üzmek istemeyen bir çocukmuş. Onların bu kadar üzülmesini istememiş ve derslerine asılmaya karar vermiş. Her gün düzenli bir şekilde ödevlerini yapmaya daha sonra da derslerini tekrar etmeye başlamış. Bu sayede okulda ki başarısı da yükselmiş.Sude ailesini asla üzmek istemeyen bir çocukmuş. Onların bu kadar üzülmesini istememiş ve derslerine asılmaya karar vermiş. Her gün düzenli bir şekilde ödevlerini yapmaya daha sonra da derslerini tekrar etmeye başlamış. Bu sayede okulda ki başarısı da yükselmiş."),
        ),
      ),
    );
  }
}
