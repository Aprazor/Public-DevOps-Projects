provider "aws" {
  region     = "us-east-2"
  access_key = "Your Key"
  secret_key = "Your Key"
}

provider "random" {
  version = "3.1.0"  # Use the desired version of the random provider
}
