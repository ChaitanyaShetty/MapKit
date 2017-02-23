//
//  ViewController.h
//  Mapkit
//
//  Created by chaitanya on 24/09/16.
//  Copyright © 2016 chaitanya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate>
{
    int oldValue;
}
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)ChangeMap:(id)sender;

@end

