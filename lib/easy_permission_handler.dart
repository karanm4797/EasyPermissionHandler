library easy_permission_handler;
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';
import 'custom_button.dart';

//Now handle permission in your projects in a very easy and convenient way
class EasyPermissionHandler {

  //This will return status for single permission
  Future<PermissionStatus> askPermission(Permission permission) async {
    var status = await permission.status;
    if (status.isDenied) {
      var newStatus = await permission.request();

      return newStatus;
    } else {
      return status;
    }
  }

  //This will return statuses for multiple permissions at a time
  Future<bool> askPermissions(List<Permission> permissions) async {
    var statuses = await permissions.request();
    var statusList =
        statuses.values.where((element) => element.isGranted).toList();

    if (statusList.length < permissions.length) {
      return false;
    } else {
      return true;
    }
  }

  //Show dialog when user has denied the permission
  //Basically this dialog should be used to tell user that permission is required
  //You need to pass whether user has permanently denied the permission or not
  //It will handle if permission is denied permanently or single time and will show message accordingly
  showPermissionDialog(
      BuildContext context,
      bool isPermissionPermanentlyDenied,
      Permission permission,
      String permissionName) {
    return showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.5.w),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Permission required",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(dialogContext);
                    },
                    child: Icon(
                      Icons.close,
                      size: 6.w,
                    )),
              ],
            ),
            content: isPermissionPermanentlyDenied
                ? Text(
                "Permission required for $permissionName, Please grant it.",
                style: Theme.of(context).textTheme.bodyMedium)
                : Text(
                "Permission required for $permissionName, Click on Yes to grant it from settings",
                style: Theme.of(context).textTheme.bodyMedium),
            actionsPadding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 5.w),
            actions: [
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomButton(
                      onClick: () async {
                        Navigator.of(context).pop();
                        if (isPermissionPermanentlyDenied) {
                          await openAppSettings();
                        } else {
                          askPermission(permission);
                        }
                      },
                      buttonText: "Yes",
                      showMargin: false,
                      height: 5.h,
                    ),
                  )
                ],
              )
            ],
            actionsAlignment: MainAxisAlignment.spaceAround,
          );
        });
  }
}
