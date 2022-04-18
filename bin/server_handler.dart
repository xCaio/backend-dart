import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ServeHandler{
  Handler get handler{
    final router = Router();
    router.get('/', (Request request){
      return Response(200, body: "Primeira Rota");
    });


  //PASSANDO INFORMAÇÕES PARA O SERVIDOR EX.: usuário no end. localhost:8080/ola/mundo/caio 
  router.get('/ola/mundo/<usuario>', (Request req, String usuario){
    return Response(200, body: "Olá mundo $usuario ");
  });


  // http://localhost:8081/query?nome=Caio

  // CRIEI UMA ROTA DO TIPO GET
  // A ROTA SE CHAMA '/query' 
  // NA NOSSA REQUEST OU SEJA, O QUE O USUÁRIO ENVIO PRA GENTE, CRIAMOS UMA VARIAVEL DO TIPO STRING
  // QUE SE CHAMA 'nome' 
  // ESTAMOS PEGANDO O REQUEST, PEGANDO A URL DO REQUEST (http://localhost:8081/query?nome=Caio) 
  // E PEGANDO OS QUERY PARAMS DO NOSSO REQUEST => TUDO AQUILO QUE VEM DEPOIS DO '?' -> (http://localhost:8081/query?nome=Caio) 

  router.get('/query', (Request req) {
    // http://localhost:8081/query?nome=Caio
    String? nome = req.url.queryParameters['nome'];

    // http://localhost:8081/query?nome=Caio&idade=20
    String? idade = req.url.queryParameters['idade'];
    return Response.ok('Query é: $nome e idade: $idade');
  });


    return router;
  }
}