import 'package:flutter/material.dart';
import 'package:greengrocer/src/pages/widgets/custom_text_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cpfFormatter = MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: {'#': RegExp(r'[0-9]')},
    );

    final phoneFormatter = MaskTextInputFormatter(
      mask: '## # ####-####',
      filter: {'#': RegExp(r'[0-9]')},
    );
    return Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: [
              Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Cadastro",
                        style: TextStyle(color: Colors.white, fontSize: 35),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 40),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(45))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const CustomTextField(
                            icon: Icons.email, label: 'Email'),
                        const CustomTextField(
                          icon: Icons.lock,
                          label: 'Senha',
                          isSecret: true,
                        ),
                        const CustomTextField(
                            icon: Icons.person, label: 'Nome'),
                        CustomTextField(
                            icon: Icons.phone, label: 'Celular', inputFormatters: [phoneFormatter],),
                        CustomTextField(
                            icon: Icons.file_copy, label: 'CPF', inputFormatters: [cpfFormatter],),
                        SizedBox(
                            height: 50,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18))),
                                onPressed: () {},
                                child: const Text(
                                  'Cadastrar usuário',
                                  style: TextStyle(fontSize: 18),
                                )))
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                top: 10,
                left: 10,
                child: SafeArea(
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        }, icon: const Icon(Icons.arrow_back_ios), color: Colors.white,)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
