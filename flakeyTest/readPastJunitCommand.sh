gcloud auth application-default login; g=0; for n in $(gsutil ls {gs://istio-circleci/master/*/*/artifacts/junit.xml,gs://istio-prow/logs/*master/*/artifacts/junit.xml}); do foo=$(cut -d "," -f 2 <<< $(cut -d ":" -f 2 <<< $(gsutil stat $n | sed -n 3p))); gsutil cp $n "gs://istio-flakey-test/$data_folder/out-$foo-$g-master.xml"; ((++g)); done; g=0; for n in $(gsutil ls {gs://istio-circleci/release-1.2/*/*/artifacts/junit.xml,gs://istio-prow/logs/*release-1.2/*/artifacts/junit.xml}); do foo=$(cut -d "," -f 2 <<< $(cut -d ":" -f 2 <<< $(gsutil stat $n | sed -n 3p))); gsutil cp $n "gs://istio-flakey-test/$data_folder/out-$foo-$g-release1.2.xml"; ((++g)); done