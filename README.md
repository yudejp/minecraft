# minecraft
🔳 **[WIP]** A Minecraft Server on yude.jp

## Deploy
* Please build (`./manage.sh build`) before start the container in order to ensure avoiding any permission issues.
* Please do not build without using `manage.sh`.
```
git clone https://github.com/yudejp/minecraft; cd minecraft
# If you agree with Minecraft EULA: https://account.mojang.com/documents/minecraft_eula
echo "eula=true" > papermc/eula.txt
./manage.sh build
./manage.sh up
```

## License
MIT License
