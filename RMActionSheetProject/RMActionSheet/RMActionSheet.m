//
//  RMActionSheet.m
//  RMActionSheetProject
//
//  Created by 王林 on 2017/5/17.
//  Copyright © 2017年 wanglin. All rights reserved.
//

#import "RMActionSheet.h"
#import "RMAlertSheetDefine.h"

@implementation RMActionSheet

+ (void)actionTouched:(UIAlertController *)actionSheet tag:(NSInteger)tag title:(NSString *)title delegate:(id<RMActionSheetDelegate>)delegate
{
	if ([delegate respondsToSelector:@selector(actionSheet:clickedButtonAtIndex:)]) {
		[delegate actionSheet:actionSheet didClickedButtonAtIndex:tag title:title];
	}
}

+ (void)actionCancelTouched:(UIAlertController *)action delegate:(id<RMActionSheetDelegate>)delegate
{
	if ([delegate respondsToSelector:@selector(actionSheetDissmissed:)]) {
		[delegate actionSheetDissmissed:action];
	}
}

+ (void)showSheetWithTitle:(NSString *)title
				   message:(NSString *)message
			  buttonTitles:(NSArray *)titles
			  cancelButton:(NSString *)cancelButton
		  inViewController:(UIViewController *)viewController
				  delegate:(id<RMActionSheetDelegate>)delegate
{
	UIAlertController *alertSheet = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
	
	for (int i = 0; i < [titles count]; i++) {
		NSString *title = titles[i];
		UIAlertAction *action = [UIAlertAction actionWithTitle:title style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
			[self actionTouched:alertSheet tag:i title:title delegate:delegate];
		}];
		[action setValue:RM_MAIN_COLOR forKey:@"titleTextColor"];
		[alertSheet addAction:action];
	}
	
	//取消
	if (cancelButton != nil) {
		UIAlertAction *action = [UIAlertAction actionWithTitle:cancelButton style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
			[self actionCancelTouched:alertSheet delegate:delegate];
		}];
		[action setValue:RM_ORANGE_COLOR forKey:@"titleTextColor"];
		[alertSheet addAction:action];
	}
	[viewController presentViewController:alertSheet animated:YES completion:nil];
}

//默认取消
+ (void)showSheetWithTitle:(NSString *)title
				   message:(NSString *)message
			  buttonTitles:(NSArray *)titles
		  inViewController:(UIViewController *)viewController
				  delegate:(id<RMActionSheetDelegate>)delegate
{
	[self showSheetWithTitle:title
					 message:message
				buttonTitles:titles
				cancelButton:@"取消"
			inViewController:viewController
					delegate:delegate];
}

//取消自定义
+ (void)showSheetWithTitle:(NSString *)title
				   message:(NSString *)message
			  buttonTitles:(NSArray *)titles
			  cancelButton:(NSString *)cancelButton
		  inViewController:(UIViewController *)viewController
					 block:(void(^)(NSInteger selectIndex,NSString *title))selectBlock
			   cancelBlock:(void(^)())cancelBlock
{
	UIAlertController *alertSheet = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
	
	for (int i = 0; i < [titles count]; i++) {
		NSString *title = titles[i];
		UIAlertAction *action = [UIAlertAction actionWithTitle:title style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
			if (selectBlock) {
				selectBlock(i,title);
			}
		}];
		[action setValue:RM_MAIN_COLOR forKey:@"titleTextColor"];
		[alertSheet addAction:action];
	}
	
	//取消
	if (cancelButton != nil) {
		UIAlertAction *action = [UIAlertAction actionWithTitle:cancelButton style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
			if (cancelBlock) {
				cancelBlock();
			}
		}];
		[action setValue:RM_ORANGE_COLOR forKey:@"titleTextColor"];
		[alertSheet addAction:action];
	}
	[viewController presentViewController:alertSheet animated:YES completion:nil];
}

//默认取消
+ (void)showSheetWithTitle:(NSString *)title
				   message:(NSString *)message
			  buttonTitles:(NSArray *)titles
		  inViewController:(UIViewController *)viewController
					 block:(void(^)(NSInteger selectIndex,NSString *title))selectBlock
{
	[self showSheetWithTitle:title
					 message:message
				buttonTitles:titles
				cancelButton:@"取消"
			inViewController:viewController
					   block:selectBlock
				 cancelBlock:nil];
}


@end
