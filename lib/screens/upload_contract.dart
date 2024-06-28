import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:my_job_desktop/cubit/app_states.dart';
import 'package:my_job_desktop/cubit/cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class UploadContract extends StatelessWidget {
  const UploadContract({super.key});

  @override
  Widget build(BuildContext context) {
    String url = '';
    CubitClass cub = CubitClass.get(context);
    return BlocConsumer<CubitClass, AppState>(
      listener: (context, state) {
        if (state is UploadFile) {
          showDialog(
              context: context,
              builder: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ));
        }
        if (state is UploadFileSuccess || state is FilePickCancelled) Navigator.pop(context);
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
                            if(url!='') {
                              showDialog(
                                  context: context,
                                  builder: (context) =>
                                  const Center(
                                    child: CircularProgressIndicator(),
                                  ));
                                cub.deleteFile(downloadUrl: url);
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
            title: const Text('Upload Contract'),
            centerTitle: false,
            actions: [
              TextButton(
                  onPressed: () {},
                  child: const Text('Update Profile',
                      style: TextStyle(color: Colors.blue))),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        cub.pickSingleFile(field: 'm',uid: 'ahmed' ).then((value){
                          url = value??'' ;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),

                        child: const Row(
                          children: [
                            SizedBox(width: 8,),
                            Icon(IconlyBroken.upload , color: Colors.white,),
                            SizedBox(width: 8,),
                            Text('Upload Contract'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    url !='' ?InkWell(
                      onTap: () async {
                        await cub.deleteFile(downloadUrl: url).then((v){
                          cub.pickSingleFile(field: 'm',uid: 'ahmed' ).then((value){
                            url = value??'' ;
                          });
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),

                        child: const Row(
                          children: [
                            SizedBox(width: 8,),
                            Icon(IconlyBroken.download , color: Colors.white,),
                            SizedBox(width: 8,),
                            Text('Update Contract'),
                          ],
                        ),
                      ),
                    ):const SizedBox(),

                  ],
                ),
                if (url != '')
                  Column(
                    children: [
                      const SizedBox(height: 50,),
                      const Text(
                        'You can see The Contract from here : ',
                        style: TextStyle(color: Colors.white),
                      ),
                      InkWell(
                        onTap: () async {
                           Uri contractUrl = Uri.parse(url);
                           await launchUrl(contractUrl);
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: const Row(
                            children: [
                              SizedBox(width: 8,),
                              Icon(IconlyBroken.download , color: Colors.white,),
                              SizedBox(width: 8,),
                              Text('Contract'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
