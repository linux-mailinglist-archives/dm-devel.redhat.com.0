Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A27D51F4
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 21:11:05 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5A713307CDC0;
	Sat, 12 Oct 2019 19:11:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CADB21001B08;
	Sat, 12 Oct 2019 19:10:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 33D7D4A486;
	Sat, 12 Oct 2019 19:10:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CJ8iFo030287 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 15:08:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5AF5B19C5B; Sat, 12 Oct 2019 19:08:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54F4E19C58
	for <dm-devel@redhat.com>; Sat, 12 Oct 2019 19:08:42 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E82F3C057F2C
	for <dm-devel@redhat.com>; Sat, 12 Oct 2019 19:08:40 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id m18so13071615wmc.1
	for <dm-devel@redhat.com>; Sat, 12 Oct 2019 12:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=IWzrNpluSrf3KemlT50V0xmDHpnltO8JUruoqXkdgAE=;
	b=qXGaz6DOy1Q3g4P9zFSKZS3bBT+jSVg+eeKMdQUqYmWO+xzgD0I+b2i8w7tZbTmN/r
	Jx76IxxUHvdSEeuy6eJXuNys5jy+rSe1QPOibY8Lwc5m8aqAR9xjSoJOk/p0CdIoHxoh
	jG7hLazApDRPndzHcMP4RA+3CVNToAZ6NeZMmWFGVQWc84hEWGQ/i8jvqJcINn4661GJ
	wNsA4FnJ37s6ZvRAttok6gEUksCCVfbSnR2gknMNtslY4DxNlq9MJuNYQ5RRM8dibKU/
	bkEXUd9QP4HRMN7U3R/maO1+c3nMV5bPYBTg3cIo/XVgMm8Ed7u64mn214xn5sPIF2g4
	7F6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=IWzrNpluSrf3KemlT50V0xmDHpnltO8JUruoqXkdgAE=;
	b=MbMUHNUkv9IRxp9kGMVcLThVx0QAYoHVyklssnbPTy2w71hSMXNgi3gkYmx5DOs8bL
	DX0CxRsNoKvE3lNHw/bKIoIewgSpCuFxiH3AeJlUYLx95U6u/56sBdvBYvK2mQr/CZuR
	GaLdVQHlJKnxnqZNl7CkdvPtIpOX1uWhnEdZZ+Vh5D4ljUJ4CA2a85yysJRhaxophMAy
	ZXaNSlCxmAiLXPZWLXio1E/LvRcHh0F/YTRpEqHWMvWIUpFKzlY/tFtcYJ5rSUB3EGpY
	8t2CQEDiuioZ4f4ylHoNbdI6/cj8/Btbvs+WbDS3E39xL2dN11fyVBVaU3zQeQVtDVNd
	MGnQ==
X-Gm-Message-State: APjAAAVYtl9Sbyk+Efm4BDq20iB9Dop3WKKOGBxBDOXUPV95wvNKlN8w
	ull0L+LjOexRXRbec4Pt1Wc=
X-Google-Smtp-Source: APXvYqzHd2MXpc0sL0kAWPyrEROy0PcMTB8tCQ3VLatcYm8h8rN8pcrXhmiMM0dy8nPvZxtMI0ICPA==
X-Received: by 2002:a7b:cd13:: with SMTP id f19mr7723786wmj.4.1570907319616;
	Sat, 12 Oct 2019 12:08:39 -0700 (PDT)
Received: from x230 ([62.201.25.198]) by smtp.gmail.com with ESMTPSA id
	y5sm12893049wma.14.2019.10.12.12.08.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Oct 2019 12:08:38 -0700 (PDT)
Date: Sat, 12 Oct 2019 21:08:36 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Baruch Even <baruch@ev-en.org>
Message-ID: <20191012190835.GA6490@x230>
References: <20190708213551.26349-1-petr.vorel@gmail.com>
	<20190709024742.GA22293@infradead.org>
	<20190709080204.GA12875@dell5510>
	<20190709133436.GA2231@infradead.org> <20191002060508.GA16684@x230>
	<20191007165732.GA4805@infradead.org>
	<20191008081831.GA29132@dell5510>
	<CAC9+an+8SgNnR7Sr=Q8MKEN9ykPwL2q4LvSTE3C9OisDrN=pKg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAC9+an+8SgNnR7Sr=Q8MKEN9ykPwL2q4LvSTE3C9OisDrN=pKg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Sat, 12 Oct 2019 19:08:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Sat, 12 Oct 2019 19:08:41 +0000 (UTC) for IP:'209.85.128.49'
	DOMAIN:'mail-wm1-f49.google.com' HELO:'mail-wm1-f49.google.com'
	FROM:'petr.vorel@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.128.49 mail-wm1-f49.google.com 209.85.128.49
	mail-wm1-f49.google.com <petr.vorel@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Christoph Hellwig <hch@infradead.org>, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 1/1] kpartx: Use __kernel_daddr_t for
 solaris_x86_slice.s_start
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: Petr Vorel <petr.vorel@gmail.com>
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Sat, 12 Oct 2019 19:11:03 +0000 (UTC)

Hi Baruch,

> Hi,

> The patch looks good to me, as for gpart, I needed it so I've taken the
> bits and pieces that floated around and merged them all into one place from
> all distributions that I could find.   As for users, in Debian the number
> of users is around 250 so it's a very low usage program but I guess that
> would always be unless very many people lost their partitions every day :-)

> https://qa.debian.org/popcon-graph.php?packages=gpart

> Cheers,
> Baruch

> P.S. While I'm sort of maintaining the program, it's only maintenance, no
> active development is going on with it and very rarely do I get a patch or
> an issue reported.

Thanks for info. FYI (even you don't do active development), although this patch
was merged, it's IMHO wrong approach.
I've sent better approach [1] and I'm going to send v2, which uses uint{16,32}_t
instead of uint{16,32}_t (fixed size types are good enough).
I'll Cc you in new patch, but feel free to ignore it.

Kind regards,
Petr

[1] https://www.redhat.com/archives/dm-devel/2019-October/msg00058.html

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
