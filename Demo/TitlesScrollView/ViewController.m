//
//  ViewController.m
//  TitlesScrollView
//
//  Created by Peter Kong on 15/7/5.
//  Copyright (c) 2015年 CrazyPeter. All rights reserved.
//

#import "ViewController.h"

#import "TitleScrollView.h"

@interface ViewController ()<TitlesInScollViewDelegate,UIScrollViewDelegate>
@property (strong,nonatomic) TitleScrollView *titleScrollView;
@property (strong,nonatomic) UIScrollView *scrollView;
@end

@implementation ViewController

#define screenBouns [UIScreen mainScreen].bounds

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initTitleScrollView];
    [self initScrollView];
}

#pragma MARK - initViews
-(void)initTitleScrollView
{
    NSArray *titleArray = @[@"yellow",@"cyan",@"orange",@"purple",@"green"];
    _titleScrollView = [[TitleScrollView alloc]initWithFrame:CGRectMake((screenBouns.size.width - 240)/2.0f, 100, 240, 40)];
    _titleScrollView.buttonWidth = 80;
    _titleScrollView.pagingEnabled = YES;
    [_titleScrollView setupWithTitleArray:titleArray];
    _titleScrollView.backgroundColor = [UIColor darkGrayColor];
    
    _titleScrollView.titlesdelegate = self;
    
    [self.view addSubview:_titleScrollView];
}

-(void)initScrollView
{
    NSArray *colorArray = @[[UIColor yellowColor],[UIColor cyanColor],[UIColor orangeColor],[UIColor purpleColor],[UIColor greenColor]];
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 140, screenBouns.size.width, 300)];
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(screenBouns.size.width*colorArray.count, 300);
    _scrollView.pagingEnabled = YES;
    
    for (int i = 0; i < colorArray.count; i++) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(i*screenBouns.size.width, 0, screenBouns.size.width, 300)];
        view.backgroundColor = [colorArray objectAtIndex:i];
        [_scrollView addSubview:view];
    }
    
    [self.view addSubview:_scrollView];
}


#pragma MARK - delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_titleScrollView didScollContentOffsetX:scrollView.contentOffset.x andPageSizeX:screenBouns.size.width];
}

#pragma MARK - delegate
-(void)scrollviewShouldScollByTitleScollview:(float)page
{
    [self.scrollView setContentOffset:CGPointMake(page*screenBouns.size.width, 0) animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

