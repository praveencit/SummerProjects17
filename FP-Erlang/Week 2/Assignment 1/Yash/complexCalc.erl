-module(complexCalc).
-import(math,[atan/1,sin/1,cos/1,pow/2,pi/0]).
-import(io,[format/2]).
-export([add/4,subtract/4,multiply/4,divide/4,arg/1,argInv/1,absolute/1,print/1]).
add(R1,I1,R2,I2)->
	[(R1+R2),(I1+I2)].
subtract(A1,B1,A2,B2)->
	add(A1,B1,-A2,-B2).
multiply(R1,I1,R2,I2)->
	add(R1*R2,I2*R1,-I1*I2,I1*R2).
divide(R1,I1,R2,I2)->
	[A1,B1]=subtract(R2,0,0,I2),
	[X,Y]=multiply(R1,I1,A1,B1),
	[A,_]=multiply(R2,I2,A1,B1),
	[X/A,Y/A].
arg([X,Y])->math:atan(Y/X)*180/pi().
argInv(Z)->[math:cos(Z),math:sin(Z)].
absolute([A,B])->math:sqrt(pow(A,2)+pow(B,2)).
print([A,B])->
	io:format("Number:~p+(~p)i~nReal Component:~p~nImaginary Component:~p~nArgument:~p~nMagnitude:~p~n",[A,B,A,B,arg([A,B]),absolute([A,B])]).
