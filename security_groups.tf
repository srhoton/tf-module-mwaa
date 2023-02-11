resource "aws_security_group" "mwaa_security_group" {
  name        = "${var.env_name}-mwaa-security-group"
  description = "Security group for MWAA"
  vpc_id      = var.vpc_id
  tags = {
    Name = "${var.env_name}-mwaa-security-group"
  }
}
  
resource "aws_security_group_rule" "mwaa_security_group_rule_ingress_tcp" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  security_group_id = aws_security_group.mwaa_security_group.id
  source_security_group_id = aws_security_group.mwaa_security_group.id
}

resource "aws_security_group_rule" "mwaa_security_group_rule_egress_tcp" {
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.mwaa_security_group.id
}
  
resource "aws_security_group_rule" "mwaa_security_group_rule_ingress_udp" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "udp"
  security_group_id = aws_security_group.mwaa_security_group.id
  source_security_group_id = aws_security_group.mwaa_security_group.id
}

resource "aws_security_group_rule" "mwaa_security_group_rule_egress_udp" {
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "udp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.mwaa_security_group.id
}
  