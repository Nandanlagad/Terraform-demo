resource "aws_iam_role" "app_role" {
  name               = var.role_name
  assume_role_policy = var.assume_role_policy
}

resource "aws_iam_instance_profile" "app_profile" {
  name = "${aws_iam_role.app_role.name}-profile"
  role = aws_iam_role.app_role.name
}

resource "aws_iam_role_policy_attachment" "ssm_core" {
  role       = aws_iam_role.app_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
