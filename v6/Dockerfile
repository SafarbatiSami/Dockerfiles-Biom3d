# Use PyTorch base image with Python 3.8, CUDA 11.7, and cuDNN 8
FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime

# Set environment variables
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# Install basic dependencies
RUN apt-get update --fix-missing && \
    apt-get install -y --no-install-recommends \
    wget \
    bzip2 \
    ca-certificates \
    libglib2.0-0 \
    libxext6 \
    libsm6 \
    libxrender1 \
    git \
    mercurial \
    subversion


# Set the working directory to /app
WORKDIR /app

# Clone the biom3d repository
RUN git clone --branch 2D_Segmentation https://github.com/SafarbatiSami/biom3d.git

# Upgrade pip and setuptools
RUN pip install --upgrade setuptools pip wheel

# Install OMERO and other dependencies
RUN pip install omero-py

# Navigate into the biom3d directory
WORKDIR /app/biom3d

# Install biom3d in editable mode
RUN pip install -e .

# Copy and set permissions for the entrypoint script
WORKDIR /app
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Set the working directory to biom3d
WORKDIR /app/biom3d/

# Specify the default command to run when the container starts
ENTRYPOINT ["/app/entrypoint.sh"]

