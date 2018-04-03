#!/usr/bin/env bash

{
  echo "ECS_CLUSTER=${cluster_name}"
} >> /etc/ecs/ecs.config


{
  echo "ECS_INSTANCE_ATTRIBUTES={\"FRONTEND\": \"${frontend}\", \"APPLICATION\": \"${application}\", \"DATABASE\": \"${database}\", \"SPOT\": \"${spot}\"}"
} >> /etc/ecs/ecs.config


