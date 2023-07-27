import 'package:coffee_app/Model/CardListModel.dart';
import 'package:coffee_app/Model/ProductModel.dart';
import 'package:get/get.dart';


class CartController extends GetxController{
  var totalQuantity = 0.obs;
  var numOfItems = 1.obs;
  var cardItems = <CardItemListModel>[].obs;
  var total = 0.obs;

  void RemoveItem()
  {
  if(numOfItems.value > 1 ){
    numOfItems.value--;
  }
  
  }
  
  void AddItemInCard(ProductModel product){
    final i = cardItems.indexWhere((element) => element.product == product);
    if(i>=0)
    {
     cardItems[i] = CardItemListModel(
     product: product,
     quantity: (numOfItems.value + cardItems[i].quantity));
    }
    else
    {
     cardItems.add(CardItemListModel(quantity: numOfItems.value, product: product));
    }
    totalQuantity.value = totalQuantity.value+ numOfItems.value;
    //numOfItems.value = 1;

 
    total.value = total.value+((product.Price as int ) * numOfItems.value);
   
   

  }

   
void quantity(){
  numOfItems.value = 1;
}

  void AddItem() {

numOfItems.value++;
  }   
 
  
  
}
