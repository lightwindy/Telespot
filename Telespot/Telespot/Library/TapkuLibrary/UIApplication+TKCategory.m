//
//  UIApplication+TKCategory.m
//  Created by Devin Ross on 4/6/15.
//
/*
 
 tapku || http://github.com/devinross/tapkulibrary
 
 Permission is hereby granted, free of charge, to any person
 obtaining a copy of this software and associated documentation
 files (the "Software"), to deal in the Software without
 restriction, including without limitation the rights to use,
 copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the
 Software is furnished to do so, subject to the following
 conditions:
 
 The above copyright notice and this permission notice shall be
 included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import "UIApplication+TKCategory.h"

@implementation UIApplication (TKCategory)

- (void) openGoogleMapURLWithCoordinate:(CLLocationCoordinate2D)coordinates query:(NSString*)query{
    
    NSString *endpoint = @"http://maps.google.com/maps?ll=%@&q=%@";
    
    if([self canOpenURL:[NSURL URLWithString:@"comgooglemaps://?center="]])
        endpoint = @"comgooglemaps://?center=%@&q=%@";

    NSString *latlong = [[NSString stringWithFormat:@"%@,%@",@(coordinates.latitude),@(coordinates.longitude)] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSString *url = [NSString stringWithFormat:endpoint,latlong,[query stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    
}

- (void) openAppleMapURLWithCoordinate:(CLLocationCoordinate2D)coordinates query:(NSString*)query{
    
    NSString *endpoint = @"http://maps.apple.com/maps?ll=%@&q=%@";
    
    NSString *latlong = [[NSString stringWithFormat:@"%@,%@",@(coordinates.latitude),@(coordinates.longitude)] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSString *url = [NSString stringWithFormat:endpoint,latlong,[query stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    
}

@end