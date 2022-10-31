import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigation_bar/drawer_item.dart';
import 'package:navigation_bar/drawer_items.dart';
import 'package:navigation_bar/main.dart';
import 'package:navigation_bar/navigation_provider.dart';
import 'package:navigation_bar/page/setting_page.dart';
import 'package:navigation_bar/page/status_page.dart';
import 'package:navigation_bar/page/user_page.dart';
import 'package:provider/provider.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);
  final padding = const EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<NavigationProvider>(context);
    final isCollapsed = provider.isCollapsed;
    final safeArea = EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top);

    return Container(
      width: isCollapsed ? MediaQuery.of(context).size.width * 0.2 : null,
      child: Drawer(
        child: Container(
          color: const Color(0xFF81B700),
          child: Column( 
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 24).add(safeArea),
                width: double.infinity,
                color: const Color(0xFF152A32),
                child: buildHeader(isCollapsed),
              ),
              buildList(items: itemsFirst, isCollapsed: isCollapsed),
              Spacer(),
              buildCollapseIcon(context, isCollapsed),
              SizedBox(height: 12),
            ]
          ),
        ),
      ),
    );
  }

  Widget buildList({
    required bool isCollapsed,
    required List<DrawerItem> items,
  }) =>
    ListView.separated(
      padding: isCollapsed ? EdgeInsets.zero : padding,
      shrinkWrap: true,
      primary: false,
      itemCount: items.length,
      separatorBuilder: (context, index) => SizedBox(height: 16,),
      itemBuilder: (context, index) {
        final item = items[index];

        return buildMenuItem(
          isCollapsed: isCollapsed,
          text: item.title,
          icon: item.icon,
          onClicked: () => selectItem(context, index),
        );
      }, 
    );

  void selectItem(BuildContext context, int index){
    final navigateTo = (page) => Navigator.of(context).push(MaterialPageRoute(builder: (context) => page,));
    
    switch (index){
      case 0:
      navigateTo(MyApp());
        break;
      case 1:
      navigateTo(UserPage());
        break;
      case 2:
      navigateTo(StatusPage());
        break;
      case 3:
      navigateTo(SettingPage());
        break;
    }
  }
  
  
  Widget buildMenuItem({
    required bool isCollapsed,
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.black;
    final leading = Icon(icon, color: color);

    return Material(
      color: Colors.transparent,
      child: isCollapsed
      ? ListTile(
          title: leading,
          onTap: onClicked,
        )
      : ListTile(
          leading: leading,
          title: Text(text, style: TextStyle(color: Colors.black, fontSize: 16),),
          onTap: onClicked,
        ),
    );
  }

  Widget buildHeader(bool isCollapsed) => isCollapsed
  ? FlutterLogo(size: 48,)
  : Row(
    children: [
      SizedBox(width: 24,),
      FlutterLogo(size: 48,),
      SizedBox(width: 20,),
      Text(
        'E-Kalakal Admin',
          style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 20 ,color: Colors.white)),
        ),
    ],
  );

  Widget buildCollapseIcon(BuildContext context, bool isCollapsed){
    final double size = 52;
    final icon = isCollapsed ? Icons.arrow_forward_ios_rounded : Icons.arrow_back_ios_rounded;
    final alignment = isCollapsed ? Alignment.center : Alignment.centerRight;
    final margin = isCollapsed ? null : EdgeInsets.only(right: 16);
    final width = isCollapsed ? double.infinity : size;
    return Container(
      alignment: alignment,
      margin: margin,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: Container(
            width: width,
            height: size,
            child: Icon(icon, color: const Color(0xFF152A32),),
          ),
          onTap: (){
            final provider = Provider.of<NavigationProvider>(context, listen: false);
            provider.toggleIsCollapsed();
          },
        ),
      ),
    );


  }




}

