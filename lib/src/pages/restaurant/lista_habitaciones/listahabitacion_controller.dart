import 'package:flutter/cupertino.dart';
import 'package:hotel/src/models/product.dart';
import 'package:hotel/src/models/user.dart';
import 'package:hotel/src/provider/products_provider.dart';
import 'package:hotel/src/provider/users_provider.dart';
import 'package:hotel/src/utils/my_snackbar.dart';
import 'package:hotel/src/utils/shared_pref.dart';


class ListaHabitacionController{

  BuildContext context;
  Function refresh;



  final SharedPref _sharedPref = SharedPref();

  final UsersProvider _usersProvider = UsersProvider();
  final ProductsProvider _productsProvider = ProductsProvider();
 User user;
  List<Product> listHOTEL = [];
  

  Future init(BuildContext context, Function refresh,) async {
    this.context = context;
    this.refresh = refresh;
    
    user = User.fromJson(await _sharedPref.read('user'));
    
    _productsProvider.init(context, user);
    //_addressProvider.init(context, user);
    
    listarRepartidor();
    refresh();
  }

  void listarRepartidor() async{
    listHOTEL = await _productsProvider.ListahOTEL();
    refresh();
  } 


  void deleteItem(String id)async{
    await _productsProvider.eliminarHotel(id);
   MySnackbar.show(
          context, 'Usuario eliminado');
           listarRepartidor();
      refresh();
   
  } 
 
 




}