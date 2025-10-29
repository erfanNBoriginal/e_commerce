import 'package:e_commerce/domains/models/address.dart';
import 'package:e_commerce/modules/checkout/cubit/checkout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AddShippingAddressDialog extends StatefulWidget {
  final Address? address;
const AddShippingAddressDialog({super.key, this.address});
static show(BuildContext context,{
  required CheckoutCubit checkoutCubit,
  Address? address
}){
  showDialog(context: context,
   builder: (context){
    return BlocProvider.value(
     value: checkoutCubit,
      child: AddShippingAddressDialog(address: address,));
   });
}


  // late final TextEditingController  nameCtrl ;
  // late final TextEditingController  addressCtrl ;
  // late final TextEditingController  cityCtrl ;
  // late final TextEditingController  stateCtrl ;
  // late final TextEditingController  zipCodeCtrl ;
  // // final TextEditingController  = TextEditingController();
  // // final TextEditingController  = TextEditingController();
  // // final TextEditingController  = TextEditingController();
  // // final TextEditingController  = TextEditingController();
  //  AddShippingAddressDialog({super.key}){
  //    nameCtrl = TextEditingController();
  //    addressCtrl = TextEditingController();
  //    zipCodeCtrl = TextEditingController();
  //    stateCtrl = TextEditingController();
  //    cityCtrl = TextEditingController();
  //  }  

  @override
  State<AddShippingAddressDialog> createState() => _AddShippingAddressDialogState();
}

class _AddShippingAddressDialogState extends State<AddShippingAddressDialog> {
List<Map<String,dynamic>> textFieldsMaps = [
{
  'name' : 'Full name',
  'error' : false,
  'error message' : '',
  'controller':TextEditingController()
},
{
  'name' : 'Address',
  'error' : false,
  'error message' : '',
  'controller':TextEditingController()},
{
  'name' : 'City',
  'error' : false,
  'error message' : '',
  'controller':TextEditingController()},
{
  'name' : 'state',
  'error' : false,
  'error message' : '',
  'controller':TextEditingController()},
{
  'name' : 'Zip code',
  'error' : false,
  'error message' : '',
  'controller':TextEditingController()},
];

@override
  void initState() {
    if(widget.address != null){
textFieldsMaps[0]['controller'].text = widget.address!.name;
textFieldsMaps[1]['controller'].text = widget.address!.address;
textFieldsMaps[2]['controller'].text = widget.address!.city;
textFieldsMaps[3]['controller'].text = widget.address!.region;
textFieldsMaps[4]['controller'].text = widget.address!.zipCode.toString();
    }

    super.initState();
  }

bool checkEmpty(){
  bool res=false;
for (var element in textFieldsMaps) {
 res = element['controller'].text.isEmpty;
 element['error'] = res;
 element['error message'] = '${element['name']} cant be empty';

}
setState(() {
  
});
return res;
}

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit,CheckoutState>(
      builder: (context,state) {
        return Scaffold(
          body: ListView(
            children: [
                U.AppBar(title: 'Add Shipping Address'),
                SizedBox(height: 35,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      ...textFieldsMaps.expand((e)=>[ U.TextInput(
                        numbersOnly: e['name']=='Zip code',
                        textCtrl:e['controller'],title:e['name'] ,
                      hasError: e['error'], errorMessage: e['error message'],
                      ),
                      SizedBox(height: 20,)
                       ]),
                      // U.TextInput(title: 'Full name', textCtrl: nameCtrl),
                      // SizedBox(height: 20,),
                      // U.TextInput(title: 'Address', textCtrl: addressCtrl),
                      // SizedBox(height: 20,),
                      // U.TextInput(title: 'City', textCtrl: cityCtrl),
                      // SizedBox(height: 20,),
                      // U.TextInput(title: 'state', textCtrl: stateCtrl),
                      // SizedBox(height: 20,),
                      // U.TextInput(title: 'Zip code', textCtrl: zipCodeCtrl),
                      SizedBox(height: 40,),
                     state.addressLoading ? CircularProgressIndicator() :
                       Padding(
                         padding: const EdgeInsets.only(bottom: 10.0),
                         child: U.Button(title: 'Save Address',
                         size: U.ButtonSize.l,
                          onTap: () async{
                          print('happpend');
                            if(!checkEmpty()) { 
                              print('what the shiiiit');
                            if(widget.address != null)
                       {
                        print('fuck yessssssssssssssss');
                                final res =  await context.read<CheckoutCubit>().onAddressEdited(
                            Address(
                              name: textFieldsMaps[0]['controller'].text,
                               region: textFieldsMaps[3]['controller'].text,
                                address: textFieldsMaps[1]['controller'].text,
                                 city: textFieldsMaps[2]['controller'].text,
                                  zipCode: int.parse(textFieldsMaps[4]['controller'].text)
                                  )                            );
                                  if(res) GoRouter.of(context).pop();
                       
                       }
                         else 
                         { 
                          print('fuuuuuuuuuuuuuuck');
                          final res =  await context.read<CheckoutCubit>().onShippingAddressAdded(
                            Address(
                              name: textFieldsMaps[0]['controller'].text,
                               region: textFieldsMaps[3]['controller'].text,
                                address: textFieldsMaps[1]['controller'].text,
                                 city: textFieldsMaps[2]['controller'].text,
                                  zipCode: int.parse(textFieldsMaps[4]['controller'].text)
                                  ));
                           if(res) GoRouter.of(context).pop();
                         }
                                  }
                          },
                           bordeRaius: U.Theme.r25,
                            color: U.Theme.primary),
                       )
                    ],
                  ),
                )
            ],
          ),
        );
      }
    );
  }
}