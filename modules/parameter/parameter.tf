resource "aws_ssm_parameter" "foo" {
  name  = "${var.env}-${var.name}"
  type  = "String"
  value = var.value
}
