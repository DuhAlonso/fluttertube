# FlutterTube

Este app foi criado com base no curso de flutter para consumo de API's

## Sobre o App

:iphone: Buscando vídeos no youtube e retornando uma lista com os resultados encontrados.  
:iphone: Pesquisa com sugestões vindo do google.  
:iphone: Reprodução de vídeos do youtube dentro do app.

- [Instalação do flutter](https://flutter.dev/docs/get-started)
- [O que é Widgets?](https://flutter.dev/docs/development/ui/widgets)

:sunglasses: Qualquer dúvida me chama

:v: [Github](https://github.com/DuhAlonso)

:v: [Linkedin](https://www.linkedin.com/in/eduardo-alonso-685509b7/)

:v: [Telegram](https://t.me/duhalonso)

## Screenshots

<img src="https://github.com/DuhAlonso/fluttertube/blob/master/screenshot/Screen1.png" width="250"> <img src="https://github.com/DuhAlonso/fluttertube/blob/master/screenshot/Screen2.png" width="250"> <img src="https://github.com/DuhAlonso/fluttertube/blob/master/screenshot/Screen3.png" width="250"> 
<img src="https://github.com/DuhAlonso/fluttertube/blob/master/screenshot/Screen4.png" width="250"> <img src="https://github.com/DuhAlonso/fluttertube/blob/master/screenshot/Screen5.png" width="250"> <img src="https://github.com/DuhAlonso/fluttertube/blob/master/screenshot/Screen6.png" width="250">

## Observação

Crie um arquivo chamado <strong>api.dart</strong> dentro da pasta <strong>lib</strong> e cole o código abaixo.

``` dart
import 'models/video.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const YOUTUBE_KEY_API = 'COLE SUA API AQUI';
const ID_CANAL = "UCwXdFgeE9KYzlDdR7TG9cMw"; // Caso queira deixar fizo um canal
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<Video>> search(String pesquisa) async {
    http.Response response = await http.get(Uri.parse(URL_BASE +
        "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            // "&order=date"
            "&key=$YOUTUBE_KEY_API"
            // "&channelId=$ID_CANAL"
            "&q=$pesquisa"));

    if (response.statusCode == 200) {
      Map<String, dynamic> dataJson = json.decode(response.body);

      List<Video> videos = dataJson["items"].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();

      return videos;
    } else {}

    return search(pesquisa);
  }
}

```

#### Não esqueça de trocar a chave de API pela sua criada no google console. 

### *Estudar é fundamental para um bom futuro, estudar e praticar é a chave do SUCESSO!*

### LICENSE
[Ler](https://github.com/DuhAlonso/fluttertube/blob/master/LICENSE.md)
