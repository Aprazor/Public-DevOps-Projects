resource "random_string" "bucket_suffix" {
    length = 5
    special= false
    upper= false
}

resource "aws_s3_bucket" "myvpc_s3" {
    bucket = "myvpc-s3-${random_string.bucket_suffix.result}"

  tags = {
    name= "myvpc-s3-bucket"
  }
}

output "aws_s3_bucket" {
    value= aws_s3_bucket.myvpc_s3.id
}