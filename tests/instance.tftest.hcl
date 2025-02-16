variables  {
name = "test-instance_type"
instance_type = "t2.micro"

}

run "validate_instance_name_and_type"{
    command = apply

    assert {
    condition = aws_instance.this.instance_type == var.instance_type
    error_message = "Instance type is not correct"
    }

    assert {
    condition = aws_instance.this.tags["Name"] == var.name
    error_message = "Instance name is not correct"
    }



}