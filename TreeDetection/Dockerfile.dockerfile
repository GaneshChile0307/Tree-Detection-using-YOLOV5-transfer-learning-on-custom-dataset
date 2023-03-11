# Use an official Python runtime as a parent image
FROM python:3.7.10
# FROM pytorch/pytorch:1.9.0-cuda11.1-cudnn8-runtime

# Set the working directory
WORKDIR /app

# Install the dependencies
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0

COPY ./yolov5/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy the YOLOv5 code
COPY ./yolov5 /app/yolov5

# Download the model weights#
# RUN wget https://github.com/ultralytics/yolov5/releases/download/v5.0/yolov5s.pt -P /app/yolov5/weights

# Set the entry point
ENTRYPOINT ["/bin/bash"]