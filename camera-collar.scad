/*

A protective collar for a Raspberry Pi HQ camera
Jenny List 2020
CC-BY-SA 4.0

*/


module collarSolid() {
    translate([0,0,12.0]) cylinder(9.5,25,25,$fa=1,$fn=200,false);//upper collar
    cylinder(12.0,28.5,25,$fa=1,$fn=200,false);//conical skirt
    translate([-24.5,-24.5,0]) cube([49,49,2],false);  //skirt for screw holes
    //four collar fixing screws
    translate([22.5,22.5,1]) cylinder(2,3,3,$fn=90,true);
    translate([22.5,-22.5,1]) cylinder(2,3,3,$fn=90,true);
    translate([-22.5,22.5,1]) cylinder(2,3,3,$fn=90,true);
    translate([-22.5,-22.5,1]) cylinder(2,3,3,$fn=90,true);
}

module collarCutaway(){
    cylinder(22.5,19,19,$fn=200,false);
    translate([-5.25,-23.3,0]) cube([10.5,5.1,12.0],false);//clamp protrusion
    difference(){ //tripod mount protrusion
        translate([0,3.9,2]) rotate([0,0,45]) cube([25,25,10.0
    ],false);   
        translate([-24,15,2]) cube([10,30,10.0],false); 
        translate([14,15,2]) cube([10,30,10.0],false);
    }
    translate([-14,19.5,0]) cube([28,12.5,2],false); //bottom of tripod mount
    translate([-19.5,-19.5,0]) cube([39,39,2],false);  //pcb
    //four camera fixing screws
    translate([15,15,2.75]) cylinder(1.5,3,3,true);
    translate([15,-15,2.75]) cylinder(1.5,3,3,true);
    translate([-15,15,2.75]) cylinder(1.5,3,3,true);
    translate([-15,-15,2.75]) cylinder(1.5,3,3,true);
    //four collar fixing screws
    translate([22.5,22.5,2.5]) cylinder(5,1.25,1.25,$fn=90,true);
    translate([22.5,-22.5,2.5]) cylinder(5,1.25,1.25,$fn=90,true);
    translate([-22.5,22.5,2.5]) cylinder(5,1.25,1.25,$fn=90,true);
    translate([-22.5,-22.5,2.5]) cylinder(5,1.25,1.25,$fn=90,true);
    //Fil in leftover protrusion between camera fixing screw and tripod mount
    translate([-14.25,11.5,2]) cube([28.5,5,1.5],false);
}

//Combine both outer and cutaway
difference(){
    collarSolid();
    collarCutaway();
}

