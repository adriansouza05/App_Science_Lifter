import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../models/post_model.dart';
import '../services/api_service.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  late Future<List<PostModel>> _apiFuture;

  @override
  void initState() {
    super.initState();
    _apiFuture = ApiService().fetchExternalData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.black,
      appBar: AppBar(
        title: const Text("CONTEÚDO API REST EXTERNA"),
        backgroundColor: AppTheme.black,
      ),
      body: FutureBuilder<List<PostModel>>(
        future: _apiFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: AppTheme.red),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "${snapshot.error}",
                  style: const TextStyle(color: AppTheme.white),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                "Nenhum dado retornado da API.",
                style: TextStyle(color: AppTheme.white),
              ),
            );
          }

          final posts = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: posts.length > 15
                ? 15
                : posts.length, // Limitando a 15 itens para performance
            itemBuilder: (context, index) {
              return Card(
                color: AppTheme.cardGrey,
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: AppTheme.borderGrey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  title: Text(
                    posts[index].title.toUpperCase(),
                    style: const TextStyle(
                      color: AppTheme.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      posts[index].body,
                      style: const TextStyle(color: AppTheme.offWhite),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
