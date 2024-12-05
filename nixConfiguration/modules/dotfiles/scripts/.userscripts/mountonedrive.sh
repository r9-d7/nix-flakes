#
#
#      ___             ____       _              __   __                     _
#     / _ \ _ __   ___|  _ \ _ __(_)_   _____   |  \ /  | ___  _   _ _ __  _| |_
#    | | | | `_ \ / _ \ | | | `__| \ \ / / _ \  |   v   |/ _ \| | | | `_ \|_   _|
#    | |_| | | | |  __/ |_| | |  | |\ v /  __/  |       | |_| | |_| | | | | | |
#     \___/|_| |_|\___|____/|_|  |_| \_/ \___|  |_|\_/|_|\___/ \___/|_| |_| |_|
#
#
#     by: Ross Fagerli
#     purpose: mount OneDrive through Rclone at system boot
#
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


rclone --vfs-cache-mode writes mount OneDrive: ~/OneDrive &
notify-send "OneDrive connected" "Microsoft OneDrive successfully mounted!"
