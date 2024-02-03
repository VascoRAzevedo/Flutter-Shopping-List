import 'package:flutter/material.dart';
import 'package:shopping_list_tentativa_2/assets/app_bar.dart';
import 'package:shopping_list_tentativa_2/assets/personalized_text_fields.dart';
import 'package:shopping_list_tentativa_2/assets/shopping_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _selectedPlaces = []; // Add this line
  List<List<dynamic>> itemListTotal = [
    ["Bananas", "4 units", "Lidl", false],
    ["Milk", "1 liter", "Jumbo", false],
    ["Cookies", "3", "Mercadona", false],
    ["Rice", "2kg", "Lidl", false],
    ["Apples", "6 units", "Continente", false],
    ["Cheese", "150 grams", "Continente", false],
    ["Pasta", "500g", "Lidl", false],
    ["Tomatoes", "5 units", "Lidl", false],
    ["Bread", "2 loaves", "Jumbo", false],
    ["Eggs", "12", "Lidl", false],
    ["Chicken", "1kg", "Continente", false],
    ["Water", "3 liters", "Pingo Doce", false],
    ["Potatoes", "3kg", "Jumbo", false],
    ["Onions", "8 units", "Continente", false],
    ["Cereal", "2 boxes", "Mercadona", false],
    ["Coffee", "1kg", "Lidl", false],
    ["Orange Juice", "4 liters", "Jumbo", false],
    ["Butter", "2 packs", "Mercadona", false],
    ["Yogurt", "6 units", "Lidl", false],
    ["Ham", "1.5kg", "Pingo Doce", false],
    ["Ice Cream", "2 liters", "Jumbo", false],
    ["Honey", "1 jar", "Continente", false],
    ["Salad", "3 bags", "Lidl", false],
    ["Olive Oil", "1.5 liters", "Mercadona", false],
  ];

  List itemList = [];

  @override
  void initState() {
    super.initState();
    itemList = List.from(
        itemListTotal); // Initialize itemList with a copy of itemListTotal
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: const MyAppBar(),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildFilter(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: itemList.length,
              itemBuilder: (BuildContext context, int index) {
                return ShoppingItemTile(
                  itemName: itemList[index][0],
                  quantity: itemList[index][1],
                  placeToBuy: itemList[index][2],
                  isBought: itemList[index][3],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: floatingActionButton(),
    );
  }

  FloatingActionButton floatingActionButton() {
    return FloatingActionButton(
      onPressed: showAddItemDialog,
      tooltip: 'Add Item',
      backgroundColor: const Color.fromARGB(
          255, 255, 255, 255), // Set your preferred background color
      elevation: 0.0, // Set the elevation (shadow) of the button
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(3.0), // Set the button border radius
        // You can also use other shapes like StadiumBorder, CircleBorder, etc.
      ),
      child: const Icon(Icons.add),
      // You can add more customizations as needed
    );
  }

  void showAddItemDialog() async {
    String itemName = '';
    String quantity = '';
    String placeToBuy = '';

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3.0), // Adjust corner radius
          ),
          content: Container(
            color: Colors.white,
            width: 300,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 8.0),
                PersonalizedTextField(
                  labelText: 'Item Name',
                  onChanged: (value) => itemName = value,
                ),
                const SizedBox(height: 25.0),
                PersonalizedTextField(
                  labelText: 'Quantity',
                  onChanged: (value) => quantity = value,
                ),
                const SizedBox(height: 25),
                PersonalizedTextField(
                  labelText: 'Place to Buy',
                  onChanged: (value) => placeToBuy = value,
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black54,
                          side: const BorderSide(
                              color: Colors.black54), // Border color
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(4.0), // Border radius
                          ),
                        ),
                        child: const Text('Cancel'),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            itemList
                                .add([itemName, quantity, placeToBuy, false]);
                          });
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black54,
                          side: const BorderSide(
                              color: Colors.black54), // Border color
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(4.0), // Border radius
                          ),
                        ),
                        child: const Text('Add'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildFilter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          filter(),
        ],
      ),
    );
  }

  ElevatedButton filter() {
    return ElevatedButton(
      onPressed: () {
        showFilterDialog();
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(250, 40),
        foregroundColor: Colors.black45,
        backgroundColor: const Color.fromARGB(255, 240, 240, 240),
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1.5, color: Colors.black54),
          borderRadius: BorderRadius.circular(3),
        ),
      ),
      child: const Text('Filter'),
    );
  }

  void showFilterDialog() async {
    List<String> selectedPlaces = List.from(_selectedPlaces); // Create a copy

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(3.0), // Adjust corner radius
              ),
              content: Container(
                color: Colors.white,
                width: 300,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: selectedPlaces.contains('Mercadona')
                              ? const Color.fromARGB(255, 200, 230,
                                  201) // Background color when checked
                              : null,
                        ),
                        // Default background color when not checked
                        child: CheckboxListTile(
                          side: const BorderSide(
                            color:
                                Colors.black54, // Outline color when inactive
                            width: 1.5, // Adjust the thickness of the outline
                          ),
                          activeColor: Colors
                              .black54, // Color of the checkbox when checked
                          title: const Text('Mercadona',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54)),
                          value: selectedPlaces.contains('Mercadona'),
                          onChanged: (value) {
                            setState(() {
                              if (value!) {
                                selectedPlaces.add('Mercadona');
                              } else {
                                selectedPlaces.remove('Mercadona');
                              }
                            });
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: selectedPlaces.contains('Continente')
                              ? const Color.fromRGBO(239, 154, 154,
                                  1) // Background color when checked
                              : null,
                        ),
                        // Default background color when not checked
                        child: CheckboxListTile(
                          side: const BorderSide(
                            color:
                                Colors.black54, // Outline color when inactive
                            width: 1.5, // Adjust the thickness of the outline
                          ),
                          activeColor: Colors
                              .black54, // Color of the checkbox when checked
                          title: const Text('Continente',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54)),
                          value: selectedPlaces.contains('Continente'),
                          onChanged: (value) {
                            setState(() {
                              if (value!) {
                                selectedPlaces.add('Continente');
                              } else {
                                selectedPlaces.remove('Continente');
                              }
                            });
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: selectedPlaces.contains('Lidl')
                              ? const Color.fromARGB(255, 250, 255,
                                  202) // Background color when checked
                              : null,
                        ),
                        // Default background color when not checked
                        child: CheckboxListTile(
                          side: const BorderSide(
                            color:
                                Colors.black54, // Outline color when inactive
                            width: 1.5, // Adjust the thickness of the outline
                          ),
                          activeColor: Colors
                              .black54, // Color of the checkbox when checked
                          title: const Text('Lidl',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54)),
                          value: selectedPlaces.contains('Lidl'),
                          onChanged: (value) {
                            setState(() {
                              if (value!) {
                                selectedPlaces.add('Lidl');
                              } else {
                                selectedPlaces.remove('Lidl');
                              }
                            });
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: selectedPlaces.contains('Pingo Doce')
                              ? const Color.fromARGB(255, 122, 197,
                                  126) // Background color when checked
                              : null,
                        ),
                        // Default background color when not checked
                        child: CheckboxListTile(
                          side: const BorderSide(
                            color:
                                Colors.black54, // Outline color when inactive
                            width: 1.5, // Adjust the thickness of the outline
                          ),
                          activeColor: Colors
                              .black54, // Color of the checkbox when checked
                          title: const Text('Pingo Doce',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54)),
                          value: selectedPlaces.contains('Pingo Doce'),
                          onChanged: (value) {
                            setState(() {
                              if (value!) {
                                selectedPlaces.add('Pingo Doce');
                              } else {
                                selectedPlaces.remove('Pingo Doce');
                              }
                            });
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: selectedPlaces.contains('Jumbo')
                              ? const Color.fromARGB(255, 190, 226,
                                  255) // Background color when checked
                              : null,
                        ),
                        // Default background color when not checked
                        child: CheckboxListTile(
                          side: const BorderSide(
                            color:
                                Colors.black54, // Outline color when inactive
                            width: 1.5, // Adjust the thickness of the outline
                          ),
                          activeColor: Colors
                              .black54, // Color of the checkbox when checked
                          title: const Text('Jumbo',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54)),
                          value: selectedPlaces.contains('Jumbo'),
                          onChanged: (value) {
                            setState(() {
                              if (value!) {
                                selectedPlaces.add('Jumbo');
                              } else {
                                selectedPlaces.remove('Jumbo');
                              }
                            });
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: selectedPlaces.contains('Outros')
                              ? const Color.fromARGB(255, 206, 206,
                                  206) // Background color when checked
                              : null,
                        ),
                        // Default background color when not checked
                        child: CheckboxListTile(
                          side: const BorderSide(
                            color:
                                Colors.black54, // Outline color when inactive
                            width: 1.5, // Adjust the thickness of the outline
                          ),
                          activeColor: Colors
                              .black54, // Color of the checkbox when checked
                          title: const Text('Outros',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54)),
                          value: selectedPlaces.contains('Outros'),
                          onChanged: (value) {
                            setState(() {
                              if (value!) {
                                selectedPlaces.add('Outros');
                              } else {
                                selectedPlaces.remove('Outros');
                              }
                            });
                          },
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.black54,
                              side: const BorderSide(
                                  color: Colors.black54), // Border color
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(4.0), // Border radius
                              ),
                            ),
                            child: const Text('Cancel'),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              applyFilter(selectedPlaces);
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.black54,
                              side: const BorderSide(
                                  color: Colors.black54), // Border color
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(4.0), // Border radius
                              ),
                            ),
                            child: const Text('Done'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void applyFilter(List<String> selectedPlaces) {
    setState(() {
      _selectedPlaces = List.from(selectedPlaces);

      // Filter the itemList based on selected places
      List<List<dynamic>> filteredItemList = [];

      for (var item in itemListTotal) {
        String placeToBuy = item[2];
        if (_selectedPlaces.contains(placeToBuy)) {
          filteredItemList.add(item);
        }
      }

      // Update the itemList with the filtered list

      if (selectedPlaces.isEmpty) {
        itemList = itemListTotal;
      } else {
        itemList = List.from(filteredItemList);
      }
    });
  }
}
