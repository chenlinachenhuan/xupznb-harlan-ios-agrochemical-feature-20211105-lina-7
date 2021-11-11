//
//  goodsImageScrollview.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/12.
//

#import "goodsImageScrollview.h"

@implementation goodsImageScrollview

-(id)initWithArr:(NSMutableArray*)arr{
    if (self==[super init]) {
        self.imgArr = arr;
        [self creatImageView];
        
    }
    return self;
}
-(void)creatImageView{
    UIScrollView *imageScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight+TopHeight+49)];
    imageScroll.backgroundColor = [UIColor blackColor];
    imageScroll.contentSize = CGSizeMake(ScreenWidth * _imgArr.count, ScreenHeight);
    imageScroll.pagingEnabled = YES;
    imageScroll.bounces = NO;
    imageScroll.alpha = 0;
    imageScroll.delegate = self;
    self.imageScroll = imageScroll;
    imageScroll.userInteractionEnabled = YES;
    [[UIApplication sharedApplication].keyWindow addSubview:imageScroll];
    for (int i = 0; i < self.imgArr.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake( ScreenWidth * i, 156, ScreenWidth, 500)];
        imageView.image = self.imgArr[i];
        imageView.userInteractionEnabled = YES;
        [imageScroll addSubview:imageView];
    }
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.frame = CGRectMake(0, ScreenHeight - 50, ScreenWidth, 20);
    pageControl.numberOfPages = self.imgArr.count;
    pageControl.currentPage = 0;
    pageControl.hidden = YES;
//    pageControl.pageIndicatorTintColor =[UIColor redColor];
//    pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    self.pageControl = pageControl;
    [[UIApplication sharedApplication].keyWindow addSubview:pageControl];
    
    UITapGestureRecognizer *scrTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(scrTap:)];
    scrTap.numberOfTapsRequired = 1;
    scrTap.numberOfTouchesRequired = 1;
    [imageScroll addGestureRecognizer:scrTap];
}
-(void)showScorllViewMethod:(NSInteger)selectIndex{
 
    [self creatImageView];
    self.imageScroll.contentOffset  = CGPointMake(selectIndex*ScreenWidth, 0);

    [UIView animateWithDuration:0.5 animations:^{
        self.imageScroll.alpha = 1;
         self.pageControl.currentPage =selectIndex;
        if (self.imgArr.count==1) {
            return;
        }
        self->_pageControl.hidden = NO;

    }];
 
    
}
- (void)scrTap:(UITapGestureRecognizer *)tap{
    [UIView animateWithDuration:0.5 animations:^{
        self.imageScroll.alpha = 0;
        self->_pageControl.hidden = YES;
    }];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offSetX = scrollView.contentOffset.x;
     int number = offSetX / ScreenWidth;
    _pageControl.currentPage = number;
}

@end
