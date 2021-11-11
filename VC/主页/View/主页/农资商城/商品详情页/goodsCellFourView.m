//
//  goodsCellFourView.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/13.
//

#import "goodsCellFourView.h"

@implementation goodsCellFourView

-(id)init{
    if (self==[super init]) {
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 10;
       
    }
    return self;
}
 
-(void)createCellFourView:(goodsCellFOurFrameModel *)frameModel{
    UIImageView * bgImageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth-20, frameModel.cellHeight)];
    bgImageV.userInteractionEnabled = YES;
    bgImageV.image = [UIImage imageNamed:@"lADPDgfLS4sczknNAX_NAsY_710_383.jpg_720x720g.jpg"];
    [self addSubview:bgImageV];
    
    UIImageView * storeImageV = [[UIImageView alloc] init];
    storeImageV.frame = frameModel.imageVFrame;
    storeImageV.image = frameModel.textModel.storeImage;
    storeImageV.clipsToBounds = YES;
    storeImageV.layer.cornerRadius = 5;
    [bgImageV addSubview:storeImageV];
    
    UILabel * nameL = [[UILabel alloc] init];
    nameL.frame = frameModel.storeNameFrame;
    nameL.text = frameModel.textModel.storeNameStr;
    nameL.textColor = [UIColor whiteColor];
    nameL.font = [UIFont fontWithName:@"PingFang SC Medium" size:17];
    nameL.numberOfLines = 0;
    [bgImageV addSubview:nameL];
    
    UILabel * scoreL1 = [[UILabel alloc] init];
    scoreL1.frame = frameModel.scoreL1Frame;
    scoreL1.text = [NSString stringWithFormat:@"卖家服务 %@",frameModel.textModel.score1Str];
    scoreL1.textColor = [UIColor whiteColor];
    scoreL1.font = FontSize(10);
    [bgImageV addSubview:scoreL1];
    
    UILabel * scoreL2 = [[UILabel alloc] init];
    scoreL2.frame = frameModel.scoreL2Frame;
    scoreL2.text = [NSString stringWithFormat:@"物流服务 %@",frameModel.textModel.score2Str];
    scoreL2.textColor = [UIColor whiteColor];
    scoreL2.font = FontSize(10);
    [bgImageV addSubview:scoreL2];
    
    UILabel * allGoodsL = [[UILabel alloc] init];
    allGoodsL.frame = frameModel.allGoodsLFrame;
    allGoodsL.text = frameModel.textModel.allGoodsStr;
    allGoodsL.textColor = [UIColor whiteColor];
    allGoodsL.font = FontSize(15);
    [bgImageV addSubview:allGoodsL];
    
    UILabel * newGoodsL = [[UILabel alloc] init];
    newGoodsL.frame = frameModel.newGoodsLFrame;
    newGoodsL.text = frameModel.textModel.newgoodsStr;
    newGoodsL.textColor = [UIColor whiteColor];
    newGoodsL.font = FontSize(15);
    [bgImageV addSubview:newGoodsL];
    
    UILabel * collectionL = [[UILabel alloc] init];
    collectionL.frame = frameModel.collectionLFrame;
    collectionL.text = frameModel.textModel.collectionStr;
    collectionL.textColor = [UIColor whiteColor];
    collectionL.font = FontSize(15);
    [bgImageV addSubview:collectionL];
    
    UILabel * label1 = [[UILabel alloc] init];
    label1.frame = frameModel.label2Frame;
    label1.text = @"全部宝贝";
    label1.textColor = [UIColor whiteColor];
    label1.font = FontSize(12);
    [bgImageV addSubview:label1];
    
    UILabel * label2 = [[UILabel alloc] init];
    label2.frame = frameModel.label1Frame;
    label2.text = @"上新宝贝";
    label2.textColor = [UIColor whiteColor];
    label2.font = FontSize(12);
    [bgImageV addSubview:label2];
    
    UILabel * label3 = [[UILabel alloc] init];
    label3.frame = frameModel.label3Frame;
    label3.text = @"关注人数";
    label3.textColor = [UIColor whiteColor];
    label3.font = FontSize(12);
    [bgImageV addSubview:label3];
    
    UIButton * sorbButton = [UIButton buttonWithType:UIButtonTypeCustom];
    sorbButton.frame = frameModel.sortButtonFrame;
    [sorbButton setTitle:@"查看分类" forState:UIControlStateNormal];
    [sorbButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    sorbButton.clipsToBounds = YES;
    sorbButton.layer.cornerRadius = 14;
    sorbButton.backgroundColor = [UIColor whiteColor];
    sorbButton.titleLabel.font = FontSize(14);
    [sorbButton addTarget:self action:@selector(sortButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [bgImageV addSubview:sorbButton];
    
    UIButton * gotoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    gotoButton.frame = frameModel.goToButtonFrame;
    [gotoButton setTitle:@"进店逛逛" forState:UIControlStateNormal];
    [gotoButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    gotoButton.clipsToBounds = YES;
    gotoButton.layer.cornerRadius = 14;
    gotoButton.backgroundColor = [UIColor whiteColor];
    gotoButton.titleLabel.font = FontSize(14);
    [gotoButton addTarget:self action:@selector(gotoButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [bgImageV addSubview:gotoButton];
    
}
-(void)sortButtonMethod{
    
}
-(void)gotoButtonMethod{
    
}
@end
