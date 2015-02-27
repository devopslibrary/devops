#!/usr/bin/env bash
hostname minion
echo "192.168.5.10 salt" | tee -a /etc/hosts
echo "192.168.5.11 minion" | tee -a /etc/hosts