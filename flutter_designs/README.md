# flutter_designs

This is the starting point for the project. Within the main.dart file, resides a linkedHashMap named _widgetOptions. This contains pages and their buttons in the format:

```const [page]: const BottomNavigationBarItem(
    icon: [icon],
    label: "[label]",
)```

When adding a new page, add the .dart file to 'lib' and update this linkedHashMap to match.

Currently these page files are only placeholders: my_home_page.dart, my_inbox_page.dart, my_map_page.dart, my_rent_page.dart.
