import 'package:flutter/material.dart';
import 'package:greengrocer/src/pages/widgets/custom_text_field.dart';
import 'package:greengrocer/src/config/app_data.dart' as appdata;

class Profiletab extends StatefulWidget {
  const Profiletab({super.key});

  @override
  State<Profiletab> createState() => _ProfiletabState();
}

class _ProfiletabState extends State<Profiletab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil de usuário'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.logout))],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          CustomTextField(
              icon: Icons.email,
              label: 'Email',
              initialValue: appdata.user.email,
              readOnly: true),
          CustomTextField(
              icon: Icons.person,
              label: 'Nome',
              initialValue: appdata.user.name,
              readOnly: true),
          CustomTextField(
              icon: Icons.phone,
              label: 'Celular',
              initialValue: appdata.user.phone,
              readOnly: true),
          CustomTextField(
              icon: Icons.file_copy,
              label: 'CPF',
              isSecret: true,
              initialValue: appdata.user.cpf,
              readOnly: true),

          // botão atualizar senha
          SizedBox(
              height: 50,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Colors.green,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {
                    updatePassword();
                  },
                  child: const Text('Atualizar senha'))),
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text('Atualização de senha',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      const CustomTextField(
                          icon: Icons.lock,
                          label: 'Senha atual',
                          isSecret: true),
                      const CustomTextField(
                          icon: Icons.lock_outline,
                          label: 'Nova senha',
                          isSecret: true),
                      const CustomTextField(
                          icon: Icons.lock_outline,
                          label: 'Confirmar nova senha',
                          isSecret: true),
                      SizedBox(
                        height: 45,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () {},
                            child: const Text('Atualizar')),
                      )
                    ],
                  ),
                ),
                Positioned(
                    top: 5,
                    right: 5,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close),
                    ))
              ],
            ),
          );
        });
  }
}
