
# Mount Ext4 Drive On OSX (read-only)
- Tryed on Mavericks and El Capitan

```
brew tap homebrew/fuse
brew install Caskroom/cask/osxfuse
brew install ext4fuse
```

- Use `df` to get disk name, should be under the Filesystem Category:

```
/dev/disk2s2
```

### MOUNT EXT4 readonly on MAC

[Ext4fuse GitHub](https://github.com/gerard/ext4fuse#readme)


ext4fuse <disk> <mountpoint>

#### Example

```
df
Filesystem        Size   Used  Avail Capacity    iused     ifree %iused  Mounted on
/dev/disk2s2     931Gi  313Gi  617Gi    34%   82177493 161803247   34%   /Volumes/Untitled

mkdir /Volumes/EXT4

ext4fuse /dev/disk2s1 /Volumes/EXT4
```