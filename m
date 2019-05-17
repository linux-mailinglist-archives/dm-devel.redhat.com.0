Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F1721B6E
	for <lists+dm-devel@lfdr.de>; Fri, 17 May 2019 18:18:24 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 81FD43001830;
	Fri, 17 May 2019 16:18:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 208D217C4A;
	Fri, 17 May 2019 16:18:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2B0E31806B11;
	Fri, 17 May 2019 16:18:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4HGIBAV030873 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 17 May 2019 12:18:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C04349CC2; Fri, 17 May 2019 16:18:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BAB235B806
	for <dm-devel@redhat.com>; Fri, 17 May 2019 16:18:09 +0000 (UTC)
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4458030C1B96
	for <dm-devel@redhat.com>; Fri, 17 May 2019 16:17:57 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id f24so8583526qtk.11
	for <dm-devel@redhat.com>; Fri, 17 May 2019 09:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gpiccoli-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=y4FffnAnwdRE+1PgwVKRrOC66n7RnysXVy2HJUpNb2M=;
	b=c1Geez7bVZbVWrY4f+4RoXhbwUhzklz/7bC0OK5tQLJ7Bqwo2i4ZRZN+WyhS7YjMRX
	OigAhZQafsBif5DZx+nzKNAnFTPJPtDJNIIsGXVv+hYf7GdpoRBCcIq3Sm3eJEWn0uOm
	KE06l+A/nU5cszw5p9lZqZFu8BgXlk7C98t0NwBl6Q1pPQvfcyvPmqO4P0pyc0nNb8Pe
	hvea1fmleiuAgn5jdS2KgdJIAi9JZavLtc8mgHBB2aBCl7B0Syf7/MXuCwq4Gx5Xy9jX
	4LYkN1Z1r1DAQIlJNLZ2dJkpH0TgyvTd4FWN+XzmAa29nCx9kjF8BWUM0k/0psETkJrQ
	OO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=y4FffnAnwdRE+1PgwVKRrOC66n7RnysXVy2HJUpNb2M=;
	b=J54SkHXzJo32bwcpKe9JtdpuYHPxUvPdm9SQoum9P966CXWYIDNcRF1tTS5zx8VcAE
	W4n43mQPWOG05Kzjim5s1UXVs9EtQih4QIJiga3h+pHWyQ3e2B0ftXVkVZWv4rfXA399
	a8TkSFbQqSi8873bO2Qtl6g8LdQcLUB1IUqOuvgkXL9bfYrmtcG3R0WqmzyNI3nYGfPh
	tCeKATe28Om8x5d/JqWb6l2vm7y3K8DS2m+yRJ7cqIw0C3T+uGuKc3e+Wbwt3dRkZGaX
	eu+7LnFz3Ps+0I9w8p3IZ2NjDW1lrHHxgyoYmBBncKeJ4JxJ0Y5RCH1YxX75Sn8RqrKb
	LmVw==
X-Gm-Message-State: APjAAAUq6uA6X+XWacNE9Wdso7qIz3luXB/JH0MkLxF+P2u+it8gsZKe
	QKgxbkGbcxAECIDE9RAf4YDUBPV4Q8Jnk8ptLSscoQ==
X-Google-Smtp-Source: APXvYqzbeRUmj6xRCLSv9g2lWjKr1SwKV3qpXEK7UfptQnDMaaQvvApWUcRABpavgtAEHwcAbEJT7QLHUWF8CTer57s=
X-Received: by 2002:ac8:2ac5:: with SMTP id c5mr44962908qta.332.1558109871467; 
	Fri, 17 May 2019 09:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190430223722.20845-1-gpiccoli@canonical.com>
	<CAKM4Aez=eC96uyqJa+=Aom2M2eQnknQW_uY4v9NMVpROSiuKSg@mail.gmail.com>
In-Reply-To: <CAKM4Aez=eC96uyqJa+=Aom2M2eQnknQW_uY4v9NMVpROSiuKSg@mail.gmail.com>
From: "Guilherme G. Piccoli" <kernel@gpiccoli.net>
Date: Fri, 17 May 2019 13:17:15 -0300
Message-ID: <CALJn8nME9NQGsSqLXHQPEizFfKUzxozfYy-2510MHyMPHRzhfw@mail.gmail.com>
To: Eric Ren <renzhengeek@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 17 May 2019 16:17:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Fri, 17 May 2019 16:17:57 +0000 (UTC) for IP:'209.85.160.194'
	DOMAIN:'mail-qt1-f194.google.com'
	HELO:'mail-qt1-f194.google.com' FROM:'guilherme@gpiccoli.net'
	RCPT:''
X-RedHat-Spam-Score: -0.006  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_NONE) 209.85.160.194 mail-qt1-f194.google.com 209.85.160.194
	mail-qt1-f194.google.com <guilherme@gpiccoli.net>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, linux-raid <linux-raid@vger.kernel.org>,
	Bart Van Assche <bvanassche@acm.org>,
	"Guilherme G. Piccoli" <gpiccoli@canonical.com>,
	stable@vger.kernel.org, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Jay Vosburgh <jay.vosburgh@canonical.com>,
	Gavin Guo <gavin.guo@canonical.com>
Subject: Re: [dm-devel] [PATCH 1/2] block: Fix a NULL pointer dereference in
	generic_make_request()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Fri, 17 May 2019 16:18:23 +0000 (UTC)

On Fri, May 17, 2019 at 12:33 AM Eric Ren <renzhengeek@gmail.com> wrote:
>
> Hello,
> [...]
> Thanks for the bugfix. I also had a panic having very similar
> calltrace below as this one,
> when using devicemapper in container scenario and deleting many thin
> snapshots by dmsetup
> remove_all -f, meanwhile executing lvm command like vgs.
>
> After applied this one, my testing doesn't crash kernel any more for
> one week.  Could the block
> developers please give more feedback/priority on this one?
>

Thanks Eric, for the testing! I think you could send your Tested-by[0]
tag, which could be added
in the patch before merge. It's good to know the patch helped somebody
and your testing improves
confidence in the change.

Cheers,


Guilherme

[0] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
