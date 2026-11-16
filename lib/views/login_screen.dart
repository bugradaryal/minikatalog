import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart';
import 'package:minikatalog/views/home_screen.dart';
import 'package:minikatalog/services/local_storage_service.dart';

class LoginScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  LocalStorageService lsServices = LocalStorageService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                
              Text("Welcome back", style:  TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              )),
              SizedBox(height: 6),
          
              Text("Please login to your account", style:  TextStyle(
                fontSize: 14,
                color: Colors.grey
              )),
              SizedBox(height: 40),
          
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  prefixIcon: Icon(Icons.person_outline),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  )
                ),

                validator: (value) {
                  if(value == null || value.trim().isEmpty){
                    return "İsim alanı boş geçilemez";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: surnameController,
                decoration: InputDecoration(
                  labelText: "Surname",
                  prefixIcon: Icon(Icons.person_outline),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  )
                ),

                validator: (value) {
                  if(value == null || value.trim().isEmpty){
                    return "Soyisim alanı boş geçilemez";
                  }
                  return null;
                },
              ),
          
              SizedBox(height: 20),
          
              ElevatedButton(
                
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )
                ),
          
                onPressed: () {
                  if(formKey.currentState!.validate()){
                    // sayfalar arası geçiş
                    lsServices.saveData(nameController.text);

                    Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => HomeScreen(),)

                    );
                  }
                  //hata durumu yönetimi
                }, 
              
                child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 16),),
                
              
              ),
              SizedBox(height: 20),
              Center(
                child: Text("2026", style: TextStyle(fontSize: 12, color: Colors.grey))
                ),
            ],
                
          ),
        ),
      ),
    ),
    );
  }
}