clc
clear
close all

%-------------------Data Collection and Reading 

data1 = readtable('housing.csv');
data2 = readtable('housing 2.csv');

%% ================== DATA INTEGRATION ==================
% Combine datasets 
data = [data1; data2];

%% ================== DATA CLEANING ==================
data = rmmissing(data);
data = unique(data);

%% ================== DATA SELECTION ==================
X = data{:, {'Avg_AreaIncome','Avg_AreaNumberOfRooms','Avg_AreaNumberOfBedrooms','Avg_AreaHouseAge','AreaPopulation'}};
y = data.Price;

%% ================== DATA TRANSFORMATION ==================
X = normalize(X);

%% ================== TRAIN-TEST SPLIT ==================
cv = cvpartition(height(data), 'HoldOut', 0.2);

XTrain = X(training(cv), :);
yTrain = y(training(cv), :);

XTest = X(test(cv), :);
yTest = y(test(cv), :);

%% ================== MODEL TRAINING ==================
mdl = fitlm(XTrain, yTrain);

%% ================== PREDICTION ==================
yPred = predict(mdl, XTest);

%% ================== EVALUATION ==================
rmse = sqrt(mean((yTest - yPred).^2));
r2 = 1 - sum((yTest - yPred).^2) / sum((yTest - mean(yTest)).^2);

fprintf('\n================ RESULTS ================\n');
fprintf('RMSE: %.2f\n', rmse);
fprintf('R2 Score: %.4f\n', r2);
fprintf('=========================================\n');

disp('--- REGRESSION MODEL SUMMARY ---');
disp(mdl);

%% ================== VISUALIZATION ==================

% 1. Actual vs Predicted
figure
scatter(yTest, yPred, 'filled')
hold on
plot([min(yTest) max(yTest)], [min(yTest) max(yTest)], 'r', 'LineWidth', 2)
xlabel('Actual Price')
ylabel('Predicted Price')
title('Actual vs Predicted House Prices')
grid on
legend('Predictions', 'Perfect Fit Line')

% 2. Error Distribution
figure
residuals = yTest - yPred;
histogram(residuals, 30)
xlabel('Prediction Error')
ylabel('Frequency')
title('Error Distribution')
grid on

% 3. Residual Plot
figure
scatter(yPred, residuals, 'filled')
yline(0, 'r', 'LineWidth', 2)
xlabel('Predicted Price')
ylabel('Residuals')
title('Residuals vs Predicted Values')
grid on

% 4. Feature Importance (coefficients)
figure
bar(mdl.Coefficients.Estimate(2:end))
xticklabels({'Income','Rooms','Bedrooms','HouseAge','Population'})
title('Feature Importance')
grid on