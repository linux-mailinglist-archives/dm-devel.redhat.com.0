Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B425020325A
	for <lists+dm-devel@lfdr.de>; Mon, 22 Jun 2020 10:47:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592815661;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=okxmxCL2WH3Al3bIx/Ga9MKP2ghWE/AUPM+q9m0lD2Q=;
	b=ZCLrB/id84kahsJf1UBxQ8REUR2Y0nsASaBRvpitV20MM2oMVHzku2lj/DkaLclj3MbA9w
	wVgTDx03PJbKiCZLMyw+vXnmnPF00q20cr9zuRUPzzCLYGdEhpwvfnTylix/LvQ3nmmPoq
	b+LJ7lQx8/cpM5HwV1/K+o/w7BC/ZWY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-1fcpLa0-O2unp66AVFYptw-1; Mon, 22 Jun 2020 04:47:39 -0400
X-MC-Unique: 1fcpLa0-O2unp66AVFYptw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C336A835B40;
	Mon, 22 Jun 2020 08:47:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A11F85D9D5;
	Mon, 22 Jun 2020 08:47:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5930B180954D;
	Mon, 22 Jun 2020 08:47:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05KL2uvi028003 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 20 Jun 2020 17:02:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EAEE6112D170; Sat, 20 Jun 2020 21:02:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E57D7112C268
	for <dm-devel@redhat.com>; Sat, 20 Jun 2020 21:02:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BAA5C101A526
	for <dm-devel@redhat.com>; Sat, 20 Jun 2020 21:02:52 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-352-fxqGssnTMPmMV9QZL2W7Gg-1; Sat, 20 Jun 2020 17:02:48 -0400
X-MC-Unique: fxqGssnTMPmMV9QZL2W7Gg-1
Received: by mail-wr1-f66.google.com with SMTP id c3so12941716wru.12
	for <dm-devel@redhat.com>; Sat, 20 Jun 2020 14:02:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UK/b7D+TDaCrVMB4MYWyMIM/SEpzN9NfRE/O/U09lk0=;
	b=J8sw+ikd0/4n0eMv3QFVpwQGz1i+Az/AL6jmBDSmQFBsXLY/vfrzlduKI3Ex7ygGnA
	EgMLASP4ZFEhl3xr0+M5keGrQxCi4uxVsvjmGjsGR8QTr8zQTg/lbM8gX3V9tM33oio+
	ijXqewcQe3w/IGWL3VAivXqLyVwABKuuR2PdMImAxQghoI0+wCRZyMB/bYO3LHwmGiJC
	a4g82XfHkqD2iR2z35CiP+RUxbE5vypIUkWnQjvYsseApCoMKUN+jd04XwgwfM3hwBJT
	28bSn1+nKmrpAgVF0wq2Ke7nsQwqhptngyMOZXUBhuRgZXoX4GgDJy2t8SkyJjjnJiiv
	BRnQ==
X-Gm-Message-State: AOAM532+HsGl6cVBPHLLsQ2BrNG3PWgsebCPdWROQcSrMf4oVdS9JA1l
	U+POEEziqF+IpfEtSVv9h6qmQ2WcTqE2rXrAZs8pJA==
X-Google-Smtp-Source: ABdhPJwne0faQxsH1AV+Rbyt9DjggiwqGRPOyyks3+UnxD4RvMo3kd9QadfLQ7IwwR7btf52DKKCa9bzgz6I0S/v4xM=
X-Received: by 2002:a5d:470b:: with SMTP id y11mr1563972wrq.101.1592686966821; 
	Sat, 20 Jun 2020 14:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200619164132.1648-1-ignat@cloudflare.com>
	<20200619165548.GA24779@redhat.com>
	<alpine.LRH.2.02.2006191429060.23991@file01.intranet.prod.int.rdu2.redhat.com>
	<20200620012332.GA25340@gondor.apana.org.au>
	<alpine.LRH.2.02.2006201535280.24999@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2006201535280.24999@file01.intranet.prod.int.rdu2.redhat.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Sat, 20 Jun 2020 22:02:36 +0100
Message-ID: <CALrw=nHZK7JhUO+-vAeMxCZqTBGBkWckBeg56pFuc1bo6yep6A@mail.gmail.com>
To: Mikulas Patocka <mpatocka@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 22 Jun 2020 04:47:18 -0400
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Mike Snitzer <snitzer@redhat.com>,
	kernel-team <kernel-team@cloudflare.com>, dm-crypt@saout.de,
	linux-kernel <linux-kernel@vger.kernel.org>, dm-devel@redhat.com,
	"David S. Miller" <davem@davemloft.net>, agk@redhat.com
Subject: Re: [dm-devel] [RFC PATCH 0/1] dm-crypt excessive overhead
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Yes, it should.

I got one when I was testing the first iteration (without the tasklet)
of the patch on an NVME? disk.

On Sat, Jun 20, 2020 at 8:36 PM Mikulas Patocka <mpatocka@redhat.com> wrote:
>
>
>
> On Sat, 20 Jun 2020, Herbert Xu wrote:
>
> > On Fri, Jun 19, 2020 at 02:39:39PM -0400, Mikulas Patocka wrote:
> > >
> > > I'm looking at this and I'd like to know why does the crypto API fail in
> > > hard-irq context and why does it work in tasklet context. What's the exact
> > > reason behind this?
> >
> > You're not supposed to do any real work in IRQ handlers.  All
> > the substantial work should be postponed to softirq context.
>
> I see.
>
> BTW - should it also warn if it is running in a process context with
> interrupts disabled?
>
> Mikulas
>
> > Why do you need to do work in hard IRQ context?
> >
> > Cheers,
> > --
> > Email: Herbert Xu <herbert@gondor.apana.org.au>
> > Home Page: http://gondor.apana.org.au/~herbert/
> > PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
> >
>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

