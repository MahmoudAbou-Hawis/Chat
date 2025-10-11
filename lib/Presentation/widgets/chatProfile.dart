import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ChatProfile extends StatelessWidget {
  final bool hasStatus;
  final String imageLink;
  final String name;
  final int unreadCount;
  final String lastMessage;
  final String date;
  final isStatusWatched;
  final VoidCallback ? ChatCallback;
  final VoidCallback ? PhotoCallback;
  const ChatProfile({
    super.key,
    required this.hasStatus,
    required this.imageLink,
    required this.name,
    required this.unreadCount,
    required this.date,
    required this.lastMessage,
    required this.isStatusWatched,
    required this.ChatCallback,
    required this.PhotoCallback
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ChatCallback,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 350),
        child: SizedBox(
          width: MediaQuery.of(context).size.width -35,
          child: Row(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: PhotoCallback,
                child: Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    border: Border.all(
                      color: hasStatus
                          ? (isStatusWatched == false)
                                ? Color(0xff007665)
                                : Color(0xffC5BCBC)
                          : Colors.transparent,
                      width: 1.8,
                    ),
                  ),
                  child: Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      border: Border.all(color: Colors.white),
                    ),
                
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: CachedNetworkImage(
                        errorWidget: (context, url, error) =>
                            Image.asset('assets/image.png'),
                        placeholder: (context, url) {
                          return Skeletonizer(
                            enableSwitchAnimation: true,
                            child: Container(color: Colors.blueGrey),
                          );
                        },
                        imageUrl: imageLink,
                        width: 50,
                        fit: BoxFit.cover,
                        height: 50,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  //  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 5),
                              if (unreadCount > 0)
                                Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xff55A99D),
                                  ),
                                  child: Center(
                                    child: Text(
                                      (unreadCount > 99)
                                          ? '+99'
                                          : unreadCount.toString(),
                                      style: TextStyle(
                                        fontSize: (unreadCount > 99) ? 8 : 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        height: 1,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Text(
                          date,
                          style: TextStyle(
                            color: Color.fromARGB(255, 167, 162, 162),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 250,
                          child: Text(
                            lastMessage,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: unreadCount == 0
                                  ? Color.fromARGB(255, 193, 186, 186)
                                  : Color.fromARGB(255, 140, 131, 131),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
