import 'dart:convert';
import 'dart:io';

void main() async {
  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 80);
  await for(HttpRequest request in server){
    await index(request,request.response);
    request.response.close();
  }
}


void index(HttpRequest request,HttpResponse response) async {
  print("entro");
  var resp = "";
  var path = request.requestedUri.path;
  if(path[path.length-1]=="/") path=path+"index.html";
  try{
    await new File("static"+path).openRead()
    .transform(utf8.decoder)
    .transform(new LineSplitter())
    .forEach((element) {
      resp = resp+element+"\n";
    });
    response.headers.set("Content-Type", "text/html");
    response.write(resp);
  }catch(e){
    response.statusCode = 404;
  }
}