gcloud auth activate-service-account --key-file=$HOME/gcloud-service-key.json
gcloud config set project $GCP_PROJECT_ID
gcloud auth application-default login
gcloud container clusters get-credentials $CLUSTER_NAME --zone=$CLUSTER_ZONE
/usr/bin/prepare.sh