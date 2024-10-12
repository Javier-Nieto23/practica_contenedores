import 'package:flutter/material.dart';
//corre la aplicacion MyApp
void main() {
  runApp(MyApp());
}
//clase MyApp la cual 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OrderSummaryScreen(),
    );
  }
}

class OrderSummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //topBar de la aplicacion
        title: Text('Reorder Pick-Up'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.directions_car),
                SizedBox(width: 5),
                Text('Delivery', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
      //cuerpo de la aplicacion 
      body: Column(
        children:[
          Expanded(
            //lista de los platillos
            child: ListView(
              children: [
                // platillo 1
                OrderItem(
                  imageUrl:
                      'https://www.cookwithmanali.com/wp-content/uploads/2022/12/Instant-Pot-Beetroot-Tomato-Soup-1200x1818.jpg', // Url de la imagen
                  itemName: 'Super Colorful Soup',
                  price: '\$20',
                ),
                // Platillo 2
                OrderItem(
                  imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_cRW-GpvSWO4EPgIdzAIrEqxju4YEpESbTQ&s', // Url de la imagen
                  itemName: 'Avocado Salad',
                  price: '\$10',
                ),
                //platillo 3
                OrderItem(
                  imageUrl:
                      'https://www.gourmet.cl/wp-content/uploads/2016/09/Ensalada_C%C3%A9sar-web.jpg', // Url de la imagen
                  itemName: 'Caessar Salad',
                  price: '\$9',
                ),
              ],
            ),
          ),
          //divisor de los costos finales
          Divider(),
          //tarifa por taxi
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Taxes and Fees', style: TextStyle(fontSize: 16)),
                Text('\$4', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          SizedBox(height: 10),
          // Tarifa totalTotal
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('\$43', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Botones cancelar y ordenar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // Boton cancelar
                    },
                    child: Text('Cancel'),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Boton ordenar
                    },
                    child: Text('Order'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  final String imageUrl;
  final String itemName;
  final String price;

  OrderItem({required this.imageUrl, required this.itemName, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              itemName,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Text(
            price,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
