import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_truck_app/core/app/app.dart';
import 'package:smart_truck_app/features/registration/presentation/controller/registration_draft_notifier.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // ChangeNotifierProvider(
  // create: (_) => RegistrationDraftNotifier(),
  // child: MyApp(),
  // );
  runApp(
    ChangeNotifierProvider(
      create: (_) => RegistrationDraftNotifier(),
      child: MyApp(),
    ),
  );
}

// MyApp()
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         useMaterial3: true,
//         colorSchemeSeed: Colors.blue,
//       ),
//       home: const ReviewsAndRatingsPage(),
//     );
//   }
// }

// class ReviewsAndRatingsPage extends StatelessWidget {
//   const ReviewsAndRatingsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const BackButton(),
//         title: const Text('Reviews and Ratings'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             _RatingSummaryCard(),
//             const SizedBox(height: 16),
//             _HeaderRow(),
//             const SizedBox(height: 12),
//             const Expanded(child: _ReviewsList()),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /* ---------------------- Rating Summary ---------------------- */

// class _RatingSummaryCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 0,
//       color: Theme.of(context).colorScheme.surfaceVariant,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Row(
//           children: [
//             Column(
//               children: [
//                 Text(
//                   '4.8',
//                   style: Theme.of(context)
//                       .textTheme
//                       .displaySmall
//                       ?.copyWith(fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 4),
//                 _StarRow(rating: 5),
//                 const SizedBox(height: 4),
//                 Text(
//                   '120 Reviews',
//                   style: Theme.of(context).textTheme.labelMedium,
//                 ),
//               ],
//             ),
//             const SizedBox(width: 16),
//             const Expanded(child: _RatingBars()),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /* ---------------------- Rating Bars ---------------------- */

// class _RatingBars extends StatelessWidget {
//   const _RatingBars();

//   @override
//   Widget build(BuildContext context) {
//     final data = {
//       5: 0.75,
//       4: 0.15,
//       3: 0.07,
//       2: 0.02,
//       1: 0.01,
//     };

//     return Column(
//       children: data.entries.map((e) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 4),
//           child: Row(
//             children: [
//               Text(e.key.toString()),
//               const SizedBox(width: 8),
//               Expanded(
//                 child: LinearProgressIndicator(
//                   value: e.value,
//                   minHeight: 6,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ],
//           ),
//         );
//       }).toList(),
//     );
//   }
// }

// /* ---------------------- Header ---------------------- */

// class _HeaderRow extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           'All Reviews',
//           style: Theme.of(context).textTheme.titleMedium,
//         ),
//         TextButton.icon(
//           onPressed: () {},
//           icon: const Icon(Icons.sort, size: 18),
//           label: const Text('Most Recent'),
//         ),
//       ],
//     );
//   }
// }

// /* ---------------------- Reviews List ---------------------- */

// class _ReviewsList extends StatelessWidget {
//   const _ReviewsList();

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       itemCount: reviews.length,
//       separatorBuilder: (_, __) => const SizedBox(height: 12),
//       itemBuilder: (context, index) {
//         return _ReviewTile(review: reviews[index]);
//       },
//     );
//   }
// }

// /* ---------------------- Review Tile ---------------------- */

// class _ReviewTile extends StatelessWidget {
//   final Review review;

//   const _ReviewTile({required this.review});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//         side: BorderSide(
//           color: Theme.of(context).colorScheme.outlineVariant,
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 CircleAvatar(
//                   backgroundColor:
//                       Theme.of(context).colorScheme.primaryContainer,
//                   child: Text(review.initials),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         review.name,
//                         style: Theme.of(context).textTheme.titleSmall,
//                       ),
//                       Text(
//                         review.time,
//                         style: Theme.of(context).textTheme.labelSmall,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Text(
//                       review.rating.toStringAsFixed(1),
//                       style: Theme.of(context).textTheme.labelLarge,
//                     ),
//                     _StarRow(rating: review.rating.round()),
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(height: 12),
//             Text(
//               review.comment,
//               style: Theme.of(context).textTheme.bodyMedium,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /* ---------------------- Star Row ---------------------- */

// class _StarRow extends StatelessWidget {
//   final int rating;

//   const _StarRow({required this.rating});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: List.generate(5, (index) {
//         return Icon(
//           index < rating ? Icons.star : Icons.star_border,
//           color: Colors.amber,
//           size: 18,
//         );
//       }),
//     );
//   }
// }

// /* ---------------------- Model & Mock Data ---------------------- */

// class Review {
//   final String name;
//   final String time;
//   final double rating;
//   final String comment;

//   Review({
//     required this.name,
//     required this.time,
//     required this.rating,
//     required this.comment,
//   });

//   String get initials =>
//       name.split(' ').map((e) => e[0]).take(2).join();
// }

// final reviews = [
//   Review(
//     name: 'Mike R.',
//     time: '2 days ago',
//     rating: 5.0,
//     comment:
//         'John was fantastic! He arrived early for pickup and the goods were delivered in perfect condition.',
//   ),
//   Review(
//     name: 'Sarah Jenkins',
//     time: '1 week ago',
//     rating: 5.0,
//     comment:
//         'Very professional service. The truck was clean and the driver helped with securing the load.',
//   ),
//   Review(
//     name: 'David Lee',
//     time: '3 weeks ago',
//     rating: 4.0,
//     comment:
//         'Good communication throughout the trip. Arrived slightly later than estimated.',
//   ),
//   Review(
//     name: 'Alex Martinez',
//     time: '1 month ago',
//     rating: 5.0,
//     comment:
//         'Best freight experience I’ve had in a while. The service was excellent.',
//   ),
//   Review(
//     name: 'Elena T.',
//     time: '2 months ago',
//     rating: 5.0,
//     comment: 'Smooth transaction. Highly recommended!',
//   ),
// ];
