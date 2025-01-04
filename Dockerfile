FROM python:3.13-slim

RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-venv \
    && apt-get clean

  WORKDIR /app
  RUN pip install llama-stack

  COPY setup.sh /app/setup.sh
  RUN chmod +x /app/setup.sh
  CMD ["/app/setup.sh"]

  COPY . .

  CMD ["bash"]
  