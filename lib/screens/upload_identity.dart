import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:my_job_desktop/cubit/app_states.dart';
import 'package:my_job_desktop/cubit/cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class UploadIdentity extends StatelessWidget {
  const UploadIdentity({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> urls = [];
    CubitClass cub = CubitClass.get(context);
    return BlocConsumer<CubitClass, AppState>(
      listener: (context, state) {
        if (state is UploadFiles) {
          showDialog(
              context: context,
              builder: (context) =>
              const Center(
                child: CircularProgressIndicator(),
              ));
        }
        if (state is PickMultipleFiles ||state is FilePickCancelled ) Navigator.pop(context);
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
                            if(urls.isNotEmpty) {
                              showDialog(
                                  context: context,
                                  builder: (context) =>
                                  const Center(
                                    child: CircularProgressIndicator(),
                                  ));
                              for(var e in urls){
                                cub.deleteFile(downloadUrl: e);
                              }
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
                  onPressed: () {},
                  child: const Text('Update Profile',
                      style: TextStyle(color: Colors.blue))),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: InkWell(
                    onTap: () async {
                      cub.pickMultipleFiles(field: 'm', uid: 'ahmed').then((
                          value) {
                        urls.addAll(value!) ;
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
                          Icon(IconlyBroken.download, color: Colors.white,),
                          SizedBox(width: 8,),
                          Text('Add Identity\'s'),
                        ],
                      ),
                    ),
                  ),
                ) ,
                if (urls != [])
                  Column(
                    children: [
                      const SizedBox(height: 50,),
                      const Text(
                        'You can see The Identity\'s from here : ',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(width: 20,),
                      ListView.separated(
                          shrinkWrap: true ,
                          itemBuilder:(context , index )=>_urlItemBuilder( cub , index , urls) ,
                          separatorBuilder: (context , index)=>
                          const SizedBox(height: 20,)
                          ,
                          itemCount: urls.length)

                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
  _urlItemBuilder(CubitClass cub,int index , List<String> urls){
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () async {
              Uri qualificationUrl = Uri.parse(urls[index]);
              await launchUrl(qualificationUrl);
            },
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),

              child:  Row(
                children: [
                  const SizedBox(width: 8,),
                  const Icon(IconlyBroken.download , color: Colors.white,),
                  const SizedBox(width: 8,),
                  Text('Qualification ${index + 1 }'),
                ],
              ),
            ),
          ),
        ),
        IconButton(onPressed: (){
          cub.deleteFile(downloadUrl: urls[index]);
          urls.removeAt(index);

        }, icon: const Icon(IconlyBroken.delete))
      ],
    );
  }
}

