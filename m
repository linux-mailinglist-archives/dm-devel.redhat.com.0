Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3A389201A7E
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 20:40:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592592016;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GVevBHs6/Y6bNvXsUHxMRq5n7vig4/+PNK62jPB/nLo=;
	b=jWgP4JlCOsSFwfxGYaqwBHexTHg4i+LNFuBex0X/mqkWDSn6KR75tcFDtaBhiVnus0AhjL
	GhaL9n4nLxfV47aHawnqGwjHI3Nu/qSRwoMcXj2P/8+nhAW1waLXSE3a+eTHYmAZ7D9Rsl
	gvEKNDBLvoybsLVODGd986I4l/nlQO0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-zUhdRqvsPIyo9-o2h55KnQ-1; Fri, 19 Jun 2020 14:40:13 -0400
X-MC-Unique: zUhdRqvsPIyo9-o2h55KnQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0D27835B40;
	Fri, 19 Jun 2020 18:40:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC6837C1E5;
	Fri, 19 Jun 2020 18:40:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 36C24833CE;
	Fri, 19 Jun 2020 18:39:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JIdkDM013978 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 14:39:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EA90119D9E; Fri, 19 Jun 2020 18:39:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5718619D7B;
	Fri, 19 Jun 2020 18:39:41 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 05JIde6C026822; Fri, 19 Jun 2020 14:39:40 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 05JIddo9026818; Fri, 19 Jun 2020 14:39:39 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Fri, 19 Jun 2020 14:39:39 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Ignat Korchagin <ignat@cloudflare.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
In-Reply-To: <20200619165548.GA24779@redhat.com>
Message-ID: <alpine.LRH.2.02.2006191429060.23991@file01.intranet.prod.int.rdu2.redhat.com>
References: <20200619164132.1648-1-ignat@cloudflare.com>
	<20200619165548.GA24779@redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@redhat.com>, kernel-team@cloudflare.com,
	dm-crypt@saout.de, linux-kernel@vger.kernel.org,
	dm-devel@redhat.com, agk@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Fri, 19 Jun 2020, Mike Snitzer wrote:

> On Fri, Jun 19 2020 at 12:41pm -0400,
> Ignat Korchagin <ignat@cloudflare.com> wrote:
> 
> > This is a follow up from the long-forgotten [1], but with some more convincing
> > evidence. Consider the following script:
> > 
> > [1]: https://www.spinics.net/lists/dm-crypt/msg07516.html
> > [2]: https://blog.cloudflare.com/speeding-up-linux-disk-encryption/
> > 
> > Ignat Korchagin (1):
> >   Add DM_CRYPT_FORCE_INLINE flag to dm-crypt target
> > 
> >  drivers/md/dm-crypt.c | 55 +++++++++++++++++++++++++++++++++----------
> >  1 file changed, 43 insertions(+), 12 deletions(-)
> > 
> > -- 
> > 2.20.1
> > 
> 
> Hi,
> 
> I saw [2] and have been expecting something from cloudflare ever since.
> Nice to see this submission.
> 
> There is useful context in your 0th patch header.  I'll likely merge
> parts of this patch header with the more terse 1/1 header (reality is
> there only needed to be a single patch submission).
> 
> Will review and stage accordingly if all looks fine to me.  Mikulas,
> please have a look too.
> 
> Thanks,
> Mike

+       if (test_bit(DM_CRYPT_FORCE_INLINE, &cc->flags)) {
+               if (in_irq()) {
+                       /* Crypto API will fail hard in hard IRQ context */
+                       tasklet_init(&io->tasklet, kcryptd_crypt_tasklet, (unsigned long)&io->work);
+                       tasklet_schedule(&io->tasklet);
+               } else
+                       kcryptd_crypt(&io->work);
+       } else {
+               INIT_WORK(&io->work, kcryptd_crypt);
+               queue_work(cc->crypt_queue, &io->work);
+       }

I'm looking at this and I'd like to know why does the crypto API fail in 
hard-irq context and why does it work in tasklet context. What's the exact 
reason behind this?

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

