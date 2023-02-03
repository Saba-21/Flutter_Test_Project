import 'package:flutter/material.dart';
import 'package:sample_app/data_models/character.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem(this.character, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(24);
    return SizedBox(
      height: 200,
      child: Card(
        color: const Color(0xFF3C3E44),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(radius),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: radius,
                  bottomLeft: radius,
                ),
                child: Image.network(
                  fit: BoxFit.cover,
                  character.image,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              character.name,
                              style: const TextStyle(
                                  color: Color(0xFFF3F3F4),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${character.status} - ${character.species}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Color(0xFFF3F3F4)),
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Last known location:',
                              style: TextStyle(color: Color(0xFF9D9D87)),
                            ),
                            Text(
                              character.location.name,
                              style: const TextStyle(color: Color(0xFFF3F3F4)),
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'First seen in:',
                              style: TextStyle(color: Color(0xFF9D9D87)),
                            ),
                            Text(
                              character.episode[0]
                                  .replaceFirst(
                                      'https://rickandmortyapi.com/api/', '')
                                  .replaceFirst('/', ' - '),
                              style: const TextStyle(color: Color(0xFFF3F3F4)),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
