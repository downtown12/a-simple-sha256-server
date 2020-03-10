## 服务说明：

1. 最大支持2MB大小请求体上传
2. 空请求体会返回400报错码
3. 暂时未配置限速，请尽量不要做压测
4. 接口uri开放到/，请求/和请求/123的结果是一样的

## 实现

- 一个OpenResty上的应用demo，lua代码实现

# For Test
```
curl http://host/ -v -d'1234567-`-@'
curl http://host/ -v 
curl http://host/ -v -d'123'
curl http://host/ -v -d @123.txt

```
