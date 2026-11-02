# 😊 Face Emotion Recognition — Real-Time Computer Vision

tags: #project #computervision #deepface #opencv #python #cnn #realtime

---

## 📌 One-Line Summary
> Real-time facial emotion detection system using OpenCV for face localization and the DeepFace library for emotion classification — runs live from webcam feed with on-screen emotion labels.

---

## 📂 Location
`~/aathi/6th sem /nndl/cnn/FACE_EMO/Facial-Emotion-Recognition-using-OpenCV-and-Deepface/`

---

## 🏗️ Architecture & Processing Pipeline

```
Webcam Input (cv2.VideoCapture)
         │
         ▼ Frame-by-frame loop
┌────────────────────────────┐
│  Grayscale Conversion       │ ← cv2.cvtColor()
└─────────────┬──────────────┘
              │
              ▼
┌────────────────────────────┐
│  Haar Cascade Face Detector│ ← haarcascade_frontalface_default.xml
│  face_cascade.detectMultiScale() │
└─────────────┬──────────────┘
              │ Detected face ROI (Region of Interest)
              ▼
┌────────────────────────────┐
│  DeepFace Emotion Analysis │ ← Pre-trained deep learning model
│  deepface.analyze()        │   Classifies emotion from face ROI
└─────────────┬──────────────┘
              │ Emotion label + confidence
              ▼
┌────────────────────────────┐
│  Overlay on Frame           │ ← cv2.rectangle() + cv2.putText()
│  Draw bounding box + label  │
└─────────────┬──────────────┘
              │
              ▼
         cv2.imshow() — Live display
         (Press 'q' to quit)
```

---

## 🛠️ Technology Stack

| Component | Technology |
|-----------|-----------|
| Language | Python |
| Computer Vision | OpenCV (`opencv-python`) |
| Face Detection | Haar Cascade classifier (XML-based) |
| Emotion Recognition | DeepFace library |
| Deep Learning Backend | TensorFlow / tf_keras (via DeepFace) |
| Video Capture | `cv2.VideoCapture(0)` — webcam |

---

## ✅ Key Features

### 🎥 Real-Time Processing
- Processes each video frame in a continuous loop
- Face detection + emotion classification per frame
- Minimal latency — designed for real-time display

### 😃 Emotions Detected
DeepFace classifies faces into:
- Angry, Disgust, Fear, Happy, Sad, Surprise, Neutral

### 🔍 Face Detection
- Uses **Haar Cascade** classifier (`haarcascade_frontalface_default.xml` — 1.25MB)
- Converts frames to grayscale before detection (improves speed)
- Detects multiple faces per frame simultaneously

### 🧠 DeepFace Emotion Model
- Pre-trained model from the `deepface` library (wraps VGG-Face, FaceNet, etc.)
- No training required — plug-and-play inference
- Outputs dominant emotion + confidence scores per emotion

### 📦 Minimal Codebase
- **Single script:** `emotion.py` (1.5KB) — entire system in ~50 lines of Python
- Known for being one of the shortest real-time emotion detection implementations

---

## 📁 File Structure

```
Facial-Emotion-Recognition-using-OpenCV-and-Deepface/
├── emotion.py                          ← Main script (1.5KB, ~50 lines)
├── haarcascade_frontalface_default.xml ← Haar cascade model (1.25MB)
├── requirements.txt                    ← deepface, tf_keras, opencv-python
├── LICENSE
└── README.md
```

---

## 🔧 How to Run

```bash
git clone <repo>
cd Facial-Emotion-Recognition-using-OpenCV-and-Deepface

pip install deepface tf_keras opencv-python

python emotion.py
# → Webcam opens, emotion labels appear in real-time
# → Press 'q' to quit
```

---

## 💡 Resume Bullet Points

- Built a **real-time facial emotion detection** system using **OpenCV** (Haar Cascade face localization) and the **DeepFace** library for emotion classification
- Designed a live video processing pipeline: webcam capture → grayscale conversion → face ROI extraction → deep learning inference → on-screen overlay
- Implemented in under 50 lines of Python, demonstrating ability to build concise, production-ready computer vision solutions
- Detects **7 emotion categories** (Angry, Disgust, Fear, Happy, Sad, Surprise, Neutral) from live webcam feed

---

## 🏷️ Tags
`#opencv` `#deepface` `#computervision` `#emotiondetection` `#realtime` `#python` `#haarcascade` `#tensorflow`

---

## 🔗 Links
- [[00_INDEX]]
- [[Plant Guard]]
- [[Fake News Detection]]
