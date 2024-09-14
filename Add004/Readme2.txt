How to Modify the tag system
In each of your characters cns where Data,Size,Velocity,Movement Constants etc are placed
you can set your own constants to define Hypers,Assists
;Copy these constants to your char main CNS file ONLY if that char differs from the standard stateno notation used by most Mugen char creators.
;These are very important to detect when combo and hyper switch can happen.

;I highly recommend to clone your favorite animation in Fighter Factory and extend the frametime of the animelem that has the red box.

;Copy them below [Movement] or [Quotes] parameters like this.

[Constants]
StateTagSuperAssist = 3000   ;Dual Hyper to Tag In
StateTagSuperAssist2  =3100  ;Second one
StateTagAssist = 1000  ;Sets your assist 
AnimAerialAttack=640
superAttacksStartStateno = 2000 ; the stateno that starts super attacks
superAttacksEndStateno = 3999 ; the stateno that ends super attacks
SpecialAttackAIStartStateno =1000
SpecialAttackAIEndStateno =1999
