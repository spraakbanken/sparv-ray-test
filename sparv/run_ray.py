import sys
from ray.job_submission import JobSubmissionClient

runtime_env = {
  "pip": "./requirements.txt",
  "working_dir": ".",
  "env_vars": {
      "SPARV_DATADIR": "."
  }
}

client = JobSubmissionClient("http://127.0.0.1:8265")
job_id = client.submit_job(
    entrypoint="sparv --dir example_corpora/mini-swe run",
    runtime_env=runtime_env
)

print(job_id)
