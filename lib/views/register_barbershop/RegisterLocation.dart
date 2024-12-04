import 'package:flutter/material.dart';

class RegisterLocation extends StatelessWidget {
  const RegisterLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Alinha o conteúdo à esquerda
      children: [
        // Texto do título
        Text(
          'Localização',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10), // Espaçamento entre o texto e a imagem
        // Imagem abaixo do texto
        Image.network(
          'https://s3-alpha-sig.figma.com/img/eb7b/17ba/788a8ad1c8e07dc619bd02dc696a5ea4?Expires=1734307200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=okVplKi4eFdH1mRKzm5EfeqzXZUOZ9fbUJlmaOqbttl20m8saMmgC82x4xfYVvNxJyvEXxAAsbVBE6x9nJb7ZWZd4Mu86enn976SD~H6d9LLsilq8H~z562tPhHWETPf3kSOXnSGcXAWlbRlWbPRSwQeFoCPPDYbDcFGRRmizFAm9TMsZ8tTrApiVUpz~bW4feZgHoATiqYF0YjJT-bVot0fveQPE5xEutxIUQi3bGXZhcsCB6Ub9puEUrUVDKs~dvIlqiatGvtVxIuSRWlTGIAEFX3YRUHppquLDrGhXuz2YJYWz6rh4eN96kgipjle7JTheJayl75byvVftZOylA__',
          height: 150,
          width: 250,
        ),
      ],
    );
  }
}
