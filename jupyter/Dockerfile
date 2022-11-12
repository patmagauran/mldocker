FROM ghcr.io/patmagauran/mldocker-base:main
ENV USE_MAMBA=true
ENV EXTRA_CONDA_PACKAGES="jupyterlab matplotlib graphviz"
ENV EXTRA_APT_PACKAGES ="graphviz"
RUN tini -g -- /usr/bin/prepare.sh
ENV EXTRA_CONDA_PACKAGES=""
ENTRYPOINT ["tini", "-g", "--", "/usr/bin/prepare.sh"]