List impar(int a,int b){
  List impares = new List();
  for(var i=a;i<b;i++){
    if(i%2!=0) impares.add(i);
  }
  return impares;
}

Map<String,int> cont(String pharse){
  Map<String,int> w = {};
  for(var pal in pharse.split(" ")){
    if(w[pal]==null) w[pal]=1;
    else w[pal] +=1;
  }
  return w;
}

void main(){
  for(var x in impar(1, 100)){
    print(x);
  }
  print(cont("Hola Mundo Hola Juan Hola Tia Que pasa Mundo"));
  print(imparMatrix().toString());

}

List imparMatrix(){
  List matix = new List();
  var acum = 1;
  for(var i=0;i<20;i++){
    List nums = new List();
    for(var i=0;i<20;i++){
      nums.add(acum);
      acum+=2;
    }
    matix.add(nums);
  }
  return matix;
}