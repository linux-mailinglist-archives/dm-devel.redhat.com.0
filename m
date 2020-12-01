Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C73762C93DE
	for <lists+dm-devel@lfdr.de>; Tue,  1 Dec 2020 01:24:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606782289;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=A8ucltVWziOi+utmICSnD1VHgtKfRh0RmemN86f39PQ=;
	b=h2Ck/z6pWaT4TUnXAOyrjS/tJRO7roqsbu85KtZdbSPZMcIL9vR/kg0gNoZZPXzmY8MWEO
	2e92Wb8E/TsTWgNj5NokjHbBKxPvMhuTQGHsN2HDeIpyo0LPPF6I84VVqnh0V+7hKjd99g
	yqny/Rfn5vtEHH7RGT3/ZHfmAe+mnv4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-5e5_R_L8O0awYTUOdcu72Q-1; Mon, 30 Nov 2020 19:24:46 -0500
X-MC-Unique: 5e5_R_L8O0awYTUOdcu72Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8158A1006C85;
	Tue,  1 Dec 2020 00:24:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CAC760854;
	Tue,  1 Dec 2020 00:24:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3012F4A7C6;
	Tue,  1 Dec 2020 00:24:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B10LKsi018114 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 30 Nov 2020 19:21:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 191CB2166B2B; Tue,  1 Dec 2020 00:21:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12F602166B2E
	for <dm-devel@redhat.com>; Tue,  1 Dec 2020 00:21:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BE62186E122
	for <dm-devel@redhat.com>; Tue,  1 Dec 2020 00:21:17 +0000 (UTC)
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
	[209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-453-Z0YO9TdrPR2520H-87pF0Q-1; Mon, 30 Nov 2020 19:21:15 -0500
X-MC-Unique: Z0YO9TdrPR2520H-87pF0Q-1
Received: by mail-vk1-f198.google.com with SMTP id s68so22584vkb.6
	for <dm-devel@redhat.com>; Mon, 30 Nov 2020 16:21:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hQKQXqTPRKvVYnv32OOXF3L+vo5VS+wmoEPKC6MdlJU=;
	b=tQfPPcZfkMRSPBMOJChuvk+bro7DllYTbE/c2Kte/a9i7UpdkcJ+3Zk7TbPi5t+E0e
	P10HPy+PbE/bb+AAE23bAf2EoKknX0p7fUHxQYaUuRCie3bDqHGp9EC4WipWRowBjEvN
	JhkfDge/tzv1kgvHotSO3CDgczRqmzgbuzAOjw5b/r82f8D8/WGOWv/T5UA0Kp+4C13P
	8CpcyxFZIJHcGG4N48eOvW27KL093SV+ZRQZjbdpePHeaXeUfb0C0e6MnGeRI3pVTmIm
	NEK12ZdwY4XlEl4TGLhE7S5FHh7R7YmU50yW5+58FsvBmAIt00X12mBAYjVsaOdVsTla
	e5xg==
X-Gm-Message-State: AOAM5323ikrParxvHwUvPa5CmHC8fNwONephWH0iQ4iwSCM2RThbF87f
	ucMuXyY4UjfGriziFtJ3W5m0Y+QAoF6t7NUWe7wc4UrXGc0+lTWqLw4qCByCY6NVci774K2Oc1V
	MF1sRjnId5zOeYf+9NFdTmKZa9FqvkBs=
X-Received: by 2002:ab0:4d6a:: with SMTP id k42mr367931uag.131.1606782074895; 
	Mon, 30 Nov 2020 16:21:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDWgtSzGfeASRxiwB17oIgwbMUloZ9SVF2OH9PFhTAbEtxCVcZCDOG0sUBclEWnbyJtUKFbSRVnMiZIZ47nRQ=
X-Received: by 2002:ab0:4d6a:: with SMTP id k42mr367919uag.131.1606782074669; 
	Mon, 30 Nov 2020 16:21:14 -0800 (PST)
MIME-Version: 1.0
References: <20201130171805.77712-1-snitzer@redhat.com>
	<CAMeeMh8fb2JEBmuSuTP8ys6Xr+GpFqcUr5Py73W4wCQb1MCuAw@mail.gmail.com>
	<20201130232417.GA12865@redhat.com>
In-Reply-To: <20201130232417.GA12865@redhat.com>
From: John Dorminy <jdorminy@redhat.com>
Date: Mon, 30 Nov 2020 19:21:03 -0500
Message-ID: <CAMeeMh9Ykqhc75VCSgLoj+hMpqBaV2uY7XvXUP1-FQdQLF49Ew@mail.gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linux-block <linux-block@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	Bruce Johnston <bjohnsto@redhat.com>
Subject: Re: [dm-devel] block: revert to using min_not_zero() when stacking
	chunk_sectors
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> If you're going to cherry pick a portion of a commit header please
> reference the commit id and use quotes or indentation to make it clear
> what is being referenced, etc.
Apologies.

> Quite the tangent just to setup an a toy example of say: thinp with 256K
> blocksize/chunk_sectors ontop of a RAID6 with a chunk_sectors of 128K
> and stripesize of 1280K.

I screwed up my math ... many apologies :/

Consider a thinp of chunk_sectors 512K atop a RAID6 with chunk_sectors 1280K.
(Previously, this RAID6 would be disallowed because chunk_sectors
could only be a power of 2, but 07d098e6bba removed this constraint.)
-With lcm_not_zero(), a full-device IO would be split into 2560K IOs,
which obviously spans both 512K and 1280K chunk boundaries.
-With min_not_zero(), a full-device IO would be split into 512K IOs,
some of which would span 1280k chunk boundaries. For instance, one IO
would span from offset 1024K to 1536K.
-With the hypothetical gcd_not_zero(), a full-device IO would be split
into 256K IOs, which span neither 512K nor 1280K chunk boundaries.

>
> To be clear, you are _not_ saying using lcm_not_zero() is correct.
> You're saying that simply reverting block core back to using
> min_not_zero() may not be as good as using gcd().

Assuming my understanding of chunk_sectors is correct -- which as per
blk-settings.c seems to be "a driver will not receive a bio that spans
a chunk_sector boundary, except in single-page cases" -- I believe
using lcm_not_zero() and min_not_zero() can both violate this
requirement. The current lcm_not_zero() is not correct, but also
reverting block core back to using min_not_zero() leaves edge cases as
above.

I believe gcd provides the requirement, but min_not_zero() +
disallowing non-power-of-2 chunk_sectors also provides the
requirement.

> > But it's possible I'm misunderstanding the purpose of chunk_sectors,
> > or there should be a check that the one of the two devices' chunk
> > sizes divides the other.
>
> Seriously not amused by your response, I now have to do damage control
> because you have a concern that you really weren't able to communicate
> very effectively.

Apologies.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

