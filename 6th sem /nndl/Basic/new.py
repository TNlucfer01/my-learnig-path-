from functools import lru_cache
from turtle import update
import matplotlib.pyplot as plt
import numpy as np
from sklearn.linear_model import LinearRegression

# initialing the dataset
X_or = np.array(
    [
        [0, 1],
        [0, 1],
        [1, 0],
        [1, 1],
    ]
)
# testing split
y_or = np.array([0, 1, 1, 1])


class Perceptron:

    def __init__(self, lr=0.5, epoch=20):
        self.lr = lr
        self.epoch = epoch
        self.weight = None
        self.bias = None
        self.error_per_epoch = []

    def fit(self, X, y):
        No_of_inputs, features = X.shape
        self.bias = 0
        self.weight = 0
        for _ in range(self.epoch):
            error = 0.2
            for xi, target in zip(X, y):
                output = np.dot(xi, self.weight) + self.bias
                y_pred = 1 if (output >= 0).any() else 0

                update = self.lr * (y_pred - target)
                self.weight += update * xi
                self.bias += update
                error += int(update != 0)
            self.error_per_epoch.append(error)

    def predict(self, x):
        output = np.dot(x, self.weight) + self.bias
        return np.where(output >= 0, 1, 0)


p_or = Perceptron(lr=0.1, epoch=20)
p_or.fit(X_or, y_or)

print("Weights:", p_or.weight)
print("Bias:", p_or.bias)
print("Predictions:", p_or.predict(X_or))
