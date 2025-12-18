// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// abstract class LocalDataSource {
//   // Future<void> cacheLoginData(LoginData loginData);
//   // Future<LoginData?> getLoginData();

//   // Future<void> cacheCategories(List<Category> categories);
//   // Future<Categories?> getCategories();
// }

// class LocalDataSourceImplementor implements LocalDataSource {
//   static final LocalDataSourceImplementor _instance =
//       LocalDataSourceImplementor._internal();
//   Database? _database;

//   factory LocalDataSourceImplementor() {
//     return _instance;
//   }

//   LocalDataSourceImplementor._internal();

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future<Database> _initDatabase() async {
//     final dbPath = await getDatabasesPath();
//     return openDatabase(
//       join(dbPath, 'lists.db'),
//       onCreate: (db, version) async {
//         await db.execute('''CREATE TABLE categories(
//           id TEXT PRIMARY KEY,
//           title TEXT,
//           description TEXT,
//           package TEXT,
//           createdAt TEXT,
//           updatedAt TEXT,
//           v INTEGER
//         )''');

//       },
//       version: 1,
//     );
//   }

// // // Caching categories
// //   @override
// //   Future<void> cacheCategories(List<Category> categories) async {
// //     final db = await database;
// //     await db.delete('categories'); // Clear old data

// //     for (var category in categories) {
// //       await db.insert(
// //         'categories',
// //         {
// //           'id': category.id,
// //           'title': category.title,
// //           'description': category.description,
// //           'createdAt': category.createdAt,
// //           'updatedAt': category.updatedAt,
// //           'v': category.v,
// //         },
// //         conflictAlgorithm: ConflictAlgorithm.replace,
// //       );

// //       // Store each package within this category in a separate table if needed
     
// //     }
// //   }

// //   @override
// //   Future<Categories?> getCategories() async {
// //     final db = await database;
// //     final result = await db.query('categories');

// //     if (result.isEmpty) return null;

// //     List<Category> categories = [];
// //     for (var item in result) {
// //       // Fetch packages related to this category
    
// //       categories.add(Category(
// //         item['createdAt'] as String?,
// //         item['id'] as String?,
// //         item['description'] as String?,
// //         item['image'] as String?,
// //         item['updatedAt'] as String?,
// //         item['v'] as int?,
// //         item['title'] as String?,
// //       ));
// //     }

// //     return Categories(categories); // Wrap the list in a Categories instance
// //   }

// }
