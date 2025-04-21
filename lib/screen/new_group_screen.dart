import 'package:demo_applications/bloc/group_bloc.dart';
import 'package:demo_applications/bloc/group_event.dart';
import 'package:demo_applications/bloc/group_state.dart';
import 'package:demo_applications/model/group_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class NewGroupScreen extends StatefulWidget {
  const NewGroupScreen({super.key});

  @override
  State<NewGroupScreen> createState() => _NewGroupScreenState();
}

class _NewGroupScreenState extends State<NewGroupScreen> {
  final TextEditingController codeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController membersController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  GroupType selectedType = GroupType.random;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _selectDate(
    BuildContext context,
    TextEditingController controller,
  ) async {
    DateTime initialDate = DateTime.now();
    DateTime firstDate = DateTime(2000);
    DateTime lastDate = DateTime(2100);

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (pickedDate != null && pickedDate != initialDate) {
      controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildProfileImage(),
              const SizedBox(height: 20),
              _buildTextField("Group Code", codeController, Icons.group, (
                value,
              ) {
                if (value == null || value.isEmpty) {
                  return 'Please enter group code';
                }
                return null;
              }),
              _buildTextField("Group Name", nameController, Icons.group, (
                value,
              ) {
                if (value == null || value.isEmpty) {
                  return 'Please enter group name';
                }
                return null;
              }),
              _buildTextField(
                "Total Members",
                membersController,
                Icons.people,
                (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter total members';
                  }
                  return null;
                },
              ),
              _buildTextField(
                "Start Date",
                startDateController,
                Icons.calendar_today,
                (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select start date';
                  }
                  return null;
                },
                onTap: _selectDate,
              ),
      
              _buildTextField(
                "End Date",
                endDateController,
                Icons.calendar_today,
                (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select end date';
                  }
                  return null;
                },
                onTap: _selectDate,
              ),
      
              _buildTextField(
                "Member Amount",
                amountController,
                Icons.currency_rupee,
                (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter member amount';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              _buildGroupTypeOptions(),
              const SizedBox(height: 30),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: InkWell(
        onTap: (){
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back, color: Colors.white)),
      backgroundColor: const Color.fromARGB(255, 114, 14, 7),
      title: Text(
        'New Group',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      ),
      centerTitle: true,
    );
  }

  Widget _buildProfileImage() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(''),
          onBackgroundImageError: (exception, stackTrace) {
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
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    IconData icon,
    String? Function(String?)? validator, {
    Function(BuildContext, TextEditingController)? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: label,
          labelText: label,
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        validator: validator,
        readOnly:
            onTap !=
            null,
        onTap:
            onTap != null
                ? () {
                  FocusScope.of(
                    context,
                  ).requestFocus(FocusNode()); // Dismiss keyboard
                  onTap(context, controller); // Open date picker
                }
                : null,
        keyboardType:
            label == "Total Members" ? TextInputType.number : TextInputType.text,
      ),
    );
  }

  Widget _buildGroupTypeOptions() {
    return Row(
      children: [
        Expanded(child: _modeOption("Random", GroupType.random)),
        const SizedBox(width: 16),
        Expanded(child: _modeOption("Manual", GroupType.maunal)),
      ],
    );
  }

  Widget _modeOption(String label, GroupType type) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedType = type;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: selectedType == type ? Colors.red : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              selectedType == type ? Icons.check_circle : Icons.circle_outlined,
              color: selectedType == type ? Colors.red : Colors.grey,
            ),
            const SizedBox(width: 8),
            Text(label),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _submitGroup,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 114, 14, 7),
        ),
        child: const Text(
          "Submit",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  void _submitGroup() {
    if (_formKey.currentState?.validate() ?? false) {
      final group = GroupModel(
        groupId: "",
        groupCode: codeController.text,
        groupName: nameController.text,
        totalMembers: membersController.text,
        totalMonths: "12",
        startDate: startDateController.text,
        endDate: endDateController.text,
        amount: amountController.text,
        groupType: selectedType,
        groupStatus: "Active",
        createdBy: "admin",
        createdDate: DateTime.now().toIso8601String(),
        updatedBy: null,
        updatedDate: null,
        isGroupAdmin: "1",
        groupAdmin: "admin",
      );

      context.read<GroupBloc>().add(AddGroup(group));
    }
  }

  void _groupStateListener(BuildContext context, GroupState state) {
    if (state is GroupAdded) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Group added successfully")));
      Navigator.pop(context);
    } else if (state is GroupError) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(state.message)));
    }
  }
}
