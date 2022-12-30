import 'package:admin_dash/src/constant/color.dart';
import 'package:admin_dash/src/constant/icons.dart';
import 'package:admin_dash/src/constant/image.dart';
import 'package:admin_dash/src/constant/string.dart';
import 'package:admin_dash/src/constant/theme.dart';
import 'package:admin_dash/src/provider/theme/bloc/theme_mode_bloc.dart';
import 'package:admin_dash/src/routes/routes.gr.dart';
import 'package:admin_dash/src/utils/hive/hive.dart';
import 'package:admin_dash/src/utils/hover.dart';
import 'package:admin_dash/src/utils/responsive.dart';
import 'package:admin_dash/src/utils/text_utils.dart';
import 'package:admin_dash/src/widget/alert.dart';
import 'package:admin_dash/src/widget/button.dart';
import 'package:admin_dash/src/widget/expantion_tile.dart';
import 'package:admin_dash/src/widget/svg_icon.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterx/flutterx.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuBar extends StatefulWidget {
  const MenuBar({Key? key}) : super(key: key);

  @override
  State<MenuBar> createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldDrawerKey =
      GlobalKey<ScaffoldState>();

  final ScrollController _scrollController = ScrollController();

  ValueNotifier<bool> isOpen = ValueNotifier(true);

  Map<String, String> mainData = {
    Strings.dashboard: IconlyBroken.home,
    Strings.calendar: IconlyBroken.calendar,
    Strings.map: IconlyBroken.map,
  };

  Map<String, String> componentData = {
    Strings.uiElements: IconlyBroken.box,
    Strings.forms: IconlyBroken.forms,
    Strings.charts: IconlyBroken.charts,
    Strings.tables: IconlyBroken.tables,
  };

  Map<String, String> extrasData = {
    Strings.authentication: IconlyBroken.archive,
    Strings.emailTemplates: IconlyBroken.emailTemplate,
    Strings.extraPages: IconlyBroken.extraPages,
  };

  List<List<String>> componentsExpandList = [
    [
      Strings.toast,
      Strings.buttons,
      Strings.rating,
      Strings.badge,
      Strings.alertDialog,
      Strings.modal,
      Strings.loader,
      Strings.tabs,
      Strings.carousel,
      Strings.videoPlayer,
    ],
    [
      Strings.formElements,
      Strings.formValidation,
      Strings.formFileUpload,
      Strings.formRepeater,
      Strings.formWizard,
      Strings.formMask,
    ],
    [Strings.morrisChart, Strings.chartistChart, Strings.chartJsChart],
    [
      Strings.basicTable,
      Strings.dataTable,
      Strings.responsiveTable,
      Strings.editableTable,
    ],
  ];

  List<List<String>> extrasExpandList = [
    [
      Strings.loginOne,
      Strings.loginTwo,
      Strings.registerOne,
      Strings.registerTwo,
      Strings.recoverPasswordOne,
      Strings.recoverPasswordTwo,
      Strings.lockScreenOne,
      Strings.lockScreenTwo,
    ],
    [
      Strings.basicActionEmail,
      Strings.alertEmail,
      Strings.billingEmail,
    ],
    [
      Strings.timeline,
      Strings.invoice,
      Strings.directory,
      Strings.error404,
      Strings.error500,
      Strings.pricing,
      Strings.gallery,
      Strings.maintenence,
      Strings.comingSoon,
      Strings.faqs,
    ],
  ];

  final List<String> _items = [
    Strings.profile,
    Strings.settings,
    Strings.lockScreen,
  ];

  final List<String> _notificationTitle = [
    'Your order is shipped',
    'your accound have verified',
    'New Notification arrived',
  ];

  final List<String> _notificationSubtitle = [
    'Please share your experience with us',
    'Congratulation  👏🏻',
    'Hey!, How are you?',
  ];

  final List<PageRouteInfo<dynamic>> _routes = const [
    Dashboard(),
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: _routes,
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          key: _scaffoldKey,
          appBar: _appBar(tabsRouter),
          body: SafeArea(
            child: Scaffold(
              key: _scaffoldDrawerKey,
              drawerScrimColor: ColorConst.transparent,
              drawer: _sidebar(tabsRouter),
              body: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ValueListenableBuilder<bool>(
                    valueListenable: isOpen,
                    builder: (context, value, child) {
                      return Responsive.isWeb(context)
                          ? _sidebar(tabsRouter)
                          : const SizedBox.shrink();
                    },
                  ),
                  Expanded(
                    child: SelectionArea(
                      child: CustomScrollView(
                        controller: _scrollController,
                        slivers: [
                          SliverList(
                            delegate: SliverChildListDelegate(
                              [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FxBox.h20,
                                      Text(
                                        upperCase(tabsRouter.currentPath),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      FxBox.h8,
                                      _routesDeatils(tabsRouter),
                                      FxBox.h20,
                                      child,
                                      FxBox.h20,
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SliverFillRemaining(
                            hasScrollBody: false,
                            fillOverscroll: true,
                            child: Column(
                              children: <Widget>[
                                const Expanded(
                                  child: SizedBox.shrink(),
                                ),
                                _footer(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// appbar
  PreferredSizeWidget _appBar(TabsRouter tabsRouter) => AppBar(
        toolbarHeight: 70,
        elevation: 0.0,
        shadowColor: ColorConst.transparent,
        leadingWidth: 392,
        leading: Row(
          children: [
            ValueListenableBuilder<bool>(
              valueListenable: isOpen,
              builder: (context, value, child) {
                if (Responsive.isWeb(context) && value) {
                  _scaffoldDrawerKey.currentState!.closeDrawer();
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      width: 240,
                      padding: const EdgeInsets.symmetric(horizontal: 61),
                      height: double.infinity,
                      color: ColorConst.transparent,
                      child: Image.asset(
                          isDark ? Images.lgDarkLogo : Images.lgLightLogo),
                    ),
                  );
                }
                return InkWell(
                  onTap: () {
                    _scaffoldDrawerKey.currentState?.closeDrawer();
                  },
                  child: Container(
                    width: 70,
                    height: double.infinity,
                    color:
                        isDark ? ColorConst.transparent : ColorConst.drawerBG,
                    child: Image.asset(
                      Images.smLogo,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            ),
            MaterialButton(
              height: double.infinity,
              minWidth: 60,
              hoverColor: ColorConst.transparent,
              onPressed: () async {
                if (Responsive.isMobile(context) ||
                    Responsive.isTablet(context)) {
                  if (_scaffoldDrawerKey.currentState!.isDrawerOpen) {
                    _scaffoldDrawerKey.currentState!.closeDrawer();
                  } else {
                    _scaffoldDrawerKey.currentState!.openDrawer();
                  }
                } else if (Responsive.isWeb(context)) {
                  _scaffoldDrawerKey.currentState!.closeDrawer();
                  isOpen.value = !isOpen.value;
                }
              },
              child: const SvgIcon(icon: IconlyBroken.drawer),
            )
          ],
        ),
        actions: [
          Responsive.isMobile(context) || Responsive.isTablet(context)
              ? MaterialButton(
                  height: double.infinity,
                  minWidth: 60,
                  hoverColor: ColorConst.transparent,
                  onPressed: () {},
                  child: const SvgIcon(icon: IconlyBroken.search),
                )
              : Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  width: 180,
                  height: 48,
                  child: TextField(
                    cursorWidth: 1,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hoverColor: ColorConst.transparent,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      contentPadding: const EdgeInsets.fromLTRB(12, 10, 0, 4),
                      hintText: Strings.searchHint,
                      hintStyle: const TextStyle(fontSize: 15),
                      suffixIcon: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: SvgIcon(icon: IconlyBroken.search),
                      ),
                      // fillColor: ColorConst.textFieldBG,
                      isCollapsed: true,
                    ),
                  ),
                ),
          _notification(),
          BlocBuilder<ThemeModeBloc, ThemeModeState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        HiveUtils.set(HiveKeys.themeMode, !isDark);
                        themeModeBloc.add(ThemeModeEvent.changeTheme(!isDark));
                      },
                      icon: Icon(
                        isDark
                            ? Icons.light_mode_outlined
                            : Icons.dark_mode_outlined,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          _profile(tabsRouter),
        ],
      );

  Widget _notification() {
    return FxDropdownButton(
      focusColor: Colors.transparent,
      underline: FxBox.shrink,
      customButton: const MaterialButton(
        height: double.infinity,
        minWidth: 60,
        hoverColor: ColorConst.transparent,
        onPressed: null,
        child: SvgIcon(icon: IconlyBroken.notification),
      ),
      customItemsIndexes: const [1],
      customItemsHeight: 0,
      onChanged: (value) {},
      dropdownWidth: 298,
      dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
      dropdownDecoration: BoxDecoration(
        color: isDark ? ColorConst.cardDark : Colors.white,
        border: Border.all(
          color: isDark
              ? ColorConst.lightGrey.withOpacity(0.1)
              : ColorConst.lightGrey.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      scrollbarAlwaysShow: false,
      dropdownElevation: 0,
      offset: const Offset(-246, 0),
      itemHeight: 352,
      items: [
        DropdownMenuItem(
          alignment: AlignmentDirectional.topStart,
          value: '',
          child: SizedBox(
            height: 344,
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                controller: ScrollController(),
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
                      child: Text(
                        '${Strings.notifications} (258)',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    FxBox.h8,
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _notificationTitle.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            title: Text(
                              _notificationTitle[index],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              _notificationSubtitle[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .color!
                                        .withOpacity(0.5),
                                  ),
                            ),
                          );
                        },
                      ),
                    ),
                    const Divider(color: ColorConst.lightGrey, height: 8.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          Strings.viewAll,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _profile(TabsRouter tabsRouter) {
    return FxDropdownButton(
      focusColor: Colors.transparent,
      underline: FxBox.shrink,
      customButton: const MaterialButton(
        height: double.infinity,
        minWidth: 60,
        hoverColor: ColorConst.transparent,
        onPressed: null,
        child: CircleAvatar(
          maxRadius: 16,
          backgroundImage: AssetImage(Images.profileImage),
        ),
      ),
      customItemsIndexes: const [3],
      customItemsHeight: 8,
      onChanged: (value) {
        if (value == 'Profile') {
          _scaffoldDrawerKey.currentState?.closeDrawer();
        }
      },
      items: [
        ..._items.map(
          (e) => DropdownMenuItem(
            value: e,
            child: Text(
              e,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        const DropdownMenuItem<Divider>(
          enabled: false,
          child: Divider(color: ColorConst.lightGrey),
        ),
        const DropdownMenuItem(
          value: 'Logout',
          child: Text(
            Strings.logout,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
      itemHeight: 48,
      itemPadding: const EdgeInsets.only(left: 16, right: 16),
      dropdownWidth: 160,
      dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
      dropdownDecoration: BoxDecoration(
        color: isDark ? ColorConst.cardDark : Colors.white,
        border: Border.all(
          color: isDark
              ? ColorConst.lightGrey.withOpacity(0.1)
              : ColorConst.lightGrey.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      dropdownElevation: 0,
      offset: const Offset(-108, 0),
    );
  }

  /// drawer / sidebar
  Widget _sidebar(TabsRouter tabsRouter) => ValueListenableBuilder<bool>(
        valueListenable: isOpen,
        builder: (context, value, child) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: value ? 240 : 70,
            color: isDark ? ColorConst.transparent : ColorConst.drawerBG,
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxBox.h8,
                  // main
                  _menuList(
                    tabsRouter: tabsRouter,
                    items: mainData,
                    isopen: value,
                  ),
                  // components
                  _menuList(
                    tabsRouter: tabsRouter,
                    items: componentData,
                    isExpanded: true,
                    children: componentsExpandList,
                    isopen: value,
                  ),
                  // extras
                  _menuList(
                    tabsRouter: tabsRouter,
                    items: extrasData,
                    isExpanded: true,
                    children: extrasExpandList,
                    isopen: value,
                  ),
                  FxBox.h20,
                ],
              ),
            ),
          );
        },
      );

  /// menu list
  Widget _menuList({
    required TabsRouter tabsRouter,
    required Map<String, String> items,
    bool isExpanded = false,
    List<List<String>> children = const [],
    required bool isopen,
  }) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) => FxHover(
        builder: (isHover) {
          Color color = isHover
              ? isDark
                  ? ColorConst.chartForgoundColor
                  : ColorConst.primary
              : isDark
                  ? ColorConst.white
                  : ColorConst.black;
          if (isExpanded) {
            return isopen
                ? FxExpansionTile(
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FxBox.w(22.0),
                        SvgIcon(
                          icon: items.values.elementAt(index),
                          size: 16,
                          color: children[index]
                                  .contains(upperCase(tabsRouter.currentPath))
                              ? isDark
                                  ? ColorConst.chartForgoundColor
                                  : ColorConst.primary
                              : color,
                        ),
                        FxBox.w(24.0),
                      ],
                    ),
                    title: Text(
                      items.keys.elementAt(index),
                      style: TextStyle(
                          color: children[index]
                                  .contains(upperCase(tabsRouter.currentPath))
                              ? isDark
                                  ? ColorConst.chartForgoundColor
                                  : ColorConst.primary
                              : color,
                          fontSize: 15.7),
                    ),
                    trailing: SvgIcon(
                      icon: IconlyBroken.arrowDown,
                      size: 16,
                      color: children[index]
                              .contains(upperCase(tabsRouter.currentPath))
                          ? isDark
                              ? ColorConst.chartForgoundColor
                              : ColorConst.primary
                          : color,
                    ),
                    children: [_subMenuList(children[index], tabsRouter)],
                  )
                : ListTile(
                    leading: SvgIcon(
                      icon: items.values.elementAt(index),
                      size: isopen ? 16 : 18,
                      color: items.keys.elementAt(index) ==
                              upperCase(tabsRouter.currentPath)
                          ? isDark
                              ? ColorConst.chartForgoundColor
                              : ColorConst.primary
                          : color,
                    ),
                    title: isopen
                        ? Text(
                            items.keys.elementAt(index),
                            style: TextStyle(
                              color: items.keys.elementAt(index) ==
                                      upperCase(tabsRouter.currentPath)
                                  ? isDark
                                      ? ColorConst.chartForgoundColor
                                      : ColorConst.primary
                                  : color,
                              fontSize: 15.7,
                            ),
                          )
                        : null,
                    mouseCursor: SystemMouseCursors.click,
                    horizontalTitleGap: 0.0,
                    onTap: () {
                      isOpen.value = true;
                      _scaffoldDrawerKey.currentState?.closeDrawer();
                    },
                  );
          } else {
            return Row(
              children: [
                if (isopen)
                  Container(
                    width: 6.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                      color: items.keys.elementAt(index) ==
                              upperCase(tabsRouter.currentPath)
                          ? isDark
                              ? ColorConst.chartForgoundColor
                              : ColorConst.primary
                          : ColorConst.transparent,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(6.0),
                        bottomRight: Radius.circular(6.0),
                      ),
                    ),
                  ),
                if (isopen) FxBox.w16,
                Expanded(
                  child: ListTile(
                    leading: SvgIcon(
                      icon: items.values.elementAt(index),
                      size: isopen ? 16 : 18,
                      color: items.keys.elementAt(index) ==
                              upperCase(tabsRouter.currentPath)
                          ? isDark
                              ? ColorConst.chartForgoundColor
                              : ColorConst.primary
                          : color,
                    ),
                    title: isopen
                        ? Text(
                            items.keys.elementAt(index),
                            style: TextStyle(
                              color: items.keys.elementAt(index) ==
                                      upperCase(tabsRouter.currentPath)
                                  ? isDark
                                      ? ColorConst.chartForgoundColor
                                      : ColorConst.primary
                                  : color,
                              fontSize: 15.7,
                            ),
                          )
                        : null,
                    mouseCursor: SystemMouseCursors.click,
                    horizontalTitleGap: 0.0,
                    onTap: () {
                      isOpen.value = true;
                      FxAlert.showAlert(
                        context: context,
                        content:
                            'Find the full version of the Flutter Admin Dashboard at Code Caniyon',
                        actions: [
                          FxButton(
                            onPressed: () async {
                              if (await canLaunchUrl(Uri.parse(
                                  'https://codecanyon.net/item/flutter-admin-portal/42273274'))) {
                                await launchUrl(
                                  Uri.parse(
                                      'https://codecanyon.net/item/flutter-admin-portal/42273274'),
                                );
                              }
                            },
                            text: Strings.open,
                            fontSize: 24.0,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32.0, vertical: 16.0),
                          ),
                          FxButton(
                            onPressed: () => Navigator.pop(context),
                            text: Strings.cancle,
                            color: Theme.of(context).colorScheme.secondary,
                            hoverColor: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                            textColor: Theme.of(context).colorScheme.surface,
                            hoverTextColor:
                                Theme.of(context).colorScheme.surface,
                            fontSize: 24.0,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32.0, vertical: 16.0),
                          ),
                        ],
                      );
                      _scaffoldDrawerKey.currentState?.closeDrawer();
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  /// sub menu list
  Widget _subMenuList(List<String> items, TabsRouter tabsRouter) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => FxHover(
        builder: (isHover) {
          Color color = isHover
              ? isDark
                  ? ColorConst.chartForgoundColor
                  : ColorConst.primary
              : upperCase(tabsRouter.currentPath) == items[index]
                  ? isDark
                      ? ColorConst.chartForgoundColor
                      : ColorConst.primary
                  : isDark
                      ? ColorConst.white
                      : ColorConst.black;
          return Row(
            children: [
              Container(
                width: 6.0,
                height: 48.0,
                decoration: BoxDecoration(
                  color: upperCase(tabsRouter.currentPath) == items[index]
                      ? isDark
                          ? ColorConst.chartForgoundColor
                          : ColorConst.primary
                      : ColorConst.transparent,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(6.0),
                    bottomRight: Radius.circular(6.0),
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  dense: true,
                  visualDensity: const VisualDensity(vertical: -3),
                  mouseCursor: SystemMouseCursors.click,
                  contentPadding: const EdgeInsets.only(left: 52.0),
                  title: Text(
                    items[index],
                    style: TextStyle(color: color, fontSize: 15),
                  ),
                  onTap: () {
                    FxAlert.showAlert(
                      context: context,
                      content:
                          'Find the full version of the Flutter Admin Dashboard at Code Caniyon',
                      actions: [
                        FxButton(
                          onPressed: () async {
                            if (await canLaunchUrl(Uri.parse(
                                'https://codecanyon.net/item/flutter-admin-portal/42273274'))) {
                              await launchUrl(
                                Uri.parse(
                                    'https://codecanyon.net/item/flutter-admin-portal/42273274'),
                              );
                            }
                          },
                          text: Strings.open,
                          fontSize: 24.0,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 16.0),
                        ),
                        FxButton(
                          onPressed: () => Navigator.pop(context),
                          text: Strings.cancle,
                          color: Theme.of(context).colorScheme.secondary,
                          hoverColor: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                          textColor: Theme.of(context).colorScheme.surface,
                          hoverTextColor: Theme.of(context).colorScheme.surface,
                          fontSize: 24.0,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 16.0),
                        ),
                      ],
                    );
                    _scaffoldDrawerKey.currentState?.closeDrawer();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  /// routes
  Widget _routesDeatils(TabsRouter tabsRouter) => Row(
        children: tabsRouter.currentPath == '/dashboard'
            ? []
            : [
                const InkWell(
                  mouseCursor: SystemMouseCursors.click,
                  child: Text(Strings.admin),
                ),
                const Text('  /  '),
                Text(upperCase(tabsRouter.currentPath)),
              ],
      );

  Widget _footer() => Container(
        color: isDark ? ColorConst.footerDark : ColorConst.drawerBG,
        height: 60,
        width: Responsive.isWeb(context)
            ? MediaQuery.of(context).size.width - 240
            : MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: const Text(Strings.footerText),
      );
}
