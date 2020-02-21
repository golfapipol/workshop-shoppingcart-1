provider "aws" {
  access_key = "<AWS_KEY>"
  secret_key = "<SECRET_KEY>"
  region     = "ap-southeast-1"
}

# kubectl-ready
module "kube_master" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name = "Kube Master"
  ami  = "ami-0e45ef99a98566a26"

  instance_type = "t3.large"

  instance_count              = 1
  vpc_security_group_ids      = ["sg-053f9469043e52750"]
  subnet_id                   = "subnet-0985cbfb509d8a25c"
  associate_public_ip_address = true
  monitoring                  = true

  root_block_device = [
    {
      volume_type = "gp2"
      volume_size = 10
    },
  ]

  key_name = "dlor"
  tags = {
    "Type" = "kubernetes"
  }
}

# kubectl-ready
module "kube_slave" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name = "RSS App"
  ami  = "ami-0e45ef99a98566a26"

  instance_type = "t3.large"

  instance_count              = 2
  vpc_security_group_ids      = ["sg-053f9469043e52750"]
  subnet_id                   = "subnet-0985cbfb509d8a25c"
  associate_public_ip_address = true
  monitoring                  = true

  root_block_device = [
    {
      volume_type = "gp2"
      volume_size = 10
    },
  ]

  key_name = "dlor"
  tags = {
    Type = "kubernetes"
  }
}

module "j_meter" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name = "j meter"
  ami  = "ami-0907d9e140ac01676"

  instance_type = "t3.large"

  instance_count              = 1
  vpc_security_group_ids      = ["sg-053f9469043e52750"]
  subnet_id                   = "subnet-0985cbfb509d8a25c"
  associate_public_ip_address = true
  monitoring                  = false

  root_block_device = [
    {
      volume_type = "gp2"
      volume_size = 10
    },
  ]

  key_name = "dlor"
  tags = {
    Type = "jmeter"
  }
}