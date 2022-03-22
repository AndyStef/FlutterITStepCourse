import 'Category.dart';
import 'Product.dart';

class CategoriesGenerator {
  List<Category> generateAllCategories() {
    return [
      Category('Кава та напої', 'DrinksCategory.webp', [
        Product('Nescafe CLASSIC', 'NescafeClassic.jpeg'),
        Product('Nescafe GOLD', 'NescafeGold.webp'),
        Product('Nescafe 3в1', 'Nescafe3in1.jpeg'),
        Product('Nesquik', 'Nesquik.webp'),
        Product('Nescafe ESPRESSO', 'NescafeEspresso.jpeg'),
        Product('Coffee-mate', 'CoffeeMate.webp'),
        Product('Dolce Gusto', 'DolceGusto.jpeg'),
      ]),
      Category('Солодке', 'Sweets.jpeg', [
        Product('KitKat', 'KitKat.webp'),
        Product('Lion', 'Lion.jpeg'),
        Product('NUTS', 'NUTS.jpeg'),
        Product('Шоколадки Світоч', 'SwitochBars.png'),
        Product('Зоряне сяйво', 'StarShine.jpeg'),
        Product('Ромашка', 'DaisyFlower.jpeg'),
        Product('AERO', 'AERO.jpeg'),
        Product('Вафлі Артек', 'Artek.jpeg'),
        Product('Цукерки Світоч', 'SwitochCandies.jpeg'),
      ]),
      Category('Корм для тварин', 'PetsFood.png', [
        Product('Корми Purina', 'Purina.jpeg'),
        Product('Friskies', 'Friskies.jpeg'),
        Product('Gourmet', 'gourmet.webp'),
        Product('Darling', 'Darling.jpeg'),
      ]),
      Category('Дитяче харчування', 'KidsFood.jpeg', []),
      Category('Напої', 'Drinks.jpeg', [
        Product('Nestea', 'Nestea.png'),
      ]),
      Category('Парфуми', 'Parfumes.jpeg', [
        Product('Ralph Lauren', 'RalphLauren.jpeg'),
        Product('Giorgio Armani', 'GiorgioArmani.jpeg'),
      ]),
      Category('Кулінарія', 'Сooking.jpeg', [
        Product('Вермішель Мівіна', 'Mivina.jpeg'),
        Product('Картопляне пюре Мівіна', 'MivinaPotato.png'),
        Product('Кетчупи Торчин', 'TorchunKetchup.jpeg'),
        Product('Гірчиця Торчин', 'TorchunMustard.jpeg'),
      ]),
      Category('Косметика', 'Cosmetics.jpeg', [
        Product('Засоби Garnier', 'Garnier.webp'),
        Product('Засоби Vichy', 'Vichy.jpeg'),
        Product('Засоби Maybelline', 'Maybelline.webp'),
      ]),
    ];
  }
}
