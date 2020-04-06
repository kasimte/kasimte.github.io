---
layout: post
title: "Settting up a firewall for Visdom on Google Cloud"
tags: google-cloud visdom
---

I've been doing some work with PyTorch recently and have found the
Facebook Visdom project has been great for live plotting to see what
is going on with my experimental runs.

I've also been using Google Cloud as of late to run my experiments on
GPU, but had a little trouble initially setting the firewall up
appropriately so I could view the visdom plots when running from the
cloud.

This is what ended up working for me.

1. Go to cloud.google.com
2. Go to my Console
3. Choose your Project
4. Choose Networking > VPC network
5. Choose "Firewalls rules"
6. Choose "Create Firewall Rule"
7. Setup the rule with the following parameters:
   * ingress
   * Targets > All Instances (although this could be limited with a target tag)
   * Protocols and Ports > tcp:8097
8. Save, confirm, and double check the rule is being applied to the VM instance in question.
9. Shell into the cloud server and run visdom from the command line.
10. Visit `http://myipaddress:8097`, where `myipaddress` is the External IP of the VM instance.

## Related

[How to open a specific port such as 9090 in Google Compute Engine](https://stackoverflow.com/questions/21065922/how-to-open-a-specific-port-such-as-9090-in-google-compute-engine)
