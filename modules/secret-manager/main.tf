resource "aws_secretsmanager_secret" "db_credentials" {
  name                    = "/pharma/${var.env}/db-credentials"
  description             = "Database credentials for the pharma ${var.env} environment"
  recovery_window_in_days = 0

  tags = {
    Name    = "/pharma/${var.env}/db-credentials"
    Env     = var.env
    Project = var.project
  }
}

resource "aws_secretsmanager_secret_version" "db_credentials" {
  secret_id = aws_secretsmanager_secret.db_credentials.id
  secret_string = jsonencode({
    username = var.db_username
    password = var.db_password
  })
}

resource "aws_secretsmanager_secret" "jwt_secret" {
  name                    = "/pharma/${var.env}/jwt-secret"
  description             = "JWT signing secret for the pharma ${var.env} environment"
  recovery_window_in_days = 0

  tags = {
    Name    = "/pharma/${var.env}/jwt-secret"
    Env     = var.env
    Project = var.project
  }
}

resource "aws_secretsmanager_secret_version" "jwt_secret" {
  secret_id = aws_secretsmanager_secret.jwt_secret.id
  secret_string = jsonencode({
    secret = var.jwt_secret
  })
}

resource "aws_secretsmanager_secret" "elastic_api_key" {
  name                    = "/pharma/${var.env}/elastic-api-key"
  description             = "Elasticsearch API key for Fluent Bit log shipping in the pharma ${var.env} environment"
  recovery_window_in_days = 0

  tags = {
    Name    = "/pharma/${var.env}/elastic-api-key"
    Env     = var.env
    Project = var.project
  }
}

resource "aws_secretsmanager_secret_version" "elastic_api_key" {
  secret_id = aws_secretsmanager_secret.elastic_api_key.id
  secret_string = jsonencode({
    api_key = var.elastic_api_key
  })
}
