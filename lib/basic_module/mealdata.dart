class Meal {
  final int id;
  final String title;
  final double price;
  final String description;
  final List<String> images;

  Meal(this.id, this.title, this.price, this.description, this.images);
}

List<Meal> khmerMealList = [
  Meal(
    101,
    "ឆាក្តៅ",
    3.5,
    "។ គ្រឿងផ្សំសំខាន់ៗរួមមាន សាច់ (មាន់ គោ ជ្រូក ឬទា) គល់ស្លឹកគ្រៃ ស្លឹកក្រូចសើច ម្ទេស ខ្ទឹមស និងជីម្រះព្រៅ។ គេច្រើននិយមញ៉ាំជាមួយបាយសក្តិសមបំផុត។",
    [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIw_Sr6VOaKI0LfMxU6t2xtK9Xmq6Q-KsTz1_qCFIXXtrAunkfZ2gefgGO&s=10",
      "https://s9.kh1.co/4a/4a00f7f022977efa4aee26726ac41ace0bca0fc2.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrd4_CUAJs8oaQRFnepRUOzzArM9eGSLxjsDqqeQLZ5yRJmVOdNzQ9xCLi&s=10",
    ],
  ),
  Meal(
    102,
    "គោឡើងភ្នំ",
    7,
    "គោឡើងភ្នំ គឺជាឈ្មោះមុខម្ហូបដ៏ពេញនិយមមួយប្រភេទនៅក្នុងប្រទេសកម្ពុជា ដែលមានលក្ខណៈស្រដៀងនឹងសាច់គោអាំង ឬការបរិភោគបبرាជ័យបែបជប់លៀងជាមួយគ្រួសារ និងមិត្តភក្តិ។",
    [
      "https://i.ytimg.com/vi/_12mKQnk4ik/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLDLMiOV2ejY7j_MbsqLmXhUd-tR-Q",
      "https://i.ytimg.com/vi/ZNw53o5rnGs/maxresdefault.jpg",
    ],
  ),
  Meal(
    103,
    "ទឹកគ្រឿងពិសេស",
    4,
    "ទឹកគ្រឿង គឺជាម្ហូបខ្មែរដ៏ពេញនិយម មានរសជាតិឆ្ងាញ់ ប្រៃ ផ្អែម ជូរ ហឹរ និយមទទួលទានជាមួយបន្លែស្រស់ ឬបន្លែស្ងោរ និងត្រីឆ្អិន។",
    [
      "https://i.ytimg.com/vi/FcMGJGvOBcI/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLBH7iEZ059SQ8otKVvXhqNjOWNcdA",
      "https://kohsantepheap.tv/wp-content/uploads/2020/05/27749905_562603540766366_5281293467083015458_n.jpg",
    ],
  ),
  Meal(
    104,
    "សាច់គោអាំងទឹកប្រហុក",
    5,
    "សាច់គោអាំងទឹកប្រហុក ជាម្ហូបខ្មែរដ៏ពេញនិយម និងមានរសជាតិឆ្ងាញ់ខ្លាំង។ សាច់គោជាប់ខ្លាញ់បន្តិចត្រូវបានប្រឡាក់ និងអាំងរហូតដល់ឆ្អិនល្មម ញ៉ាំផ្ទាល់ជាមួយទឹកប្រហុកខ្មែររស់ជាតិដិត និងបន្លែស្រស់ៗ។",
    [
      "https://i.ytimg.com/vi/TP5Tp2PviKg/maxresdefault.jpg",
      "https://images.deliveryhero.io/image/fd-kh/LH/ce8m-listing.jpg?width=512&height=384&quality=45",
    ],
  ),
  Meal(
    105,
    "ឆាឆ្អឹងជំនីជូរអែម",
    4,
    "ឆាឆ្អឹងជំនីជូរអែម គឺជាមុខម្ហូបដ៏ពេញនិយម និងមានរសជាតិឆ្ងាញ់ជូរអែមស៊ីសង្វាក់គ្នា។ គ្រឿងផ្សំចម្បងមាន ឆ្អឹងជំនីជ្រូក ទឹកប៉េងប៉ោះ ទឹកត្រី ស្ករស ខ្ទឹមស ខ្ទឹមបារាំង ម្រេច និងបន្លែដូចជា ប៉េងប៉ោះ និងត្រសក់ ឬម្នាស់",
    [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgpiNyLY39N1hDRYx2_K9OWBzhy1__dhmnSg&s",
      "https://i.ytimg.com/vi/Ff9o9n6hidA/maxresdefault.jpg",
    ],
  ),
];