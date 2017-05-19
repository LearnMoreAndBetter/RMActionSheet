# RMActionSheet
ActionSheet和AlertView的封装

提供了两种方式的封装

#pragma mark - 使用UIAlertController自定义的AlertView
/**
有“确定”按钮的AlertView

@param title 标题
@param message 内容
@param viewController 显示的控制器，可为nil
*/
+ (void)showOKAlertTitle:(NSString *)title
				 message:(NSString *)message
		  withController:(UIViewController *)viewController;

/**
有“确定”按钮的AlertView

@param title 标题
@param message 内容
@param viewController 显示的控制器，可为nil
@param doneBlock 确定block
*/
+ (void)showOKAlertTitle:(NSString *)title
				 message:(NSString *)message
		  withController:(UIViewController *)viewController
			   doneBlock:(void(^)())doneBlock;

/**
有“确定”和”取消“按钮的AlertView

@param title 标题
@param message 内容
@param viewController 显示的控制器，可为nil
@param doneBlock 确定block
*/
+ (void)showOKCancelAlertTitle:(NSString *)title
					   message:(NSString *)message
				withController:(UIViewController *)viewController
					 doneBlock:(void(^)())doneBlock;


/**
有多个按钮的AlertView

@param title 标题
@param message 内容
@param buttonTitles 按钮标题
@param viewController 显示的控制器，可为nil
@param selectBlock 选择block，返回标题及index
*/
+ (void)showAlertTitle:(NSString *)title
			   message:(NSString *)message
		  buttonTitles:(NSArray *)buttonTitles
		withController:(UIViewController *)viewController
		   selectBlock:(void(^)(NSInteger selectIndex,NSString *title))selectBlock;


#pragma mark - HUD
/**
无按钮的AlertView（HUD），默认停留时间为1秒

@param text 内容
*/
+ (void)showMessage:(NSString *)text;

/**
无按钮的AlertView（HUD）

@param text 内容
@param delay 停留时间
*/
+ (void)showMessage:(NSString *)text
		 afterDelay:(NSTimeInterval)delay;


#pragma mark - 使用UIAlertController自定义的ActionSheet
/**
取消自定义的 使用delegate的actionsheet

@param title 标题
@param message 内容
@param titles 除取消外的按钮
@param cancelButton 取消按钮标题，为空则没有取消按钮
@param viewController 显示在控制器（可为空，如果为空则显示在默认控制器中）
@param delegate 协议
*/
+ (void)showSheetWithTitle:(NSString *)title
				   message:(NSString *)message
			  buttonTitles:(NSArray *)titles
			  cancelButton:(NSString *)cancelButton
		  inViewController:(UIViewController *)viewController
				  delegate:(id<RMActionSheetDelegate>)delegate;

/**
默认取消自定义的使用delegate的actionsheet

@param title 标题
@param message 内容
@param titles 除取消外的按钮
@param viewController 显示在控制器（可为空，如果为空则显示在默认控制器中）
@param delegate 协议
*/
+ (void)showSheetWithTitle:(NSString *)title
				   message:(NSString *)message
			  buttonTitles:(NSArray *)titles
		  inViewController:(UIViewController *)viewController
				  delegate:(id<RMActionSheetDelegate>)delegate;

/**
取消自定义的使用block的actionsheet

@param title 标题
@param message 内容
@param titles 除取消外的按钮
@param cancelButton 取消按钮标题，为空则没有取消按钮
@param viewController 显示在控制器（可为空，如果为空则显示在默认控制器中）
@param selectBlock 选择block，返回标题及index
@param cancelBlock 取消block
*/
+ (void)showSheetWithTitle:(NSString *)title
				   message:(NSString *)message
			  buttonTitles:(NSArray *)titles
			  cancelButton:(NSString *)cancelButton
		  inViewController:(UIViewController *)viewController
					 block:(void(^)(NSInteger selectIndex,NSString *title))selectBlock
			   cancelBlock:(void(^)())cancelBlock;


/**
默认取消使用block的actionsheet

@param title 标题
@param message 内容
@param titles 除取消外的按钮
@param viewController 显示在控制器（可为空，如果为空则显示在默认控制器中）
@param selectBlock 选择block，返回标题及index
*/
+ (void)showSheetWithTitle:(NSString *)title
				   message:(NSString *)message
			  buttonTitles:(NSArray *)titles
		  inViewController:(UIViewController *)viewController
					 block:(void(^)(NSInteger selectIndex,NSString *title))selectBlock;




