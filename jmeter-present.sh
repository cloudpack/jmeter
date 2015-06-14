#!/bin/sh

EXTRA_VARS=$(cat <<EOS
    ProjectName=${ProjectName:-Jmeter0}
    Region=`curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone | sed -e 's/.$//'`
    TemplateBucket=${TemplateBucket}
    KeyName=${KeyName}
    CustomerCidrIp=${CustomerCidrIp}
    State=present
EOS
)

ansible-playbook -v -e "$EXTRA_VARS" ./ansible/cloudformation/jmeter.yml
