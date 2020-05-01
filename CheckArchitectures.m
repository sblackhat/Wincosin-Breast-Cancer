function[ind,values] = CheckArchitectures(architectures,X,y,iterations,trainRatio,valRatio,testRatio)
%Check the precision of the different architectures and print 
l = length(architectures);
ind =  zeros(l,1);
values = zeros(l,1);
for i = 1:l
   arch  = architectures{i};
   trainingPrecission = zeros(iterations,1);
   trainingValidationSet = zeros(iterations,1);
   trainingTestSet = zeros(iterations,1);
   bestEpoch = zeros(iterations,1);
   
   for j = 1:iterations
       ann = patternnet(arch);
       ann.trainParam.showWindow = false;
       ann.divideParam.trainRatio = trainRatio;
       ann.divideParam.testRatio = testRatio;
       ann.divideParam.valRatio = valRatio;
       ann.trainParam.max_fail = 20;
       ann.trainParam.min_grad = 10^(-3);
       [ann, tr] =  train(ann, X, y);
       outputANN = sim(ann, X);
       
       bestEpoch = tr.best_epoch;
       trainingPrecission(j) = 1 - confusion( y(:, tr.trainInd), ...
       outputANN(:, tr.trainInd));
       trainingValidationSet(j) = 1 - confusion( y(:, tr.valInd), ...
       outputANN(:, tr.valInd));
       trainingTestSet(j) = 1 - confusion( y(:, tr.testInd), ...
       outputANN(:, tr.testInd));
   end
   testM  = mean(trainingTestSet)*100;
   testS  = std(trainingTestSet)*100;
   trainM = mean(trainingPrecission)*100;
   trainS = std(trainingPrecission)*100;
   valM = mean(trainingValidationSet)*100;
   valS = std(trainingValidationSet)*100;
   
   ind(i) = mean(bestEpoch);
   values(i) = testM;
   
   fprintf('Architecture [%d] Average best epoch : %d ',i,ind(i));
   fprintf('Training : %.5f %% +/- %.2f %%, Validation : %.5f %% +/- %.2f %%, Test : %.5f %% +/- %.2f %%\n', ...
   trainM,trainS,valM,valS,testM,testS);

end
% =========================================================================
end