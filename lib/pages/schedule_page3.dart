import 'package:flutter/material.dart';

class UttoraPage extends StatelessWidget {
  const UttoraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
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
                          'UTTORA',
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
                      TimeSection(
                        title: "Starting Time",
                        times: ['7:00 AM', '10:00 AM', '3:00 PM', '5:15 PM'],
                      ),
                      const SizedBox(height: 30),
                      // Departure Time Section
                      TimeSection(
                        title: "Departure Time",
                        times: ['2:00 PM', '4:00 PM', '6:00 PM', '9:15 PM'],
                      ),
                      const SizedBox(height: 40),
                      // Buttons Section in the specified order
                      Column(
                        children: [
                          CustomButton(
                            text: "Available Buses",
                            backgroundColor: Colors.orange,
                            icon: Icons.directions_bus,
                            onPressed: () {
                              _showAvailableBuses(context);
                            },
                          ),
                          const SizedBox(height: 16),
                          CustomButton(
                            text: "Route Details",
                            backgroundColor: Colors.green,
                            icon: Icons.directions,
                            onPressed: () {
                              _showRouteDetails(context);
                            },
                          ),
                          const SizedBox(height: 16),
                          CustomButton(
                            text: "Bus Details",
                            backgroundColor: Colors.purple,
                            icon: Icons.info,
                            onPressed: () {
                              _showBusDetails(context);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to show available buses
  void _showAvailableBuses(BuildContext context) {
    final buses = ["Bus No 10", "Bus No 22", "Bus No 13"];
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Available Buses",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
              const SizedBox(height: 16),
              ...buses.map((bus) {
                return ListTile(
                  leading:
                      const Icon(Icons.directions_bus, color: Colors.orange),
                  title: Text(bus,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )),
                );
              }).toList(),
            ],
          ),
        );
      },
    );
  }

  // Function to show route details
  void _showRouteDetails(BuildContext context) {
    final busRoutes = [
      {"name": "Bus No 10", "route": "DIU - Mirpur - Uttara"},
      {"name": "Bus No 22", "route": "DIU - Airport Road - Uttara"},
      {"name": "Bus No 13", "route": "DIU - Farmgate - Uttara"},
    ];
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Route Details",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
              const SizedBox(height: 16),
              ...busRoutes.map((bus) {
                return ListTile(
                  leading: const Icon(Icons.route, color: Colors.green),
                  title: Text(bus["name"]!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )),
                  subtitle: Text(bus["route"]!,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      )),
                );
              }).toList(),
            ],
          ),
        );
      },
    );
  }

  // Function to show bus details
  void _showBusDetails(BuildContext context) {
    final busDetails = [
      {"name": "Bus No 10", "capacity": "40 Seats", "type": "AC Bus"},
      {"name": "Bus No 22", "capacity": "50 Seats", "type": "Non-AC Bus"},
      {"name": "Bus No 13", "capacity": "45 Seats", "type": "AC Bus"},
    ];
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Bus Details",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
              const SizedBox(height: 16),
              ...busDetails.map((bus) {
                return ListTile(
                  leading: const Icon(Icons.info, color: Colors.purple),
                  title: Text(bus["name"]!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )),
                  subtitle:
                      Text("Capacity: ${bus["capacity"]}, Type: ${bus["type"]}",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          )),
                );
              }).toList(),
            ],
          ),
        );
      },
    );
  }
}

// Time Section Widget with favorite toggle functionality
class TimeSection extends StatefulWidget {
  final String title;
  final List<String> times;

  const TimeSection({super.key, required this.title, required this.times});

  @override
  State<TimeSection> createState() => _TimeSectionState();
}

class _TimeSectionState extends State<TimeSection> {
  final Set<String> _favorites = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
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
          children: widget.times
              .map(
                (time) => GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_favorites.contains(time)) {
                        _favorites.remove(time);
                      } else {
                        _favorites.add(time);
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 16),
                    decoration: BoxDecoration(
                      color: _favorites.contains(time)
                          ? Colors.blue.shade300
                          : Colors.blue.shade100,
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
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          time,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          _favorites.contains(time)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: _favorites.contains(time)
                              ? Colors.red
                              : Colors.grey,
                          size: 20,
                        ),
                      ],
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
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        icon: Icon(icon, color: Colors.white),
        label: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
