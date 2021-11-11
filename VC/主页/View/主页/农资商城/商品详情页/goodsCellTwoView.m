//
//  goodsCellTwoView.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/12.
//

#import "goodsCellTwoView.h"
#import "goodsTypeView.h"
#import "productSKUModel.h"
#import "guaranteeBaseListModel.h"
@implementation goodsCellTwoView
-(id)init{
    if (self==[super init]) {
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 5;
    }
    return self;
}
-(void)createCellTwoView:(goodsCellTwoFrameModel *)frameModel{
    productSKUModel * model = frameModel.textModel.typeArr[0];
    self.frameModel = frameModel;
    UILabel * label1 = [[UILabel alloc] init];
    label1.frame = frameModel.label1Frame;
    label1.text = @"选择";
    label1.font = FontSize(14);
    label1.textColor = CommonColor;
    [self addSubview:label1];
    
    UILabel * typeL = [[UILabel alloc] init];
    typeL.frame = frameModel.typeLFrame;
    typeL.text = model.spec1Val;
    typeL.font = FontSize(14);
//    typeL.textColor = CommonColor;
    [self addSubview:typeL];
    
    self.typeTextL = [[UILabel alloc] init];
    self.typeTextL.frame = frameModel.typeTextLFrame;
    self.typeTextL.text = @"这里是规格名称";
    self.typeTextL.font = FontSize(14);
//    typeL.textColor = CommonColor;
    [self addSubview:self.typeTextL];
    
    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = frameModel.button1Frame;
    [button1 setBackgroundImage:[UIImage imageNamed:@"查看更多"] forState:UIControlStateNormal];
    button1.tag = 100;
    [button1 addTarget:self action:@selector(buttonClickMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button1];
    
    self.typeV = [[UIView alloc] init];
    self.typeV.frame = frameModel.typeVFrame;
//    self.typeV.backgroundColor = SelectColor;
    [self addSubview:self.typeV];
    CGFloat allWidth = CGRectGetWidth(self.typeV.frame)-96-6;//计算规格的最大宽度
    CGFloat widthd = 0;
    NSMutableArray * typeArr = frameModel.textModel.typeArr;
    for (int i=0; i<typeArr.count; i++) {
        productSKUModel * textModel = typeArr[i];
        CGFloat width= [commonMethod widthAuto:textModel.spec1Val fontSize:14 contentheight:30]+20;//拿到每一个规格的宽度 +20是因为扩宽一点
        widthd =widthd + width;//每一个规格宽度相加
        if (widthd<allWidth-6*i)/*规格相加总长度<容量的最大长度-间隔宽度 创建button*/ {
            UIButton * typeVButton = [self createTypeButtonMethod:CGRectMake(recordX, 0, width, 30)];
            [typeVButton setTitle:textModel.spec1Val forState:UIControlStateNormal];
        }else/*如果第i个规格的x坐标+长度>总容量，则不创建*/{
            if (recordX==0)/*防止第一个button的长度大于总容量导致一个都不创建*/ {
                productSKUModel * textModel = typeArr[0];
                UIButton * typeVButton = [self createTypeButtonMethod:CGRectMake(0, 0, allWidth, 30)];
                [typeVButton setTitle:textModel.spec1Val forState:UIControlStateNormal];
            }
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(recordX, 0, 96, 30);
            [button setTitle:[NSString  stringWithFormat:@"共%lu个可选",(unsigned long)typeArr.count] forState:UIControlStateNormal];
            [button setTitleColor:CommonColor forState:UIControlStateNormal];
            [button setBackgroundColor:[UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0]];
            button.titleLabel.font = FontSize(14);
            [self.typeV addSubview:button];
        }
    }
// 
    
    UILabel * label2 = [[UILabel alloc] init];
    label2.frame = frameModel.label2Frame;
    label2.text = @"发货";
    label2.font = FontSize(14);
    label2.textColor = CommonColor;
    [self addSubview:label2];
    
    UILabel * addressL = [[UILabel alloc] init];
    addressL.frame = frameModel.addressLFrame;
    addressL.text = frameModel.textModel.departure;
    addressL.font = FontSize(14);
//    addressL.textColor = CommonColor;
    [self addSubview:addressL];
    
    UILabel * lineL = [[UILabel alloc] init];
    lineL.frame = frameModel.lineLFrame;
//    lineL.font = FontSize(14);
    lineL.backgroundColor = CommonColor;
    [self addSubview:lineL];
    
    UILabel * sendL = [[UILabel alloc] init];
    sendL.frame = frameModel.edFrame;
    sendL.text = [NSString stringWithFormat:@"快递:%@",model.freight];
    sendL.font = FontSize(14);
//    addressL.textColor = CommonColor;
    [self addSubview:sendL];
    
    UIButton * button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = frameModel.button2Frame;
    [button2 setBackgroundImage:[UIImage imageNamed:@"查看更多"] forState:UIControlStateNormal];
    button2.tag = 101;
    [button2 addTarget:self action:@selector(buttonClickMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button2];
    
    UILabel * label3 = [[UILabel alloc] init];
    label3.frame = frameModel.label3Frame;
    label3.text = @"保障";
    label3.font = FontSize(14);
    label3.textColor = CommonColor;
    [self addSubview:label3]; 
    
    UILabel * ensureL = [[UILabel alloc] init];
    ensureL.frame = frameModel.ensureFrame;
    NSMutableArray * arr = [[NSMutableArray alloc] init];
    for (guaranteeBaseListModel * model in frameModel.textModel.guaranteeBaseList) {
        [arr addObject:model.dictValue];
    }
    NSString * ensureStr = [arr componentsJoinedByString:@" · "];
    ensureL.text =ensureStr;
//    ensureL.backgroundColor = SelectColor;
    ensureL.numberOfLines = 0;
    ensureL.font = FontSize(14);
//    ensureL.textColor = CommonColor;
    [self addSubview:ensureL];
    
    UIButton * button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame = frameModel.button3Frame;
    [button3 setBackgroundImage:[UIImage imageNamed:@"查看更多"] forState:UIControlStateNormal];
    button3.tag = 102;
    [button3 addTarget:self action:@selector(buttonClickMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button3];
    
    UILabel * label4 = [[UILabel alloc] init];
    label4.frame = frameModel.label4Frame;
    label4.text = @"参数";
    label4.font = FontSize(14);
    label4.textColor = CommonColor;
    [self addSubview:label4];
    
    UILabel * parameterL = [[UILabel alloc] init];
//    NSDictionary * dic1 = frameModel.textModel.goodsparameterDic;
//    NSArray * arr1 = [dic1 allKeys];
//    parameterL.frame = frameModel.parameterFrame;
//    if (arr1.count==0) {
//        parameterL.text =@"无";
//    }else if(arr1.count<3){
//        for (NSString*str in arr1) {
//            parameterL.text =[NSString stringWithFormat:@"%@ ",str];
//        }
//    }else{
//        parameterL.text =[NSString stringWithFormat:@"%@ %@...",arr1[0],arr1[1]];
//    }
//    parameterL.font = FontSize(14);
    [self addSubview:parameterL];
    
    UIButton * button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    button4.frame = frameModel.button4Frame;
    [button4 setBackgroundImage:[UIImage imageNamed:@"查看更多"] forState:UIControlStateNormal];
    button4.tag = 103;
    [button4 addTarget:self action:@selector(buttonClickMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button4];
    
}
-(UIButton*)createTypeButtonMethod:(CGRect)frame{
    UIButton * typeVButton = [UIButton buttonWithType:UIButtonTypeCustom];
    typeVButton.frame = frame;
//    [typeVButton setTitle:typeArr[i] forState:UIControlStateNormal];
    [typeVButton setTitleColor:CommonColor forState:UIControlStateNormal];
    [typeVButton setBackgroundColor:[UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0]];
    typeVButton.titleLabel.font = FontSize(14);
    typeVButton.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    typeVButton.clipsToBounds = YES;
    typeVButton.layer.cornerRadius = 5;
    [typeVButton addTarget:self action:@selector(typeButtomMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.typeV addSubview:typeVButton];
    recordX =CGRectGetMaxX(typeVButton.frame)+6;
    return typeVButton;
}
#pragma mark查看更多button
-(void)buttonClickMethod:(UIButton*)button{
    
}
#pragma mark查看规格
-(void)typeButtomMethod{
    [[NSNotificationCenter defaultCenter ] postNotificationName:@"showGoodsType" object:self.frameModel.textModel userInfo:nil];
    
}
@end
