resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "${var.project_name}-high-cpu-alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = var.cpu_threshold
  alarm_description   = "Triggers when EC2 CPU utilization exceeds ${var.cpu_threshold}%"
  treat_missing_data  = "notBreaching"

  dimensions = {
    InstanceId = aws_instance.monitored_ec2.id
  }
}
