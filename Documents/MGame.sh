#!/bin/bash

#Creates the new Sink channel for the M Game Solo
pw-cli create-node adapter '{ factory.name=support.null-audio-sink node.name=Game media.class=Audio/Sink object.linger=true audio.position=[FL FR] monitor.channel-volumes=true monitor.passthrough=true }'
pw-cli create-node adapter '{ factory.name=support.null-audio-sink node.name=Chat media.class=Audio/Sink object.linger=true audio.position=[FL FR] monitor.channel-volumes=true monitor.passthrough=true }'
pw-cli create-node adapter '{ factory.name=support.null-audio-sink node.name=Music media.class=Audio/Sink object.linger=true audio.position=[FL FR] monitor.channel-volumes=true monitor.passthrough=true }'
pw-cli create-node adapter '{ factory.name=support.null-audio-sink node.name=System media.class=Audio/Sink object.linger=true audio.position=[FL FR] monitor.channel-volumes=true monitor.passthrough=true }'
#Links the new sinks to the correct mixer channel
pw-link "Game:monitor_FL" alsa_output.usb-M-Audio_M-Game_Solo-01.pro-output-0:playback_AUX0
pw-link "Game:monitor_FR" alsa_output.usb-M-Audio_M-Game_Solo-01.pro-output-0:playback_AUX1
pw-link "Chat:monitor_FL" alsa_output.usb-M-Audio_M-Game_Solo-01.pro-output-0:playback_AUX2
pw-link "Chat:monitor_FR" alsa_output.usb-M-Audio_M-Game_Solo-01.pro-output-0:playback_AUX3
pw-link "Music:monitor_FL" alsa_output.usb-M-Audio_M-Game_Solo-01.pro-output-0:playback_AUX4
pw-link "Music:monitor_FR" alsa_output.usb-M-Audio_M-Game_Solo-01.pro-output-0:playback_AUX5
pw-link "System:monitor_FL" alsa_output.usb-M-Audio_M-Game_Solo-01.pro-output-0:playback_AUX6
pw-link "System:monitor_FR" alsa_output.usb-M-Audio_M-Game_Solo-01.pro-output-0:playback_AUX7
#Set default audio to System
wpctl set-default `wpctl status | grep "\. System" | egrep '^ │( )*[0-9]*' -o | cut -c6-55 | egrep -o '[0-9]*'`