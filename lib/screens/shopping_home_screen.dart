import 'package:flutter/material.dart';

final products = [
  {'title': 'Wireless Headphones', 'price': '\$2,399', 'image': 'assets/images/product1.png'},
  {'title': 'Backpack', 'price': '\$100', 'image': 'assets/images/product2.png'},
  {'title': 'Smart Watch Ultra', 'price': '\$499', 'image': 'assets/images/product3.png'},
  {'title': 'Green T-shirt', 'price': '\$150', 'image': 'assets/images/product4.png'},
  {'title': 'Lipstick', 'price': '\$50', 'image': 'assets/images/product5.png'},
  {'title': 'White Shoes', 'price': '\$50', 'image': 'assets/images/product6.png'},
];

final offers = [
  {'image': 'assets/images/discount1.png', 'desc': 'Up to 50% off on all accessories!'},
  {'image': 'assets/images/discount2.png', 'desc': 'Buy one Wireless Headphones , get second half price.'},
  {'image': 'assets/images/discount3.png', 'desc': 'Free shipping on orders over \$200'},
  {'image': 'assets/images/discount4.png', 'desc': 'Exclusive discounts for new customers!'},
  {'image': 'assets/images/discount5.png', 'desc': 'End of season clearance!'},
];

final featuredImages = [
  'assets/images/product4.png',
  'assets/images/product5.png',
  'assets/images/product6.png', 
];


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Our Products',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        )
      ),
      home: const ShoppingHomeScreen(),
    );
  }
}


class ShoppingHomeScreen extends StatefulWidget {
  const ShoppingHomeScreen({super.key});

  @override
  State<ShoppingHomeScreen> createState() => _ShoppingHomeScreenState();
}

class _ShoppingHomeScreenState extends State<ShoppingHomeScreen> {
  int _currentImageIndex = 0;

  void _goToNextImage() {
    setState(() {
      _currentImageIndex = (_currentImageIndex + 1) % featuredImages.length;
    });
  }

  void _goToPreviousImage() {
    setState(() {
      _currentImageIndex = (_currentImageIndex - 1 + featuredImages.length) % featuredImages.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Our Products',
          style: TextStyle(
            fontFamily: "Suwannaphum",
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          
//  Featured Products title      
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Center(
                child: Text(
                  'Featured Products',
                  style: TextStyle(
                    fontFamily: "Suwannaphum",
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),

//size box with stack
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
              child: SizedBox(
                height: 300,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            featuredImages[_currentImageIndex], 
                            fit: BoxFit.contain,
                          ),
                          //shadow
                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.transparent, Colors.black87],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0.5, 1.0],
                              ),
                            ),
                          ),
                         //stack title
                          Container(
                            alignment: Alignment.bottomLeft,
                            padding: const EdgeInsets.all(16),
                            child: const Text(
                              'Premium Collection', 
                              style: TextStyle(
                                fontFamily: "Suwannaphum",
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //previous
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: _goToPreviousImage,
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
                        ),
                      ),
                    ),

                    // Next
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: _goToNextImage,
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20),
                        ),
                      ),
                    ),
                    
                    // Dots Indicator
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(featuredImages.length, (index) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.symmetric(horizontal: 4.0),
                              height: 8.0,
                              width: _currentImageIndex == index ? 20.0 : 8.0,
                              decoration: BoxDecoration(
                                color: _currentImageIndex == index ? const Color.fromARGB(255, 247, 174, 29):Colors.grey,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
//our proudct title
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  'Shop Our Collection',
                  style: TextStyle(
                    fontFamily: "Suwannaphum",
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),

//our product sliver grid
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, i) => ProductCard(product: products[i]),
                childCount: products.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.8, 
              ),
            ),
          ),

//offer title
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text('Hot Offers',
                  style: TextStyle(
                    fontFamily: "Suwannaphum",
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),

//offer list
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) => OfferCard(offer: offers[i]),
              childCount: offers.length,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }
}

//Our Product-card

class ProductCard extends StatelessWidget {
  final Map product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.asset(
                    product['image'],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content:
                          Text('Item "${product['title']}" added to the cart'),
                          backgroundColor:const Color.fromARGB(255, 247, 174, 29), 
                          ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color:const Color.fromARGB(255, 247, 174, 29),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(Icons.add_shopping_cart, color: Colors.white, size: 23),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['title'], 
                  style: const TextStyle(
                    fontFamily: "Suwannaphum",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(product['price'], 
                style: const TextStyle(
                color: Color.fromARGB(255, 247, 174, 29),
                fontSize: 20,
                fontWeight: FontWeight.bold,
                )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//Offer card

class OfferCard extends StatelessWidget {
  final Map offer;
  const OfferCard({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Image.asset(
          offer['image'], 
          width: 80, 
          height: 100, 
        fit: BoxFit.cover
        ),
        title: Text(
          offer['desc'],
          style: const TextStyle(
              fontFamily: "Suwannaphum",
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              )
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
      ),
    );
  }
}