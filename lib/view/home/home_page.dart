import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> horizontalList = [
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1519996529931-28324d5a630e?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'imageUrl':
          'https://www.jiomart.com/images/product/original/599991773/dragonfruit-red-flesh-medium-premium-indian-1-pc-approx-300-g-400-g-product-images-o599991773-p602538035-0-202306230600.jpg?im=Resize=(420,420)',
    },
    {
      'imageUrl':
          'https://www.jiomart.com/images/product/original/599991868/apple-grannysmith-bites-premium-imported-3-pc-product-images-o599991868-p604441953-0-202309061044.jpg?im=Resize=(420,420)',
    },
    {
      'imageUrl':
          'https://www.jiomart.com/images/product/original/599991771/avocado-premium-indian-1-pc-approx-250-g-375-g-product-images-o599991771-p602529962-0-202306221933.jpg?im=Resize=(420,420)',
    },
    {
      'imageUrl':
          'https://www.jiomart.com/images/product/original/599991535/kiwi-green-jumbo-premium-imported-2-pc-approx-220-g-240-g-product-images-o599991535-p594456163-0-202210131728.jpg?im=Resize=(420,420)',
    },
    {
      'imageUrl':
          'https://www.jiomart.com/images/product/original/599991075/mulberry-premium-indian-pack-150-g-product-images-o599991075-p590959468-0-202209150849.jpg?im=Resize=(420,420)',
    },
  ];

  List<Map<String, String>> verticalList = [
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1519996529931-28324d5a630e?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'imageUrl':
          'https://www.jiomart.com/images/product/original/599991773/dragonfruit-red-flesh-medium-premium-indian-1-pc-approx-300-g-400-g-product-images-o599991773-p602538035-0-202306230600.jpg?im=Resize=(420,420)',
    },
    {
      'imageUrl':
          'https://www.jiomart.com/images/product/original/599991868/apple-grannysmith-bites-premium-imported-3-pc-product-images-o599991868-p604441953-0-202309061044.jpg?im=Resize=(420,420)',
    },
    {
      'imageUrl':
          'https://www.jiomart.com/images/product/original/599991771/avocado-premium-indian-1-pc-approx-250-g-375-g-product-images-o599991771-p602529962-0-202306221933.jpg?im=Resize=(420,420)',
    },
    {
      'imageUrl':
          'https://www.jiomart.com/images/product/original/599991535/kiwi-green-jumbo-premium-imported-2-pc-approx-220-g-240-g-product-images-o599991535-p594456163-0-202210131728.jpg?im=Resize=(420,420)',
    },
    {
      'imageUrl':
          'https://www.jiomart.com/images/product/original/599991075/mulberry-premium-indian-pack-150-g-product-images-o599991075-p590959468-0-202209150849.jpg?im=Resize=(420,420)',
    },
  ];

  List<Map<String, String>> gridList = [
    {
      'imageUrl':
          'https://images.unsplash.com/photo-1519996529931-28324d5a630e?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'imageUrl':
          'https://www.jiomart.com/images/product/original/599991773/dragonfruit-red-flesh-medium-premium-indian-1-pc-approx-300-g-400-g-product-images-o599991773-p602538035-0-202306230600.jpg?im=Resize=(420,420)',
    },
    {
      'imageUrl':
          'https://www.jiomart.com/images/product/original/599991868/apple-grannysmith-bites-premium-imported-3-pc-product-images-o599991868-p604441953-0-202309061044.jpg?im=Resize=(420,420)',
    },
    {
      'imageUrl':
          'https://www.jiomart.com/images/product/original/599991771/avocado-premium-indian-1-pc-approx-250-g-375-g-product-images-o599991771-p602529962-0-202306221933.jpg?im=Resize=(420,420)',
    },
    {
      'imageUrl':
          'https://www.jiomart.com/images/product/original/599991535/kiwi-green-jumbo-premium-imported-2-pc-approx-220-g-240-g-product-images-o599991535-p594456163-0-202210131728.jpg?im=Resize=(420,420)',
    },
    {
      'imageUrl':
          'https://www.jiomart.com/images/product/original/599991075/mulberry-premium-indian-pack-150-g-product-images-o599991075-p590959468-0-202209150849.jpg?im=Resize=(420,420)',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade200,
      appBar: AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Horizontal Listing',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: horizontalList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        horizontalList[index]['imageUrl']!,
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const SizedBox(),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Vertical Listing',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: verticalList.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 4,
                  margin: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      verticalList[index]['imageUrl']!,
                      height: 200,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const SizedBox(),
                    ),
                  ),
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Grid View',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: gridList.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      gridList[index]['imageUrl']!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const SizedBox(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
