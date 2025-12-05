import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/item.dart';

class ItemTile extends StatelessWidget {
  final Item item;
  final VoidCallback onTap;

  const ItemTile({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cardColor = Theme.of(context).cardColor;
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0,2))],
        ),
        child: Row(
          children: [
            // Imagen del item (asset local)
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                item.imageUrl,
                width: 88,
                height: 88,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 6),
                  Text(item.description, maxLines: 2, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const FaIcon(FontAwesomeIcons.circleInfo, size: 14),
                      const SizedBox(width: 6),
                      Expanded(child: Text(item.extra, style: const TextStyle(fontSize: 12), overflow: TextOverflow.ellipsis)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}