//
//  ViewController.m
//  Mapkit
//
//  Created by chaitanya on 24/09/16.
//  Copyright © 2016 chaitanya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapView.showsUserLocation = YES;
    self.mapView.delegate = self;
    CLLocationCoordinate2D annotationCoord;
    annotationCoord.latitude = 13.3202774;
    annotationCoord.longitude = 77.0215674;
    
    MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc]init];
    annotationPoint.coordinate = annotationCoord;
    annotationPoint.title = @"SSIT";
    annotationPoint.subtitle = @"Tumkur";
    [_mapView addAnnotation:annotationPoint];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)ChangeMap:(id)sender {
    if (_mapView.mapType == MKMapTypeStandard) {
        _mapView.mapType = MKMapTypeSatellite;
    } else {
        _mapView.mapType = MKMapTypeSatellite;
    }
}



-(IBAction)zoomOut
{
    MKCoordinateSpan span;
    span.latitudeDelta = _mapView.region.span.latitudeDelta * 2;
    span.longitudeDelta = _mapView.region.span.longitudeDelta * 2;
    MKCoordinateRegion region;
    region.span = span;
    region.center = _mapView.region.center;
    [self.mapView setRegion:region animated:YES];
    
}

-(IBAction)zoomIn
{
    MKCoordinateSpan span;
    span.latitudeDelta = _mapView.region.span.latitudeDelta / 2;
    span.longitudeDelta = _mapView.region.span.longitudeDelta/2;
    MKCoordinateRegion region;
    region.span = span;
    region.center = _mapView.region.center;
    [self.mapView setRegion:region animated:YES];
    
}

- (IBAction)didClickStepper:(UIStepper *)sender {
    int value = sender.value;
    if ( value > oldValue) {
        [self zoomIn];
    } else {
        [self zoomOut];
    }
    
    oldValue = value;
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    self.mapView.centerCoordinate = userLocation.location.coordinate;
}



@end
