//
//  RMActionSheet.h
//  RMActionSheetProject
//
//  Created by 王林 on 2017/5/17.
//  Copyright © 2017年 wanglin. All rights reserved.
//

#import <UIKit/UIKit.h>


//@class RMActionSheet;

@protocol RMActionSheetDelegate <NSObject>

@optional
- (void)actionSheet:(UIAlertController *)actionSheet didClickedButtonAtIndex:(NSInteger)buttonIndex title:(NSString *)title;
- (void)actionSheetDissmissed:(UIAlertController *)actionSheet;
@end


@interface RMActionSheet : NSObject

//取消自定义
+ (void)showSheetWithTitle:(NSString *)title
				   message:(NSString *)message
			  buttonTitles:(NSArray *)titles
			  cancelButton:(NSString *)cancelButton
		  inViewController:(UIViewController *)viewController
				  delegate:(id<RMActionSheetDelegate>)delegate;

//默认取消
+ (void)showSheetWithTitle:(NSString *)title
				   message:(NSString *)message
			  buttonTitles:(NSArray *)titles
		  inViewController:(UIViewController *)viewController
				  delegate:(id<RMActionSheetDelegate>)delegate;

//取消自定义
+ (void)showSheetWithTitle:(NSString *)title
				   message:(NSString *)message
			  buttonTitles:(NSArray *)titles
			  cancelButton:(NSString *)cancelButton
		  inViewController:(UIViewController *)viewController
					 block:(void(^)(NSInteger selectIndex,NSString *title))selectBlock
			   cancelBlock:(void(^)())cancelBlock;

//默认取消
+ (void)showSheetWithTitle:(NSString *)title
				   message:(NSString *)message
			  buttonTitles:(NSArray *)titles
		  inViewController:(UIViewController *)viewController
					 block:(void(^)(NSInteger selectIndex,NSString *title))selectBlock;


@end
