//
//  goodscustomBannerView.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/12.
//

#import "goodscustomBannerView.h"

@implementation goodscustomBannerView

-(id)initWithFrame:(CGRect)frame imageArr:(NSMutableArray*)imgArr{
    if (self=[super initWithFrame:frame]) {
         self.imgArr = imgArr;
        self.bannerHeight = self.frame.size.height;
        [self createHotBanner];
        
    }
    return self;
}
-(void)createHotBanner{
    
    self.bannerScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, self.bannerHeight)];
    self.bannerScrollView.delegate = self;
    self.bannerScrollView.contentSize = CGSizeMake((self.imgArr.count+1)*(ScreenWidth), 0);
    self.bannerScrollView.showsHorizontalScrollIndicator = NO;
    self.bannerScrollView.pagingEnabled = YES;
//    self.bannerScrollView.backgroundColor = [UIColor redColor];
    [self addSubview:self.bannerScrollView];
    
    for (int i = 0; i < self.imgArr.count+1; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*(ScreenWidth), 0, (ScreenWidth), self.bannerHeight)];
        if (i == self.imgArr.count) {
            [imageView sd_setImageWithURL:[NSURL URLWithString:self.imgArr[0]]];
        }else{
            [imageView sd_setImageWithURL:[NSURL URLWithString:self.imgArr[i]]];
        }
        imageView.tag = i;
        imageView.userInteractionEnabled = YES;
        [self.bannerScrollView addSubview:imageView];
        
        UITapGestureRecognizer * tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showScorllViewMethod:)];
        tapGR.view.tag = imageView.tag;
        [imageView addGestureRecognizer:tapGR];
        
    }
    _pageL = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth-52, CGRectGetMaxY(self.bannerScrollView.frame)-41, 42, 25)];
    _pageL.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    _pageL.clipsToBounds = YES;
    _pageL.layer.cornerRadius = 12;
    _pageL.textColor = [UIColor whiteColor];
    _pageL.textAlignment = NSTextAlignmentCenter;
    _pageL.font = FontSize(12);
    _pageL.text = [NSString stringWithFormat:@"1/%lu",(unsigned long)self.imgArr.count];
    [self addSubview:_pageL];
    
    
    self.bannerpageC = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.bannerScrollView.frame.size.height-16, ScreenWidth, 2)];
    self.bannerpageC.currentPage = 0;
    self.bannerpageC.numberOfPages = self.imgArr.count;
    self.bannerpageC.pageIndicatorTintColor =colorH(218, 221, 225);
    self.bannerpageC.currentPageIndicatorTintColor = colorH(98, 191, 180);
    [self addSubview:self.bannerpageC];
    self.bannerpageC.hidden = YES;
 }
 
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView==self.bannerScrollView) {
        CGPoint point = scrollView.contentOffset;
        BOOL isRight = self.oldScrollOffset < point.x;
        self.oldScrollOffset = point.x;
        // 调整pageControl的当前 位置
        if (point.x > ScreenWidth*(self.imgArr.count-1)+ScreenWidth*0.5 ){
            self.bannerpageC.currentPage = 0;
        }else if (point.x > ScreenWidth*(self.imgArr.count-1) && isRight){
            self.bannerpageC.currentPage = 0;
        }else{
//            NSLog(@"%f",(point.x+ScreenWidth*0.5)/ ScreenWidth);
            self.bannerpageC.currentPage = (point.x+ScreenWidth*0.5)/ ScreenWidth;
        }
        //处理两种情况，1、当偏移量超出scrollView contentSize最大值时 2、当偏移量小于零时
        if (point.x >= ScreenWidth*self.imgArr.count) {
            [scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
        }else if (point.x < 0) {
            [scrollView setContentOffset:CGPointMake(point.x+ScreenWidth*(self.imgArr.count), 0) animated:NO];
        }
        _pageL.text = [NSString stringWithFormat:@"%ld/%lu",(long)self.bannerpageC.currentPage+1,(unsigned long)self.imgArr.count];

    }else if(scrollView==self.imageScroll){
        CGFloat offSetX = scrollView.contentOffset.x;
         int number = offSetX / ScreenWidth;
        _pageControl.currentPage = number;
    }
    
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
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake( ScreenWidth * i, [UIScreen mainScreen].bounds.size.height/2-[UIScreen mainScreen].bounds.size.height*0.558*0.5, ScreenWidth, [UIScreen mainScreen].bounds.size.height*0.558)];
        [imageView sd_setImageWithURL:[NSURL URLWithString:self.imgArr[i]]];

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
    
    [self createTopView];
}
-(void)createTopView{
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backButton.frame = CGRectMake(16.5, TopHeight-20, 14, 14);
    [self.backButton setBackgroundImage:[UIImage imageNamed:@"关闭"] forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(scrTap:) forControlEvents:UIControlEventTouchUpInside];
    [[UIApplication sharedApplication].keyWindow addSubview:self.backButton];
    
    
}
-(void)createImageVTapGesture:(UIImageView*)imageV{
    NSLog(@"%ld",(long)imageV.tag);
    UITapGestureRecognizer * Recognizer = [[UITapGestureRecognizer alloc] init];
    Recognizer.view.tag = imageV.tag;
    [Recognizer addTarget:self action:@selector(showScorllViewMethod:)];
    [imageV addGestureRecognizer:Recognizer];
}
-(void)showScorllViewMethod:(UITapGestureRecognizer*)Recognizer{
 
    [self creatImageView];
    self.imageScroll.contentOffset  = CGPointMake((Recognizer.view.tag)*ScreenWidth, 0);

    [UIView animateWithDuration:0.5 animations:^{
        self.imageScroll.alpha = 1;
         self.pageControl.currentPage =Recognizer.view.tag;
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
        [self.backButton removeFromSuperview];
    }];
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    CGFloat offSetX = scrollView.contentOffset.x;
//     int number = offSetX / ScreenWidth;
//    _pageControl.currentPage = number;
//}
@end
