import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:my_job_desktop/cubit/app_states.dart';
import 'package:my_job_desktop/cubit/cubit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/user_model.dart';

class UploadIdentity extends StatelessWidget {
  final UserModel model ;
  const UploadIdentity({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    String frontUrl = '';
    String backUrl = '';
    CubitClass cub = CubitClass.get(context);
    return BlocConsumer<CubitClass, AppState>(
      listener: (context, state) {
        if (state is UploadPhoto) {
          showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ));
        }
        if (state is PickSinglePhoto || state is PhotoPickCancelled) Navigator.pop(context);
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Are you sure ?'),
                    content: const Text(
                      'any changes you made will be ignored',
                      style: TextStyle(color: Colors.black),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'No',
                            style: TextStyle(color: Colors.green),
                          )),
                      TextButton(
                          onPressed: () {
                            if(frontUrl!='' && backUrl!='') {
                              showDialog(
                                  context: context,
                                  builder: (context) =>
                                  const Center(
                                    child: CircularProgressIndicator(),
                                  ));
                              cub.deleteFile(downloadUrl: frontUrl);
                              cub.deleteFile(downloadUrl: backUrl);
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.pop(context);

                            }else {
                              Navigator.pop(context);
                              Navigator.pop(context);

                            }
                          },
                          child: const Text(
                            'Yes',
                            style: TextStyle(color: Colors.red),
                          )),
                    ],
                  ),
                );
              },
              icon: const Icon(IconlyBroken.arrow_left_2),
            ),
            title: const Text('Upload Identity'),
            centerTitle: false,
            actions: [
              TextButton(
                  onPressed: () {
                    FirebaseFirestore.instance.collection('users').doc(model.uid).update({'frontIdPhoto' : frontUrl}).then((e){
                      FirebaseFirestore.instance.collection('users').doc(model.uid).update({'backIdPhoto' : backUrl}).then((e){
                        Navigator.pop(context);
                      });

                    });

                  },
                  child: const Text('Update',
                      style: TextStyle(color: Colors.blue))),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          cub.pickPhoto(field: 'front Identity',uid: model.uid! ).then((value){
                            frontUrl = value??'' ;
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
            
                          child: const Row(
                            children: [
                              SizedBox(width: 8,),
                              Icon(IconlyBroken.upload , color: Colors.white,),
                              SizedBox(width: 8,),
                              Text('Upload front Identity'),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      InkWell(
                        onTap: () async {
                            cub.pickPhoto(field: 'back Identity',uid: model.uid!  ).then((value){
                              backUrl = value??'' ;
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
            
                          child: const Row(
                            children: [
                              SizedBox(width: 8,),
                              Icon(IconlyBroken.download , color: Colors.white,),
                              SizedBox(width: 8,),
                              Text('Upload Back Identity'),
                            ],
                          ),
                        ),
                      ),
            
                    ],
                  ),
                 Column(
                        children: [
                          const SizedBox(height: 50,),
                          const Text(
                            'You can see and download The Identity from here : ',
                            style: TextStyle(color: Colors.white),
                          ),
                        Row(children: [
                         frontUrl.isNotEmpty ? Expanded(child: Padding(padding: const EdgeInsets.all(20),child: Column(children: [
                           Image.network(frontUrl),
                           const SizedBox(height: 10,),
                           InkWell(
                             onTap: () async {
                               Uri frontIdtUrl = Uri.parse(frontUrl);
                               await launchUrl(frontIdtUrl);
                             },
                             child: Container(
                               height: 50,
                               width: 200,
                               decoration: BoxDecoration(
                                 color: Colors.blue,
                                 borderRadius: BorderRadius.circular(10),
                               ),
                      
                               child: const Row(
                                 children: [
                                   SizedBox(width: 8,),
                                   Icon(IconlyBroken.download , color: Colors.white,),
                                   SizedBox(width: 8,),
                                   Text('Download Front Identity'),
                                 ],
                               ),
                             ),
                           ),
                          
                         ],),)) : const SizedBox(),
                               backUrl.isNotEmpty ? Expanded(child: Padding(padding: const EdgeInsets.all(20),child: Column(children: [
                           Image.network(backUrl),
                           const SizedBox(height: 10,),
                           InkWell(
                             onTap: () async {
                               Uri backIdtUrl = Uri.parse(backUrl);
                               await launchUrl(backIdtUrl);
                             },
                             child: Container(
                               height: 50,
                               width: 200,
                               decoration: BoxDecoration(
                                 color: Colors.blue,
                                 borderRadius: BorderRadius.circular(10),
                               ),
                      
                               child: const Row(
                                 children: [
                                   SizedBox(width: 8,),
                                   Icon(IconlyBroken.download , color: Colors.white,),
                                   SizedBox(width: 8,),
                                   Text('Download back Identity'),
                                 ],
                               ),
                             ),
                           ),
                          
                         ],),)) : const SizedBox(),
                          
                        ],)
                        ],
                      ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
