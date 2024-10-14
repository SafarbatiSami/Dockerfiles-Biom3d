# Use the official Miniconda base image
FROM continuumio/miniconda3:latest

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

# Set CUDA environment variables
ENV PATH=/usr/local/cuda/bin:${PATH}
ENV CUDA_PATH=/usr/local/cuda
ENV CUDA_INCLUDE_DIRS=${CUDA_PATH}/include
ENV CUDA_LIB_DIRS=${CUDA_PATH}/lib64

# Create a conda environment with Python 3.8
RUN conda create --name pytorch_env python=3.8 -y \
    && conda run -n pytorch_env conda install -y pytorch pytorch-cuda=11.8 -c pytorch -c nvidia \
RUN conda install -c ome omero-py -y \
RUN conda install -c conda-forge ezomero -y || pip install ezomero
SHELL ["conda", "run", "-n", "pytorch_env", "/bin/bash", "-c"]
WORKDIR /app

# Clone the biom3d repository (specific branch)
RUN git clone --branch 2D_Segmentation https://github.com/SafarbatiSami/biom3d.git 

# Navigate into the biom3d directory
WORKDIR /app/biom3d

# Activate the environment and install biom3d in editable mode
RUN conda run -n pytorch_env /bin/bash -c "pip install -e ."

# Set the working directory back to /app
WORKDIR /app

# Copy the entrypoint script into the container
COPY entrypoint.sh /app/entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /app/entrypoint.sh

# Specify the default command to run when the container starts
ENTRYPOINT ["/app/entrypoint.sh"]

