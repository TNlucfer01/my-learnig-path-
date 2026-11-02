import matplotlib.pyplot as plt 
import numpy as np 
from sklearn.linear_model import  LinearRegression
#initialing the dataset 
X_or = np.array([
    [0, 0],
    [0, 1],
    [1, 0],
    [1, 1]
])
#testing split
Y_or=np.array([0,1,1,1])

#createing a perceptronclass
class Perceptron:
     # define a constructor
    def __init__(self,learning_rate=0.2,epochs=20):
        self.lr=learning_rate   # pyright: ignore[reportUnannotatedClassAttribute]
        self.epochs=epochs      # pyright: ignore[reportUnannotatedClassAttribute]
        self.weight=None
        self.bias=None
        # why do we need this is this need for the grapgh 
        self.error_per_epochs=[]
    def predict(self,X):
     #   for the claculating maybeor after the training in the place
        linnea_result=np.dot(X,self.weight)+self.bias
        return np.where(linnea_result >0,1,0)
    def fit(self, X, y):
       # we need this because of the input size for the network 
        n_samples, n_features = X.shape
        self.weight = np.zeros(n_features)
        self.bias = 0.0
        for _ in range(self.epochs):
            errors = 0 # calculating error for each of the input 
            for xi, target in zip(X, y):
                print(xi,target)
                linear_output = np.dot(xi, self.weight) + self.bias
                y_pred = 1 if linear_output >= 0 else 0 # is positive
                update = self.lr * (target - y_pred) # new weight

                self.weight += update * xi
                self.bias += update
                errors += int(update != 0) # ooh 
            self.error_per_epochs.append(errors) # rhen we are appending this to that 

def plot_decision_boundary(X, y, model, title):
    x_min, x_max = X[:, 0].min() - 1, X[:, 0].max() + 1
    y_min, y_max = X[:, 1].min() - 1, X[:, 1].max() + 1

    xx, yy = np.meshgrid(
        np.linspace(x_min, x_max, 300),
        np.linspace(y_min, y_max, 300)
    )

    grid = np.c_[xx.ravel(), yy.ravel()]
    Z = model.predict(grid)
    Z = Z.reshape(xx.shape)

    plt.figure(figsize=(6, 5))
    plt.contourf(xx, yy, Z, alpha=0.3, cmap="coolwarm")

    for label in np.unique(y):
        pts = X[y == label]
        plt.scatter(pts[:, 0], pts[:, 1],
                    s=100, edgecolor='black',
                    label=f"Class {label}")

    plt.title(title)
    plt.xlabel("x1")
    plt.ylabel("x2")
    plt.legend()
    plt.grid(True)
    plt.show()






p_or = Perceptron(learning_rate=0.1, epochs=20)
p_or.fit(X_or, Y_or)

print("Weights:", p_or.weight)
print("Bias:", p_or.bias)
print("Predictions:", p_or.predict(X_or))


plt.figure(figsize=(6, 4))
plt.plot(p_or.error_per_epochs, marker='o')
plt.title("Misclassifications per Epoch (OR)")
plt.xlabel("Epoch")
plt.ylabel("Errors")
plt.grid(True)
plt.show()




plot_decision_boundary(X_or, Y_or, p_or, "Perceptron Decision Boundary (OR)")



