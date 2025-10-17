


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserPhoto extends StatelessWidget
{
  final VoidCallback ? PhotoCallback;
  final bool isStatusWatched;
  final bool hasStatus;
  final String imageLink;
  UserPhoto({required this.PhotoCallback ,required this.isStatusWatched, required this.hasStatus,    required this.imageLink,
});

  @override
  Widget build(BuildContext context) {
    return         GestureDetector(
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
                            Image.asset('assets/profile.png'),
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
              );
  }
  
}