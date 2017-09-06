<h1>ec2_instance terraform module</h1>

A terraform module for making ec2 instances.

Assumes you're making your instances in a VPC.

<h2> Sample of Resources</h2>
`ami_id` - The AMI to use<br />
`number_of_instances` - The number of instances you want made<br />
`subnet_id` - The VPC subnet to place the instance in<br />
`instance_type` - The EC2 instance type, e.g. m1.small<br />
`instance_name` - The instance name you want, this is used to populate the Name tag<br />
`user_data` - The path to the user_data file. Terraform will include the contents of this file while launching the instance<br />
`tags` - A map for setting AWS tags<br /> 

<h1>Usage</h1>

`You` can use this in your terraform template with the following steps.

Adding a module resource to your template, e.g. main.tf
module "ec2_instance" {
  instance_type = "${var.instance_type}"
  instance_name = "${var.instance_name}"
  ami_id = "${var.ami_id}"
  aws_access_key = "${var.aws_access_key}"
  aws_secret_key = "${var.aws_secret_key}"
  aws_region = "${var.aws_region}"
  subnet_id = "${var.subnet_id}"
  number_of_instances = "${var.number_of_instances}"
  user_data = "${var.user_data}"
}
Setting values for the following variables, either through terraform.tfvars or -var arguments on the CLI
aws_access_key = "xxxxxxxxxxxxxxxxx"
aws_secret_key = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
aws_region = "ap-southeast-1"


<h1>How to use?</h1>

CLI > terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

The Terraform execution plan has been generated and is shown below.
Resources are shown in alphabetical order for quick scanning. Green resources
will be created (or destroyed and then created if an existing resource
exists), yellow resources are being changed in-place, and red resources
will be destroyed. Cyan entries are data sources to be read.

Note: You didn't specify an "-out" parameter to save this plan, so when
"apply" is called, Terraform can't guarantee this is what will execute.

  + aws_instance.ec2_instance
      ami:                          "ami-10bb2373"
      associate_public_ip_address:  "<computed>"
      availability_zone:            "<computed>"
      ebs_block_device.#:           "<computed>"
      ephemeral_block_device.#:     "<computed>"
      instance_state:               "<computed>"
      instance_type:                "t2.micro"
      ipv6_address_count:           "<computed>"
      ipv6_addresses.#:             "<computed>"
      key_name:                     "<computed>"
      network_interface.#:          "<computed>"
      network_interface_id:         "<computed>"
      placement_group:              "<computed>"
      primary_network_interface_id: "<computed>"
      private_dns:                  "<computed>"
      private_ip:                   "<computed>"
      public_dns:                   "<computed>"
      public_ip:                    "<computed>"
      root_block_device.#:          "<computed>"
      security_groups.#:            "<computed>"
      source_dest_check:            "true"
      subnet_id:                    "<computed>"
      tags.%:                       "1"
      tags.Name:                    "sample terraform testing"
      tenancy:                      "<computed>"
      volume_tags.%:                "<computed>"
      vpc_security_group_ids.#:     "<computed>"


Plan: 1 to add, 0 to change, 0 to destroy.

CLI > terraform apply
aws_instance.ec2_instance: Creating...
  ami:                          "" => "ami-10bb2373"
  associate_public_ip_address:  "" => "<computed>"
  availability_zone:            "" => "<computed>"
  ebs_block_device.#:           "" => "<computed>"
  ephemeral_block_device.#:     "" => "<computed>"
  instance_state:               "" => "<computed>"
  instance_type:                "" => "t2.micro"
  ipv6_address_count:           "" => "<computed>"
  ipv6_addresses.#:             "" => "<computed>"
  key_name:                     "" => "<computed>"
  network_interface.#:          "" => "<computed>"
  network_interface_id:         "" => "<computed>"
  placement_group:              "" => "<computed>"
  primary_network_interface_id: "" => "<computed>"
  private_dns:                  "" => "<computed>"
  private_ip:                   "" => "<computed>"
  public_dns:                   "" => "<computed>"
  public_ip:                    "" => "<computed>"
  root_block_device.#:          "" => "<computed>"
  security_groups.#:            "" => "<computed>"
  source_dest_check:            "" => "true"
  subnet_id:                    "" => "<computed>"
  tags.%:                       "" => "1"
  tags.Name:                    "" => "sample terraform testing"
  tenancy:                      "" => "<computed>"
  volume_tags.%:                "" => "<computed>"
  vpc_security_group_ids.#:     "" => "<computed>"
aws_instance.ec2_instance: Still creating... (10s elapsed)
aws_instance.ec2_instance: Still creating... (20s elapsed)
aws_instance.ec2_instance: Creation complete after 22s (ID: i-02fb1bd2ad22291d6)
  

Outputs.tf will give the on-screen output

Example : 

aws_instance.ec2_instance: Creation complete after 22s (ID: i-02fb1bd2ad22291d6)

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

ec2_instance_id = i-02fb1bd2ad22291d6
