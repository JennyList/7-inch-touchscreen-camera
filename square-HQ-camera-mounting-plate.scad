/*

A flat square mounting plate for a Raspberry Pi HQ camera
Jenny List 2020
CC-BY-SA 4.0

*/
module SquarePiHQcameraMountingPlate(){
    //Recess for camera
    difference() {
        union(){ //camera plate and back box
            cube([55,55,2.5],true);
            translate([0,0,2.5]) cube([41,41,6],true);
        }
        translate([0,0,-0.5]) cube([36,36,10.5],true); //hollow it out  
        translate([0,16.75,0]) rotate([45,0,0]) cube([22,20,3.5],true); //somewhere for the cable
        translate([0,17.5,-1.25]) cube([25,2.5,10],true); // Extra space round connector
    }
    
    
    //screw pillars
    module cameraScrewPillar(angle=0){
        rotate(angle){
            difference() {
                union(){
                    cylinder(6,2.75,2.75,false);
                    translate([-3,-3,0]) linear_extrude(6) polygon(points=[[5,5],[5,0],[0,0],[0,5]]); 
                }
                cylinder(6,1,1,false);
            }
        } 
    }
    translate([-15,-15,-1.25]){
        cameraScrewPillar(0);
    }
    translate([15,-15,-1.25]){
        cameraScrewPillar(90);
    }
    translate([15,15,-1.25]){
        cameraScrewPillar(180);
    }
    translate([-15,15,-1.25]){
        cameraScrewPillar(270);
    }
}


//collar screw pillars
module collarScrewPillar(){
        union() {
            cylinder(6,5,5,false);
        }
}
//collar screw pillar holes
module collarScrewPillarHole(){
        union() {
            cylinder(6,1,1,false);
        }
}

module SquarePiHQcameraMountingPlateWithCollarHoles(tripodMarker=false){
    difference(){
        union(){
            SquarePiHQcameraMountingPlate();
            //four collar fixing pillars
            translate([0,0,-1.25]){
                translate([22.5,22.5,0]) collarScrewPillar();
                translate([22.5,-22.5,0]) collarScrewPillar();
                translate([-22.5,22.5,0]) collarScrewPillar();
                translate([-22.5,-22.5,0]) collarScrewPillar();
            }
        }
        
        //four collar fixing screws
        translate([0,0,-1.25]){
            translate([22.5,22.5,0]) collarScrewPillarHole();
            translate([22.5,-22.5,0]) collarScrewPillarHole();
            translate([-22.5,22.5,0]) collarScrewPillarHole();
            translate([-22.5,-22.5,0]) collarScrewPillarHole();
        }
    }
    //Show position of tripod mount ar 31mm y direction
    if(tripodMarker == true){
        translate([-9.5,31,-5.5]) cube([19,5,11]);
    }
}

//SquarePiHQcameraMountingPlateWithCollarHoles(tripodMarker=true);
