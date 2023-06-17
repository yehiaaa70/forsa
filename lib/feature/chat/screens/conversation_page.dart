import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:forsa/core/widgets/avater_widget.dart';
import '../../../core/utils/app_colors.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage({Key? key}) : super(key: key);

  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  var hei, wid;

  int user_id = 0;

  // late Stream<LocalNotification> _notificationsStream;

  // late ConversationPageCubit cubit;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    hei = size.height;
    wid = size.width;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: AppColors.white,
      //   centerTitle: true,
      //   elevation: 0,
      //   title: Text(
      //     'chat'.tr(),
      //     style: const TextStyle(
      //         color: AppColors.black,
      //         fontSize: 16.0,
      //         fontWeight: FontWeight.bold),
      //   ),
      //   leading:  context.read<NavigatorBottomCubit>().page != 1
      //       ? AppWidget.buildBackArrow(context: context)
      //       : SizedBox(),
      // ),
      // backgroundColor: AppColors.gray1,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.linearColors,
          ),
        ),
        padding: EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: RefreshIndicator(
            color: AppColors.primary,
            onRefresh: () async {},
            child: ListView.separated(
              itemCount: 2,
              scrollDirection: Axis.vertical,
              itemBuilder: ((context, index) {
                // ChatModel model = list[index];
                return InkWell(
                  onTap: () {},
                  child: Card(
                    color: AppColors.white.withOpacity(0.7),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        leading: CachedNetworkImage(
                          imageUrl:
                              'https://scontent.faly8-1.fna.fbcdn.net/v/t39.30808-6/331514621_885258862534152_7250881746152239477_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=IGqu8CHU8bYAX_nxSPt&_nc_ht=scontent.faly8-1.fna&oh=00_AfDUK0voB-s-lOX7KF4KDa5IuAMDCpdwLL3t5yMPhykJjQ&oe=641C4562',
                          placeholder: (context, url) => AvatarWidget(size: 48),
                          errorWidget: (context, url, error) =>
                              AvatarWidget(size: 48),
                          width: 48,
                          height: 48,
                          imageBuilder: (context, imageProvider) {
                            return CircleAvatar(
                              backgroundImage: imageProvider,
                              radius: 48.0,
                            );
                          },
                        ),
                        title: Text(
                          'Yehia',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: AppColors.black,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text('كيف حالك صديقى'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '3:00',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: AppColors.blueColor1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 20);
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
}
