terraform {
    backend "s3"{
        bucket = "talent-academy-nisha1506-lab-tfstates"
        key = "talent-academy/ELK-stack/terraform.tfstates"
        region = "eu-west-1"
        dynamodb_table = "terraform-lock"
    }
}