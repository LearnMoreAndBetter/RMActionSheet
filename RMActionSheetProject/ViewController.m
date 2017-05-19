//
//  ViewController.m
//  RMActionSheetProject
//
//  Created by 王林 on 2017/5/17.
//  Copyright © 2017年 wanglin. All rights reserved.
//

#import "ViewController.h"
#import "RMActionSheet.h"
#import "RMAlertView.h"

#define WEAKSELF __weak typeof(self)
//主色调－－深绿
#define RM_MAIN_COLOR       [UIColor colorWithRed:44 / 255.0 green:183 / 255.0 blue:124 / 255.0 alpha:1]

@interface ViewController ()

@property (strong, nonatomic)UIButton *rightButton;
@property (strong, nonatomic)UIButton *leftButton;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.title = @"首页";
	self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
	
	self.navigationController.navigationBar.tintColor = RM_MAIN_COLOR;
	[self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjects:@[RM_MAIN_COLOR,[UIFont boldSystemFontOfSize:20]] forKeys:@[NSForegroundColorAttributeName,NSFontAttributeName]]];
	
	[self addLeftButtonItem];
	
	[self addRightButtonItem];
}

- (void)addRightButtonItem{
	UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightButton];
	self.navigationItem.rightBarButtonItem = rightItem;
	
	[self.rightButton setTitle:@"评价" forState:UIControlStateNormal];
}

- (void)addLeftButtonItem{
	UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftButton];
	self.navigationItem.leftBarButtonItem = leftItem;
	
	[self.leftButton setTitle:@"删除" forState:UIControlStateNormal];
}


- (void)rightButtonAction:(UIButton *)button{
	[self addEvaluateAlertSheet];
}


- (void)leftButtonAction:(UIButton *)button{
	[self addDeleteAlertView];
}

- (void)addDeleteAlertView{
	WEAKSELF weakSelf = self;
	[RMAlertView showAlertTitle:@"确认删除？" message:nil buttonTitles:@[@"真的", @"假的"] withController:self selectBlock:^(NSInteger selectIndex, NSString *title) {
		[weakSelf.leftButton setTitle:title forState:UIControlStateNormal];
	}];
}


//评价弹窗
- (void)addEvaluateAlertSheet{
	WEAKSELF weakSelf = self;
	[RMActionSheet showSheetWithTitle:@"服务评价" message:nil buttonTitles:@[@"很满意",@"满意",@"不满意"] inViewController:self block:^(NSInteger selectIndex, NSString *title) {
		[weakSelf.rightButton setTitle:title forState:UIControlStateNormal];
	}];
}


- (UIButton *)rightButton{
	if (!_rightButton) {
		_rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
		_rightButton.frame = CGRectMake(0, 0, 65, 30);
		_rightButton.titleLabel.font = [UIFont systemFontOfSize:16];
		_rightButton.titleLabel.textAlignment = NSTextAlignmentCenter;
		[_rightButton setTitleColor: RM_MAIN_COLOR forState:UIControlStateNormal];
		_rightButton.backgroundColor = [UIColor clearColor];
		_rightButton.layer.cornerRadius = 15.0;
		_rightButton.layer.masksToBounds = YES;
		_rightButton.layer.borderColor = RM_MAIN_COLOR.CGColor;
		_rightButton.layer.borderWidth = 1.0;
		
		[_rightButton addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
	}
	return _rightButton;
}


- (UIButton *)leftButton{
	if (!_leftButton) {
		_leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
		_leftButton.frame = CGRectMake(0, 0, 65, 30);
		_leftButton.titleLabel.font = [UIFont systemFontOfSize:16];
		_leftButton.titleLabel.textAlignment = NSTextAlignmentCenter;
		[_leftButton setTitleColor: RM_MAIN_COLOR forState:UIControlStateNormal];
		_leftButton.backgroundColor = [UIColor clearColor];
		_leftButton.layer.cornerRadius = 15.0;
		_leftButton.layer.masksToBounds = YES;
		_leftButton.layer.borderColor = RM_MAIN_COLOR.CGColor;
		_leftButton.layer.borderWidth = 1.0;
		
		[_leftButton addTarget:self action:@selector(leftButtonAction:) forControlEvents:UIControlEventTouchUpInside];
	}
	return _leftButton;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
