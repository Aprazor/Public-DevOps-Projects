provider "aws" {
  region     = "us-east-2"
  access_key = "your AK"
  secret_key = "your SK"
}

provider "random" {
  version = "3.1.0" # Use the desired version of the random provider
}
