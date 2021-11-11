//
//  CustomBannerView.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/7.
//
#define timerInterval 2.0
#define scrWidth (ScreenWidth-32)
#import "CustomBannerView.h"
 
@implementation CustomBannerView
-(id)initWithFrame:(CGRect)frame imageArr:(NSMutableArray*)imgArr isTimer:(BOOL)isTimer{
    if (self=[super initWithFrame:frame]) {
         self.imgArr = imgArr;
        self.bannerHeight = self.frame.size.height;
        self.isTimer = isTimer;
        [self createHotBanner];
        
    }
    return self;
}
-(void)createHotBanner{
    
    self.bannerScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, scrWidth, self.bannerHeight)];
    self.bannerScrollView.delegate = self;
    self.bannerScrollView.contentSize = CGSizeMake((self.imgArr.count+1)*(scrWidth), 0);
    self.bannerScrollView.showsHorizontalScrollIndicator = NO;
    self.bannerScrollView.pagingEnabled = YES;
//    self.bannerScrollView.backgroundColor = [UIColor redColor];
    [self addSubview:self.bannerScrollView];
    
     
    
    self.bannerpageC = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.bannerScrollView.frame.size.height-16, scrWidth, 2)];
    self.bannerpageC.currentPage = 0;
    self.bannerpageC.numberOfPages = self.imgArr.count;
    self.bannerpageC.pageIndicatorTintColor =colorH(218, 221, 225);
    self.bannerpageC.currentPageIndicatorTintColor = colorH(98, 191, 180);
    [self addSubview:self.bannerpageC];
    if (self.isTimer==YES) {
        [self creatTimer];

    }
    //创建定时器
 }
-(void)setImgArr:(NSMutableArray *)imgArr{
    _imgArr = imgArr;
    for (int i = 0; i < self.imgArr.count+1; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*(scrWidth), 0, (scrWidth), self.bannerHeight*0.860215)];
        if (i == self.imgArr.count) {
            [imageView sd_setImageWithURL:[NSURL URLWithString:self.imgArr[0]]];
        }else{
            [imageView sd_setImageWithURL:[NSURL URLWithString:self.imgArr[i]]];
        }
        imageView.tag = i;
//        imageView.userInteractionEnabled = YES;
//        imageView.clipsToBounds = YES;
//        imageView.layer.cornerRadius = 10;
        [self.bannerScrollView addSubview:imageView];
        
        UITapGestureRecognizer * tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImageMethod:)];
        tapGR.view.tag = imageView.tag;
        [imageView addGestureRecognizer:tapGR];
        
    }
    
}
-(void)clickImageMethod:(UITapGestureRecognizer*)recognizer{
    NSInteger clickTag = recognizer.view.tag;
    [self.delegate imageViewDidClick: clickTag];
}
-(void)creatTimer {
    self.bannerTimer = [NSTimer scheduledTimerWithTimeInterval:timerInterval
                                              target:self
                                            selector:@selector(changeScrollOffset)
                                            userInfo:nil
                                             repeats:YES];
    // 调整timer 的优先级
    NSRunLoop *mainLoop = [NSRunLoop mainRunLoop];
    [mainLoop addTimer:self.bannerTimer forMode:NSRunLoopCommonModes];
}
- (void)changeScrollOffset {
//    NSLog(@"%ld",(long)self.bannerpageC.currentPage);

    [self.bannerScrollView setContentOffset:CGPointMake((self.bannerpageC.currentPage+1) * scrWidth, 0) animated:YES];
}
- (void)stopTimer
{
    [self.bannerTimer invalidate];
    self.bannerTimer = nil;
}
 
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint point = scrollView.contentOffset;
    BOOL isRight = _oldScrollOffset < point.x;
    self.oldScrollOffset = point.x;
    // 调整pageControl的当前 位置
    if (point.x > scrWidth*(self.imgArr.count-1)+scrWidth*0.5 && !self.bannerTimer){
        self.bannerpageC.currentPage = 0;
    }else if (point.x > scrWidth*(self.imgArr.count-1) && self.bannerTimer && isRight){
        self.bannerpageC.currentPage = 0;
    }else{
//        NSLog(@"%f",(point.x+scrWidth*0.5)/ scrWidth);
        self.bannerpageC.currentPage = (point.x+scrWidth*0.5)/ scrWidth;
    }
    //处理两种情况，1、当偏移量超出scrollView contentSize最大值时 2、当偏移量小于零时
    if (point.x >= scrWidth*self.imgArr.count) {
        [scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
    }else if (point.x < 0) {
        [scrollView setContentOffset:CGPointMake(point.x+scrWidth*(self.imgArr.count), 0) animated:NO];
    }
}
/**
 手指开始拖动的时候, 就让计时器停止
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self stopTimer];
 }
/**
 手指离开屏幕的时候, 就让计时器开始工作
 */
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    [self creatTimer];
}
 
@end
