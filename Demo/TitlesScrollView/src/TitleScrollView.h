//
//  TitleScrollView.h
//  TitlesInScrollView
//
//  Created by Peter Kong on 15/6/29.
//  Copyright (c) 2015年 CrazyPeter. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol TitlesInScollViewDelegate <NSObject>

/**
 *  delegate function
 *
 *  @param Xpercent currentpageInTitleScrollview
 */
- (void)scrollviewShouldScollByTitleScollview:(float)page;

@end

@interface TitleScrollView : UIScrollView

/*
 *WARNING: if you want appear 3 buttons at the sametime,in the titlescrollview
 *         you should frame like this :
 *         buttonWidth*3 = titleScrollViewWidth
 */


/**
*  setupWithTitleArray
*
*  @param array titlesForShow
*/

- (void)setupWithTitleArray:(NSArray *)array;

@property float buttonWidth;

/*
 *gsv -- gray scale values
*/

/**
 *  gsv_selected - buttonHighlightedColor
 *  gsv_default  - buttonNormalColor
 */
@property float gsv_selected;
@property float gsv_default;

/**
 *  scale_max    - button's Scale,highlighted
 *  scale_min    - button's Scale,normal
 */
@property float scale_max;
@property float scale_min;


/*
 *pagesizex：每页的width
 */
- (void)didScollContentOffsetX:(CGFloat)offsetX andPageSizeX:(CGFloat)pagesizex;

@property (assign, nonatomic) id<TitlesInScollViewDelegate>titlesdelegate;
@end
