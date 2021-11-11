//
//  trendtabelView.m
//  Agrochemical
//
//  Created by HarLan on 2021/9/15.
//

#import "trendImageView.h"
#import "trendModel.h"
@implementation trendImageView
-(id)initWithFrame:(CGRect)frame {
    if ([ super initWithFrame:frame]) {
         
    }
    return self;
}
 
-(void)imageFrame:(CGRect)frame imageArr:(NSMutableArray *)imageArr{
    self.imageArr = imageArr;
    if (imageArr.count!=0) {
        if (imageArr.count==1) {
            UIImageView * image  = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,frame.size.width, frame.size.height)];
            image.tag = 1000;
            image.userInteractionEnabled = YES;
            [self createImageVTapGesture:image];
            [image sd_setImageWithURL:imageArr[0]];
            [self addSubview:image];
        }else if (imageArr.count<=3) {
            for (int i=0; i<imageArr.count; i++) {
                UIImageView * image  = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width/imageArr.count+3)*i, 0,frame.size.height, frame.size.height)];
                [image sd_setImageWithURL:imageArr[i]];
                image.tag = 1000+i;
                image.userInteractionEnabled = YES;
                [self createImageVTapGesture:image];
                [self addSubview:image];
            }
        }else if (imageArr.count>3&&imageArr.count<=6) {
            for (int i=0; i<imageArr.count; i++) {
                UIImageView * image;
                if (i<3) {
                    image  = [[UIImageView alloc] initWithFrame:CGRectMake(((frame.size.width-6)/3+3)*i, 0,(frame.size.width-6)/3, (frame.size.height-3)/2)];
                    [image sd_setImageWithURL:imageArr[i]];
                    [self addSubview:image];
                }else{
                    image  = [[UIImageView alloc] initWithFrame:CGRectMake(((frame.size.width-6)/3+3)*(i-3), (frame.size.height-3)/2+3,(frame.size.width-6)/3, (frame.size.height-3)/2)];
                    [image sd_setImageWithURL:imageArr[i]];
                    [self addSubview:image];
                }
                image.tag = 1000+i;
                image.userInteractionEnabled = YES;
                [self createImageVTapGesture:image];
            }
        }else if (imageArr.count>6&&imageArr.count<=9) {
            for (int i=0; i<imageArr.count; i++) {
                UIImageView * image;
                if (i<3) {
                    image  = [[UIImageView alloc] initWithFrame:CGRectMake(((frame.size.width-6)/3+3)*i, 0,(frame.size.width-6)/3, (frame.size.height-6)/3)];
                    [image sd_setImageWithURL:imageArr[i]];
                    [self addSubview:image];
                }else if(i<6){
                    image  = [[UIImageView alloc] initWithFrame:CGRectMake(((frame.size.width-6)/3+3)*(i-3), (frame.size.height-6)/3+3,(frame.size.width-6)/3, (frame.size.height-6)/3)];
                    [image sd_setImageWithURL:imageArr[i]];
                    [self addSubview:image];
                }else{
                    image  = [[UIImageView alloc] initWithFrame:CGRectMake(((frame.size.width-6)/3+3)*(i-6), ((frame.size.height-6)/3+3)*2,(frame.size.width-6)/3, (frame.size.height-6)/3)];
                    [image sd_setImageWithURL:imageArr[i]];
                    [self addSubview:image];
                }
                image.tag = 1000+i;
                image.userInteractionEnabled = YES;
                [self createImageVTapGesture:image];
            }
        }
    }else{
        
    }
   
}
-(void)createImageVTapGesture:(UIImageView*)imageV{
    NSLog(@"%ld",(long)imageV.tag);
    UITapGestureRecognizer * Recognizer = [[UITapGestureRecognizer alloc] init];
    Recognizer.view.tag = imageV.tag;
    [Recognizer addTarget:self action:@selector(showScorllViewMethod:)];
    [imageV addGestureRecognizer:Recognizer];
}
-(void)creatImageView{
    UIScrollView *imageScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight+TopHeight+49)];
    imageScroll.backgroundColor = [UIColor blackColor];
    imageScroll.contentSize = CGSizeMake(ScreenWidth * self.imageArr.count, ScreenHeight);
    imageScroll.pagingEnabled = YES;
    imageScroll.bounces = NO;
    imageScroll.alpha = 0;
    imageScroll.delegate = self;
    self.imageScroll = imageScroll;
    imageScroll.userInteractionEnabled = YES;
    [[UIApplication sharedApplication].keyWindow addSubview:imageScroll];
    for (int i = 0; i < self.imageArr.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake( ScreenWidth * i, (ScreenHeight - ScreenWidth) / 2, ScreenWidth, ScreenWidth)];
        [imageView sd_setImageWithURL:self.imageArr[i]];
        imageView.userInteractionEnabled = YES;
        [imageScroll addSubview:imageView];
    }
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.frame = CGRectMake(0, ScreenHeight - 50, ScreenWidth, 20);
    pageControl.numberOfPages = self.imageArr.count;
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
-(void)showScorllViewMethod:(UITapGestureRecognizer*)Recognizer{
 
    [self creatImageView];
    self.imageScroll.contentOffset  = CGPointMake((Recognizer.view.tag-1000)*ScreenWidth, 0);

    [UIView animateWithDuration:0.5 animations:^{
        self.imageScroll.alpha = 1;
         self.pageControl.currentPage =Recognizer.view.tag-1000;
        if (self.imageArr.count==1) {
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
