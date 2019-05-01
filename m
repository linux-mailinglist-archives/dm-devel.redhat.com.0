Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 31720146CD
	for <lists+dm-devel@lfdr.de>; Mon,  6 May 2019 10:50:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 67A16A405A;
	Mon,  6 May 2019 08:50:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36936608A4;
	Mon,  6 May 2019 08:50:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B4F5D18089CC;
	Mon,  6 May 2019 08:50:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x41FYEEJ012480 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 May 2019 11:34:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F34331001E95; Wed,  1 May 2019 15:34:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED7B4100200A
	for <dm-devel@redhat.com>; Wed,  1 May 2019 15:34:11 +0000 (UTC)
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 124848831D
	for <dm-devel@redhat.com>; Wed,  1 May 2019 15:34:10 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id e5so13437271qtq.2
	for <dm-devel@redhat.com>; Wed, 01 May 2019 08:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=N7BVof8zcWOlmgfoNNTzY2OrKwZHtJkNJJ/tVCOczZQ=;
	b=LJOCQpTuAOMonbbFd+HFYKhAdfAuYbz/YN7leE+vqtSDSU77hZTmtUm3kYo7OdSMgM
	bH+Uv1E5hNu61ylGEuBOy/k+G8bWfbgx1x4bt1RyzeeGPtU4wtJFqhNrbXKVLmh94P5W
	H3JUZA9DgRHA5jzjjyiyGIQ0AqNMI6bzImj/vOm9YVV4oR/FGuBfYGCrY5ue21OVzIdv
	oBsJuDbw1wtIi+98ifSfhjY4bQJVSklHmKuSmnCSGb3iwN/kbnqBhhGyP68b00fF+kuh
	9J7hQkjNfqRKZOp//X4aLOdG0KSktlZqMG5xgHHuyoM6+AgFw6h7NDcSqZqnr21zte0i
	lb6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=N7BVof8zcWOlmgfoNNTzY2OrKwZHtJkNJJ/tVCOczZQ=;
	b=jP06ACoGenVlpwCtvJ50pHLLuLEGzNXnBrQqAuSagnhOcC4CZn4kupve/kJY0yGj8D
	80/0fmUIwoZw2Ovnqn7em7CYrJnzxnCwZZX69JLrl1wZtEd5SaJ/6D07GKTVBBZyt4pc
	ZEybVBK89K37RWT++6Feb2zILLX4qA801Qap+O/AeEgXkLH7N3BNd1gbPmD1aWlWGCer
	sonf6KD+Kai9lkckfMoK6gEHqAJ7vJh1ERhkzsa+FMr4l3iL9j9XvUINKZD4sZDBx3tS
	Vtu1YiDiHpAlERzn9ZbONC5TsXhIIuxkmiLs4xobBQFEElTaBMYpnmkY2LKdZu2TZ/h/
	S2KA==
X-Gm-Message-State: APjAAAXwViKsUfdjPb+Vs26lvKEjInttnPSycUXTwuJMkEXLMzuF08nO
	kGMnll/1alWxftdQ+jE9o9VWyA7g4DbV2H1HB7w=
X-Google-Smtp-Source: APXvYqzROLS7CvGrZASPPcvG/dxihfU9bAmIpDLNRjhMKwZG33h79JY5/Yot97nB/NsbR3Hm3m6NGf/lJdTltx6q0ic=
X-Received: by 2002:ac8:25b8:: with SMTP id e53mr24425025qte.194.1556724849335;
	Wed, 01 May 2019 08:34:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190418220448.7219-1-gpiccoli@canonical.com>
	<CAPhsuW4k5zz2pJBPL60VzjTcj6NTnhBh-RjvWASLcOxAk+yDEw@mail.gmail.com>
	<b39b96ea-2540-a407-2232-1af91e3e6658@canonical.com>
In-Reply-To: <b39b96ea-2540-a407-2232-1af91e3e6658@canonical.com>
From: Song Liu <liu.song.a23@gmail.com>
Date: Wed, 1 May 2019 08:33:58 -0700
Message-ID: <CAPhsuW65EW8JgjE8zknPQPXYcmDhX9LEhTKGb0KHywqKuZkUcA@mail.gmail.com>
To: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 01 May 2019 15:34:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Wed, 01 May 2019 15:34:10 +0000 (UTC) for IP:'209.85.160.194'
	DOMAIN:'mail-qt1-f194.google.com'
	HELO:'mail-qt1-f194.google.com' FROM:'liu.song.a23@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.142  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL,
	SPF_PASS) 209.85.160.194 mail-qt1-f194.google.com 209.85.160.194
	mail-qt1-f194.google.com <liu.song.a23@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 06 May 2019 04:49:36 -0400
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, kernel@gpiccoli.net,
	NeilBrown <neilb@suse.com>,
	linux-raid <linux-raid@vger.kernel.org>, dm-devel@redhat.com,
	Linux-Fsdevel <linux-fsdevel@vger.kernel.org>,
	Jay Vosburgh <jay.vosburgh@canonical.com>, gavin.guo@canonical.com
Subject: Re: [dm-devel] [RFC] [PATCH V2 0/1] Introduce emergency raid0 stop
	for mounted arrays
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Mon, 06 May 2019 08:50:54 +0000 (UTC)

On Tue, Apr 30, 2019 at 3:41 PM Guilherme G. Piccoli
<gpiccoli@canonical.com> wrote:
>
> > On 19/04/2019 14:08, Song Liu wrote:
> > [...]
> > I read through the discussion in V1, and I would agree with Neil that
> > current behavior is reasonable.
> >
> > For the following example:
> >
> > fd = open("file", "w");
> > write(fd, buf, size);
> > ret = fsync(fd);
> >
> > If "size" is big enough, the write is not expected to be atomic for
> > md or other drives. If we remove the underlining block device
> > after write() and before fsync(), the file could get corrupted. This
> > is the same for md or NVMe/SCSI drives.
> >
> > The application need to check "ret" from fsync(), the data is safe
> > only when fsync() returns 0.
> >
> > Does this make sense?
> >
>
> Hi Song, thanks for your quick response, and sorry for my delay.
> I've noticed after v4.18 kernel started to crash when we remove one
> raid0 member while writing, so I was investigating this
> before perform your test (in fact, found 2 issues [0]), hence my delay.
>
> Your test does make sense; in fact I've tested your scenario with the
> following code (with the patches from [0]):
> https://pastebin.ubuntu.com/p/cyqpDqpM7x/
>
> Indeed, fsync returns -1 in this case.
> Interestingly, when I do a "dd if=<some_file> of=<raid0_mount>" and try
> to "sync -f <some_file>" and "sync", it succeeds and the file is
> written, although corrupted.

I guess this is some issue with sync command, but I haven't got time
to look into it. How about running dd with oflag=sync or oflag=direct?

>
> Do you think this behavior is correct? In other devices, like a pure
> SCSI disk or NVMe, the 'dd' write fails.
> Also, what about the status of the raid0 array in mdadm - it shows as
> "clean" even after the member is removed, should we change that?

I guess this is because the kernel hasn't detect the array is gone? In
that case, I think reducing the latency would be useful for some use
cases.

Thanks,
Song

>
>
> > Also, could you please highlight changes from V1 (if more than
> > just rebase)?
>
> No changes other than rebase. Worth mentioning here that a kernel bot
> (and Julia Lawall) found an issue in my patch; I forgot a
> "mutex_lock(&mddev->open_mutex);" in line 6053, which caused the first
> caveat (hung mdadm and persistent device in /dev). Thanks for pointing
> this silly mistake from me! in case this patch gets some traction, I'll
> re-submit with that fixed.
>
> Cheers,
>
>
> Guilherme
>
> [0] https://marc.info/?l=linux-block&m=155666385707413
>
> >
> > Thanks,
> > Song
> >

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
