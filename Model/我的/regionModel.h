//
//  regionModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface regionModel : NSObject
@property(nonatomic,retain)NSString*region;
@property(nonatomic,retain)NSString*firstWord;
@property(nonatomic,retain)NSString*level;
@property(nonatomic,retain)NSString*myId;

-(id)initWithData:(NSDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
