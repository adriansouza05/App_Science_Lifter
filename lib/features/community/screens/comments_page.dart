import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  final List<Map<String, String>> _comentarios = [];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scroll = ScrollController();

  void _adicionar() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _comentarios.insert(0, {
        'text': text,
        'time': _formatTime(DateTime.now()),
      });
      _controller.clear();
    });
  }

  String _formatTime(DateTime dt) {
    final h = dt.hour.toString().padLeft(2, '0');
    final m = dt.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  @override
  void dispose() {
    _controller.dispose();
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.black,
      appBar: AppBar(
        title: const Text('COMENTÁRIOS'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('COMUNIDADE', style: AppTheme.labelUpper),
                const SizedBox(height: 4),
                const Text(
                  'Compartilhe sua evolução',
                  style: AppTheme.headingMedium,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),

          // Input area
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.cardGrey,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppTheme.borderGrey),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  controller: _controller,
                  style: const TextStyle(color: AppTheme.white, fontSize: 14),
                  maxLines: 3,
                  minLines: 2,
                  decoration: InputDecoration(
                    hintText: 'Compartilhe sua experiência, dica ou dúvida...',
                    hintStyle: AppTheme.caption.copyWith(fontSize: 13),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    filled: false,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: _adicionar,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      gradient: AppTheme.redGradient,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.send, color: AppTheme.white, size: 16),
                        SizedBox(width: 8),
                        Text(
                          'PUBLICAR',
                          style: TextStyle(
                            color: AppTheme.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Comments list
          Expanded(
            child: _comentarios.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.chat_bubble_outline,
                          color: AppTheme.borderGrey,
                          size: 48,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Nenhum comentário ainda',
                          style: AppTheme.caption.copyWith(fontSize: 14),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Seja o primeiro a compartilhar!',
                          style: AppTheme.caption,
                        ),
                      ],
                    ),
                  )
                : ListView.separated(
                    controller: _scroll,
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                    itemCount: _comentarios.length,
                    separatorBuilder: (ctx, index) =>
                        const SizedBox(height: 10),
                    itemBuilder: (ctx, index) {
                      final c = _comentarios[index];
                      return Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppTheme.cardGrey,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppTheme.borderGrey),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                gradient: AppTheme.redGradient,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.person,
                                color: AppTheme.white,
                                size: 18,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Atleta',
                                        style: TextStyle(
                                          color: AppTheme.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(c['time']!, style: AppTheme.caption),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    c['text']!,
                                    style: const TextStyle(
                                      color: AppTheme.offWhite,
                                      fontSize: 14,
                                      height: 1.4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
