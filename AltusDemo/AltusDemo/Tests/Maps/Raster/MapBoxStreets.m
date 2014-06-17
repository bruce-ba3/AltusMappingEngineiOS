//  Copyright (c) 2014 BA3, LLC. All rights reserved.
#import "MapBoxStreets.h"
#import "../../Utilities/MapFactory.h"
@implementation MapBoxStreets

-(id) init{
    if(self=[super init]){
        self.name = @"MapBox Streets - Raster";
        
        self.urlTemplate = @"http://{s}.tiles.mapbox.com/v3/dxjacob.map-s5qr595q/{z}/{x}/{y}.png";
    }
    return self;
}

- (void) beginTest{
    
    //Stop tests that obscure or affect this one
    [self.meTestManager stopBaseMapTests];
    
    //Add the map
    [self.meMapViewController addMapUsingMapInfo:
     [MapFactory createInternetMapInfo:self.meMapViewController
                               mapName:self.name
                           urlTemplate:self.urlTemplate
                            subDomains:@"a,b,c,d"
                              maxLevel:18
                                zOrder:2
                            numWorkers:3
                           enableAlpha:NO]];
}

- (void) endTest{
	[self.meMapViewController removeMap:self.name
							 clearCache:NO];
}


@end
