resource "aws_mwaa_environment" "mwaa_environment" {
  dag_s3_path = var.dag_s3_path
  execution_role_arn = aws_iam_role.mwaa_execution_role.arn
  airflow_version = var.airflow_version 
  environment_class = var.environment_class
  name = var.env_name
  webserver_access_mode = var.webserver_access_mode
  source_bucket_arn = aws_s3_bucket.mwaa_bucket.arn
  requirements_s3_path = "s3:://${aws_s3_bucket.mwaa_bucket.id}/"
  logging_configuration {
    dag_processing_logs {
      enabled   = true
      log_level = "INFO"
    }

    scheduler_logs {
      enabled   = true
      log_level = "INFO"
    }

    task_logs {
      enabled   = true
      log_level = "WARNING"
    }

    webserver_logs {
      enabled   = true
      log_level = "ERROR"
    }

    worker_logs {
      enabled   = true
      log_level = "CRITICAL"
    }
  }
  network_configuration {
    security_group_ids = [aws_security_group.mwaa_security_group.id]
    subnet_ids         = var.private_subnet_ids
  }

  tags = {
    "Name" = "${var.env_name}-mwaa-env"
  }
}
