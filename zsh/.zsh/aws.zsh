# AWS helpers

# ssm <name-tag> — open an SSM session to the EC2 instance with the given Name tag
ssm() {
    local target_id
    target_id=$(aws ec2 describe-instances \
        --filters "Name=tag:Name,Values=$1" \
        --query "Reservations[*].Instances[*].InstanceId" \
        --output text)

    if [ -z "$target_id" ]; then
        echo "Error: No instance found with Name tag '$1'"
        return 1
    fi

    aws ssm start-session --target "$target_id"
}
