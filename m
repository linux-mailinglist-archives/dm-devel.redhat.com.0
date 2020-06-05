Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A7B8C1F03D5
	for <lists+dm-devel@lfdr.de>; Sat,  6 Jun 2020 02:22:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591402971;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=h+UyQvl0L2d9pqVRFpsKSNzq3tjCiYjsu+g78+6nVPw=;
	b=iIHR241RLml/iJ63rZSbTnIaoM1UfVFhiqJGYhhI4cxwOPXWzV5mDVpdLIEGOWjZEL0647
	+s6bAH0Yz8XprQbsS4hX8X6oWv67jhBUNExlj48vAkMXupHpNlDhuy9b4t6/3fexmqIbtB
	bt6+tkNdn5/h+yduUOpyGKILXZYj1zk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-pzIESOglM8ubob4RrlHTaw-1; Fri, 05 Jun 2020 20:22:48 -0400
X-MC-Unique: pzIESOglM8ubob4RrlHTaw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47AA78018AB;
	Sat,  6 Jun 2020 00:22:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2037C19D7B;
	Sat,  6 Jun 2020 00:22:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D3614B34BA;
	Sat,  6 Jun 2020 00:22:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 055Jlkx3004186 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 5 Jun 2020 15:47:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 25EEE100738C; Fri,  5 Jun 2020 19:47:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 03FB510F2701
	for <dm-devel@redhat.com>; Fri,  5 Jun 2020 19:47:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9050811768
	for <dm-devel@redhat.com>; Fri,  5 Jun 2020 19:47:43 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
	[209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-121-jf5Bd790MwmENrzclX6pJw-1; Fri, 05 Jun 2020 15:47:41 -0400
X-MC-Unique: jf5Bd790MwmENrzclX6pJw-1
Received: by mail-wm1-f72.google.com with SMTP id h6so2912856wmb.7
	for <dm-devel@redhat.com>; Fri, 05 Jun 2020 12:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=B150u82sENz7KxEE5qblESdUtWP9gi68veAYe+3qvUY=;
	b=E2y8v5qRKOhQrbSb1aaHeciCTkIdl0EjzxicA9t2xSYQYH1QK/Gc+/FfFhGhNCknOe
	5Dc1qBAN3o4rk4OtFMn+gJ9WRUW1XOHsGOVlBnxHEs8G9hXOkE6bSVrzNb6gfRhJMQqF
	uCYMvwSgdLarZ4tiiy+7SWF2lRl4AoFp57R6aVJmOO0IpiLW+C9fG+0O7B+4HvoxBhM6
	m7uuwmlQSmnrYxkeHhk4Whw3nswadohGKxUWoW2qbe4Nm+/rWpPFyRrY9enYQbFTzbWx
	oiqjqoLwXYgRIzo4T2o/8IgYw44s0vkqw7ZWw/utaYuNO1f+2qwXmIP1yVB5igaK52Sq
	/3XQ==
X-Gm-Message-State: AOAM532DaP3H809CB6Juxw2JW4zYE2VPRzFPLxcTYffCpi9z/NhqFRJb
	N0wtDV5T0yqm/9cJ6bPIhdKiVsK2LgQK6EDP2hWQadYiUYJ28a9zKb6Ux5ZRXB6l400SDu1GgTy
	l+nrGj2z+G/Uj1hWBnJLvmyWYo7/ZZxU=
X-Received: by 2002:adf:e3c1:: with SMTP id k1mr10271151wrm.33.1591386460527; 
	Fri, 05 Jun 2020 12:47:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzV6ucdq0lXzdHXTNZQNMNEuIVFa39bSGea/J0bJas3m0ktgA2AwQ7B5XSS/mVILPY6rhh7xS5QGDwSKcTB09A=
X-Received: by 2002:adf:e3c1:: with SMTP id k1mr10271140wrm.33.1591386460280; 
	Fri, 05 Jun 2020 12:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200605073201.1742675-1-yangerkun@huawei.com>
	<20200605073201.1742675-2-yangerkun@huawei.com>
In-Reply-To: <20200605073201.1742675-2-yangerkun@huawei.com>
From: Bryan Gurney <bgurney@redhat.com>
Date: Fri, 5 Jun 2020 15:47:29 -0400
Message-ID: <CAHhmqcRgu9NsVeHzwJP4kGpFuimw7_RdevY6OC2T9UoZ=LBg=w@mail.gmail.com>
To: yangerkun <yangerkun@huawei.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
	"Alasdair G. Kergon" <agk@redhat.com>
Subject: Re: [dm-devel] [RFC 1/2] dm dust: add interface to list all
	badblocks
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 5, 2020 at 3:48 AM yangerkun <yangerkun@huawei.com> wrote:
>
> This interface may help anyone want to know all badblocks without query
> block one by one.
>
> Signed-off-by: yangerkun <yangerkun@huawei.com>
> ---
>  drivers/md/dm-dust.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/drivers/md/dm-dust.c b/drivers/md/dm-dust.c
> index ff03b90072c5..903c0d158c6e 100644
> --- a/drivers/md/dm-dust.c
> +++ b/drivers/md/dm-dust.c
> @@ -280,6 +280,24 @@ static int dust_clear_badblocks(struct dust_device *dd)
>         return 0;
>  }
>
> +static void dust_list_badblocks(struct dust_device *dd)
> +{
> +       unsigned long flags;
> +       struct rb_root badblocklist;
> +       struct rb_node *node;
> +       struct badblock *bblk;
> +
> +       DMINFO("%s: badblocks list as below:", __func__);
> +       spin_lock_irqsave(&dd->dust_lock, flags);
> +       badblocklist = dd->badblocklist;
> +       for (node = rb_first(&badblocklist); node; node = rb_next(node)) {
> +               bblk = rb_entry(node, struct badblock, node);
> +               DMINFO("bad block: %llu", bblk->bb);
> +       }
> +       spin_unlock_irqrestore(&dd->dust_lock, flags);
> +       DMINFO("%s: badblocks list end.", __func__);
> +}
> +
>  /*
>   * Target parameters:
>   *
> @@ -422,6 +440,9 @@ static int dust_message(struct dm_target *ti, unsigned int argc, char **argv,
>                         else
>                                 dd->quiet_mode = false;
>                         r = 0;
> +               } else if (!strcasecmp(argv[0], "listbadblocks")) {
> +                       dust_list_badblocks(dd);
> +                       r = 0;
>                 } else {
>                         invalid_msg = true;
>                 }
> --
> 2.25.4
>

I tested this, and it looks good.

I see that the message says "badblocks list as below"; I'm wondering
if that was meant to say "badblocks list is below".  Or perhaps it
might be better to say "badblocks list below".

Aside from that potential correction,

Reviewed-by: Bryan Gurney <bgurney@redhat.com>


Thanks,

Bryan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

