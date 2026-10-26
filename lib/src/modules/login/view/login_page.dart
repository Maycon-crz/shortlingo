import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortlingo/src/modules/login/controller/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.translate,
                        size: 72, color: Theme.of(context).colorScheme.primary),
                    const SizedBox(height: 8),
                    Text('ShortLingo',
                        style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(height: 4),
                    const Text('Aprenda inglês de forma prática'),
                    const SizedBox(height: 32),
                    TextFormField(
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'E-mail',
                        prefixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(),
                      ),
                      validator: controller.validateEmail,
                    ),
                    const SizedBox(height: 16),
                    Obx(
                      () => TextFormField(
                        controller: controller.passwordController,
                        obscureText: controller.obscurePassword.value,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          prefixIcon: const Icon(Icons.lock_outline),
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(controller.obscurePassword.value
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () => controller.obscurePassword.toggle(),
                          ),
                        ),
                        validator: controller.validatePassword,
                        onFieldSubmitted: (_) => controller.login(),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: FilledButton(
                        onPressed: controller.login,
                        child: const Text('Entrar'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
