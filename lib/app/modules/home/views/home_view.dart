import 'package:counter/app/helpers/color-helper.dart';
import 'package:counter/app/helpers/responsive-helper.dart';
import 'package:counter/app/helpers/text-style-helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';


class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // final responsive = ResponsiveHelper;
    // final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: ColorHelper.lightBackground,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(context),
            
            // Main Content
            Expanded(
              child: Row(
                children: [
                  // Orders Grid Section
                  Expanded(
                    flex: ResponsiveHelper.isLargeTablet(context) ? 6 : 5,
                    child: _buildOrdersGrid(context),
                  ),
                  
                  // Divider
                  Container(
                    width: 1,
                    color: ColorHelper.orderCardBorder,
                  ),
                  
                  // Cart Section
                  Expanded(
                    flex: ResponsiveHelper.isLargeTablet(context) ? 4 : 5,
                    child: _buildCartSection(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.getResponsivePadding(context, 24),
        vertical: ResponsiveHelper.getResponsivePadding(context, 16),
      ),
      color: ColorHelper.darkBackground,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Brand Name
          Text(
            'DOABA',
            style: TextStyleHelper.brandTitle(
              ResponsiveHelper.getResponsiveFontSize(context, 32),
            ),
          ),
          
          // COP Button
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveHelper.getResponsivePadding(context, 32),
              vertical: ResponsiveHelper.getResponsivePadding(context, 12),
            ),
            decoration: BoxDecoration(
              color: ColorHelper.copButton,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'COP',
              style: TextStyleHelper.buttonText(
                ResponsiveHelper.getResponsiveFontSize(context, 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrdersGrid(BuildContext context) {
    final columns = ResponsiveHelper.getGridColumns(context);
    final padding = ResponsiveHelper.getResponsivePadding(context, 16);

    return Obx(() => GridView.builder(
          padding: EdgeInsets.all(padding),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            childAspectRatio: ResponsiveHelper.isLargeTablet(context) ? 1.4 : 1.2,
            crossAxisSpacing: padding,
            mainAxisSpacing: padding,
          ),
          itemCount: controller.orders.length,
          itemBuilder: (context, index) {
            final order = controller.orders[index];
            return _buildOrderCard(context, order);
          },
        ));
  }

  Widget _buildOrderCard(BuildContext context, OrderModel order) {
    return Container(
      decoration: BoxDecoration(
        color: ColorHelper.cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: ColorHelper.orderCardBorder,
          width: 1.5,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Order Label
          Text(
            'Order',
            style: TextStyleHelper.orderLabel(
              ResponsiveHelper.getResponsiveFontSize(context, 16),
            ),
          ),
          
          SizedBox(height: ResponsiveHelper.getResponsivePadding(context, 8)),
          
          // Order Number
          Text(
            order.orderNumber,
            style: TextStyleHelper.orderNumber(
              ResponsiveHelper.getResponsiveFontSize(context, 64),
            ),
          ),
          
          SizedBox(height: ResponsiveHelper.getResponsivePadding(context, 16)),
          
          // Price
          Text(
            '\$ ${order.price.toStringAsFixed(2)}',
            style: TextStyleHelper.price(
              ResponsiveHelper.getResponsiveFontSize(context, 20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartSection(BuildContext context) {
    return Container(
      color: ColorHelper.cardBackground,
      child: Column(
        children: [
          // Cart Title
          Padding(
            padding: EdgeInsets.all(
              ResponsiveHelper.getResponsivePadding(context, 20),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Your Cart',
                style: TextStyleHelper.cartTitle(
                  ResponsiveHelper.getResponsiveFontSize(context, 28),
                ),
              ),
            ),
          ),
          
          // Cart Items List
          Expanded(
            child: Obx(() => ListView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: ResponsiveHelper.getResponsivePadding(context, 12),
                  ),
                  itemCount: controller.cartItems.length,
                  itemBuilder: (context, index) {
                    final item = controller.cartItems[index];
                    return _buildCartItem(context, item, index);
                  },
                )),
          ),
          
          // Checkout Section
          _buildCheckoutSection(context),
        ],
      ),
    );
  }

  Widget _buildCartItem(BuildContext context, CartItemModel item, int index) {
    return Container(
      margin: EdgeInsets.only(
        bottom: ResponsiveHelper.getResponsivePadding(context, 12),
      ),
      decoration: BoxDecoration(
        color: ColorHelper.cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Product Image
          Container(
            width: ResponsiveHelper.getResponsivePadding(context, 80),
            height: ResponsiveHelper.getResponsivePadding(context, 80),
            margin: EdgeInsets.all(
              ResponsiveHelper.getResponsivePadding(context, 8),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ColorHelper.lightBackground,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Icon(
                Icons.fastfood,
                size: ResponsiveHelper.getResponsivePadding(context, 40),
                color: ColorHelper.primaryPurple,
              ),
              // Replace with: Image.asset(item.imageUrl, fit: BoxFit.cover)
            ),
          ),
          
          // Product Info
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: ResponsiveHelper.getResponsivePadding(context, 12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyleHelper.productName(
                      ResponsiveHelper.getResponsiveFontSize(context, 16),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    item.weight,
                    style: TextStyleHelper.productWeight(
                      ResponsiveHelper.getResponsiveFontSize(context, 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Price
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveHelper.getResponsivePadding(context, 20),
              vertical: ResponsiveHelper.getResponsivePadding(context, 24),
            ),
            decoration: BoxDecoration(
              color: ColorHelper.primaryPurple,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Text(
              '\$ ${item.price.toStringAsFixed(2)}',
              style: TextStyleHelper.productPrice(
                ResponsiveHelper.getResponsiveFontSize(context, 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckoutSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        ResponsiveHelper.getResponsivePadding(context, 20),
      ),
      child: Row(
        children: [
          // Checkout Button
          Expanded(
            child: GestureDetector(
              onTap: () => controller.checkout(),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: ResponsiveHelper.getResponsivePadding(context, 16),
                ),
                decoration: BoxDecoration(
                  color: ColorHelper.checkoutButton,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Check Out',
                    style: TextStyleHelper.buttonText(
                      ResponsiveHelper.getResponsiveFontSize(context, 20),
                    ),
                  ),
                ),
              ),
            ),
          ),
          
          SizedBox(width: ResponsiveHelper.getResponsivePadding(context, 16)),
          
          // Total Price
          Obx(() => Container(
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveHelper.getResponsivePadding(context, 24),
                  vertical: ResponsiveHelper.getResponsivePadding(context, 16),
                ),
                decoration: BoxDecoration(
                  color: ColorHelper.checkoutButton,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '\$ ${controller.totalPrice.value.toStringAsFixed(2)}',
                  style: TextStyleHelper.buttonText(
                    ResponsiveHelper.getResponsiveFontSize(context, 24),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
