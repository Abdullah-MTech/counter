import 'package:get/get.dart';

class OrderModel {
  final String orderNumber;
  final double price;

  OrderModel({required this.orderNumber, required this.price});
}

class CartItemModel {
  final String name;
  final String weight;
  final double price;
  final String imageUrl;

  CartItemModel({
    required this.name,
    required this.weight,
    required this.price,
    required this.imageUrl,
  });
}

class HomeController extends GetxController {
  // Observable list of orders
  var orders = <OrderModel>[].obs;
  
  // Observable list of cart items
  var cartItems = <CartItemModel>[].obs;
  
  // Total cart price
  var totalPrice = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    loadDummyData();
  }

  void loadDummyData() {
    // Load dummy orders
    orders.value = [
      OrderModel(orderNumber: '0058', price: 15.50),
      OrderModel(orderNumber: '0058', price: 15.50),
      OrderModel(orderNumber: '0058', price: 15.50),
      OrderModel(orderNumber: '0058', price: 15.50),
    ];

    // Load dummy cart items
    cartItems.value = [
      CartItemModel(
        name: 'Mix Mithai',
        weight: '1 Kg',
        price: 5.50,
        imageUrl: 'assets/images/mithai1.png',
      ),
      CartItemModel(
        name: 'Mix Mithai',
        weight: '1 Kg',
        price: 5.00,
        imageUrl: 'assets/images/mithai2.png',
      ),
      CartItemModel(
        name: 'Mix Mithai',
        weight: '1 Kg',
        price: 5.00,
        imageUrl: 'assets/images/mithai3.png',
      ),
    ];

    calculateTotal();
  }

  void calculateTotal() {
    totalPrice.value = cartItems.fold(0.0, (sum, item) => sum + item.price);
  }

  void removeCartItem(int index) {
    cartItems.removeAt(index);
    calculateTotal();
  }

  void addOrder(OrderModel order) {
    orders.add(order);
  }

  void checkout() {
    // Checkout logic here
    Get.snackbar(
      'Checkout',
      'Total: \$${totalPrice.value.toStringAsFixed(2)}',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }
}
