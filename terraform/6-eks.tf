resource "aws_iam_role" "proj9-cluster"{
  name = "proj9-cluster"

  assume_role_policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "eks.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "proj9-AmazonEKSClusterPolicy"{
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role = aws_iam_role.proj9-cluster.name
}

resource "aws_eks_cluster" "proj9-cluster"{
  name = "proj9-cluster"
  role_arn = aws_iam_role.proj9-cluster.arn

  vpc_config {
    subnet_ids = [
        aws_subnet.private-us-east-1a.id,
        aws_subnet.private-us-east-1b.id,
        aws_subnet.public-us-east-1a.id,
        aws_subnet.public-us-east-1b.id
    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.proj9-AmazonEKSClusterPolicy
  ]
}