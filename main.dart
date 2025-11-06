import 'package:flutter/material.dart';

void main() {
  runApp(const BookingApp());
}

class BookingApp extends StatelessWidget {
  const BookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Booking Consultation',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFF7D1), // kuning muda pastel
        fontFamily: 'Poppins',
      ),
      home: const BookingPage(),
    );
  }
}

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFFFFB84C); // oranye pastel
    final Color accentColor = const Color(0xFFFFE382); // kuning pastel lembut
    final Color textColor = const Color(0xFF4A4A4A); // abu gelap

    return Scaffold(
      body: Center(
        child: Container(
          width: 390,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Color(0x33000000), // abu lembut transparan
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.arrow_back_ios, color: textColor),
                        Text(
                          'Booking Consultation',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const CircleAvatar(
                          backgroundImage: AssetImage('assets/profile.jpg'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),

                    // Doctor profiles
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        doctorCard(
                          'Dr. Lory Ford',
                          'Heart Specialist',
                          'assets/doctor1.jpg',
                          primaryColor,
                        ),
                        doctorCard(
                          'Dr. Kate Carter',
                          'Dental Expert',
                          'assets/doctor2.jpg',
                          accentColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),

                    // Calendar
                    Text(
                      'November 2025',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 15),
                    calendarGrid(primaryColor),

                    const SizedBox(height: 30),

                    // Time section
                    Text(
                      'Time',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: const [
                        TimeBox(time: '09:00 AM', isSelected: true),
                        TimeBox(time: '10:00 AM'),
                        TimeBox(time: '11:00 AM'),
                        TimeBox(time: '12:00 PM'),
                        TimeBox(time: '01:00 PM'),
                        TimeBox(time: '02:00 PM'),
                      ],
                    ),
                    const SizedBox(height: 40),

                    // Booking button
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          minimumSize: const Size(200, 55),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Booking',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),

                    Center(
                      child: Text(
                        'Hilda Nurhasanah - 1000116156',
                        style: TextStyle(color: textColor, fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Kalender 1–30 November
  Widget calendarGrid(Color primaryColor) {
    final daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    final totalDays = 30;
    final firstDayOffset = 6; // Sabtu (mulai dari kolom ke-6)
    List<Widget> dateBoxes = [];

    // Tambah header hari
    for (var day in daysOfWeek) {
      dateBoxes.add(
        Center(
          child: Text(
            day,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
      );
    }

    // Tambah kotak kosong sebelum tanggal 1
    for (int i = 0; i < firstDayOffset; i++) {
      dateBoxes.add(const SizedBox());
    }

    // Tambah tanggal 1–30
    for (int i = 1; i <= totalDays; i++) {
      dateBoxes.add(
        DateBox(
          day: '',
          date: '$i',
          isSelected: i == 10, // contoh tanggal yang dipilih
        ),
      );
    }

    return GridView.count(
      crossAxisCount: 7,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: dateBoxes,
    );
  }

  // Doctor card
  Widget doctorCard(String name, String title, String image, Color color) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(radius: 30, backgroundImage: AssetImage(image)),
          const SizedBox(height: 10),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

// DateBox widget
class DateBox extends StatelessWidget {
  final String day;
  final String date;
  final bool isSelected;
  const DateBox({
    super.key,
    required this.day,
    required this.date,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color selectedColor = const Color(0xFFFFB84C);
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? selectedColor : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x26000000), // abu lembut
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          date,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// TimeBox widget
class TimeBox extends StatelessWidget {
  final String time;
  final bool isSelected;
  const TimeBox({super.key, required this.time, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    final Color selectedColor = const Color(0xFFFFB84C);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? selectedColor : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        time,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
