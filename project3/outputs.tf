output "instance_id" {
  description = "ID of the monitored EC2 instance"
  value       = aws_instance.monitored_ec2.id
}

output "alarm_name" {
  description = "Name of the CloudWatch CPU Alarm"
  value       = aws_cloudwatch_metric_alarm.high_cpu.alarm_name
}
