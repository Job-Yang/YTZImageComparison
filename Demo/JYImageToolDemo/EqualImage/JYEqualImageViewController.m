//
//  JYEqualImageViewController.m
//  JYImageToolDemo
//
//  Created by 杨权 on 16/3/25.
//  Copyright © 2016年 Job-Yang. All rights reserved.
//

#import "JYEqualImageViewController.h"
#import "JYImageTool.h"

@interface JYEqualImageViewController ()
@property (strong, nonatomic) UIImageView *imageViewOne;
@property (strong, nonatomic) UIImageView *imageViewTwo;
@property (strong, nonatomic) UILabel *resultLabel;
@property (strong, nonatomic) UIButton *nextButton;
@end

@implementation JYEqualImageViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self nextButtonAction];
}

#pragma mark - setup methods
- (void)initUI {
    self.view.backgroundColor = [UIColor whiteColor];
    [self imageViewOne];
    [self imageViewTwo];
    [self resultLabel];
    [self nextButton];
}

#pragma mark - event & response
- (void)nextButtonAction {
    //随机拿2张图。
    [self nextImage];
    
    //判断是否相同
    BOOL isEqual = [self.imageViewOne.image isEqualToImage:self.imageViewTwo.image];
    if (isEqual) {
        self.resultLabel.backgroundColor = [UIColor greenColor];
        self.resultLabel.text = @"相同图片";
    }
    else {
        self.resultLabel.backgroundColor = [UIColor redColor];
        self.resultLabel.text = @"不同图片";
    }
}

- (void)nextImage {
    //随机拿2张图。
    NSString *imageName1 = [NSString stringWithFormat:@"resources_%d",(arc4random()%10)+1];
    NSString *imageName2 = [NSString stringWithFormat:@"resources_%d",(arc4random()%10)+1];
    self.imageViewOne.image = [UIImage imageNamed:imageName1];
    self.imageViewTwo.image = [UIImage imageNamed:imageName2];
}

#pragma mark - getter & setter
- (UIImageView *)imageViewOne {
    if (!_imageViewOne) {
        _imageViewOne = [[UIImageView alloc] initWithFrame:CGRectMake(0, TOP_LAYOUT_GUIDE, SCREEN_WIDTH, (SAFE_HEIGHT-50)/2)];
        [_imageViewOne setContentMode:UIViewContentModeScaleAspectFill];
        _imageViewOne.layer.masksToBounds = YES;
        [self.view addSubview:_imageViewOne];
    }
    return _imageViewOne;
}

- (UIImageView *)imageViewTwo {
    if (!_imageViewTwo) {
        _imageViewTwo = [[UIImageView alloc] initWithFrame:CGRectMake(0, (SAFE_HEIGHT-50)/2+TOP_LAYOUT_GUIDE, SCREEN_WIDTH, (SAFE_HEIGHT-50)/2)];
        [_imageViewTwo setContentMode:UIViewContentModeScaleAspectFill];
        _imageViewTwo.layer.masksToBounds = YES;
        [self.view addSubview:_imageViewTwo];
    }
    return _imageViewTwo;
}

- (UILabel *)resultLabel {
    if (!_resultLabel) {
        _resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-100, (SCREEN_HEIGHT-TOP_LAYOUT_GUIDE-50)/2+30, 200, 60)];
        [_resultLabel setTextColor:[UIColor whiteColor]];
        _resultLabel.textAlignment = NSTextAlignmentCenter;
        _resultLabel.font = [UIFont fontWithName:@"GillSans-Italic" size:30.f];
        [self.view addSubview:_resultLabel];
    }
    return _resultLabel;
}

- (UIButton *)nextButton {
    if (!_nextButton) {
        _nextButton = [[UIButton alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-BOTTOM_LAYOUT_GUIDE-49, SCREEN_WIDTH, 49)];
        _nextButton.titleLabel.font = [UIFont fontWithName:@"GillSans-Italic" size:30.f];
        [_nextButton setTitle:@"NEXT" forState:UIControlStateNormal];
        [_nextButton setTitleColor:RGB(58,63,83) forState:UIControlStateNormal];
        [_nextButton addTarget:self action:@selector(nextButtonAction) forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:_nextButton];
    }
    return _nextButton;
}
@end
