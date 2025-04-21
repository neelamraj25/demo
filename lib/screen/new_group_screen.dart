import 'package:flutter/material.dart';

class NewGroupScreen extends StatelessWidget {
  const NewGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 114, 14, 7),
        title: Text(
          'New Group',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
               SizedBox(height: 10),
          Stack(
           alignment: Alignment.topCenter,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(''),
                onBackgroundImageError: (exception, stactTrack) {
                  print('Error loading image: $exception');
                },
              ),
              Positioned(
                bottom: 2,
                right: 1,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: const Color.fromARGB(255, 114, 14, 7),
                  child: Icon(Icons.camera_alt, color: Colors.white, size: 18),
                ),
              ),
           ],
          ),

          SizedBox(height: 5),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      customTextfield(Icons.group, 'GOO021'),
                      const SizedBox(height: 12),
                      customTextfield(Icons.group, 'Group Name'),
                      const SizedBox(height: 12),
                      customTextfield(Icons.people, 'Total Members'),
                      const SizedBox(height: 12),
                      customTextfield(Icons.calendar_today, 'Start Date'),
                      const SizedBox(height: 12),
                      customTextfield(Icons.calendar_today, 'End Date'),
                      const SizedBox(height: 12),
                      customTextfield(Icons.currency_rupee, 'Member Amount'),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(child: modeOption("Random")),
                          const SizedBox(width: 16),
                          Expanded(child: modeOption("Manual")),
                        ],
                      ),
                      const SizedBox(height: 30),
                  
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 114, 14, 7),
                          ),
                          child: const Text(
                            "Submit",
                            style: TextStyle(fontSize: 18,color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
           
        ],
      ),
    );
  }

  Widget customTextfield(IconData icon, String hint, {bool enabled = true}) {
    return TextField(
      enabled: enabled,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
        labelText: hint,
       
        fillColor: Colors.grey[100],
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade400)
        
        ),
      ),
    );
  }

  Widget modeOption(String label) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.circle_outlined, color: Colors.grey),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
    );
  }
}
