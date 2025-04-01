#!/bin/bash
if [ ! -d ".venv" ]; then
  python -m venv .venv
  source .venv/bin/activate
  pip install git+https://github.com/spraakbanken/sparv.git@dev
  sparv setup -d "./sparv"
fi

  
if [ ! -d "sparv/bin" ]; then
  mkdir -p sparv/bin/wsd
  wget https://github.com/spraakbanken/sparv-wsd/raw/master/bin/saldowsd.jar
  mv saldowsd.jar sparv/bin/wsd
fi

if [ ! -d "sparv/example_corpora" ]; then
  wget https://github.com/spraakbanken/sparv-pipeline/releases/latest/download/example_corpora.zip
  unzip example_corpora.zip
  mv example_corpora sparv/
  rm example_corpora.zip
fi

