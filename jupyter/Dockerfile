FROM ghcr.io/dask/dask-notebook:2022.10.2-py3.10
ENV USE_MAMBA=true
ENV EXTRA_CONDA_PACKAGES="dask[complete] dask-ml[complete] distributed dask-kubernetes numpy scikit-learn pyarrow psycopg2 matplotlib graphviz"
ENV EXTRA_APT_PACKAGES ="graphviz"
RUN tini -- /usr/bin/prepare.sh
ENV EXTRA_CONDA_PACKAGES=""
ENTRYPOINT ["tini", "--", "/usr/bin/prepare.sh"]
