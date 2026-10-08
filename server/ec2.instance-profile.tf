# Quem pode assumir essa role
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    #quem pode usar
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
    # instancias ec2 podem assumir essa role
  }
}
# cria um instance profile que é necessário para anexar a role a uma instancia EC2
# ec2 não usa a role diretamente, o instance profile encapsula a role para a EC2 usar.
resource "aws_iam_instance_profile" "instance_profile" {
  name = var.ec2_resources.instance_profile
  role = aws_iam_role.role.name
}

#role
resource "aws_iam_role" "role" {
  name               = var.ec2_resources.instance_role
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}