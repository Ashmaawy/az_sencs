import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/cubit/cubit/master_cubit.dart';
import '../../../shared/cubit/states/master_states.dart';
import '../../../shared/styles/icon_broken.dart';


class EditProfileUniversityScreen extends StatelessWidget {
  const EditProfileUniversityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MasterCubit, MasterStates>(
      listener: (context, state) {
        if (state is EditProfileUpdateUniversitySuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var bioController = TextEditingController();
        var userModel = MasterCubit.get(context).user;
        var cubit = MasterCubit.get(context);
        bioController.text = userModel!.bio!;
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 8.0,
                    left: 8.0,
                    top: 8.0,
                    bottom: 5.0,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          IconBroken.arrowLeft_2,
                          color: Colors.redAccent,
                        ),
                      ),
                      Text(
                        'Preview profile university',
                        style: Theme.of(context).textTheme.caption?.copyWith(
                          color: Colors.black87,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 40,
                        width: 90,
                        child: OutlinedButton(
                          onPressed: () {
                            cubit.updateUniversity(bioController.text);
                          },
                          child: const Text('UPDATE'),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1.0,
                  width: double.infinity,
                  color: Colors.grey[300],
                ),
                if (state is EditProfileUpdateUniversityLoadingState)
                  const LinearProgressIndicator(),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    height: 65,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: bioController,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54
                        ),
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: 'University',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}