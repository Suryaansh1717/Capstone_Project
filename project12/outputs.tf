output "planned_vpc_cidr" {
  value = aws_vpc.ci_vpc.cidr_block
}
