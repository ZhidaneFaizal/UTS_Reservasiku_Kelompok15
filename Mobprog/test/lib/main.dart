import 'package:flutter/material.dart';

void main() {
  runApp(const ReservasiApp());
}

class ReservasiApp extends StatelessWidget {
  const ReservasiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ReservasiKu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

// =====================================================
// DATA LAYANAN
// =====================================================

class Service {
  final String name;
  final String description;
  final int price;
  final String duration;
  final IconData icon;

  Service({
    required this.name,
    required this.description,
    required this.price,
    required this.duration,
    required this.icon,
  });
}

final List<Service> services = [
  Service(
    name: 'Potong Rambut',
    description: 'Potong rambut sesuai model yang diinginkan.',
    price: 50000,
    duration: '30 Menit',
    icon: Icons.content_cut,
  ),
  Service(
    name: 'Facial Wajah',
    description: 'Perawatan wajah untuk membuat kulit lebih bersih.',
    price: 80000,
    duration: '60 Menit',
    icon: Icons.face,
  ),
  Service(
    name: 'Manicure',
    description: 'Perawatan kuku tangan agar terlihat lebih rapi.',
    price: 70000,
    duration: '45 Menit',
    icon: Icons.back_hand,
  ),
  Service(
    name: 'Massage',
    description: 'Pijat relaksasi untuk membantu tubuh lebih rileks.',
    price: 100000,
    duration: '60 Menit',
    icon: Icons.spa,
  ),
];

// =====================================================
// HOME PAGE
// =====================================================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  String formatRupiah(int price) {
    return 'Rp ${price.toString().replaceAllMapped(
          RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (match) => '${match[1]}.',
        )}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReservasiKu'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: Colors.blue,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang 👋',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Pilih layanan yang kamu butuhkan',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // JUDUL
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Layanan Tersedia',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // LIST LAYANAN
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final service = services[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailPage(service: service),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey.shade200,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // ICON
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              borderRadius:
                                  BorderRadius.circular(12),
                            ),
                            child: Icon(
                              service.icon,
                              size: 35,
                              color: Colors.blue,
                            ),
                          ),

                          const SizedBox(width: 15),

                          // INFORMASI
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  service.name,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  service.description,
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Text(
                                      formatRupiah(service.price),
                                      style: const TextStyle(
                                        color: Colors.blue,
                                        fontWeight:
                                            FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      service.duration,
                                      style: TextStyle(
                                        color:
                                            Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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

// =====================================================
// DETAIL LAYANAN
// =====================================================

class DetailPage extends StatelessWidget {
  final Service service;

  const DetailPage({
    super.key,
    required this.service,
  });

  String formatRupiah(int price) {
    return 'Rp ${price.toString().replaceAllMapped(
          RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (match) => '${match[1]}.',
        )}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Layanan'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // ICON BESAR
              Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  service.icon,
                  size: 100,
                  color: Colors.blue,
                ),
              ),

              const SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  service.name,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  service.description,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius:
                            BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          const Text('Harga'),
                          const SizedBox(height: 5),
                          Text(
                            formatRupiah(service.price),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius:
                            BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          const Text('Durasi'),
                          const SizedBox(height: 5),
                          Text(
                            service.duration,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              // BUTTON
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SchedulePage(service: service),
                      ),
                    );
                  },
                  child: const Text(
                    'Pilih Layanan',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =====================================================
// PILIH JADWAL
// =====================================================

class SchedulePage extends StatefulWidget {
  final Service service;

  const SchedulePage({
    super.key,
    required this.service,
  });

  @override
  State<SchedulePage> createState() =>
      _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  int selectedDate = 1;
  String selectedTime = '09:00';

  final List<String> times = [
    '09:00',
    '10:00',
    '11:00',
    '13:00',
    '14:00',
    '15:00',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Jadwal'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                widget.service.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'Pilih Tanggal',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              // PILIH TANGGAL
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    int date = index + 1;

                    bool selected =
                        selectedDate == date;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDate = date;
                        });
                      },
                      child: Container(
                        width: 55,
                        margin:
                            const EdgeInsets.only(
                          right: 10,
                        ),
                        decoration: BoxDecoration(
                          color: selected
                              ? Colors.blue
                              : Colors.grey.shade200,
                          borderRadius:
                              BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            '$date',
                            style: TextStyle(
                              color: selected
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'Pilih Waktu',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              // PILIH WAKTU
              GridView.builder(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(),
                itemCount: times.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2,
                ),
                itemBuilder: (context, index) {
                  String time = times[index];

                  bool selected =
                      selectedTime == time;

                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedTime = time;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: selected
                            ? Colors.blue
                            : Colors.grey.shade200,
                        borderRadius:
                            BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          time,
                          style: TextStyle(
                            color: selected
                                ? Colors.white
                                : Colors.black,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CartPage(
                          service: widget.service,
                          date: selectedDate,
                          time: selectedTime,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Lanjutkan',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =====================================================
// KERANJANG / RINGKASAN
// =====================================================

class CartPage extends StatefulWidget {
  final Service service;
  final int date;
  final String time;

  const CartPage({
    super.key,
    required this.service,
    required this.date,
    required this.time,
  });

  @override
  State<CartPage> createState() =>
      _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool serviceSelected = true;

  String formatRupiah(int price) {
    return 'Rp ${price.toString().replaceAllMapped(
          RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (match) => '${match[1]}.',
        )}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              if (serviceSelected)
                Dismissible(
                  key: const ValueKey('service'),
                  direction:
                      DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      serviceSelected = false;
                    });
                  },
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding:
                        const EdgeInsets.only(
                      right: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius:
                          BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  child: Container(
                    padding:
                        const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(15),
                      border: Border.all(
                        color:
                            Colors.grey.shade200,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                            color:
                                Colors.blue.shade50,
                            borderRadius:
                                BorderRadius.circular(
                              12,
                            ),
                          ),
                          child: Icon(
                            widget.service.icon,
                            color: Colors.blue,
                            size: 35,
                          ),
                        ),

                        const SizedBox(width: 15),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                            children: [
                              Text(
                                widget.service.name,
                                style:
                                    const TextStyle(
                                  fontWeight:
                                      FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),

                              const SizedBox(
                                height: 5,
                              ),

                              Text(
                                'Tanggal: ${widget.date}',
                              ),

                              Text(
                                'Waktu: ${widget.time}',
                              ),

                              const SizedBox(
                                height: 5,
                              ),

                              Text(
                                formatRupiah(
                                  widget.service.price,
                                ),
                                style:
                                    const TextStyle(
                                  color: Colors.blue,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              if (!serviceSelected)
                const Expanded(
                  child: Center(
                    child: Text(
                      'Keranjang kosong',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),

              if (serviceSelected) ...[
                const Spacer(),

                Container(
                  padding:
                      const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius:
                        BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Total',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        formatRupiah(
                          widget.service.price,
                        ),
                        style:
                            const TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PaymentPage(
                            service:
                                widget.service,
                            date: widget.date,
                            time: widget.time,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'Checkout',
                      style:
                          TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// =====================================================
// PEMBAYARAN
// =====================================================

class PaymentPage extends StatelessWidget {
  final Service service;
  final int date;
  final String time;

  const PaymentPage({
    super.key,
    required this.service,
    required this.date,
    required this.time,
  });

  String formatRupiah(int price) {
    return 'Rp ${price.toString().replaceAllMapped(
          RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (match) => '${match[1]}.',
        )}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembayaran'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              const Text(
                'Konfirmasi Reservasi',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius:
                      BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Layanan',
                      style: TextStyle(
                        color:
                            Colors.grey.shade600,
                      ),
                    ),

                    Text(
                      service.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Text(
                      'Tanggal',
                      style: TextStyle(
                        color:
                            Colors.grey.shade600,
                      ),
                    ),

                    Text(
                      '$date Oktober 2026',
                      style: const TextStyle(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Text(
                      'Waktu',
                      style: TextStyle(
                        color:
                            Colors.grey.shade600,
                      ),
                    ),

                    Text(
                      time,
                      style: const TextStyle(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Text(
                      'Total Pembayaran',
                      style: TextStyle(
                        color:
                            Colors.grey.shade600,
                      ),
                    ),

                    Text(
                      formatRupiah(
                        service.price,
                      ),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                            'Reservasi Berhasil!',
                          ),
                          content: Text(
                            '${service.name}\n'
                            '$date Oktober 2026\n'
                            'Pukul $time\n\n'
                            'Terima kasih telah melakukan reservasi.',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.popUntil(
                                  context,
                                  (route) =>
                                      route.isFirst,
                                );
                              },
                              child:
                                  const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text(
                    'Bayar Sekarang',
                    style:
                        TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}