import 'package:flutter/material.dart';

class ShoppingItemTile extends StatelessWidget {
  final String itemName;
  final String quantity;
  final String placeToBuy;
  final bool isBought;

  const ShoppingItemTile({
    super.key,
    required this.itemName,
    required this.quantity,
    required this.placeToBuy,
    required this.isBought,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showMoreDialog(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(17),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: _getColorForPlace(placeToBuy),
            borderRadius: BorderRadius.circular(3.0),
          ),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Align the children in the middle
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                itemName,
                style: const TextStyle(
                  fontSize: 16.0, // Adjust font size as needed
                  fontWeight: FontWeight.w300, // Adjust font weight as needed
                ),
                maxLines: 1, // Set the maximum number of lines to 1
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMoreDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: _getColorForPlace(placeToBuy),
          title: Center(
            child: Text(
              maxLines: 1, // Set the maximum number of lines to 1
              overflow: TextOverflow.ellipsis,
              itemName,
              style: const TextStyle(
                fontSize: 30.0, // Adjust font size as needed
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          content: Container(
            width: 300.0, // Adjust the width as needed
            height: 200.0, // Adjust the height as needed
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Quantidade: $quantity',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w200),
                ),
                Text(
                  'Comprar em: $placeToBuy',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w200),
                ),
              ],
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
        );
      },
    );
  }

  Color _getColorForPlace(String placeToBuy) {
    switch (placeToBuy.toLowerCase()) {
      case 'lidl':
        return const Color.fromARGB(255, 250, 255, 202);
      case 'jumbo':
        return const Color.fromARGB(255, 190, 226, 255);
      case 'mercadona':
        return const Color.fromARGB(255, 200, 230, 201);
      case 'continente':
        return const Color.fromARGB(255, 239, 172, 172);
      case 'pingo doce':
        return const Color.fromARGB(255, 122, 197, 126); // Dark green
      default:
        return const Color.fromARGB(
            255, 206, 206, 206); // Default color for unknown places
    }
  }
}
