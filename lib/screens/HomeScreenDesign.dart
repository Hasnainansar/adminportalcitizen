// import 'package:flutter/material.dart';
//
// import 'package:flutter_sidebar/flutter_sidebar.dart';
//
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage>
//     with SingleTickerProviderStateMixin {
//   static const _mobileThreshold = 700.0;
//   bool isMobile = false;
//   bool sidebarOpen = false;
//   bool canBeDragged = false;
//
//   GlobalKey _sidebarKey;
//
//   AnimationController _animationController;
//   Animation _animation;
//
//   final List<Map<String, dynamic>> tabData = [
//     {
//       'title': 'Chapter A',
//     },
//     {
//       'title': 'Chapter B',
//     },
//     {
//       'title': 'Chapter C',
//     },
//     {
//       'title': 'Chapter D',
//     },
//   ];
//   String tab;
//   void setTab(String newTab) {
//     setState(() {
//       tab = newTab;
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _sidebarKey = GlobalKey();
//
//     _animationController =
//         AnimationController(vsync: this, duration: Duration(milliseconds: 300));
//     _animation = CurvedAnimation(
//         parent: _animationController, curve: Curves.easeInOutQuad);
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     final mediaQuery = MediaQuery.of(context);
//     setState(() {
//       isMobile = mediaQuery.size.width < _mobileThreshold;
//       sidebarOpen = !isMobile;
//       _animationController.value = isMobile ? 0 : 1;
//     });
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   void _toggleSidebar() {
//     setState(() {
//       sidebarOpen = !sidebarOpen;
//       if (sidebarOpen)
//         _animationController.forward();
//       else
//         _animationController.reverse();
//     });
//   }
//
//   void onDragStart(DragStartDetails details) {
//     bool isClosed = _animationController.isDismissed;
//     bool isOpen = _animationController.isCompleted;
//     canBeDragged = (isClosed && details.globalPosition.dx < 60) || isOpen;
//   }
//
//   void onDragUpdate(DragUpdateDetails details) {
//     if (canBeDragged) {
//       double delta = details.primaryDelta / 300;
//       _animationController.value += delta;
//     }
//   }
//
//   void dragCloseDrawer(DragUpdateDetails details) {
//     double delta = details.primaryDelta;
//     if (delta < 0) {
//       sidebarOpen = false;
//       _animationController.reverse();
//     }
//   }
//
//   void onDragEnd(DragEndDetails details) async {
//     double _kMinFlingVelocity = 365.0;
//
//     if (details.velocity.pixelsPerSecond.dx.abs() >= _kMinFlingVelocity) {
//       double visualVelocity = details.velocity.pixelsPerSecond.dx / 300;
//
//       await _animationController.fling(velocity: visualVelocity);
//       if (_animationController.isCompleted) {
//         setState(() {
//           sidebarOpen = true;
//         });
//       } else {
//         setState(() {
//           sidebarOpen = false;
//         });
//       }
//     } else {
//       if (_animationController.value < 0.5) {
//         _animationController.reverse();
//         setState(() {
//           sidebarOpen = false;
//         });
//       } else {
//         _animationController.forward();
//         setState(() {
//           sidebarOpen = true;
//         });
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     const _textStyle = TextStyle(fontSize: 26);
//     final sidebar = Sidebar.fromJson(
//       key: _sidebarKey,
//       tabs: tabData,
//       onTabChanged: setTab,
//     );
//     final mainContent = Center(
//       child: tab != null
//           ? Text.rich(
//         TextSpan(
//           text: 'Selected tab: ',
//           style: _textStyle,
//           children: [
//             TextSpan(
//               text: '$tab',
//               style: _textStyle.copyWith(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       )
//           : Text(
//         'No tab selected',
//         style: _textStyle,
//       ),
//     );
//
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(icon: Icon(Icons.menu), onPressed: _toggleSidebar),
//         title: Text('Flutter Sidebar'),
//       ),
//       body: AnimatedBuilder(
//         animation: _animation,
//         builder: (_, __) => isMobile
//             ? Stack(
//           children: [
//             GestureDetector(
//               onHorizontalDragStart: onDragStart,
//               onHorizontalDragUpdate: onDragUpdate,
//               onHorizontalDragEnd: onDragEnd,
//             ),
//             mainContent,
//             if (_animation.value > 0)
//               Container(
//                 color: Colors.black
//                     .withAlpha((150 * _animation.value).toInt()),
//               ),
//             if (_animation.value == 1)
//               GestureDetector(
//                 onTap: _toggleSidebar,
//                 onHorizontalDragUpdate: dragCloseDrawer,
//               ),
//             ClipRect(
//               child: SizedOverflowBox(
//                 size: Size(300 * _animation.value, double.infinity),
//                 child: sidebar,
//               ),
//             ),
//           ],
//         )
//             : Row(
//           children: [
//             ClipRect(
//               child: SizedOverflowBox(
//                 size: Size(300 * _animation.value, double.infinity),
//                 child: sidebar,
//               ),
//             ),
//             Expanded(child: mainContent),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
//
// import 'HomeScreen.dart';
// import 'newComplain.dart';
//
//
//
// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key key}) : super(key: key);
//
//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }
//
// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   int _selectedIndex = 0;
//   static const TextStyle optionStyle =
//   TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//   static const List<Widget> _widgetOptions = <Widget>[
//     Homepage(),
//     Text(
//       'Index 1: Business',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 2: School',
//       style: optionStyle,
//     ),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('BottomNavigationBar Sample'),
//
//       ),
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//        drawer: Drawer(
//           // Add a ListView to the drawer. This ensures the user can scroll
//           // through the options in the drawer if there isn't enough vertical
//           // space to fit everything.
//
//           child: ListView(
//             // Important: Remove any padding from the ListView.
//             padding: EdgeInsets.zero,
//             children: [
//               const DrawerHeader(
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                 ),
//                 child: Text('Drawer Header'),
//               ),
//               ListTile(
//                   leading: Icon(Icons.home),
//                 onTap: () {
//                   // Update the state of the app.
//                   // ...
//                   Homepage();
//
//                   // _onItemTapped;
//                   // _selectedIndex;
//                 },
//               ),
//               ListTile(
//                leading:  Icon(Icons.business),
//                 onTap: () {
//                   // Update the state of the app.
//                   // ...
//                   complain();
//                 },
//               ),  ListTile(
//                leading:  Icon(Icons.school),
//                 onTap: () {
//                   // Update the state of the app.
//                   // ...
//                   Homepage();
//
//                 },
//               ),
//             ],
//           ),
//         ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.business),
//             label: 'Business',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.school),
//             label: 'School',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.amber[800],
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
//
//
// import 'package:flutter/material.dart';
// import 'package:side_navigation/side_navigation.dart';
//
//
// class MainView extends StatefulWidget {
//   const MainView({Key key}) : super(key: key);
//
//   @override
//   _MainViewState createState() => _MainViewState();
// }
//
// class _MainViewState extends State<MainView> {
//   /// Views to display
//   List<Widget> views = const [
//     Center(
//       child: Text('Dashboard'),
//     ),
//     Center(
//       child: Text('Account'),
//     ),
//     Center(
//       child: Text('Settings'),
//     ),
//   ];
//
//   /// The currently selected index of the bar
//   int selectedIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       /// You can use an AppBar if you want to
//       //appBar: AppBar(
//       //  title: const Text('App'),
//       //),
//
//       // The row is needed to display the current view
//       body: Row(
//         children: [
//           /// Pretty similar to the BottomNavigationBar!
//           SideNavigationBar(
//             selectedIndex: selectedIndex,
//             items: const [
//               SideNavigationBarItem(
//                 icon: Icons.dashboard,
//                 label: 'Dashboard',
//               ),
//               SideNavigationBarItem(
//                 icon: Icons.person,
//                 label: 'Account',
//               ),
//               SideNavigationBarItem(
//                 icon: Icons.settings,
//                 label: 'Settings',
//               ),
//             ],
//             onTap: (index) {
//               setState(() {
//                 selectedIndex = index;
//               });
//             },
//           ),
//
//           /// Make it take the rest of the available width
//           Expanded(
//             child: views.elementAt(selectedIndex),
//           )
//         ],
//       ),
//     );
//   }
//}