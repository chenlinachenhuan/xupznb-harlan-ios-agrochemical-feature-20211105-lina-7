//
//  carCellTableViewCell.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/26.
//

#import "carCellTableViewCell.h"
 
@implementation carCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self.selectButton addTarget:self action:@selector(cellSelectButtonMethod:) forControlEvents:UIControlEventTouchUpInside];
//    self.selectButton.clipsToBounds = YES;
//    self.selectButton.layer.cornerRadius = 8;
//    self.selectButton.layer.borderWidth = 0.5;
//    self.selectButton.layer.borderColor = UIColorFromRGB(0xCCCCCC).CGColor;
//    [self.selectButton addTarget:self action:@selector(selectBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)cellSelectButtonMethod:(cartButton*)button{
    button.selected = !button.selected;
    
    if (self.cellSelectedBlock) {
        self.cellSelectedBlock(button.selected);
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma mark - public method
- (void)reloadDataWithModel:(cartProductModel*)model {
    
    [self.cellImageV sd_setImageWithURL:[NSURL URLWithString:model.pic]];
    self.titleL.text = model.name;
    self.moneyL.text = [NSString stringWithFormat:@"%@",model.mallPrice];
    self.typeNameL.text = model.spec1;
    self.countL.text = [NSString stringWithFormat:@"x%ld",(long)[model.quantity integerValue]];
//    self.sizeLabel.text = model.sizeStr;
    self.selectButton.selected = model.select;
}


//- (void)cellSelectedWithBlock:(DWQCellSelectedBlock)block {
////    cellSelectedBlock = block;
//}
#pragma mark - 重写setter方法
- (void)setDwqNumber:(NSInteger)dwqNumber {
    _dwqNumber = dwqNumber;
    
//    self.numberLabel.text = [NSString stringWithFormat:@"%ld",(long)dwqNumber];
}

 
#pragma mark - 按钮点击方法
- (void)selectBtnClick:(UIButton*)button {
    button.selected = !button.selected;
     
//    if (cellSelectedBlock) {
//        cellSelectedBlock(button.selected);
//    }
}
- (void)setDwqSelected:(BOOL)dwqSelected {
    _dwqSelected = dwqSelected;
    self.selectButton.selected = dwqSelected;
    
}
 
@end
