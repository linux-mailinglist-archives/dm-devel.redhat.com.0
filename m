Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C219920110B
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 17:41:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592581261;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=raBA++6ZWOyn3k1otfmFldiT08mKz491FQSRtqkbfz8=;
	b=bYNeZVAvo9qF1IXhYUwCXk4t71YvNRPLbbMF/SdOqnYDnPhrSFJbG8Vv2sYRBQSEu56EHH
	lvv6TIfE/VikD7HpATFW5hDY3lrAUk3nSgrf+WbH1q7Q+khq025wwEPyPX6aq6x29u+5VI
	97tdhO6dtEwyW0FhTJ+DbYU5hSdyiAk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-C9BPpXH1PIue30bj5TF4eg-1; Fri, 19 Jun 2020 11:40:59 -0400
X-MC-Unique: C9BPpXH1PIue30bj5TF4eg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C41FE18A8220;
	Fri, 19 Jun 2020 15:40:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A95AE60E1C;
	Fri, 19 Jun 2020 15:40:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C7D24833B1;
	Fri, 19 Jun 2020 15:40:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JFeQ7c019840 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 11:40:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 876682026D67; Fri, 19 Jun 2020 15:40:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 834FE202696B
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 15:40:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1FD17101A526
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 15:40:24 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
	[209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-410-KrW63SDLNheE74SDeQ28Cw-1; Fri, 19 Jun 2020 11:40:17 -0400
X-MC-Unique: KrW63SDLNheE74SDeQ28Cw-1
Received: by mail-wm1-f71.google.com with SMTP id g84so4102831wmf.4
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 08:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JsAPSZSX413LrMmwt3Tfl1rINfhllZJbRkCILSrFou4=;
	b=suVXTzRSgoIIPj/mMc9z/sWfWvjj1al/XplpiZ0Le1KtpvVTCyMdqAgMlG9bhgvuOq
	2tP7Y4SbHspQZAl4VhquDGSm9Fp/hINwnkTJFQjQgl916biWKVCTKJIKW4SxlM4h/9nU
	9ReaNmmU86mYMDoRr5hzR1rP3yJ1cq8DGboceqs1+N+gEohtPEUoz+k/ljTxw4XcM/9X
	TNGmjFigz3zOw+pCTHUssghWBWuGLpQCfrYNyXsOBL/kU17hia9Ni3iPKq5j3uSniywo
	IMLWPOz8yqD/2vt7cfKuET9EPRoHwoqmYxoRbQI35jpP/HErDEI/cV+02030I8DIYilQ
	B0SA==
X-Gm-Message-State: AOAM533Fah80PpCZndx+nwFKEzfArTKSl3POxGDCIezcga28ZpfChu/3
	8OQaUWjPT0cCE+j5ZsPRPUzFabikjMF29vaeTusBrAEc1MjsAe2BSPvOSXwh7c660q+bQJyY7S6
	LvlkvrfMf16mSU1KJOp/yl9Ep1Kxas4U=
X-Received: by 2002:a1c:cc03:: with SMTP id h3mr4329879wmb.87.1592581216178;
	Fri, 19 Jun 2020 08:40:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTRKQG7MpdLXhYk/HLY/sYmZnqHc3iESLa4luArUvICgo1WQZhIRQUjGR0s2v6EqdJT4rwb/nM+xA4raLAEsI=
X-Received: by 2002:a1c:cc03:: with SMTP id h3mr4329849wmb.87.1592581215854;
	Fri, 19 Jun 2020 08:40:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200619123803.1441373-1-yangerkun@huawei.com>
	<20200619123803.1441373-2-yangerkun@huawei.com>
In-Reply-To: <20200619123803.1441373-2-yangerkun@huawei.com>
From: Bryan Gurney <bgurney@redhat.com>
Date: Fri, 19 Jun 2020 11:40:04 -0400
Message-ID: <CAHhmqcTdxeTrpBuJBLqch9FzYuv=k+73fOjStsd-NmoDRyFffQ@mail.gmail.com>
To: yangerkun <yangerkun@huawei.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: bmr@redhat.com, dm-devel@redhat.com, "Alasdair G. Kergon" <agk@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH v3 1/4] dm dust: report some message results
	back to user directly
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 19, 2020 at 8:37 AM yangerkun <yangerkun@huawei.com> wrote:
>
> Some type of message(queryblock/countbadblocks/removebadblock) may better
> report results to user directly. Do it with DMEMIT.
>
> Signed-off-by: yangerkun <yangerkun@huawei.com>
> ---
>  drivers/md/dm-dust.c | 31 ++++++++++++++++++-------------
>  1 file changed, 18 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/md/dm-dust.c b/drivers/md/dm-dust.c
> index ff03b90072c5..a0c75c104de0 100644
> --- a/drivers/md/dm-dust.c
> +++ b/drivers/md/dm-dust.c
> @@ -138,20 +138,22 @@ static int dust_add_block(struct dust_device *dd, unsigned long long block,
>         return 0;
>  }
>
> -static int dust_query_block(struct dust_device *dd, unsigned long long block)
> +static int dust_query_block(struct dust_device *dd, unsigned long long block, char *result,
> +                           unsigned int maxlen, unsigned int *sz_ptr)
>  {
>         struct badblock *bblock;
>         unsigned long flags;
> +       unsigned int sz = *sz_ptr;
>
>         spin_lock_irqsave(&dd->dust_lock, flags);
>         bblock = dust_rb_search(&dd->badblocklist, block);
>         if (bblock != NULL)
> -               DMINFO("%s: block %llu found in badblocklist", __func__, block);
> +               DMEMIT("block %llu found in badblocklist", block);
>         else
> -               DMINFO("%s: block %llu not found in badblocklist", __func__, block);
> +               DMEMIT("block %llu not found in badblocklist", block);
>         spin_unlock_irqrestore(&dd->dust_lock, flags);
>
> -       return 0;
> +       return 1;

First, thank you very much for this patch.  After the concerns to
convert some functions to use DMEMIT were brought up, I was trying to
start the conversion, when this patch arrived, so I installed it, and
tested it.

I do have a question, though:

First, I see that in dust_query_block() (above) and
dust_clear_badblocks(), the "return 0" statement is changed to "return
1".

(Additionally, there is a change from "r = 0" to  "r = 1", in the
"countbadblocks" message handler)

On testing the functions, they still work, but why was this change
made?  Is it related to the use of DMEMIT?


Thanks,

Bryan

>  }
>
>  static int __dust_map_read(struct dust_device *dd, sector_t thisblock)
> @@ -259,11 +261,13 @@ static bool __dust_clear_badblocks(struct rb_root *tree,
>         return true;
>  }
>
> -static int dust_clear_badblocks(struct dust_device *dd)
> +static int dust_clear_badblocks(struct dust_device *dd, char *result, unsigned int maxlen,
> +                               unsigned int *sz_ptr)
>  {
>         unsigned long flags;
>         struct rb_root badblocklist;
>         unsigned long long badblock_count;
> +       unsigned int sz = *sz_ptr;
>
>         spin_lock_irqsave(&dd->dust_lock, flags);
>         badblocklist = dd->badblocklist;
> @@ -273,11 +277,11 @@ static int dust_clear_badblocks(struct dust_device *dd)
>         spin_unlock_irqrestore(&dd->dust_lock, flags);
>
>         if (!__dust_clear_badblocks(&badblocklist, badblock_count))
> -               DMINFO("%s: no badblocks found", __func__);
> +               DMEMIT("no badblocks found");
>         else
> -               DMINFO("%s: badblocks cleared", __func__);
> +               DMEMIT("badblocks cleared");
>
> -       return 0;
> +       return 1;
>  }
>
>  /*
> @@ -383,7 +387,7 @@ static void dust_dtr(struct dm_target *ti)
>  }
>
>  static int dust_message(struct dm_target *ti, unsigned int argc, char **argv,
> -                       char *result_buf, unsigned int maxlen)
> +                       char *result, unsigned int maxlen)
>  {
>         struct dust_device *dd = ti->private;
>         sector_t size = i_size_read(dd->dev->bdev->bd_inode) >> SECTOR_SHIFT;
> @@ -393,6 +397,7 @@ static int dust_message(struct dm_target *ti, unsigned int argc, char **argv,
>         unsigned char wr_fail_cnt;
>         unsigned int tmp_ui;
>         unsigned long flags;
> +       unsigned int sz = 0;
>         char dummy;
>
>         if (argc == 1) {
> @@ -410,12 +415,12 @@ static int dust_message(struct dm_target *ti, unsigned int argc, char **argv,
>                         r = 0;
>                 } else if (!strcasecmp(argv[0], "countbadblocks")) {
>                         spin_lock_irqsave(&dd->dust_lock, flags);
> -                       DMINFO("countbadblocks: %llu badblock(s) found",
> +                       DMEMIT("countbadblocks: %llu badblock(s) found",
>                                dd->badblock_count);
>                         spin_unlock_irqrestore(&dd->dust_lock, flags);
> -                       r = 0;
> +                       r = 1;
>                 } else if (!strcasecmp(argv[0], "clearbadblocks")) {
> -                       r = dust_clear_badblocks(dd);
> +                       r = dust_clear_badblocks(dd, result, maxlen, &sz);
>                 } else if (!strcasecmp(argv[0], "quiet")) {
>                         if (!dd->quiet_mode)
>                                 dd->quiet_mode = true;
> @@ -441,7 +446,7 @@ static int dust_message(struct dm_target *ti, unsigned int argc, char **argv,
>                 else if (!strcasecmp(argv[0], "removebadblock"))
>                         r = dust_remove_block(dd, block);
>                 else if (!strcasecmp(argv[0], "queryblock"))
> -                       r = dust_query_block(dd, block);
> +                       r = dust_query_block(dd, block, result, maxlen, &sz);
>                 else
>                         invalid_msg = true;
>
> --
> 2.25.4
>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

