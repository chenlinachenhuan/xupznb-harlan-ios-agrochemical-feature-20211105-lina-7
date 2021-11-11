//
//  NSMutableArray+CLNArray.m
//  Agrochemical
//
//  Created by HarLan on 2021/10/29.
//

#import "NSMutableArray+CLNArray.h"

@implementation NSMutableArray (CLNArray)
- (id)objectAtIndexCheck:(NSUInteger)index{
    if (index >= self.count) {
            return  nil;
        }
        
        id value = [self objectAtIndex:index];
        if (value == [NSNull null]) {
            return  nil;
        }
        return value;
}
@end
