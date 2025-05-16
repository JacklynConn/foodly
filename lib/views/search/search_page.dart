import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/custom_container.dart';
import '../../constants/constants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _showStoriesInAppBar = false;
  double _storyTransition = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    double offset = _scrollController.offset;
    double start = 0;
    double end = 120;
    // Use a smooth curve for the transition
    double t = ((offset - start) / (end - start)).clamp(0.0, 1.0);
    t = Curves.easeInOut.transform(t);
    if (_storyTransition != t) {
      setState(() {
        _storyTransition = t;
        _showStoriesInAppBar = t > 0.99;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: kOffWhite,
      child: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            CupertinoSliverNavigationBar(
              largeTitle: const Text('Chats'),
              // Show stories in app bar when scrolled
              leading: _showStoriesInAppBar ? _buildCompactStories() : null,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Icon(CupertinoIcons.plus_circle, color: kPrimary),
                  ),
                  SizedBox(width: 15.w),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(CupertinoIcons.square_pencil, color: kPrimary),
                  ),
                ],
              ),
              backgroundColor: kOffWhite,
              border: Border(bottom: BorderSide(color: Colors.transparent)),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Stories section - only show when not in app bar
                    if (!_showStoriesInAppBar) ...[
                      SizedBox(height: 10.h),
                      SizedBox(
                        height: 100.h,
                        child: AnimatedBuilder(
                          animation: _scrollController,
                          builder: (context, child) {
                            return Stack(
                              children: [
                                AnimatedOpacity(
                                  opacity: 1 - _storyTransition,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 10,
                                    itemBuilder: (context, index) {
                                      return AnimatedScale(
                                        scale: 1 - (_storyTransition * 0.2),
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeInOut,
                                        child: _buildStoryItem(
                                          index,
                                          1 - _storyTransition,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                // Animated avatars moving to app bar
                                if (_storyTransition > 0)
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Transform.translate(
                                      offset: Offset(0, -60 * _storyTransition),
                                      child: AnimatedOpacity(
                                        opacity: _storyTransition,
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeInOut,
                                        child: Row(
                                          children: List.generate(5, (index) {
                                            return AnimatedScale(
                                              scale:
                                                  0.6 +
                                                  0.4 * (1 - _storyTransition),
                                              duration: Duration(
                                                milliseconds: 300,
                                              ),
                                              curve: Curves.easeInOut,
                                              child: _buildStoryItem(
                                                index,
                                                0.6 +
                                                    0.4 *
                                                        (1 - _storyTransition),
                                              ),
                                            );
                                          }),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 15.h),
                    ],
                    // Search bar
                    CupertinoSearchTextField(
                      controller: _searchController,
                      placeholder: 'Search',
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10.r),
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 10.w,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    // Filter tabs
                    SizedBox(
                      height: 40.h,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildFilterTab('All', true),
                          _buildFilterTab('Personal', false),
                          _buildFilterTab('Foodtech', false),
                          _buildFilterTab('IT05d', false),
                          _buildFilterTab('Master IT', false),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Chat list
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return _buildChatItem(index);
              }, childCount: 15),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStoryItem(
    int index, [
    double scale = 1.0,
    bool compact = false,
  ]) {
    List<String> storyNames = [
      'My Story',
      'TO131',
      'LMCar',
      'Flutter work',
      'Kaka',
    ];
    List<Color> avatarColors = [
      Colors.orange,
      Colors.blue,
      Colors.green,
      Colors.purple,
      Colors.cyan,
    ];

    String name =
        index < storyNames.length ? storyNames[index] : 'Story ${index + 1}';
    Color avatarColor =
        index < avatarColors.length ? avatarColors[index] : Colors.grey;

    double size = compact ? 30.w : 70.w;
    size *= scale;
    double fontSize = compact ? 14.sp : 24.sp;
    fontSize *= scale;

    return Padding(
      padding: EdgeInsets.only(right: compact ? 8.w : 15.w),
      child: Column(
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: kPrimary, width: compact ? 1.5 : 2),
            ),
            child: Center(
              child: Container(
                width: size * 0.93,
                height: size * 0.93,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: avatarColor,
                ),
                child:
                    index == 0
                        ? Icon(
                          CupertinoIcons.person_fill,
                          color: Colors.white,
                          size: fontSize,
                        )
                        : Center(
                          child: Text(
                            name[0],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
              ),
            ),
          ),
          if (!compact) SizedBox(height: 5.h),
          if (!compact)
            Text(
              name,
              style: TextStyle(fontSize: 12.sp * scale),
              overflow: TextOverflow.ellipsis,
            ),
        ],
      ),
    );
  }

  Widget _buildFilterTab(String title, bool isSelected) {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        color: isSelected ? kPrimary.withOpacity(0.2) : Colors.transparent,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: isSelected ? kPrimary : Colors.grey.withOpacity(0.3),
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? kPrimary : Colors.grey,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  // Compact stories for app bar
  Widget _buildCompactStories() {
    double overlap = 24.w; // Amount of overlap between avatars
    double baseSize = 30.w;
    double scaleStep = 0.12; // Each next avatar is slightly smaller
    return SizedBox(
      width: baseSize + (5 - 1) * overlap + 10.w,
      height: 40.h,
      child: Stack(
        children: List.generate(5, (index) {
          double scale = 1.0 - (index * scaleStep);
          return AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: index * overlap,
            child: AnimatedScale(
              scale: scale,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              alignment: Alignment.centerLeft,
              child: _buildStoryItem(index, scale, true),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildChatItem(int index) {
    List<String> chatNames = [
      'Archived Chats',
      'FlutterHive - Flutter Tips & Tricks',
      'Android App Development (G01)',
      'Android App Development (G01)',
      'Khmer IT Jobs',
      'Free Courses Discussion!',
      'Free Courses With Certificates!',
    ];

    List<String> chatMessages = [
      'OneSala-Flutter 2 Level 1(Q&A)',
      'Flutter State Management: 7 Powerful Approaches',
      'Android App Development (G01)',
      'https://youtu.be/PSf6-3zt1ng',
      'Kim 1',
      'Natalie',
      '(100% Free) PCCSA: Palo Alto Network Cyber Security Practice Test',
    ];

    List<String> chatTimes = [
      '',
      '07/02',
      '30/11/24',
      '30/11/24',
      '18:51',
      '18:51',
      '18:51',
    ];

    List<Color> avatarColors = [
      Colors.blue,
      Colors.blue.shade800,
      Colors.red,
      Colors.green,
      Colors.blue.shade900,
      Colors.yellow,
      Colors.indigo,
    ];

    String name =
        index < chatNames.length ? chatNames[index] : 'Chat ${index + 1}';
    String message =
        index < chatMessages.length ? chatMessages[index] : 'Hello there!';
    String time = index < chatTimes.length ? chatTimes[index] : '00:00';
    Color avatarColor =
        index < avatarColors.length ? avatarColors[index] : Colors.grey;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      child: Row(
        children: [
          Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: avatarColor,
            ),
            child: Center(
              child:
                  index == 0
                      ? Icon(
                        CupertinoIcons.archivebox_fill,
                        color: Colors.white,
                        size: 25.sp,
                      )
                      : index == 1
                      ? Icon(
                        CupertinoIcons.flame_fill,
                        color: Colors.white,
                        size: 25.sp,
                      )
                      : Text(
                        name[0],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Text(
                  message,
                  style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
