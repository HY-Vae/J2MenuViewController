//
//  J2MenuViewDefine.h
//  IIBrowser
//
//  Created by whatsbug on 2019/4/23.
//  Copyright © 2019 whatsbug. All rights reserved.
//

#ifndef J2MenuViewDefine_h
#define J2MenuViewDefine_h

///MARK: - Constant
#define J2MENU_HEADERVIEW_HEIGHT 84.0f // headerView Height
#define J2MENU_COLLECTIONVIEW_INSET UIEdgeInsetsMake(0.0f, 30.0f, 0.0f, 30.0f)
#define J2MENU_FOOTERVIEW_HEIGHT ([[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom + 50.0f) // footerView Height
#define J2MENU_ITEMSPACING 45.0f // itemSpacing
#define J2MENU_LINESPACING 15.0f // lineSpacing
#define J2MENU_COLS 5 // cols
#define J2MENU_BOTTOM_PADDING 12.0 // 底部padding
#define J2MENU_ANIMATIONDURATION 0.25 // 动画时长

#endif /* J2MenuViewDefine_h */
