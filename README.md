Use this package to simplify the permission handling in your project

You can ask single permission like this : 

MyPermissionHandler.askPermission(Permission.camera).then((value) async {
    if (value.isGranted) {
        //Whatever you want to do when permission is granted
    }));
    } else {
        MyPermissionHandler.showPermissionDialog(context, value.isPermanentlyDenied, Permission.camera, "Camera");
    }
});

And for asking the multiple permissions : 

MyPermissionHandler.askPermissions([Permission.camera]).then((value) async {
    if (value) {
       //Whatever you want to do when permission is granted
    } else {
        MyPermissionHandler.showPermissionDialog(context, true, Permission.camera, AppStrings.bluetoothPermission);
    }
});


Note : Do not forget to define permission in AndroidManifest.xml file for Android and info.plist file for iOS.