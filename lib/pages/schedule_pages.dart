import 'package:flutter/material.dart';

class DhanmondiPage extends StatefulWidget {
  const DhanmondiPage({super.key});

  @override
  State<DhanmondiPage> createState() => _DhanmondiPageState();
}

class _DhanmondiPageState extends State<DhanmondiPage> {
  bool isDarkMode = false; // For theme switching
  List<String> favoriteBuses = []; // For storing favorite buses

  void toggleFavorite(String busName) {
    setState(() {
      if (favoriteBuses.contains(busName)) {
        favoriteBuses.remove(busName);
      } else {
        favoriteBuses.add(busName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Back button and Search Bar
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back,
                            color: Colors.blue, size: 28),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search routes or buses...",
                            prefixIcon: Icon(Icons.search, color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 12.0),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          setState(() {
                            isDarkMode = !isDarkMode;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Title Section
                  Center(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 24.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.5),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: const Text(
                            'DHANMONDI',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        // Starting Time Section
                        const TimeSection(
                          title: "Starting Time",
                          times: ['7:00 AM', '10:00 AM', '3:00 PM', '5:15 PM'],
                        ),
                        const SizedBox(height: 30),
                        // Departure Time Section
                        const TimeSection(
                          title: "Departure Time",
                          times: ['2:00 PM', '4:00 PM', '6:00 PM', '9:15 PM'],
                        ),
                        const SizedBox(height: 40),
                        // Bus List Section
                        BusListSection(
                          favoriteBuses: favoriteBuses,
                          toggleFavorite: toggleFavorite,
                        ),
                        const SizedBox(height: 30),
                        // Notifications
                        NotificationSection(),
                        const SizedBox(height: 30),
                        // Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomButton(
                              text: "Nearby Stops",
                              backgroundColor: Colors.purple,
                              icon: Icons.location_pin,
                              onPressed: () {
                                debugPrint('Nearby Stops Pressed');
                              },
                            ),
                            CustomButton(
                              text: "QR Code Ticket",
                              backgroundColor: Colors.green,
                              icon: Icons.qr_code,
                              onPressed: () {
                                debugPrint('QR Code Ticket Pressed');
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        CustomButton(
                          text: "Contact Support",
                          backgroundColor: Colors.red,
                          icon: Icons.support_agent,
                          onPressed: () {
                            debugPrint('Contact Support Pressed');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Time Section Widget
class TimeSection extends StatelessWidget {
  final String title;
  final List<String> times;
  const TimeSection({super.key, required this.title, required this.times});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: times
              .map(
                (time) => Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    time,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

// Custom Button Widget
class CustomButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final IconData icon;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: backgroundColor.withOpacity(0.5),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Bus List Section Widget
class BusListSection extends StatelessWidget {
  final List<String> favoriteBuses;
  final Function(String) toggleFavorite;

  const BusListSection({
    super.key,
    required this.favoriteBuses,
    required this.toggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final buses = [
      {
        "name": "Bus No 1",
        "route":
            "Route A: Daffodil University -> Mirpur 1 -> Asad Gate -> Dhanmondi"
      },
      {
        "name": "Bus No 2",
        "route":
            "Route B: Daffodil University -> Kalshi -> Agargaon -> Dhanmondi"
      },
      {
        "name": "Bus No 3",
        "route":
            "Route C: Daffodil University -> Kalyanpur -> Shyamoli -> Dhanmondi"
      },
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Available Buses",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
        ),
        const SizedBox(height: 30),
        ...buses.map((bus) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 6,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bus["name"]!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      bus["route"]!,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(
                    favoriteBuses.contains(bus["name"]!)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () => toggleFavorite(bus["name"]!),
                ),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }
}

// Notification Section Widget
class NotificationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notifications = [
      "Bus No 1 is delayed by 10 minutes.",
      "New bus added on Route B - Dhanmondi.",
      "Special discounts available for early bookings!"
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Notifications",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
        ),
        const SizedBox(height: 16),
        ...notifications.map((notification) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.amber.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              notification,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          );
        }).toList(),
      ],
    );
  }
}
