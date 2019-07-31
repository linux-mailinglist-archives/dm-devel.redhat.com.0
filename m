Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFE47F61C
	for <lists+dm-devel@lfdr.de>; Fri,  2 Aug 2019 13:41:05 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D94AB83F45;
	Fri,  2 Aug 2019 11:41:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98D9E5C220;
	Fri,  2 Aug 2019 11:41:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F242D3FA9A;
	Fri,  2 Aug 2019 11:41:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6VJv2l0027105 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 31 Jul 2019 15:57:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C1BF81001B28; Wed, 31 Jul 2019 19:57:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB6581001B14
	for <dm-devel@redhat.com>; Wed, 31 Jul 2019 19:57:00 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 89D1759440
	for <dm-devel@redhat.com>; Wed, 31 Jul 2019 19:56:59 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id r21so50211426qke.2
	for <dm-devel@redhat.com>; Wed, 31 Jul 2019 12:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WdMBwj24SuBIJnxcz6f6E7XZGCQRqwgOTkOEZF7y7/s=;
	b=ZcXSJJiBkpkPToXGFq7DHCokKWZ058T8iHffmWffteP55NcYi6FqNdZ3MLtRWtxX7V
	EjXmsNsCo0N4k2ibmQW6vi0gttoazQiHOV6x8e7X4hzmw2K7NIOZZSw9NMlQI/xpxD++
	hXTkxlygAgci360srj2X8PiEUBRALJKwsoQ8NmYS64ZRWqirTSb8oJuaC2jqMW2HhHvA
	WySC05IbbYuoCZbL9wa2ejDRgxCt9PLLV9U43lfltE9RHsEXrEA8XMh/Dif194lMUpOL
	KlpBoJ7XdWTt+kN0h+Y/OfAeQPW+SySGD12vvTdRsAb32QkVJY/QuZv7UvvmR3UFJcUP
	l/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WdMBwj24SuBIJnxcz6f6E7XZGCQRqwgOTkOEZF7y7/s=;
	b=ArFGC8CIA/3MtG8+JQhMgkNDhIWqDxSiWeXpz/QS7qMpOGbm8jOgq2u7g4VTAY/yGl
	0n5pe9VbThZ6nvxE7hRTesL0mSJbywpsteWnTUfu3UqVLuk6ziuwod1WU7FxuYY8ufHw
	VU7bJ6Uw4BRjn+MFC9SdtLv4SmKK9KAZg6YJcBiT+W9cM1Og/RnLrQuLSXBt+t2eXKA6
	P/itPtLnKBKJvXq5SXhdIAF8xouBrGrc9MfuMXPxjjDGOSP/rqWlEei4Kuo2stGCdu/Q
	RLK20R37LUBHZ1cuTZioXT7us02yHcfKN6SvQIMuM4WAlG7bbKYKKLs473TlYPvRnq7D
	3jXw==
X-Gm-Message-State: APjAAAVoA3PHeMN/PGd5ve6Zg1d/MnGblgN7LjuwSyti/EnFBG/bUStf
	iCRg1Yo5gLb8K2Isqw4nWFcZRkM52gNZfG5zlr0=
X-Google-Smtp-Source: APXvYqwhmDOGHzO9U0ftdB8CX5f/DjWHe/iKI49iVdsrJr6J3fsBH+lgXpvFwQEagC14twk/VAzT9owYPHQDI3PwrUc=
X-Received: by 2002:a37:a854:: with SMTP id r81mr83186128qke.378.1564603018768;
	Wed, 31 Jul 2019 12:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190729193359.11040-1-gpiccoli@canonical.com>
	<87zhkwl6ya.fsf@notabene.neil.brown.name>
	<6400083b-3cf3-cbc6-650a-c3ae6629b14c@canonical.com>
	<CAPhsuW69YrpHqBCOob2b5wzzWS9FM087sfe3iC0odX8kZWRwmA@mail.gmail.com>
In-Reply-To: <CAPhsuW69YrpHqBCOob2b5wzzWS9FM087sfe3iC0odX8kZWRwmA@mail.gmail.com>
From: Song Liu <liu.song.a23@gmail.com>
Date: Wed, 31 Jul 2019 12:56:47 -0700
Message-ID: <CAPhsuW5zB=Kik4rq9YA-xBer7Z-h-23QV4WSCWe-jvhFgGc0Cw@mail.gmail.com>
To: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 31 Jul 2019 19:56:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Wed, 31 Jul 2019 19:56:59 +0000 (UTC) for IP:'209.85.222.195'
	DOMAIN:'mail-qk1-f195.google.com'
	HELO:'mail-qk1-f195.google.com' FROM:'liu.song.a23@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.15  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.222.195 mail-qk1-f195.google.com 209.85.222.195
	mail-qk1-f195.google.com <liu.song.a23@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 02 Aug 2019 07:39:28 -0400
Cc: Neil F Brown <nfbrown@suse.com>, Song Liu <songliubraving@fb.com>,
	NeilBrown <neilb@suse.com>,
	linux-raid <linux-raid@vger.kernel.org>, dm-devel@redhat.com,
	linux-block@vger.kernel.org, Jay Vosburgh <jay.vosburgh@canonical.com>
Subject: Re: [dm-devel] [PATCH] md/raid0: Fail BIOs if their underlying
	block device is gone
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Fri, 02 Aug 2019 11:41:04 +0000 (UTC)

On Wed, Jul 31, 2019 at 12:54 PM Song Liu <liu.song.a23@gmail.com> wrote:
>
> On Tue, Jul 30, 2019 at 5:31 AM Guilherme G. Piccoli
> <gpiccoli@canonical.com> wrote:
> >
> > On 29/07/2019 21:08, NeilBrown wrote:
> > >[...]
> > >> +    if (unlikely(test_bit(MD_BROKEN, &mddev->flags))) {
> > >> +            bio_io_error(bio);
> > >> +            return BLK_QC_T_NONE;
> > >> +    }
> > >
> > > I think this should only fail WRITE requests, not READ requests.
> > >
> > > Otherwise the patch is probably reasonable.
> > >
> > > NeilBrown
> >
> > Thanks for the feedback Neil! I thought about it; it seemed to me better
> > to deny/fail the reads instead of returning "wrong" reads, since a file
> > read in a raid0 will be incomplete if one member is missing.
> > But it's fine for me to change that in the next iteration of this patch.
>
> For reads at block/page level, we will either get EIO or valid data, right?
>
> If that's not the case, we should fail all writes.

Oops, I meant all _reads_.

>
> Thanks,
> Song

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
