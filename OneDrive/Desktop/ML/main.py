import tkinter as tk
from tkinter import messagebox
import cv2
import os
import numpy as np
from PIL import Image
import mysql.connector



def predict_age(face_image):
    # Preprocess face image for model input
    blob = cv2.dnn.blobFromImage(face_image, 1.0, (227, 227), (78.4263377603, 87.7689143744, 114.895847746), swapRB=False)
    
    # Pass through the network
    age_net.setInput(blob)
    age_preds = age_net.forward()
    
    # Get the most confident age group
    age_index = np.argmax(age_preds[0])
    predicted_age = AGE_BUCKETS[age_index]
    
    return predicted_age
# Connect to MySQL Database
try:
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        passwd="Rohit@45",
        database="facerecognise"
    )
    mycursor = mydb.cursor()
    print("Database connection successful.")
except mysql.connector.Error as err:
    print(f"Error: {err}")
    exit()

# Ensure the users table exists
mycursor.execute("""
    CREATE TABLE IF NOT EXISTS users (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(50),
        age INT,
        address VARCHAR(100)
    )
""")

# Initialize GUI
window = tk.Tk()
window.title("Face Recognition System")
window.config(bg="white")

# GUI Components
tk.Label(window, text="Name", font=("Arial", 16)).grid(column=0, row=0)
t1 = tk.Entry(window, width=50, bd=5)
t1.grid(column=1, row=0)

tk.Label(window, text="Age", font=("Arial", 16)).grid(column=0, row=1)
t2 = tk.Entry(window, width=50, bd=5)
t2.grid(column=1, row=1)

tk.Label(window, text="Address", font=("Arial", 16)).grid(column=0, row=2)
t3 = tk.Entry(window, width=50, bd=5)
t3.grid(column=1, row=2)


# **Function to Capture Face Data and Store User in Database**
def generate_dataset():
    if t1.get() == "" or t2.get() == "" or t3.get() == "":
        messagebox.showwarning("Input Error", "Please fill in all fields!")
        return
    
    name, age, address = t1.get(), t2.get(), t3.get()

    # Insert user details into MySQL
    mycursor.execute("INSERT INTO users (name, age, address) VALUES (%s, %s, %s)", (name, age, address))
    mydb.commit()
    user_id = mycursor.lastrowid  # Get the inserted user ID

    user_dir = f"Data/{user_id}"
    os.makedirs(user_dir, exist_ok=True)

    face_classifier = cv2.CascadeClassifier("haarcascade_frontalface_default.xml")

    def facecrop(img):
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        faces = face_classifier.detectMultiScale(gray, 1.3, 5)
        return faces if len(faces) > 0 else None

    cap = cv2.VideoCapture(0)
    img_id = 0

    while img_id < 35:  # Capture only 35 images per user
        ret, frame = cap.read()
        if not ret:
            continue

        faces = facecrop(frame)
        if faces is not None:
            for (x, y, w, h) in faces:
                face = cv2.resize(frame[y:y+h, x:x+w], (200, 200))
                face = cv2.cvtColor(face, cv2.COLOR_BGR2GRAY)
                file_path = f"{user_dir}/{img_id}.jpg"
                cv2.imwrite(file_path, face)
                img_id += 1
                cv2.imshow("Cropped Face", face)

        if cv2.waitKey(1) == 13 or img_id >= 35:
            break

    cap.release()
    cv2.destroyAllWindows()
    messagebox.showinfo('Result', f'User ID {user_id} Data Collected Successfully')


# **Train the Face Recognizer**
def train_classifier():
    data_dir = "Data"
    if not os.path.exists(data_dir):
        print(f"Error: Directory '{data_dir}' does not exist.")
        return

    faces, ids = [], []

    for user_folder in os.listdir(data_dir):
        user_path = os.path.join(data_dir, user_folder)
        if not os.path.isdir(user_path):
            continue

        for file in os.listdir(user_path):
            if file.endswith(('.jpg', '.jpeg', '.png')):
                image_path = os.path.join(user_path, file)
                try:
                    img = Image.open(image_path).convert('L')  # Convert image to grayscale
                    imageNp = np.array(img, 'uint8')
                    ids.append(int(user_folder))  # Folder name is user ID
                    faces.append(imageNp)
                except Exception as e:
                    print(f"Error processing {image_path}: {e}")

    if not faces:
        print("Error: No valid face images found!")
        return

    ids = np.array(ids)
    clf = cv2.face.LBPHFaceRecognizer_create()
    clf.train(faces, ids)
    clf.write("classifier.xml")
    messagebox.showinfo('Result', "Training Done Successfully!")


# **Face Recognition Function**
def detect_face():
    def draw_boundary(img, classifier, clf):
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        faces = classifier.detectMultiScale(gray, 1.1, 10, minSize=(100, 100))

        for (x, y, w, h) in faces:
            cv2.rectangle(img, (x, y), (x+w, y+h), (255, 255, 255), 2)
            id, confidence = clf.predict(gray[y:y+h, x:x+w])

            confidence = int(100 * (1 - confidence / 300))
            if confidence > 75:
                mycursor.execute(f"SELECT name, age, address FROM users WHERE id = {id}")
                result = mycursor.fetchone()
                if result:
                    name, age, address = result
                    cv2.putText(img, f"Name: {name}", (x, y-5), cv2.FONT_HERSHEY_SIMPLEX, 0.8, (255, 255, 255), 2)
                    cv2.putText(img, f"Age: {age}", (x, y+25), cv2.FONT_HERSHEY_SIMPLEX, 0.8, (255, 255, 255), 2)
                    cv2.putText(img, f"Address: {address}", (x, y+50), cv2.FONT_HERSHEY_SIMPLEX, 0.8, (255, 255, 255), 2)
                else:
                    cv2.putText(img, "Unknown", (x, y-5), cv2.FONT_HERSHEY_SIMPLEX, 0.8, (255, 255, 255), 2)

    faceCascade = cv2.CascadeClassifier("haarcascade_frontalface_default.xml")
    clf = cv2.face.LBPHFaceRecognizer_create()
    clf.read("classifier.xml")

    cap = cv2.VideoCapture(0)
    while True:
        ret, img = cap.read()
        if not ret:
            continue

        draw_boundary(img, faceCascade, clf)
        cv2.imshow("Face Detection", img)

        if cv2.waitKey(1) == 13:
            break

    cap.release()
    cv2.destroyAllWindows()


# **GUI Buttons**
tk.Button(window, text="Generate Dataset", font=("Arial", 14), bg='orange', command=generate_dataset).grid(column=0, row=4)
tk.Button(window, text="Train Model", font=("Arial", 14), bg='green', command=train_classifier).grid(column=1, row=4)
tk.Button(window, text="Detect Face", font=("Arial", 14), bg='blue', command=detect_face).grid(column=2, row=4)

window.geometry("800x250")
window.mainloop()