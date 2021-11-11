//
//  goodsTypeView.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/14.
//

#import "goodsTypeView.h"
 #import "productSKUModel.h"
@implementation goodsTypeView
-(id)initWithFrame:(CGRect)frame{
    if (self==[super initWithFrame:frame]) {
        self.frame = frame;
      
    }
    return self;
}
 
-(void)createTypeView:(productDetailModel*)textModel{
//    self.frameModel = [[goodsTypeFrameModel alloc] init];
//    self.frameModel.maxTypeScrollViewHeight =0.720982*ScreenHeight;
//    self.frameModel.textModel = textModelArr[0];
//    [self.frameModel setTypeViewFrames:self.frameModel.textModel];
     productSKUModel* model = textModel.typeArr[0];
    self.shadowView = [[UIView alloc] initWithFrame:self.frame];
    self.shadowView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    [self addSubview:self.shadowView];
    UITapGestureRecognizer * rec = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMethod)];
    [self.shadowView addGestureRecognizer:rec];
    _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, ScreenWidth, 0.720982*ScreenHeight)];
    _bgView.backgroundColor = [UIColor whiteColor];
    [self.shadowView addSubview:_bgView];
    [UIView animateWithDuration:0.5 animations:^{
        self->_bgView.frame = CGRectMake(0, self.frame.size.height-0.720982*ScreenHeight, ScreenWidth, 0.720982*ScreenHeight);
    }];
    
    UIImageView * imageV = [[UIImageView alloc] initWithFrame:CGRectMake(16, 14, 58, 58)];
    [imageV sd_setImageWithURL:[NSURL URLWithString: model.pic]];
    [self.bgView addSubview:imageV];
    
    UIScrollView * myScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageV.frame)+28, ScreenWidth, _bgView.frame.size.height-55.5-(CGRectGetMaxY(imageV.frame)+28))];
    myScrollview.contentSize = CGSizeMake(ScreenWidth, 700);
//    myScrollview.backgroundColor = SelectColor;
    [self.bgView addSubview:myScrollview];
    if (model.spec1Val.length>0) {
        UILabel * typeL = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, [commonMethod widthAuto:model.spec1Val fontSize:15 contentheight:14], 14)];
        typeL.text = model.spec1Val;
        typeL.font = FontSize(15);
        [myScrollview addSubview:typeL];
        NSMutableArray *textModelArr = textModel.spec1List;
        UIView * typeView = [[UIView alloc] initWithFrame:CGRectMake(16, CGRectGetMaxY(typeL.frame)+11, ScreenWidth-32, 30+(textModelArr.count-1)*11)];
    //    typeView.backgroundColor = SelectColor;
        [myScrollview addSubview:typeView];
        
        for (int i=0; i<textModelArr.count; i++) {
            
            CGSize size =  [commonMethod sizeWithText:textModelArr[i] sizeWithWidth:ScreenWidth-52 sizeWithFont:FontSize(14)];
    //        CGFloat height=size.height<30?30:size.height;
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0, CGRectGetMaxY(self.selectButton.frame)+11, size.width+20 , 30);
            [button setTitle:textModelArr[i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setBackgroundColor:SelectColor];
            button.titleLabel.font = FontSize(14);
            button.clipsToBounds = YES;
            button.layer.cornerRadius = 5;
    //        button.titleLabel.numberOfLines = 0;
            [typeView addSubview:button];
            self.selectButton = button;
        }
    }
    
    if (model.spec2Val.length>0) {
//        UILabel * typeL = [[UILabel alloc] initWithFrame:CGRectMake(16, CGRectGetMaxY(<#CGRect rect#>), [commonMethod widthAuto:model.spec2Val fontSize:15 contentheight:14], 14)];
//        typeL.text = model.spec1Val;
//        typeL.font = FontSize(15);
//        [myScrollview addSubview:typeL];
//        NSMutableArray *textModelArr = textModel.spec1List;
//        UIView * typeView = [[UIView alloc] initWithFrame:CGRectMake(16, CGRectGetMaxY(typeL.frame)+11, ScreenWidth-32, 30+(textModelArr.count-1)*11)];
//    //    typeView.backgroundColor = SelectColor;
//        [myScrollview addSubview:typeView];
//
//        for (int i=0; i<textModelArr.count; i++) {
//
//            CGSize size =  [commonMethod sizeWithText:textModelArr[i] sizeWithWidth:ScreenWidth-52 sizeWithFont:FontSize(14)];
//    //        CGFloat height=size.height<30?30:size.height;
//            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
//            button.frame = CGRectMake(0, CGRectGetMaxY(self.selectButton.frame)+11, size.width+20 , 30);
//            [button setTitle:textModelArr[i] forState:UIControlStateNormal];
//            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//            [button setBackgroundColor:SelectColor];
//            button.titleLabel.font = FontSize(14);
//            button.clipsToBounds = YES;
//            button.layer.cornerRadius = 5;
//    //        button.titleLabel.numberOfLines = 0;
//            [typeView addSubview:button];
//            self.selectButton = button;
//        }
    }
    
}
-(void)tapMethod{
    [UIView animateWithDuration:0.5 animations:^{
        self->_bgView.frame = CGRectMake(0, self.frame.size.height, ScreenWidth, 0.720982*ScreenHeight);
    } completion:^(BOOL finished) {
        [[NSNotificationCenter defaultCenter ] postNotificationName:@"hiddenTypeView" object:nil userInfo:nil];
    }];
    
}
@end
