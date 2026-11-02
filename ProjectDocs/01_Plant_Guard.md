# 🌿 Plant Guard — Plant Disease Detection System

tags: #project #ai #ml #pytorch #cnn #ollama #streamlit #langchain #python

---

## 📌 One-Line Summary
> End-to-end CNN + Local LLM pipeline that detects plant leaf diseases from photos and provides AI-generated treatment recommendations — fully offline.

---

## 📂 Location
`~/aathi/6th sem /nndl/cnn/plant-disease/`

---

## 🏗️ Architecture

```
User uploads leaf image
         │
         ▼
┌─────────────────┐
│  MobileNetV2    │ ← Transfer Learning (PyTorch)
│  (CNN Model)    │   Frozen backbone + Custom classifier head
└────────┬────────┘
         │ Disease Class + Confidence Score
         ▼
┌─────────────────┐
│  Confidence     │ ← Thresholding (default: 0.7)
│  Gate           │   Rejects uncertain predictions
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Ollama LLM     │ ← Local LLM (llama3.2:3b recommended)
│  (Treatment     │   Structured prompts → Context-aware advice
│   Advisor)      │   Fallback advice if LLM unavailable
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Streamlit UI   │ ← Web interface
│  (Web App)      │   Single image + Batch processing
└─────────────────┘   Reports (JSON/TXT download)
```

---

## 🛠️ Technology Stack

| Layer | Technology | Role |
|-------|-----------|------|
| Language | Python | Primary language |
| Deep Learning | PyTorch | CNN model training and inference |
| CNN Architecture | MobileNetV2 | Transfer learning — efficient, mobile-friendly |
| LLM Runtime | Ollama | Local LLM inference (no internet required) |
| LLM Model | llama3.2:3b | Treatment recommendation generation |
| Web Framework | Streamlit | User interface and deployment |
| Export Format | ONNX | Model portability (mobile/production) |
| Data Augmentation | torchvision.transforms | Training robustness |
| Mobile Companion | Android (Kotlin/Gradle) | PlantGuardAndroid module |

---

## ✅ Key Features

### 🌱 Disease Detection (CNN)
- **Model:** MobileNetV2 with transfer learning
  - Backbone frozen, custom classifier head trained
  - ~3.5M parameters total, ~1.2M trainable
  - Input resolution: 224×224×3
- **Dataset:** PlantVillage dataset
- **Classes:** 38 disease classes across 14+ plant species
- **Confidence thresholding:** Rejects uncertain predictions below 0.7
- **Inference time:** ~50ms CPU / ~5ms GPU

### 🤖 LLM Treatment Advisor
- Powered by **Ollama** running locally
- Structured prompt engineering for consistent, contextual advice
- Graceful fallback: returns generic advice if Ollama is unreachable
- Privacy-first: no data leaves the machine

### 🖥️ Streamlit Web App
- **Single image analysis:** Upload → Analyze → Get result + advice
- **Batch processing:** Analyze an entire folder of images
- **Analysis history:** Session-based history of past results
- **Downloadable reports:** Export results as JSON or TXT
- Accessible at `http://localhost:8501`

### 📱 Mobile Deployment
- Model exported to **ONNX format** (`plant_disease_model.onnx` — 11.7MB)
- Android module (`PlantGuardAndroid/`) built with Gradle
- Enables on-device inference without internet

---

## 📊 Model Performance

| Condition | Accuracy Range |
|-----------|----------------|
| High-quality lab images | 95 – 98% |
| Field conditions | 85 – 92% |
| Early-stage diseases | 75 – 85% |

Training tracked in `best_plant_disease_model_history.json`

---

## 🌍 Supported Plants & Diseases (38 Classes)

| Plant | Diseases Covered |
|-------|-----------------|
| Apple | Scab, Black rot, Cedar rust, Healthy |
| Tomato | Bacterial spot, Early blight, Late blight, Leaf mold, Septoria, Spider mites, Target spot, TYLCV, Mosaic virus, Healthy |
| Potato | Early blight, Late blight, Healthy |
| Corn | Common rust, Northern leaf blight, Healthy |
| Grape | Black rot, Esca, Leaf blight, Healthy |
| Pepper | Bacterial spot, Healthy |
| Strawberry | Leaf scorch, Healthy |
| Cherry | Powdery mildew, Healthy |
| Peach | Bacterial spot, Healthy |
| Others | Blueberry, Raspberry, Soybean, Squash, Orange, Cotton |

---

## 📁 Project File Structure

```
plant-disease/
├── plant_disease_cnn.py        ← CNN model definition (MobileNetV2)
├── plant_disease_llm.py        ← LLM integration (Ollama)
├── plant_disease_pipeline.py   ← Complete CNN→LLM pipeline class
├── Second.py                   ← Alternate/extended pipeline (24KB)
├── app.py                      ← Streamlit UI
├── train.py                    ← Training script
├── download.py                 ← Dataset download utility (30KB)
├── plot_training.py            ← Training curve visualization
├── plant_disease_model.onnx    ← Exported ONNX model (11.7MB)
├── best_plant_disease_model_classes.json ← Class names
├── best_plant_disease_model_history.json ← Training history
├── training_history.png        ← Training curve image
├── requirements.txt
├── PlantGuardAndroid/          ← Android Kotlin module
├── dataset/                    ← Training data
└── models/                     ← Saved model weights
```

---

## 🔧 How to Run

```bash
# 1. Install dependencies
pip install torch torchvision
pip install -r requirements.txt

# 2. Install and start Ollama
curl -fsSL https://ollama.com/install.sh | sh
ollama pull llama3.2:3b
ollama serve

# 3. Launch app
streamlit run app.py
# → Visit http://localhost:8501
```

---

## 💡 Resume Bullet Points

- Built an end-to-end CNN + LLM pipeline for plant disease detection using **MobileNetV2** (PyTorch) achieving **85–98% accuracy** across **38 disease classes**
- Integrated **Ollama** (local LLM) for context-aware treatment recommendations — fully offline, zero API dependency
- Deployed as a production-ready **Streamlit** web app with single-image and batch-processing modes and downloadable reports
- Exported model to **ONNX** format and built an **Android companion app** for on-device mobile inference
- Applied **transfer learning** with frozen backbone and custom classifier head, reducing trainable parameters to ~1.2M

---

## 🏷️ Tags
`#pytorch` `#cnn` `#transferlearning` `#ollama` `#llm` `#streamlit` `#python` `#onnx` `#android` `#agriculturalAI`

---

## 🔗 Links
- [[00_INDEX]]
- [[RAG Chatbot (Medical - TransRAG)]]
- [[Face Emotion Recognition]]
- [[Fake News Detection]]
