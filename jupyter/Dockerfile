FROM ghcr.io/dask/dask-notebook:2022.10.2-py3.10
ENV USE_MAMBA=true
ENV EXTRA_CONDA_PACKAGES="dask[complete] jupyter-server-proxy dask-ml[complete] distributed dask-kubernetes gcsfs numpy scikit-learn pyarrow psycopg2 matplotlib graphviz jupyterlab-git imbalanced-learn"
ENV EXTRA_APT_PACKAGES ="graphviz"
USER root
RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-409.0.0-linux-x86_64.tar.gz 
RUN sudo mkdir /usr/bin/gcloud && \
sudo tar -xf google-cloud-cli-409.0.0-linux-x86_64.tar.gz -C /usr/bin/gcloud && \
sudo chmod 777 -R /usr/bin/gcloud
RUN echo "source /usr/bin/gcloud/google-cloud-sdk/path.bash.inc" >> /etc/bash.bashrc
ENV PATH=/usr/bin/gcloud/google-cloud-sdk/bin:$PATH
USER $NB_USER
RUN cd /usr/bin/gcloud &&\
./google-cloud-sdk/install.sh -q
RUN source /usr/bin/gcloud/google-cloud-sdk/path.bash.inc
RUN gcloud config configurations create dask
RUN gcloud config configurations activate dask
RUN gcloud components install kubectl &&\
gcloud components install gke-gcloud-auth-plugin
USER $NB_USER
COPY preinstall.sh /usr/bin/preinstall.sh
RUN tini -- /usr/bin/preinstall.sh
ENV GOOGLE_APPLICATION_CREDENTIALS=/home/jovyan/gcloud-service-key.json
COPY entry.sh /usr/bin/entry.sh

ENV EXTRA_CONDA_PACKAGES=""
ENV EXTRA_APT_PACKAGES=""
ENTRYPOINT ["tini", "--", "/usr/bin/entry.sh"]
