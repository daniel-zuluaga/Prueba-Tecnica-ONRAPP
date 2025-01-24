import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prueba_tecnica_orn/core/utils/valid_email_utils.dart';
import 'package:prueba_tecnica_orn/feature/product/domain/repositories/product_repository.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  setUp(() {});

  group(
    'Unit test of the ValidEmailUtils class',
    () {
      test(
        "Unit test of the isValidEmail function, case of success",
        () {
          const email = 'daniel@gmail.com';
          final isValidEmail = ValidEmailUtils.isValidEmail(email);

          expect(true, isValidEmail);
        },
      );
      test(
        "Unit test of the isValidEmail function, case of failed",
        () {
          const email = 'daniel.gmail.com';
          final isValidEmail = ValidEmailUtils.isValidEmail(email);

          expect(false, isValidEmail);
        },
      );
    },
  );
}
