# 📰 Fake News Detection — NLP Text Classifier

tags: #project #ml #nlp #scikitlearn #classification #python #svm #logisticregression

---

## 📌 One-Line Summary
> A multi-classifier NLP system that detects fake news articles using feature engineering (TF-IDF, Bag-of-Words) and multiple ML algorithms — with a Logistic Regression model achieving ~70% accuracy on the LIAR benchmark dataset.

---

## 📂 Locations
- `~/aathi/fake_news_detection/Fake_News_Detection/` ← Primary (with full README + model files)
- `~/aathi/AI/fake_news_detection/` ← Mirror/variant copy

---

## 🏗️ Architecture & Pipeline

```
Input: Raw news headlines/articles (LIAR dataset)
              │
              ▼
  ┌──────────────────────┐
  │     DataPrep.py      │ ← Tokenization, Stemming,
  │  (Pre-processing)    │   Null checks, EDA
  └──────────┬───────────┘
             │
             ▼
  ┌──────────────────────┐
  │  FeatureSelection.py │ ← Bag-of-Words, TF-IDF,
  │  (Feature Eng.)      │   n-grams, Word2Vec (WIP)
  └──────────┬───────────┘
             │
             ▼
  ┌──────────────────────┐
  │    classifier.py     │ ← Naïve Bayes, Logistic Reg,
  │   (Model Training)   │   Linear SVM, SGD, Random Forest
  └──────────┬───────────┘
             │ GridSearchCV Tuning
             ▼
  ┌──────────────────────┐
  │    prediction.py     │ ← Final model: Logistic Regression
  │  (Inference Script)  │   Saved as news_model.pkl
  └──────────────────────┘   Returns: True/False + probability
```

---

## 🛠️ Technology Stack

| Component | Technology |
|-----------|-----------|
| Language | Python |
| ML Library | Scikit-learn |
| Feature Extraction | TF-IDF, Bag-of-Words (CountVectorizer) |
| Algorithms Tested | Naïve Bayes, Logistic Regression, Linear SVM, SGD, Random Forest |
| Model Tuning | GridSearchCV |
| Evaluation | F1 Score, Confusion Matrix, Precision-Recall curves |
| Model Persistence | Pickle (`.pkl`, `.sav` files) |
| Notebook | Jupyter (final-fnd.ipynb — 76KB) |
| Frontend | Flask + HTML/CSS (`front.py`, templates/) |

---

## ✅ Key Features

### 📊 Dataset: LIAR Benchmark
- Source: ACL 2017 paper by William Yang Wang
- Original labels: True, Mostly-true, Half-true, Barely-true, False, Pants-fire (6 classes)
- Simplified to **binary** (True / False) for this project
- Splits: `train.csv` (1.1MB), `test.csv` (292KB), `valid.csv` (293KB)
- Additional metadata: speaker, party affiliation, job title, credit history counts

### 🔬 Feature Engineering
- **Bag-of-Words:** CountVectorizer on news text
- **TF-IDF:** Term frequency–inverse document frequency weighting
- **n-grams:** Unigrams and bigrams
- Word2Vec and POS tagging implemented but not yet in final pipeline

### 🤖 Classifiers Trained & Compared

| Model | Notes |
|-------|-------|
| Naïve Bayes | Probabilistic baseline |
| Logistic Regression | ✅ **Best performer — selected as final model** |
| Linear SVM | Strong competitor |
| SGD Classifier | Fast, good for large scale |
| Random Forest | Ensemble method |

### 📈 Performance
- **Best Model:** Logistic Regression
- **F1 Score:** ~70% range
- **Top 50 features extracted** from TF-IDF vectorizer (word importance analysis)
- Precision-Recall curves and learning curves generated for both candidate models

### 🌐 Flask Web Interface
- `front.py` + `templates/` → Web UI for news headline verification
- User pastes a headline → model returns True/False + probability of truth

### 💾 Saved Models
- `news_model.pkl` (2.5MB) — TF-IDF vectorizer model
- `final_model.sav` (19MB) — Complete final trained model
- `model.pkl` (1.1MB) — Alternate lightweight model

---

## 📁 File Structure

```
Fake_News_Detection/
├── DataPrep.py              ← Pre-processing pipeline
├── FeatureSelection.py      ← Feature extraction
├── classifier.py            ← All classifier training (17KB)
├── prediction.py            ← Inference script
├── front.py                 ← Flask web frontend
├── final-fnd.ipynb          ← Full Jupyter notebook (76KB)
├── train.csv / test.csv / valid.csv ← LIAR dataset splits
├── news_model.pkl           ← TF-IDF model (2.5MB)
├── final_model.sav          ← Final classifier (19MB)
├── model.pkl                ← Lightweight model (1.1MB)
├── liar_dataset/            ← Original TSV files
├── templates/               ← HTML templates
└── static/                  ← CSS/JS assets
```

---

## 🔧 How to Run

```bash
pip install scikit-learn numpy scipy

# Run prediction on a news headline
python prediction.py
# → Enter a headline when prompted
# → Returns: TRUE / FALSE + probability

# Or run web interface
python front.py
```

---

## 💡 Resume Bullet Points

- Built a **fake news detection system** using NLP feature engineering (**TF-IDF, Bag-of-Words**) on the **LIAR benchmark dataset** (ACL 2017)
- Trained and benchmarked **5 classifiers** (Naïve Bayes, Logistic Regression, Linear SVM, SGD, Random Forest) using **Scikit-learn**; selected **Logistic Regression** as best performer (~70% F1)
- Applied **GridSearchCV** for hyperparameter tuning and generated precision-recall and learning curves for model analysis
- Extracted **top 50 most discriminative features** from the TF-IDF vectorizer for interpretability
- Built a **Flask web interface** for real-time headline verification with truth probability output

---

## 🏷️ Tags
`#nlp` `#scikitlearn` `#classification` `#tfidf` `#bowmodel` `#logisticregression` `#svm` `#python` `#fakenews`

---

## 🔗 Links
- [[00_INDEX]]
- [[Plant Guard]]
- [[Face Emotion Recognition]]
