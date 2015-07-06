//
//  TitleScrollView.h
//  TitlesInScrollView
//
//  Created by Peter Kong on 15/6/29.
//  Copyright (c) 2015年 CrazyPeter. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol TitlesInScollViewDelegate <NSObject>

/*
 *回调函数：告诉上层界面现在应该在的位置
 *Xpercent：这个数值乘以每个界面的width就是上层界面应该滑动的距离
 */
- (void)scrollviewShouldScollByTitleScollview:(float)Xpercent;

@end

@interface TitleScrollView : UIScrollView

/*
 *按钮的宽度，高度与scrollview相同
 */

@property float buttonWidth;

/*
 *gsv -- gray scale values
 *灰阶值，取值范围：0 - 1
*/

@property float gsv_selected;
@property float gsv_default;

/*
 *缩放大小
 */
@property float scale_max;
@property float scale_min;

- (void)setupWithTitleArray:(NSArray *)array;

/*
 *pagesizex：每页的width
 */
- (void)didScollContentOffsetX:(CGFloat)offsetX andPageSizeX:(CGFloat)pagesizex;

@property (assign, nonatomic) id<TitlesInScollViewDelegate>titlesdelegate;
@end
