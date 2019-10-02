Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C939DC476D
	for <lists+dm-devel@lfdr.de>; Wed,  2 Oct 2019 08:05:31 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2419F3082131;
	Wed,  2 Oct 2019 06:05:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A2AB614C1;
	Wed,  2 Oct 2019 06:05:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5F9F61800B74;
	Wed,  2 Oct 2019 06:05:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9265G6V012904 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Oct 2019 02:05:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B008760623; Wed,  2 Oct 2019 06:05:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AACFC60619
	for <dm-devel@redhat.com>; Wed,  2 Oct 2019 06:05:14 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 05C16308FBA7
	for <dm-devel@redhat.com>; Wed,  2 Oct 2019 06:05:13 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z9so4944388wrl.11
	for <dm-devel@redhat.com>; Tue, 01 Oct 2019 23:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=nd+PtbLJYwM3ydRqWV7i/Bh0Eh3VjHKbxo0adsXvO48=;
	b=bHKTPVG/N3uHFRfhU4UtA1/CnLTgLiwuJWPW6D/t5S2hrpv4v2E26FJySSjdit/nLe
	MjnhkEIzVRhBuzxWAzTWpGq8R+qxI7JnQ+3/lC5+Veh/rcipCFYUBhVGZ46F7qARGtjE
	z30uDAso1iJ2iGLpEyRC7QYYu1yi7KfOc7TtSF77jPMhY4KtQT1wMqI3kDx3M5+srOuw
	31ADbOaW2gw/ts7hU2LWlmTsHJWbP7IJyw+/4sLiAqioakplrK9/mbSEtD21YKavbaSQ
	yhM6dwwy48wC84miETua4ZTyH4YKbu3g6NmBbyJR/sNqxe28FsNKuU5xZbTKbpDGdNGY
	Xk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=nd+PtbLJYwM3ydRqWV7i/Bh0Eh3VjHKbxo0adsXvO48=;
	b=M0j1MXj5RZ/eWyWrjJQKH5zwo1z5DicMCcovnaQGLjzWZoEhc+DwnAG2gMag0pZrUL
	dv4BDyfRdTMVp9ZzbP69VLnyv6R4eSMldhMWTUb7bXU5vII8ydEa807ImRB7g4PrBtbO
	g4Ii/RlxMGmhaOQcJdN324r6qiT9oOZQKyd3i/iatzCQBd1ztQQ/RAwXfsn+pDTKkwBd
	N8EwVg1cNvVeOW/RarCPFaA5iApiL/2flFt1vKchkSWlpFD34pKXbZnbYtUxDTLBKcKk
	uWgML507To8asNvhcipsB2JETk4XXmdJIiUSmwlOgb4iHOiWxnkB9v9a9gNQuL7FmMNL
	RMZw==
X-Gm-Message-State: APjAAAWgW2mROENQE7ezzNzeB5fOHNbXj4FW8/voT62yHn7LlqcCAExi
	OJoualVejD/fqvpseCYLwSNSaNvM
X-Google-Smtp-Source: APXvYqz6ALflVRB1r9I+cvO1xqTzFuLTqtd+3wZG/wiZvSr1Ljlcpg1Y/SJtB6nSd+FACxsth9hGlQ==
X-Received: by 2002:a05:6000:128e:: with SMTP id
	f14mr1086510wrx.383.1569996311721; 
	Tue, 01 Oct 2019 23:05:11 -0700 (PDT)
Received: from x230 ([62.201.25.198]) by smtp.gmail.com with ESMTPSA id
	y186sm10358386wmb.41.2019.10.01.23.05.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 01 Oct 2019 23:05:11 -0700 (PDT)
Date: Wed, 2 Oct 2019 08:05:09 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20191002060508.GA16684@x230>
References: <20190708213551.26349-1-petr.vorel@gmail.com>
	<20190709024742.GA22293@infradead.org>
	<20190709080204.GA12875@dell5510>
	<20190709133436.GA2231@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190709133436.GA2231@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Wed, 02 Oct 2019 06:05:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Wed, 02 Oct 2019 06:05:13 +0000 (UTC) for IP:'209.85.221.66'
	DOMAIN:'mail-wr1-f66.google.com' HELO:'mail-wr1-f66.google.com'
	FROM:'petr.vorel@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.221.66 mail-wr1-f66.google.com 209.85.221.66
	mail-wr1-f66.google.com <petr.vorel@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Wed, 02 Oct 2019 06:05:30 +0000 (UTC)

Hi Christoph,

> On Tue, Jul 09, 2019 at 10:02:05AM +0200, Petr Vorel wrote:

> > > What this really should use is fixed size types.
> > If it's not specific to __kernel_daddr_t nor daddr_t ("The type of a disk
> > address") and long is sufficient for all platforms, that's even better.

> > I'd be just for removing typedef int daddr_t comment.

> > BTW gpart also uses struct solaris_x86_slice, with daddr_t [1].
> > I've filed a PR [2], but I guess I'll change it to long.

> solaris_x86_slice is an on-disk format, defined for good old 32-bit
> x86 Solaris.  So the question is not if it is enough, but if it matches
> what Solaris does.  I don't have the Solaris source at the moment,
> but here is what the Linux kernel uses:

> struct solaris_x86_slice {
>         __le16 s_tag;           /* ID tag of partition */
>         __le16 s_flag;          /* permission flags */
>         __le32 s_start;         /* start sector no of partition */
>         __le32 s_size;          /* # of blocks in partition */
> };

I tried to search in [1], with not much success, I don't know the original name
of the struct and struct members are quite similar. Do you have a tip, where it
could be or would you dare to search?

Christophe already merged my patch as
129e6fe6 ("kpartx: Use __kernel_daddr_t for solaris_x86_slice.s_start")

But, according to your comments it looks to me better to use the exact structure
kernel uses. So, if we don't find anything, I'd be for using kernel struct.

Kind regards,
Petr

[1] https://grok.elemental.org/source/

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
