FROM ghcr.io/dask/dask:2022.10.2-py3.10
ENV USE_MAMBA=true
ENV EXTRA_CONDA_PACKAGES="dask[complete] gcsfs dask-ml[complete] distributed dask-kubernetes numpy scikit-learn pyarrow psycopg2"
RUN tini -g -- /usr/bin/prepare.sh
ENV EXTRA_CONDA_PACKAGES=""
ENTRYPOINT ["tini", "-g", "--", "/usr/bin/prepare.sh"]