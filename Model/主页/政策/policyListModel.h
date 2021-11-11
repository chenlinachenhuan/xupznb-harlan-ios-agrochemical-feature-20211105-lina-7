//
//  policyListModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface policyListModel : NSObject
@property(nonatomic,retain)NSString*myId;
@property(nonatomic,retain)NSString*title;
@property(nonatomic,retain)NSString*pic;
@property(nonatomic,retain)NSString*albumPics;
@property(nonatomic,retain)NSString*viewNum;
@property(nonatomic,retain)NSString*pubTime;
@property(nonatomic,retain)NSString*cat2Id;
@property(nonatomic,retain)NSString*cat2Name;
@property(nonatomic,retain)NSString*cropId;
@property(nonatomic,retain)NSString*cropName;
@property(nonatomic,retain)NSString*provinceId;
@property(nonatomic,retain)NSString*provinceDesc;
@property(nonatomic,retain)NSString*cityId;
@property(nonatomic,retain)NSString*cityDesc;
@property(nonatomic,retain)NSString*areaId;
@property(nonatomic,retain)NSString*areaDesc;
-(id)initWithData:(NSDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
