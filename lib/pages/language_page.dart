import 'package:flutter/material.dart';
import 'package:sneaker_app/global/common/button_lr.dart';
import 'package:sneaker_app/global/common/toast.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> itemLanguage = [
      'English',
      'Vietnamese',

    ];

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/nike.png', height: 80),
                Text('Select Your Language', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                SizedBox(height: 10,),
                Text('Please update to a language supported in Sneaker app.'),
                SizedBox(height: 10,),
                Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      canvasColor: Colors.grey[300], // Màu nền của dropdown
                      buttonTheme: ButtonTheme.of(context).copyWith(
                        alignedDropdown: true, // Cố định dropdown theo chiều rộng của container
                      ),
                    ),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      style: TextStyle(color: Colors.black, fontSize: 15), // Màu chữ khi chưa chọn
                      iconEnabledColor: Colors.black, // Màu mũi tên khi chưa chọn
                      dropdownColor: Colors.grey[300], // Màu nền của dropdown khi mở
                      value: itemLanguage[0],
                      items: itemLanguage.map((String language) {
                        return DropdownMenuItem<String>(
                          value: language,
                          child: Text(language),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        // Xử lý sự kiện chọn ngôn ngữ ở đây
                      },
                    ),
                  ),
                ),

              ],
            ),
          ),

          SizedBox(height: 20,),

          buttonLR(() {
            showToast(message: 'Successful Change');
            Navigator.pop(context);
          }, 'Select')
        ],
      )
    );
  }
}
