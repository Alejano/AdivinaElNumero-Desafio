
class ListNode{
  String? val;
  ListNode? next;
  ListNode([this.val,this.next]);
}

printResult(ListNode? xl){
  ListNode? aux = xl;
  String? salidaNode = aux?.val;
  while(aux?.next != null){
    xl = aux?.next;
    aux = xl;
    salidaNode = "$salidaNode ==> ${aux?.val}";
  }
  print(salidaNode);
}

String evaluaString(String? palabra){
  String formato = "";
  String result ="";
  List<String> p = [];
  String aux = "";
  String sobrante = "";
  int x = 0;
  if (palabra?.isEmpty ?? true) {return "";}
  List<String> listaux =[];
  if(palabra!.length > 1) {
    while (x < palabra.length) {
      listaux = aux.split('');
      formato = palabra[x].toLowerCase();
      if (listaux.contains(formato)) {
        p.add(aux);
        aux = "";
        sobrante = "";
        aux = aux + formato;
      } else {
        aux = aux + formato;
      }
      x++;
    }
    if (sobrante != "") {
      aux = aux + sobrante;
    }
    p.add(aux);
    aux = "";
  }else{
    p.add(palabra[x].toLowerCase());
  }

  //reutilizamos y para tamaño
  x=0;//index
  int y=0;//tamaños
  for(int i=0;i<p.length;i++){
    if(y<p[i].length) {
      y = p[i].length;
      x = i;
    }
  }

  result = p[x];
  return result;
}

ListNode crearNodos(String palabra){
  List<String> listN = palabra.split('');
  ListNode result = ListNode(listN.length.toString(),null);
  for(int x = listN.length -1; x >= 0; x--){
    result = ListNode(listN[x],result);
  }
  return result;
}

executelist(ListNode? xl){
  ListNode? aux = xl;
  String palabra = evaluaString(aux?.val);
  print(palabra);
  ListNode result = crearNodos(palabra);
  printResult(result);
 while(aux?.next != null){
     xl = aux?.next;
     aux = xl;
     String palabra = evaluaString(aux?.val);
     print(palabra);
     ListNode result = crearNodos(palabra);
     printResult(result);
 }

}


main(){
  ListNode ln = ListNode('Holaholaholahola',ListNode('Geekforgeeks',ListNode('aabc',ListNode('ok_ya_esta_todo',ListNode('d',null)))));
  print("_______");
  executelist(ln);
  //evaluaString("aabc");
}