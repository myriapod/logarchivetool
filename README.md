# Log Archive tool


## How to use
In order to launch the tool, make sure you have sudoer rights as compressing files in <code>/var/log</code> requires it.


To launch the tool, use :

```sudo log-archive.sh /path/to/log/directory [/path/to/destination/directory (optional)]```

The argument for the destination directory for the compressed files is optional, the default option is <code>/var/log/logs_compressed</code>.