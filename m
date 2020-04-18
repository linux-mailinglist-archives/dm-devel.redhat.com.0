Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0251A1AF18E
	for <lists+dm-devel@lfdr.de>; Sat, 18 Apr 2020 17:22:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587223343;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rIWnWEAvMfxWsuiGGo9/qaf6osYGdkLp/dT2sEqi2Yc=;
	b=DmcFulMBJMXJbSAPnXERAL7hzZ9QnUhL2+zTjz4AxzFD16CA6ifeQz9VBqlI7BC89v6972
	esWqLr1S6BLmmtybAxk8uA4aRX5JdGS1DP99pJw4vDATdK+QObQVD56jJ88RkBFUS0PS9F
	cvR/voOMVCNZvRPjTDFM7ueYo9lMtZI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-tcjD0dOiM1ui9wRsEf32qA-1; Sat, 18 Apr 2020 11:22:21 -0400
X-MC-Unique: tcjD0dOiM1ui9wRsEf32qA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 947008017FC;
	Sat, 18 Apr 2020 15:22:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 09B34100EBA7;
	Sat, 18 Apr 2020 15:22:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 615DD1809567;
	Sat, 18 Apr 2020 15:21:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03IFLZNg003992 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 18 Apr 2020 11:21:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 10E395C1C5; Sat, 18 Apr 2020 15:21:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9058D5C1C3;
	Sat, 18 Apr 2020 15:21:31 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 03IFLVw4030597; Sat, 18 Apr 2020 11:21:31 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 03IFLR2e030593; Sat, 18 Apr 2020 11:21:28 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Sat, 18 Apr 2020 11:21:27 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: David Laight <David.Laight@ACULAB.COM>
In-Reply-To: <69c2e011c5814255926f309dd50e6d67@AcuMS.aculab.com>
Message-ID: <alpine.LRH.2.02.2004181110160.30139@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2004071029270.8662@file01.intranet.prod.int.rdu2.redhat.com>
	<CAPcyv4goJ2jbXNVZbMUKtRUominhuMhuTKrMh=fnhrfvC4jyjw@mail.gmail.com>
	<alpine.LRH.2.02.2004081439080.13932@file01.intranet.prod.int.rdu2.redhat.com>
	<CAPcyv4grNHvyYEc4W6PkymhEJvLb17tXbC3JZdqvtFxmMZ8DCQ@mail.gmail.com>
	<alpine.LRH.2.02.2004090612320.27517@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2004160411460.7833@file01.intranet.prod.int.rdu2.redhat.com>
	<CAPcyv4gpe8u=zNrRhvd9ioVNGbOJfRUXzFZuV--be6Hbj0xXtQ@mail.gmail.com>
	<alpine.LRH.2.02.2004170831530.16047@file01.intranet.prod.int.rdu2.redhat.com>
	<69c2e011c5814255926f309dd50e6d67@AcuMS.aculab.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Peter Zijlstra <peterz@infradead.org>, X86 ML <x86@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>, Dan Williams <dan.j.williams@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [dm-devel] [PATCH] x86: introduce memcpy_flushcache_clflushopt
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Sat, 18 Apr 2020, David Laight wrote:

> From: Mikulas Patocka
> > Sent: 17 April 2020 13:47
> ...
> > Index: linux-2.6/drivers/md/dm-writecache.c
> > ===================================================================
> > --- linux-2.6.orig/drivers/md/dm-writecache.c	2020-04-17 14:06:35.139999000 +0200
> > +++ linux-2.6/drivers/md/dm-writecache.c	2020-04-17 14:06:35.129999000 +0200
> > @@ -1166,7 +1166,10 @@ static void bio_copy_block(struct dm_wri
> >  			}
> >  		} else {
> >  			flush_dcache_page(bio_page(bio));
> > -			memcpy_flushcache(data, buf, size);
> > +			if (likely(size > 512))
> > +				memcpy_flushcache_clflushopt(data, buf, size);
> > +			else
> > +				memcpy_flushcache(data, buf, size);
> 
> Hmmm... have you looked at how long clflush actually takes?
> It isn't too bad if you just do a small number, but using it
> to flush large buffers can be very slow.

Yes, I have. It's here: 
http://people.redhat.com/~mpatocka/testcases/pmem/microbenchmarks/pmem.txt

sequential write 8 + clflush	- 0.3 GB/s on nvdimm
sequential write 8 + clflushopt - 1.6 GB/s on nvdimm
sequential write-nt 8 bytes	- 1.3 GB/s on nvdimm

> I've an Ivy bridge system where the X-server process requests the
> frame buffer be flushed out every 10 seconds (no idea why).
> With my 2560x1440 monitor this takes over 3ms.
> 
> This really needs a cond_resched() every few clflush instructions.
> 
> 	David

AFAIK Ivy Bridge doesn't have clflushopt, it only has clflush. clflush 
only allows one outstanding cacle line flush, so it's very slow. 
clflushopt and clwb relaxed this restriction and there can be multiple 
cache-invalidation requests in flight until the user serializes it with 
the sfence instruction.

The patch checks for clflushopt with 
"static_cpu_has(X86_FEATURE_CLFLUSHOPT)" and if it is not present, it 
falls back to non-temporal stores.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

