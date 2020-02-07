Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 3AC8E154FBA
	for <lists+dm-devel@lfdr.de>; Fri,  7 Feb 2020 01:29:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581035341;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=C/QN2cTqh9ekJTBJ5fM6D/B0VNVZwQVHg1tCsE5QD0w=;
	b=MIxydA9lCotIxt4eFwQbL2rRLbY4nG3b2x/4Nk+WdQKGhjyZEkm74Wb2MGapIG2fxCaGU9
	2qwWM7BsU8n7WDqshzpEtg/B1Q+UPYFcsr3E0lqpQtkDSdVpXYnFy5Xml6de/ndFCQn6ca
	+yEEZWS4vrOR2cMhelH6hMxY7jKU6zc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-zOWuhNeZMM-LhTXvjZKJ3A-1; Thu, 06 Feb 2020 19:28:58 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39B9C1005F6C;
	Fri,  7 Feb 2020 00:28:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FEF3790C8;
	Fri,  7 Feb 2020 00:28:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F09D8866A2;
	Fri,  7 Feb 2020 00:28:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0170SKUv014093 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 6 Feb 2020 19:28:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E83D7101B571; Fri,  7 Feb 2020 00:28:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E3000105546E
	for <dm-devel@redhat.com>; Fri,  7 Feb 2020 00:28:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B41CD85A334
	for <dm-devel@redhat.com>; Fri,  7 Feb 2020 00:28:17 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
	[209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-357-avfXDa2fPQWGe7HlPHX_1w-1; Thu, 06 Feb 2020 19:28:16 -0500
Received: by mail-qk1-f200.google.com with SMTP id 24so222758qka.16
	for <dm-devel@redhat.com>; Thu, 06 Feb 2020 16:28:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GpdjoS8QQs2JwcUjO1hma1sv3pkY8rd1WxZ8EzEjuKM=;
	b=SBmxGFChrrKbn845y5lfNECFQ3Cq2blyCd4qgh8Q1bdWNON4TrQFuM9j4xFBtfeNhF
	WS7hNYhSmMPwSZEeEMGjxNo10IX/CcbXQROYeswFjJeHegeoEyU7jIbSr/GOyeOUqxS4
	PynUFpzv9iDQGeXWRGm8A2Vwcfztfauaj6twt2423MK6wXGCNzHwWqyxR79OvVwuPuIM
	zn5WMITNZUzkbyA10Q6W3SpoSRM5jhsVRfkLkyu42ItDMSBdKvEDjMd6guU79SurcpWJ
	/AavKA/1oxJBSyW0MDqzZsGCw8agNftNOQ/nLllSnkLdS0DdNwWeBKFQUSYMVeCFWugF
	DGJA==
X-Gm-Message-State: APjAAAXjMWyOVe8lySpuRzM+NV8gTrtXtkbPt1jkMGvoropX5hnCWNZV
	bguEkwrbd/bmWMCQ+T7x0teXLXqxrOjasQEi2gWg0y1r0P1z+5G5Tw7Sli5WVxVQJgAAhQeJfh9
	NP8+ynoVA9WHzeQYfgS3VlseTgxJBIkU=
X-Received: by 2002:a05:620a:78f:: with SMTP id
	15mr4914000qka.295.1581035295532; 
	Thu, 06 Feb 2020 16:28:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqx/fTdt6ImVGvVIKcIuCkzT/JUPDOkEkTcJkHUD5zRBCSSoEn8rexsmS85npip8SC1oqxhwaoOZXbL+FnzqIc8=
X-Received: by 2002:a05:620a:78f:: with SMTP id
	15mr4913986qka.295.1581035295259; 
	Thu, 06 Feb 2020 16:28:15 -0800 (PST)
MIME-Version: 1.0
References: <20200201005524.23405-1-jdorminy@redhat.com>
	<20200203165402.GA11874@redhat.com>
In-Reply-To: <20200203165402.GA11874@redhat.com>
From: John Dorminy <jdorminy@redhat.com>
Date: Thu, 6 Feb 2020 19:28:04 -0500
Message-ID: <CAMeeMh82tS6TZCLzMwW7Kk+wdnMFW8WXrbe6-vLxaAvBzU1gBw@mail.gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
X-MC-Unique: avfXDa2fPQWGe7HlPHX_1w-1
X-MC-Unique: zOWuhNeZMM-LhTXvjZKJ3A-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0170SKUv014093
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] dm: expose dm_copy_name_and_uuid()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 3, 2020 at 11:54 AM Mike Snitzer <snitzer@redhat.com> wrote:
>
> On Fri, Jan 31 2020 at  7:55pm -0500,
> John Dorminy <jdorminy@redhat.com> wrote:
>
> > While dm_device_name() returns the MAJOR:MINOR numbers of a device,
> > some targets would like to know the pretty name of a device, and
> > some targets would like to know the uuid expected for the device.
> >
> > The MAJOR:MINOR name is useful for logging, but printing the long
> > name of the device can make it easier for the user to correlate
> > messages with the device names they know in userspace.
> >
> > The UUID can be useful for devices which store a UUID on disk, and
> > would like to verify the on-disk UUID matches the UUID known by DM.
> >
> > dm_copy_name_and_uuid() appears to be the only way to get at the
> > pretty name and the UUID at present, and this change exports the
> > function for use by GPLd modules.
> >
> > Signed-off-by: John Dorminy <jdorminy@redhat.com>
> > ---
> >  drivers/md/dm-ioctl.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/md/dm-ioctl.c b/drivers/md/dm-ioctl.c
> > index 1e03bc89e20f..711a46015696 100644
> > --- a/drivers/md/dm-ioctl.c
> > +++ b/drivers/md/dm-ioctl.c
> > @@ -2018,7 +2018,7 @@ int dm_copy_name_and_uuid(struct mapped_device *md, char *name, char *uuid)
> >
> >       return r;
> >  }
> > -
> > +EXPORT_SYMBOL_GPL(dm_copy_name_and_uuid);
> >
> >  /**
> >   * dm_early_create - create a mapped device in early boot.
> > --
> > 2.20.1
>
> These are already available to userspace via sysfs, e.g.:
>
> # dmsetup ls
> test-test        (253:0)
> # cat /sys/block/dm-0/dm/name
> test-test
> # cat /sys/block/dm-0/dm/uuid
> LVM-IFFqf0id2DX3IgGmu6izzJW1rBoWmsC61hwGobtrD60aCMh6zJwK3uiYUS6rbNoY
>
> Verification of the UUID that a target happens to store in its ondisk
> metadata seems like it'd best be done by userspace, _before_ activating
> the DM device, no?  Or are you saying that the target would do this
> verification as part of its .ctr method?
>
> Anyway, I'm fine with exporting it.. just think the proposed usecases
> are not a "slam-dunk" for why you need it.
>

To be clear, I care more about getting the name in kernelspace than
about getting the UUID in kernelspace. (253:0) is a unique name for
test-test, and we can get that via dm_device_name() at the moment. But
test-test is often a better name -- it's the name the user provided
dmsetup in the first place, so using it in log messages can help the
user match them to the device that generated them, even after the
device has been shut down and the device number has been lost.

I would tweak dm_device_name() save that at least some of its existing
users do want the numerical name. Besides, dm_copy_name_and_uuid() is
already declared in device-mapper.h, it just isn't exported for use
yet.

With regard to the UUID, I do think that some targets would like to
check it in their .ctr() function. A userspace tool that checks the
UUID before starting the device might as well just read the UUID off
the device and then pass that into dmsetup, thus guaranteeing that
they match. But the target itself might also want to check its UUID in
kernelspace in its constructor, perhaps to warn if someone is using
the target outside of the userspace tool just mentioned and has failed
to specify the right UUID.

If it would be better to alter or tweak dm_device_name(), I'd be happy
to do that instead.

Thanks!


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

