terraform{
    required_providers {
      aws{
        source = "hashicorp/aws"
        version = "~>3.73"
      }
    }
}

provider "aws"{
    region = "us-east-1"
}
resource aws_instance jenkins{
    count = 1
    ami = "ami-052efd3df9dad4825"
    instance_type = "t2.micro"
    tags{
        name = "Jenkins"
        value = "Server"
    }
    }