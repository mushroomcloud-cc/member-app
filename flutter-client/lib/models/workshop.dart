class Workshop {
  Workshop({this.title, this.cover, this.description, this.url = ''});
  String title;
  String cover;
  String description;
  String url;
}

final workshopItems = <Workshop>[
  Workshop(
      title: '蘑菇云软件学习第五课——Flutter学习',
      description: 'Flutter 是 Google推出并开源的移动应用开发框架，主打跨平台、高保真、高性能。',
      url: 'https://mp.weixin.qq.com/s?__biz=MzA5MjA1MzgyNQ==&mid=2651991514&idx=1&sn=7da34cdd24b1b2d05f8d1435bb09f9a4',
      cover:
          'https://mmbiz.qpic.cn/mmbiz_png/KdLtjK3tQmEGkQfZtf9LGIth2DSniaF2eXzCdgWVUuZibCDevUYQsL5tG0BNXXGJg6yIdgyR2aSyHK7qLBHnVKIw/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1'),
  Workshop(
      title: '蘑菇云软件学习第四课',
      description: '蘑菇云软件学习小组第二期的第四课来啦~~经过上一周火热的阿里云iot的学习，这周我们的活动再次回归树莓派。',
      url: 'https://mp.weixin.qq.com/s?__biz=MzA5MjA1MzgyNQ==&mid=2651991504&idx=1&sn=f5188089be5af4bc7d0553ee95c15d63',
      cover:
          'https://mmbiz.qpic.cn/mmbiz_jpg/KdLtjK3tQmHpcfGxjmgdKAtmfnfDiapd4OcFibKcguIQ1kGtWZorEN2CyOXmgjgFdZtKghpUQhV1RlRfoj56AB8A/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1'),
  Workshop(
    title:'蘑菇云软件学习——Flutter第二课',
    description: '这周日我们接着上一周的课程，继续学习Flutter。提前预告一下，本期Flutter课程将持续4次课程，这周日为第二课。整期课程结束你将学会如何做一个完整的APP（不包含服务器）',
    cover: 'https://mmbiz.qpic.cn/mmbiz_jpg/KdLtjK3tQmH8TiawTjAXtDps6VWAkdgo39iaDk7IrtFUvHEJ5I2YuW311Q8qxLZL3YOAnUz3KmnXO319zOZGiczRw/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1',
    url: 'https://mp.weixin.qq.com/s?__biz=MzA5MjA1MzgyNQ==&mid=2651991518&idx=1&sn=129cddfda875fc7e57b13aa8ecaf55cc'
  )
];
