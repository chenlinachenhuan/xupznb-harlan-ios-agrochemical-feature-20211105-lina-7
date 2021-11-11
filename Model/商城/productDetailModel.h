//
//  productDetailModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface productDetailModel : NSObject
@property(nonatomic,retain)NSString * name;
@property(nonatomic,retain)NSString * shopId;
@property(nonatomic,retain)NSMutableArray * albumPics;
@property(nonatomic,retain)NSString * marketMinPrice;
@property(nonatomic,retain)NSString * marketMaxPrice;
@property(nonatomic,retain)NSString * mallMinPrice;
@property(nonatomic,retain)NSString * mallMaxPrice;
@property(nonatomic,retain)NSString * isSelf;

@property(nonatomic,retain)NSString * saleNum;
@property(nonatomic,retain)NSString * departure;
@property(nonatomic,retain)NSString * collectionStatus;
@property(nonatomic,retain)NSString * appraiseNum;
 
@property(nonatomic,retain)NSString * shopIcon;
@property(nonatomic,retain)NSString * shopName;
@property(nonatomic,retain)NSString * productNum;
@property(nonatomic,retain)NSString * productNewNum;
@property(nonatomic,retain)NSString * freight;
@property(nonatomic,retain)NSString * marketPrice;
@property(nonatomic,retain)NSString * collectionNum;
@property(nonatomic,retain)NSString * mallPrice;
@property(nonatomic,retain)NSString * myId;
@property(nonatomic,retain)NSString *spec1Val;

@property(nonatomic,retain)NSMutableArray *typeArr;
@property(nonatomic,retain)NSMutableArray * spec1List;
@property(nonatomic,retain)NSMutableArray * spec2List;
@property(nonatomic,retain)NSMutableArray * spec3List;
@property(nonatomic,retain)NSMutableArray *guaranteeBaseList;
@property(nonatomic,retain)NSMutableArray *attributeList;

-(id)initWithData:(NSDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
