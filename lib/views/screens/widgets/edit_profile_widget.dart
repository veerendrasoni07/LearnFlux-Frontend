import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnmate/controller/auth_controller.dart';
import 'package:learnmate/provider/user_provider.dart';

class EditProfileWidget extends ConsumerStatefulWidget {
  const EditProfileWidget({super.key});

  @override
  ConsumerState<EditProfileWidget> createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends ConsumerState<EditProfileWidget> {

  TextEditingController nameController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController hobbyController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _selectedBoard;
  String? _selectedClass;
  List<String> boards = [
    'CBSE',
    'MP Board',
    'ICSE',
    'OTHER'
  ];
  List<String> classes = [
    'Class 10th',
    'Class 11th',
    'Class 12th'
  ];


  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    return SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  colors: [
                    Colors.lightBlueAccent.shade100,
                    Colors.blue.shade700
                  ]
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Edit Your Profile",
                    style: GoogleFonts.grandHotel(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "Enter Your Name",
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                      letterSpacing: 1.7,
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                      controller: nameController,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Please Enter Your Name";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        hintText: "Enter Your New Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      )
                  ),
                  Text("Select Your Board",style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                    letterSpacing: 1.7,
                  ),),
                  CustomDropdown<String>(
                    onChanged: (value){
                      _selectedBoard = value!;
                    },
                    hintText: 'Select Board',
                    items: boards,
                    validator: (value){
                      if(value ==null || value.isEmpty){
                        return "Please Select The Board";
                      }
                      return null;
                    },
                    decoration: CustomDropdownDecoration(
                        closedFillColor:Theme.of(context).colorScheme.surface,
                        expandedFillColor: Theme.of(context).colorScheme.surface,
                        hintStyle: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                          letterSpacing: 1.7,
                        )
                    ),
                  ),
                  Text("Select Your Class",style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                    letterSpacing: 1.7,
                  ),),
                  CustomDropdown<String>(
                    onChanged: (value){
                      _selectedClass = value!;
                    },
                    hintText: 'Select Class',
                    items: classes,
                    validator: (value){
                      if(value ==null || value.isEmpty){
                        return "Please Select The Class";
                      }
                      return null;
                    },
                    decoration: CustomDropdownDecoration(
                        closedFillColor: Theme.of(context).colorScheme.surface,
                        expandedFillColor: Theme.of(context).colorScheme.surface,
                        hintStyle: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                          letterSpacing: 1.7,
                        )
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "Enter Your Hobby",
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                      letterSpacing: 1.7,
                    ),
                  ),
                  TextFormField(
                      controller: hobbyController,
                      validator: (value){
                        if(value ==null || value.isEmpty){
                          return "Please Enter Your Hobby";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter Your Hobby",
                        enabled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      )
                  ),
                  Text(
                    "Enter Your City",
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                      letterSpacing: 1.7,
                    ),
                  ),
                  TextFormField(
                      controller: cityController,
                      validator: (value){
                        if(value ==null || value.isEmpty){
                          return "Please Enter Your City";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        hintText: "Enter Your City",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      )
                  ),
                  Text(
                    "Enter Your State",
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                      letterSpacing: 1.7,
                    ),
                  ),
                  TextFormField(
                      controller: stateController,
                      validator: (value){
                        if(value ==null || value.isEmpty){
                          return "Please Enter Your State";
                        }
                        else{
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        enabled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        hintText: "Enter Your State",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      )
                  ),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: ()async{
                      if(_formKey.currentState!.validate()){
                        await AuthController().editStudentDetail(
                            userId: user!.id,
                            fullname: nameController.text,
                            board: _selectedBoard.toString(),
                            studentClass: _selectedClass.toString(),
                            state: stateController.text,
                            city: cityController.text,
                            interest: hobbyController.text,
                            context: context,
                            ref: ref
                        );
                      }
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(colors: [
                          Colors.greenAccent.shade200,
                          Colors.green
                        ])
                      ),
                      child: Center(
                        child: Text(
                          "Save Changes",
                          style: GoogleFonts.grandHotel(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
