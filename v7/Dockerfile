# Utilise l'image officielle PyTorch avec CUDA 11.7 et cuDNN 8.6.0
FROM pytorch/pytorch:2.0.0-cuda11.7-cudnn8-runtime

# Set environment variables
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# Mettre à jour les paquets et installer Git et d'autres dépendances
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    libbz2-dev \
    libmcpp-dev \
    libdb-dev \
    libexpat1-dev \
    libssl-dev \
    libxml2-dev \
    libzmq3-dev \
    libiconv-hook-dev \
    libicu-dev\
    mcpp \
    bzip2 \
    wget \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


# Set the working directory to /app
WORKDIR /app

# Clone the biom3d repository
RUN git clone --branch 2D_Segmentation https://github.com/SafarbatiSami/biom3d.git

# Upgrade pip and setuptools
RUN pip install --upgrade setuptools pip wheel
RUN pip install zeroc-ice
RUN pip install ice icepy

# Install OMERO and other dependencies
RUN pip install omero-py
RUN pip install ezomero
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

