Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 519071CD3A
	for <lists+dm-devel@lfdr.de>; Tue, 14 May 2019 18:48:41 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E5481104C1;
	Tue, 14 May 2019 16:48:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23831100203C;
	Tue, 14 May 2019 16:48:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 20FFE18089CC;
	Tue, 14 May 2019 16:48:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4EGlXEO015812 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 14 May 2019 12:47:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9E61B608B9; Tue, 14 May 2019 16:47:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98867608AC
	for <dm-devel@redhat.com>; Tue, 14 May 2019 16:47:31 +0000 (UTC)
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2D6AE300180E
	for <dm-devel@redhat.com>; Tue, 14 May 2019 16:47:24 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id j184so1209049vsd.11
	for <dm-devel@redhat.com>; Tue, 14 May 2019 09:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Y7PwSEWga2/yPtBQUis8gBpGWAMpLLGBJz02yhRxW58=;
	b=VSY8dXQoBspa4RXRjnFzsXCE0X8Uk+FIr6PE+cYivABoT0y+YLVAE8RbSuXG99Z7Rf
	N25/9PQ9Ufr7OYaHSH7Oh1iMkAYcaMSPowqMKeVyfw80o2CRO7ieTWCoCIez+CTxr4Tl
	rSbsPE7YdyNeVFoFWWU48wHDTgvkSL8q1w8to=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Y7PwSEWga2/yPtBQUis8gBpGWAMpLLGBJz02yhRxW58=;
	b=f6920iBqldgXEQHrmajT1baI3pcxFmvXEUiWASl6o8O4U9Ak8LZHerr8d7OQjE1qXP
	YIebmZm+2ybQasMbK3brRrx6zsd6JiygeWu8BmYv4cBpjIeZsar993aGPPxOt2lqJZvc
	WLz7yOu+BxT+USrhYW2c8wIwccs4eZAQU6BpzLK8Dr8gpHGX2XUrHxfeby+OJ4B6TqU7
	o8kPCrmGVLRzWaTHNhT7aXlyUk2De2DxpgYwBzxQ0pQe5nqMgoGSW8nQ/Iw0kSsprBoC
	dGexoMM0OW32HmmeZSPmvdGsNBAHyikxsOoXex7TkJZ17p6Zgn8lQLb/0eJDHB7uDgVu
	m6hw==
X-Gm-Message-State: APjAAAV8kygmotmAxY2DKK/ZYKfQwHFJ4XACXDuuhHRPVmWgeoxBZ2Uu
	zOQwNmi9NntvaZ3ycTkrNo1Mwnognqc=
X-Google-Smtp-Source: APXvYqyLDaq/FXw2vXF8/2TE/E7Uk0TmKnPsbpwOTzfyGky7RC+hIug7f1L6vCzXyyFR3zexeWTuuA==
X-Received: by 2002:a67:f105:: with SMTP id n5mr14983662vsk.23.1557852442070; 
	Tue, 14 May 2019 09:47:22 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com.
	[209.85.222.47]) by smtp.gmail.com with ESMTPSA id
	e62sm14489489vsc.24.2019.05.14.09.47.20 for <dm-devel@redhat.com>
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 May 2019 09:47:21 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id p13so6448702uaa.11
	for <dm-devel@redhat.com>; Tue, 14 May 2019 09:47:20 -0700 (PDT)
X-Received: by 2002:ab0:2692:: with SMTP id t18mr1528737uao.106.1557852440345; 
	Tue, 14 May 2019 09:47:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAD=FV=VOAjgdrvkK8YKPP-8zqwPpo39rA43JH2BCeYLB0UkgAQ@mail.gmail.com>
	<20190513171519.GA26166@redhat.com>
In-Reply-To: <20190513171519.GA26166@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 14 May 2019 09:47:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X7GDNoJVvRgBTDoVkf9UYA69B-rTY2G3888w=9iS=RtQ@mail.gmail.com>
Message-ID: <CAD=FV=X7GDNoJVvRgBTDoVkf9UYA69B-rTY2G3888w=9iS=RtQ@mail.gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Tue, 14 May 2019 16:47:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Tue, 14 May 2019 16:47:24 +0000 (UTC) for IP:'209.85.217.68'
	DOMAIN:'mail-vs1-f68.google.com' HELO:'mail-vs1-f68.google.com'
	FROM:'dianders@chromium.org' RCPT:''
X-RedHat-Spam-Score: -0.112  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2) 209.85.217.68 mail-vs1-f68.google.com 209.85.217.68
	mail-vs1-f68.google.com <dianders@chromium.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Vito Caputo <vcaputo@pengaru.com>, LKML <linux-kernel@vger.kernel.org>,
	Tim Murray <timmurray@google.com>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	dm-devel@redhat.com, Guenter Roeck <groeck@chromium.org>,
	Tejun Heo <tj@kernel.org>
Subject: Re: [dm-devel] Problems caused by dm crypt: use WQ_HIGHPRI for the
	IO and crypt workqueues
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Tue, 14 May 2019 16:48:39 +0000 (UTC)

Hi,

On Mon, May 13, 2019 at 10:15 AM Mike Snitzer <snitzer@redhat.com> wrote:

> On Mon, May 13 2019 at 12:18pm -0400,
> Doug Anderson <dianders@chromium.org> wrote:
>
> > Hi,
> >
> > I wanted to jump on the bandwagon of people reporting problems with
> > commit a1b89132dc4f ("dm crypt: use WQ_HIGHPRI for the IO and crypt
> > workqueues").
> >
> > Specifically I've been tracking down communication errors when talking
> > to our Embedded Controller (EC) over SPI.  I found that communication
> > errors happened _much_ more frequently on newer kernels than older
> > ones.  Using ftrace I managed to track the problem down to the dm
> > crypt patch.  ...and, indeed, reverting that patch gets rid of the
> > vast majority of my errors.
> >
> > If you want to see the ftrace of my high priority worker getting
> > blocked for 7.5 ms, you can see:
> >
> > https://bugs.chromium.org/p/chromium/issues/attachmentText?aid=392715
> >
> >
> > In my case I'm looking at solving my problems by bumping the CrOS EC
> > transfers fully up to real time priority.  ...but given that there are
> > other reports of problems with the dm-crypt priority (notably I found
> > https://bugzilla.kernel.org/show_bug.cgi?id=199857) maybe we should
> > also come up with a different solution for dm-crypt?
> >
>
> And chance you can test how behaviour changes if you remove
> WQ_CPU_INTENSIVE? e.g.:
>
> diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
> index 692cddf3fe2a..c97d5d807311 100644
> --- a/drivers/md/dm-crypt.c
> +++ b/drivers/md/dm-crypt.c
> @@ -2827,8 +2827,7 @@ static int crypt_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>
>         ret = -ENOMEM;
>         cc->io_queue = alloc_workqueue("kcryptd_io/%s",
> -                                      WQ_HIGHPRI | WQ_CPU_INTENSIVE | WQ_MEM_RECLAIM,
> -                                      1, devname);
> +                                      WQ_HIGHPRI | WQ_MEM_RECLAIM, 1, devname);
>         if (!cc->io_queue) {
>                 ti->error = "Couldn't create kcryptd io queue";
>                 goto bad;
> @@ -2836,11 +2835,10 @@ static int crypt_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>
>         if (test_bit(DM_CRYPT_SAME_CPU, &cc->flags))
>                 cc->crypt_queue = alloc_workqueue("kcryptd/%s",
> -                                                 WQ_HIGHPRI | WQ_CPU_INTENSIVE | WQ_MEM_RECLAIM,
> -                                                 1, devname);
> +                                                 WQ_HIGHPRI | WQ_MEM_RECLAIM, 1, devname);
>         else
>                 cc->crypt_queue = alloc_workqueue("kcryptd/%s",
> -                                                 WQ_HIGHPRI | WQ_CPU_INTENSIVE | WQ_MEM_RECLAIM | WQ_UNBOUND,
> +                                                 WQ_HIGHPRI | WQ_MEM_RECLAIM | WQ_UNBOUND,
>                                                   num_online_cpus(), devname);
>         if (!cc->crypt_queue) {
>                 ti->error = "Couldn't create kcryptd queue";

It's not totally trivially easy for me to test.  My previous failure
cases were leaving a few devices "idle" over a long period of time.  I
did that on 3 machines last night and didn't see any failures.  Thus
removing "WQ_CPU_INTENSIVE" may have made things better.  Before I say
for sure I'd want to test for longer / redo the test a few times,
since I've seen the problem go away on its own before (just by
timing/luck) and then re-appear.

Do you have a theory about why removing WQ_CPU_INTENSIVE would help?

---

NOTE: in trying to reproduce problems more quickly I actually came up
with a better test case for the problem I was seeing.  I found that I
can reproduce my own problems much better with this test:

  dd if=/dev/zero of=/var/log/foo.txt bs=4M count=512&
  while true; do
    ectool version > /dev/null;
  done

It should be noted that "/var" is on encrypted stateful on my system
so throwing data at it stresses dm-crypt.  It should also be noted
that somehow "/var" also ends up traversing through a loopback device
(this becomes relevant below):


With the above test:

1. With a mainline kernel that has commit 37a186225a0c
("platform/chrome: cros_ec_spi: Transfer messages at high priority"):
I see failures.

2. With a mainline kernel that has commit 37a186225a0c plus removing
WQ_CPU_INTENSIVE in dm-crypt: I still see failures.

3. With a mainline kernel that has commit 37a186225a0c plus removing
high priority (but keeping CPU intensive) in dm-crypt: I still see
failures.

4. With a mainline kernel that has commit 37a186225a0c plus removing
high priority (but keeping CPU intensive) in dm-crypt plus removing
set_user_nice() in loop_prepare_queue(): I get a pass!

5. With a mainline kernel that has commit 37a186225a0c plus removing
set_user_nice() in loop_prepare_queue() plus leaving dm-crypt alone: I
see failures.

6. With a mainline kernel that has commit 37a186225a0c plus removing
set_user_nice() in loop_prepare_queue() plus removing WQ_CPU_INTENSIVE
in dm-crypt: I still see failures

7. With my new "cros_ec at realtime" series and no other patches, I get a pass!


tl;dr: High priority (even without CPU_INTENSIVE) definitely causes
interference with my high priority work starving it for > 8 ms, but
dm-crypt isn't unique here--loopback devices also have problems.


-Doug

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
