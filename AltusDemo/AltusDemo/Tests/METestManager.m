//  Copyright (c) 2014 BA3, LLC. All rights reserved.
#import "METestManager.h"
#import "Maps/Maps.h"
#import "Markers/Markers.h"
#import "Weather/Weather.h"
#import "Terrain/Terrain.h"
#import "UserInteraction/UserInteraction.h"
#import "HeightProfiling/HeightProfiling.h"

@implementation METestManager

- (id) initWithMEMapViewController:(MEMapViewController*) meMapViewController{
    
    if(self = [super init]){
        self.meMapViewController = meMapViewController;
        self.meTestCategories = [[NSMutableArray alloc]init];
        [self createAllTests];
    }
    return self;
    
}

- (void) startInitialTest{
    [self startTestInCategory:@"Terrain" withName:@"Earth"];
}

- (void) stopBaseMapTests{
    [self stopCategory:@"Terrain"];
    [self stopCategory:@"Raster Maps"];
    [self stopCategory:@"Vector Maps"];
}

- (void) stopCategory:(NSString*) categoryName{
    METestCategory* category = [self categoryWithName:categoryName];
    if(category!=nil){
        [category stopAllTests];
    }
}

- (void) stopAllTests{
    for(METestCategory* category in self.meTestCategories){
        [category stopAllTests];
	}
}

- (void) addCategory:(METestCategory*) newCategory{
    newCategory.meMapViewController = self.meMapViewController;
    newCategory.meTestManager = self;
    [self.meTestCategories addObject:newCategory];
}

- (METestCategory*) categoryWithName:(NSString*) categoryName{
	for(METestCategory* category in self.meTestCategories){
		if([category.name isEqualToString:categoryName])
			return category;
	}
	return nil;
}

- (void) createAllTests{
    [self createHeightProfilingTests];
    [self createUserInteractionTests];
    [self createTerrainTests];
    [self createRasterMapTests];
    [self createVectorMapTests];
    [self createVirtualVectorMapTests];
    [self createMarkerTests];
    [self createDynamicMarkerTests];
    [self createWeatherTests];
}

- (void) createHeightProfilingTests{
    METestCategory* testCategory = [[METestCategory alloc]init];
    testCategory.name = @"Height Profiling";
    [self addCategory:testCategory];
    [testCategory addTestClass:[FF254205 class]];
    [testCategory addTestClass:[TerrainRadiusPerf class]];
    [testCategory addTestClass:[TerrainRadiusPerfCached class]];
    [testCategory addTestClass:[TerrainRadiusPerfCachedBigRadius class]];
    [testCategory addTestClass:[TerrainProfileVeryClose class]];
	[testCategory addTestClass:[TerrainInRadiusTest class]];
	[testCategory addTestClass:[TerrainMinMaxInBounds2 class]];
	[testCategory addTestClass:[TerrainMinMaxInBounds3 class]];
	[testCategory addTestClass:[TerrainMinMaxInBoundsA class]];
    [testCategory addTestClass:[TerrainMinMaxInBoundsB class]];
    [testCategory addTestClass:[TerrainMinMaxInBoundsC class]];
	[testCategory addTestClass:[TerrainProfileBasicTest class]];
	[testCategory addTestClass:[TerrainProfileHighToLow class]];
	[testCategory addTestClass:[TerrainProfileLowToHigh class]];
	[testCategory addTestClass:[TerrainProfileDeathValley class]];
	[testCategory addTestClass:[TerrainProfileAntiMeridian class]];
	[testCategory addTestClass:[TerrainProfileMtRanier class]];
    [testCategory addTestClass:[TerrainProfileMtRanierAcuteA class]];
    [testCategory addTestClass:[TerrainProfileMtRanierAcuteB class]];
    [testCategory addTestClass:[TerrainProfileMtRanierObtuseA class]];
    [testCategory addTestClass:[TerrainProfileMtRanierObtuseB class]];
	[testCategory addTestClass:[TerrainProfileMtRanierSpiral class]];
	[testCategory addTestClass:[TerrainProfileMtRanierZigZag class]];
	[testCategory addTestClass:[TerrainProfileArctic class]];
	[testCategory addTestClass:[TerrainProfileGrandCanyon class]];
    [testCategory addTestClass:[TerrainProfileGrandCanyonVeryShort class]];
	[testCategory addTestClass:[TerrainProfileAtlanticOcean class]];
	[testCategory addTestClass:[TerrainProfileEastBoundFlight class]];
	[testCategory addTestClass:[TerrainProfileMtRanierScan class]];
	[testCategory addTestClass:[TerrainProfileSeattleScan class]];
	[testCategory addTestClass:[ShowObstacles class]];
	[testCategory addTestClass:[ShowObstacles2 class]];
	[testCategory addTestClass:[ShowObstacles3 class]];
	[testCategory addTestClass:[ShowObstacles4 class]];
	[testCategory addTestClass:[ShowObstacles5 class]];
	[testCategory addTestClass:[ShowObstacles6 class]];
	[testCategory addTestClass:[TerrainMinMaxInBounds class]];
	[testCategory addTestClass:[TerrainMinMaxAroundLocation class]];
}

- (void) createUserInteractionTests{
    METestCategory* testCategory = [[METestCategory alloc]init];
    testCategory.name = @"User Interaction";
    [self addCategory:testCategory];
    [testCategory addTestClass:[MultiView class]];
    [testCategory addTestClass:[RoutePlanning class]];
}

- (void) createRasterMapTests{
    METestCategory* testCategory = [[METestCategory alloc]init];
    testCategory.name = @"Raster Maps";
    [self addCategory:testCategory];
    [testCategory addTestClass:[AltusRasterPackage class]];
    [testCategory addTestClass:[MapQuestAerial class]];
    [testCategory addTestClass:[MapBoxSatellite class]];
    [testCategory addTestClass:[MapBoxStreets class]];
    [testCategory addTestClass:[MBTilesNative class]];
    [testCategory addTestClass:[BA3NativeAcadia class]];
}

- (void) createVectorMapTests{
    METestCategory* testCategory = [[METestCategory alloc]init];
    testCategory.name = @"Vector Maps";
    [self addCategory:testCategory];
    [testCategory addTestClass:[AltusVectorPackage class]];
    [testCategory addTestClass:[WorldSimple class]];
    [testCategory addTestClass:[HoustonStreetsStyle1 class]];
    [testCategory addTestClass:[HoustonStreetsStyle2 class]];
    [testCategory addTestClass:[HoustonStreetsStyle3 class]];
}

- (void) createVirtualVectorMapTests{
    METestCategory* testCategory = [[METestCategory alloc]init];
    testCategory.name = @"Virtual Vector Maps";
    [self addCategory:testCategory];
    [testCategory addTestClass:[VectorGrid class]];
}

- (void) createMarkerTests{
    METestCategory* testCategory = [[METestCategory alloc]init];
    testCategory.name = @"Markers";
    [self addCategory:testCategory];
    [testCategory addTestClass:[CustomClustering class]];
    [testCategory addTestClass:[Places class]];
    [testCategory addTestClass:[PlacesFancyLabels class]];
    [testCategory addTestClass:[Towers class]];
}

- (void) createDynamicMarkerTests{
    METestCategory* testCategory = [[METestCategory alloc]init];
    testCategory.name = @"Dynamic Markers";
    [self addCategory:testCategory];
    [testCategory addTestClass:[AirTrafficScenario class]];
}

- (void) createWeatherTests{
    METestCategory* testCategory = [[METestCategory alloc]init];
    testCategory.name = @"Weather";
    [self addCategory:testCategory];
    [testCategory addTestClass:[WorldSamples class]];
    [testCategory addTestClass:[ColorMosaicTest class]];
}

- (void) createTerrainTests {
    METestCategory* testCategory = [[METestCategory alloc]init];
    testCategory.name = @"Terrain";
    [self addCategory:testCategory];
	[testCategory addTestClass:[Earth class]];
    [testCategory addTestClass:[DynamicColorBar class]];
}

- (void) startTestInCategory:(NSString*) categoryName
                    withName:(NSString*) testName{
    METestCategory* category = [self categoryWithName:categoryName];
    if(category==nil){
        NSLog(@"Category %@ not found. Exiting.", categoryName);
        exit(0);
    }
    [category startTestWithName:testName];
}

- (METest*) testInCategory:(NSString*) categoryName
                  withName:(NSString*) testName{
    METestCategory* category = [self categoryWithName:categoryName];
    if(category==nil){
        NSLog(@"Category %@ not found. Exiting.", categoryName);
        exit(0);
    }
    return [category testWithName:testName];
}

@end
