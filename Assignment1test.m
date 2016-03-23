% Function to test and show Assignment1 for CISC 472
% Created on Feb 2, 2016 by Eric Braun 10121660

function [] = Assignment1test()

fprintf('\n');
disp('Question 1, Cartesian System:');
fprintf('\n');
P1a = [0,0,0];
P2a = [1,0,0];
P3a = [0,1,0];
disp('CartesianSystem called on points [0,0,0],[1,0,0],[0,1,0]');
fprintf('\n');
[x1,y1,z1,c1] = CartesianSystem(P1a,P2a,P3a);
disp('Three direction vectors:');
disp(x1);
disp(y1);
disp(z1);
disp('Gravitational center:');
disp(c1);
fprintf('\n');

P1b = [0,0,0];
P2b = [-1,0,0];
P3b = [0,1,0];
disp('CartesianSystem called on points [0,0,0],[-1,0,0],[0,1,0]');
fprintf('\n');
[x2,y2,z2,c2] = CartesianSystem(P1b,P2b,P3b);
disp('Three direction vectors:');
disp(x2);
disp(y2);
disp(z2);
disp('Gravitatoinal center:');
disp(c2);
fprintf('\n');

P1c = [0,0,0];
P2c = [-1,0,0];
P3c = [0,-1,0];
disp('CartsianSystem called on points [0,0,0],[-1,0,0],[0,-1,0]');
fprintf('\n');
[x3,y3,z3,c3] = CartesianSystem(P1c,P2c,P3c);
disp('Three diretion vectors:');
disp(x3);
disp(y3);
disp(z3);
disp('Gravitational center: ');
disp(c3);
fprintf('\n');


disp('Question 3, Add Random Translation Error:');
disp('Point [100,100,100] ran with max error of 20, 10 times');
for i = 1:10
    [Points(i,:)] = AddRandomTranslationError([100,100,100],20);
    plot3(Points(i,1),Points(i,2),Points(i,3),'r.','MarkerSize',15);
    hold on;
end
fprintf('\n');
title('[100,100,100] Ran 10x with Max Error of 20');
disp('Transformed Points: ');
disp(Points);

fprintf('\n');
disp('Question 5, Simulate Many Patient Poses: ')
fprintf('\n');
disp('Ran 20 times with 20 random degrees rotation around y-axis and 40 random translation in either direction x and y');
disp('Ran on points [200,0,200],[200,200,200],[0,200,200] with target [100,100,100]');
[R,E] = SimulateManyPatientPoses([200,0,200],[200,200,200],[0,200,200],[100,100,100]);
fprintf('\n');
disp('Simulated Points:');
disp(R);
disp('Errors: ')
disp('FRE on left, TRE on right');
disp(E);

fprintf('\n');
disp('Question 7, Registration Robustness:');
disp('Points: [200,0,200],[200,200,200],[0,200,200], Target: [100,100,100]');
disp('Data skewed from 0mm to 10mm:');
figure;
for i = 1:100
    [FRE(i,1), TRE(i,1)] = RegistrationRobustness([200,0,200],[200,200,200],[0,200,200],[100,100,100],i);
    plot(i,FRE,'b.','MarkerSize',10);
    hold on;
    plot(i,TRE,'.r','MarkerSize',10);
    hold on;
end
xlabel('FLE mm');
ylabel('FRE (blue) & TRE (red) mm');
disp('Average FREs');
disp(FRE);
disp('Average TREs');
disp(TRE);

end 