import 'package:plant_shop/enums/pot_color.dart';
import 'package:plant_shop/enums/pot_type.dart';
import 'package:plant_shop/models/address.dart';
import 'package:plant_shop/models/card.dart';
import 'package:plant_shop/models/group_plant.dart';
import 'package:plant_shop/pages/onboarding/models/onboarding_page_model.dart';
import 'package:plant_shop/theme/app_colors.dart';

final List<OnboardingPageModel> onboardingPages = [
  OnboardingPageModel(
    title: [
      OnboardingPageTitle(
        text: 'Best collection of\n',
        color: AppColors.dark,
      ),
      OnboardingPageTitle(
        text: 'indoor & outdoor ',
        color: AppColors.primary500,
      ),
      OnboardingPageTitle(
        text: 'plants',
        color: AppColors.dark,
      ),
    ],
    description:
        'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit. Fringilla in sed risus sit.',
    image: 'assets/images/onboarding/slide1.png',
  ),
  OnboardingPageModel(
    title: [
      OnboardingPageTitle(
        text: 'Keep your \n',
        color: AppColors.dark,
      ),
      OnboardingPageTitle(
        text: 'plants ',
        color: AppColors.dark,
      ),
      OnboardingPageTitle(
        text: 'alive',
        color: AppColors.primary500,
      ),
    ],
    description:
        'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit. Fringilla in sed risus sit.',
    image: 'assets/images/onboarding/slide2.png',
  ),
  OnboardingPageModel(
    title: [
      OnboardingPageTitle(
        text: 'Plan a tree &\n',
        color: AppColors.dark,
      ),
      OnboardingPageTitle(
        text: 'green the ',
        color: AppColors.dark,
      ),
      OnboardingPageTitle(
        text: 'earth',
        color: AppColors.primary500,
      ),
    ],
    description:
        'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit. Fringilla in sed risus sit.',
    image: 'assets/images/onboarding/slide3.png',
  ),
];

List<GroupPlant> dataPlants = [
  GroupPlant(
    name: 'Beginner Set',
    description:
        """This near-unkillable duo is perfect for a beginner plant parent. The ZZ Plant & Snake Plant are tolerant to lower light levels and can even go over a month without being watered.
Both plants are active and release oxygen during the night, making them the perfect bedroom companion, and sleep-aid.
→ Both plants measure ~40cm tall from the bottom of planter to the top of the foliage
Note: Each plant is unique in shape and size; all measurements fluctuate in range by ~5cm""",
    rating: 3,
    pots: {
      PotType.circle: [
        Pot(
          height: '40 cm',
          price: 249,
          variants: {
            PotColor.white: PotVariant(
              image: 'assets/images/plants/beginner_circle_white.png',
            ),
            PotColor.greyCement: PotVariant(
              image: 'assets/images/plants/beginner_circle_grey.png',
            ),
            PotColor.crestBlue: PotVariant(
              image: 'assets/images/plants/beginner_circle_crest_blue.png',
            ),
          },
        ),
      ],
    },
    isFavorite: false,
  ),
  GroupPlant(
    name: 'Bird Paradise',
    description:
        """This near-unkillable duo is perfect for a beginner plant parent. The ZZ Plant & Snake Plant are tolerant to lower light levels and can even go over a month without being watered.
Both plants are active and release oxygen during the night, making them the perfect bedroom companion, and sleep-aid.
→ Both plants measure ~40cm tall from the bottom of planter to the top of the foliage
Note: Each plant is unique in shape and size; all measurements fluctuate in range by ~5cm""",
    rating: 3,
    pots: {
      PotType.circle: [
        Pot(
          height: '40 cm',
          price: 249,
          variants: {
            PotColor.white: PotVariant(
              image: 'assets/images/plants/beginner_circle_white.png',
            ),
            PotColor.greyCement: PotVariant(
              image: 'assets/images/plants/beginner_circle_grey.png',
            ),
            PotColor.crestBlue: PotVariant(
              image: 'assets/images/plants/beginner_circle_crest_blue.png',
            ),
          },
        ),
      ],
    },
    isFavorite: false,
  ),
];

List<Address> listAddress = [
  Address(
    id: 1,
    title: 'Home',
    address: '4517 Washington Ave. Manchester, Kentucky 39495',
  ),
  Address(
    id: 2,
    title: 'Office',
    address: '21 Ramkrishna Road, Kolkata, West Bengal 700054',
  ),
  Address(
    id: 3,
    title: 'Other',
    address: '2979 Twin Willow Lane, Delaware, Pennsylvania 19804',
  ),
];

List<Card> cards = [
  Card(
    id: 1,
    cardNumber: '5555 5555 5555 1234',
    type: CardType.mastercard,
  ),
  Card(
    id: 2,
    cardNumber: '5555 5555 5555 4321',
    type: CardType.visa,
  ),
];
