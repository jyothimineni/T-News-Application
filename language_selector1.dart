import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const LanguageSelector1());
}

class LanguageSelector1 extends StatelessWidget {
  const LanguageSelector1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LanguageSelector1(),
    );
  }
}

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LanguageSelector1State createState() => _LanguageSelector1State();
}

class _LanguageSelector1State extends State<LanguageSelector> {
  String selectedLanguage = '';

  Widget languageBox({
    required String language,
    required String assetPath,
    required String script,
    required String englishName,
    required double height,
    required double width,
    required Color underlineColor,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLanguage = language;
        });
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        height: height, // Set the height of the box
        width: width, // Set the width of the box
        decoration: BoxDecoration(
          color: selectedLanguage == language
              ? const Color.fromARGB(255, 241, 232, 201)
              : const Color.fromARGB(255, 243, 241, 241),
          borderRadius: BorderRadius.circular(10),
          border: Border(
            bottom: BorderSide(
              color: underlineColor,
              width: 3.0,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(assetPath, height: 50),
            const SizedBox(width: 10),
            Column(
              children: [
                Text(englishName, style: const TextStyle(fontSize: 16)),
                Text(script,
                    style: const TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget socialMediaIcon(IconData icon, String url) {
    return IconButton(
      icon: FaIcon(icon),
      iconSize: 25,
      onPressed: () {
        _launchURL(url);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News Portal',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 243, 244, 245),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 229, 229, 230),
              Color.fromARGB(255, 204, 206, 206)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Choose your preferred language to read the news',
                style: TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 20, 20, 20)),
                textAlign: TextAlign.center,
              ),
            ),
            Column(
              children: [
                languageBox(
                  language: 'Telugu',
                  assetPath: 'assets/telugu.jpg',
                  script: 'తెలుగు',
                  englishName: 'Telugu',
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.9,
                  underlineColor: Colors.red,
                ),
                languageBox(
                  language: 'Tamil',
                  assetPath: 'assets/tamil.jpg',
                  script: 'தமிழ்',
                  englishName: 'Tamil',
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.9,
                  underlineColor: const Color.fromARGB(255, 70, 240, 55),
                ),
              ],
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio:
                    1.5, // Adjust the aspect ratio to make the boxes smaller
                children: [
                  languageBox(
                    language: 'Kannada',
                    assetPath: 'assets/kannada.jpg',
                    script: 'ಕನ್ನಡ',
                    englishName: 'Kannada',
                    height: 50,
                    width: 100,
                    underlineColor: const Color.fromARGB(255, 87, 163, 235),
                  ),
                  languageBox(
                    language: 'Hindi',
                    assetPath: 'assets/hindi.jpg',
                    script: 'हिन्दी',
                    englishName: 'Hindi',
                    height: 50,
                    width: 100,
                    underlineColor: const Color.fromARGB(255, 194, 75, 7),
                  ),
                  languageBox(
                    language: 'Marati',
                    assetPath: 'assets/marati.jpg',
                    script: 'मराठी',
                    englishName: 'Marati',
                    height: 50,
                    width: 100,
                    underlineColor: const Color.fromARGB(255, 243, 33, 226),
                  ),
                  languageBox(
                    language: 'Malayalam',
                    assetPath: 'assets/malayalam.jpg',
                    script: 'മലയാളം',
                    englishName: 'Malayalam',
                    height: 50,
                    width: 100,
                    underlineColor: const Color.fromARGB(255, 34, 51, 146),
                  ),
                  languageBox(
                    language: 'Gujarati',
                    assetPath: 'assets/gujarati.jpg',
                    script: 'ગુજરાતી',
                    englishName: 'Gujarati',
                    height: 50,
                    width: 100,
                    underlineColor: const Color.fromARGB(255, 238, 235, 39),
                  ),
                  languageBox(
                    language: 'Bangla',
                    assetPath: 'assets/bangla.jpg',
                    script: 'বাংলা',
                    englishName: 'Bangla',
                    height: 50,
                    width: 100,
                    underlineColor: const Color.fromARGB(255, 68, 209, 228),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 250, 247, 247),
                  backgroundColor: const Color.fromARGB(255, 71, 71, 71),
                ),
                onPressed: () {
                  if (selectedLanguage.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TeluguNewsApp(
                          selectedLanguage: selectedLanguage,
                        ),
                      ),
                    );
                  }
                },
                child: const Text('Continue'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Follow us on social media',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  socialMediaIcon(
                      FontAwesomeIcons.facebook, 'https://www.facebook.com'),
                  socialMediaIcon(
                      FontAwesomeIcons.twitter, 'https://www.twitter.com'),
                  socialMediaIcon(
                      FontAwesomeIcons.instagram, 'https://www.instagram.com'),
                  socialMediaIcon(
                      FontAwesomeIcons.linkedin, 'https://www.linkedin.com'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TeluguNewsApp extends StatelessWidget {
  final PageController _controller = PageController(initialPage: 0);
  final List<NewsItem> newsItems = [
    NewsItem(
      title: 'రాఖీ పండుగకు సంబంధించిన తాజా అప్డేట్లు',
      description:
          'రాఖీ పండుగను దేశమంతటా సోదర ప్రేమకు సంకేతంగా జరుపుకుంటారు. ఈ ఏడాది రాఖీ పండుగ సాంప్రదాయాలపై ప్రత్యేక కథనాలు...',
      imageUrl:
          'https://th.bing.com/th?id=OIP.2Wj0Ms5CQCN8hW4EthxPQwHaE8&w=305&h=204&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2',
    ),
    NewsItem(
      title: 'టీడీపీ రాజకీయ సమీక్ష',
      description:
          'టీడీపీ రాజకీయాలపై తాజా సమీక్ష. రాష్ట్రంలో పార్టీకి ఉన్న పరిస్థితులు, నేతల మధ్య అనుసంధానాలు, భవిష్యత్ ప్రణాళికలు...',
      imageUrl:
          'https://www.bing.com/th?id=OIP.WYn6wi7ZUbgRT_r3LJ6iSgHaEO&w=174&h=100&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2',
    ),
    NewsItem(
      title: 'టీటీడీ దేవస్థానం కీలక నిర్ణయాలు',
      description:
          'తిరుమల తిరుపతి దేవస్థానం సరికొత్త నిర్ణయాలు తీసుకుంది. భక్తులకు అందుబాటులోకి వచ్చిన కొత్త సేవలు, సౌకర్యాలు...',
      imageUrl:
          'https://th.bing.com/th?id=OIP.O4gr1V3F94FFS9qaa9L34AHaEK&w=333&h=187&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2',
    ),
  ];

  TeluguNewsApp({super.key, required String selectedLanguage});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('తెలుగు వార్తలు'),
        backgroundColor: const Color.fromARGB(255, 209, 209, 209),
      ),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: _controller,
        itemCount: newsItems.length,
        itemBuilder: (context, index) {
          return NewsCard(newsItems[index]);
        },
      ),
    );
  }
}

class NewsItem {
  final String title;
  final String description;
  final String imageUrl;

  NewsItem(
      {required this.title, required this.description, required this.imageUrl});
}

class NewsCard extends StatelessWidget {
  final NewsItem newsItem;

  const NewsCard(this.newsItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(newsItem.imageUrl,
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                color: Colors.grey[300],
                child: const Icon(
                  Icons.broken_image,
                  size: 50,
                  color: Colors.grey,
                ),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  newsItem.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  newsItem.description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
