/*

An enclosure and HQ camera module mount for the first-generation 7" Pi touchscreen
Jenny List 2025
CC-BY-SA 4.0

*/

$fn=90;

include <./square-HQ-camera-mounting-plate.scad>


module ScreenOutline(width,height,cornerRadius){
     hull() {
         translate([cornerRadius,cornerRadius,0]) circle(cornerRadius);
         translate([width-cornerRadius,cornerRadius,0]) circle(cornerRadius);
         translate([width-cornerRadius,height-cornerRadius,0]) circle(cornerRadius);
         translate([cornerRadius,height-cornerRadius,0]) circle(cornerRadius);
     }
    
}

module grip(){
    rotate_extrude(angle=180){
        translate([-20,0,0]){
            difference() {
                ScreenOutline(40,113,8);
                square([20,113]);
            }
        }
    }
}

// Main box chassis
module cameraChassis(){
    difference(){
        union(){
            linear_extrude(45.5){ //main box structure
                difference(){
                    ScreenOutline(195,113,8); 
                    translate([4,4,0]) ScreenOutline(187,105,3);
                }
            }
            translate([28.18,0,9]) cube([15,113,4]); //Mounting strap for screen
            translate([154.38,0,9]) cube([15,113,4]); //Mounting strap for screen      
            translate([8,8,35.5]) cylinder(10,8,8); //lugs for back mounting
            translate([187,8,35.5]) cylinder(10,8,8);
            translate([187,105,35.5]) cylinder(10,8,8);
            translate([8,105,35.5]) cylinder(10,8,8);
            translate([0,20,18.5]) cube([45,65,24]); //pi ports
            translate([116,84,19.5]) cube([22,29,12]); //pi power
            translate([87.5,98,15.5]) cube([20,15,20]); //tripod block    
        }
        translate([1,1,0]) linear_extrude(1.5) ScreenOutline(193,111,7); //cut out for screen glass
        translate([35.68,22.91,0]) cylinder(20,1.75,1.75); //screw holes for screen
        translate([35.68,88.56,0]) cylinder(20,1.75,1.75);
        translate([161.88,22.91,0]) cylinder(20,1.75,1.75);
        translate([161.88,88.56,0]) cylinder(20,1.75,1.75);
        translate([8,8,0]) cylinder(50,1,1); //holes in back mounting lugs for screw threads
        translate([187,8,5.5]) cylinder(45,1,1);
        translate([187,105,5.5]) cylinder(45,1,1);
        translate([8,105,5.5]) cylinder(45,1,1);
        translate([35.68,22.91,13.5]) cylinder(230,3.25,3.25);//access for screen screw
        translate([0,21,19.5]) cube([100,63,22]); //pi ports
        translate([117,82,20.5]) cube([20,100,10]); //pi power
        translate([97.5,113,25.5]) rotate([90,0,0]) cylinder(13.7,3.1,3.1);//tripod insert
    }
}

// rear panel with grips and camera face
module cameraGripPanel(){
    difference(){
        union(){
            linear_extrude(4) ScreenOutline(195,113,8); //main rear panel
            translate([20,113,4]) rotate([90,0,0]){ grip(); } //hand grips
            translate([175,113,4]) rotate([90,0,0]){ grip(); }
            translate([47.5,6.5,4]) linear_extrude(10) ScreenOutline(100,100,8); // pedestal for camera assembly
        }
        linear_extrude(1.5){ 
            difference(){
                translate([-0.25,-0.25,0])ScreenOutline(195.5,113.5,8.75); //cut out to fit back of box structure
                translate([4.25,4.25,0]) ScreenOutline(186.5,104.5,7);
            }
        }
        translate([8.25,8.25,0]) cylinder(1.5,8.25,8.25); //lugs for back mounting
        translate([186.75,8.25,0]) cylinder(1.5,8.25,8.25); 
        translate([186.75,104.75,0]) cylinder(1.5,8.25,8.25); 
        translate([8.25,104.75,0]) cylinder(1.5,8.25,8.25);
        translate([8,8,0]) cylinder(45,1.75,1.75); //holes in back mounting lugs
        translate([187,8,0]) cylinder(45,1.75,1.75);
        translate([187,105,0]) cylinder(45,1.75,1.75);
        translate([8,105,0]) cylinder(45,1.75,1.75);
        translate([8,8,4]) cylinder(45,3.5,3.5); //holes for screw heads
        translate([187,8,4]) cylinder(45,3.5,3.5);
        translate([187,105,4]) cylinder(45,3.5,3.5);
        translate([8,105,4]) cylinder(45,3.5,3.5);
        translate([57.5,16.5,0]) cube([80,80,20]); //cutout behind camera assembly
        translate([53.5,12.5,0]) cylinder(45,1,1); //holes in camera pedestal for screw threads
        translate([141.5,12.5,0]) cylinder(45,1,1);
        translate([141.5,100.5,0]) cylinder(45,1,1);
        translate([53.5,100.5,0]) cylinder(45,1,1);
    }
}

module HQCameraFrontPlate(){ //Camera plate
    difference(){
        translate([47.5,6.5,0]) linear_extrude(2.5) ScreenOutline(100,100,8);
        translate([70,29,0]) cube([55,55,2.5]); //cutout for pi camera mount
        translate([53.5,12.5,0]) cylinder(45,1.75,1.75); //holes for screws
        translate([141.5,12.5,0]) cylinder(45,1.75,1.75);
        translate([141.5,100.5,0]) cylinder(45,1.75,1.75);
        translate([53.5,100.5,0]) cylinder(45,1.75,1.75);
    }
    translate([97.5,56.5,1.25]) SquarePiHQcameraMountingPlateWithCollarHoles();
}

//Draw the three parts
cameraChassis();
translate([0,0,50]) cameraGripPanel();
translate([0,0,80]) HQCameraFrontPlate();

