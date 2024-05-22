import 'package:flutter/material.dart';
import 'package:mobile/features/main/pages/profile/profile_page.dart';
import 'package:mobile/shared/themes/color.dart';
import 'package:mobile/shared/utils/token_handler.dart';
import 'package:mobile/shared/utils/user.dart';
import 'package:mobile/shared/widgets/text_field.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: owlBase,
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                Positioned(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xff333A73), Color(0xff606DD9)])),
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: editIcon(),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.05,
                  top: MediaQuery.of(context).size.height * 0.25 -
                      MediaQuery.of(context).size.height * 0.25 / 2,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(UserAccess.image),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.25,
                  left: MediaQuery.of(context).size.width * 0.3,
                  child: editIcon(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    hidden: false,
                    controller: usernameController,
                    hint: UserAccess.username,
                    label: "Username",
                  ),
                  CustomTextField(
                    hidden: false,
                    controller: bioController,
                    hint: UserAccess.biodata,
                    label: "Bio",
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () async {
                      final jwt = await Token.getToken();
                      UserAccess.editUser(
                              usernameController.text, bioController.text, jwt)
                          .then(
                        (_) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const ProfilePage(),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: owlMidBlue,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: const Center(
                        child: Text(
                          "Save",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: owlMidBlue,
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: const Center(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            color: owlMidBlue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget editIcon() {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: owlMidBlue,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(1000),
        ),
      ),
      child: const Icon(
        Icons.edit,
        size: 20,
        color: Colors.black,
      ),
    );
  }
}
