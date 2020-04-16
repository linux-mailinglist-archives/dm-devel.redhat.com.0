Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7A91C1ABB17
	for <lists+dm-devel@lfdr.de>; Thu, 16 Apr 2020 10:25:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587025520;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Lo1kUJHub4u7K0Q0XzNMtapbuQ+I8vewhD7pwHVyov4=;
	b=hFwbE4D1AwPFm4djIlZqgNcv+QMeLYR9lD6phQ3tf+frdy5PGOjlamy0LsAX1cW8MkMl7H
	BAfly4DTRvtlZb9y9dHPB7EBe9HluX84/Kxk0E7pMBJcBFB/WLLOiOvhZx5lRPPmJIGlfS
	NMwOLP4AQcNB0JNROTzX6o1/PtCsoWQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-AIaMN81YM4iTPfKu3w7SNQ-1; Thu, 16 Apr 2020 04:25:17 -0400
X-MC-Unique: AIaMN81YM4iTPfKu3w7SNQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E6D3DB23;
	Thu, 16 Apr 2020 08:25:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AAE1F99E03;
	Thu, 16 Apr 2020 08:24:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D5C0318089CD;
	Thu, 16 Apr 2020 08:24:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03G8OQGX014907 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Apr 2020 04:24:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DE691CFDEC; Thu, 16 Apr 2020 08:24:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A80E119DED;
	Thu, 16 Apr 2020 08:24:24 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 03G8ONMg008685; Thu, 16 Apr 2020 04:24:23 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 03G8OKM4008681; Thu, 16 Apr 2020 04:24:21 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Thu, 16 Apr 2020 04:24:20 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Dan Williams <dan.j.williams@intel.com>
In-Reply-To: <alpine.LRH.2.02.2004090612320.27517@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LRH.2.02.2004160411460.7833@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2004071029270.8662@file01.intranet.prod.int.rdu2.redhat.com>
	<CAPcyv4goJ2jbXNVZbMUKtRUominhuMhuTKrMh=fnhrfvC4jyjw@mail.gmail.com>
	<alpine.LRH.2.02.2004081439080.13932@file01.intranet.prod.int.rdu2.redhat.com>
	<CAPcyv4grNHvyYEc4W6PkymhEJvLb17tXbC3JZdqvtFxmMZ8DCQ@mail.gmail.com>
	<alpine.LRH.2.02.2004090612320.27517@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Peter Zijlstra <peterz@infradead.org>, X86 ML <x86@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [dm-devel] [PATCH] memcpy_flushcache: use cache flusing for
 larger lengths
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



On Thu, 9 Apr 2020, Mikulas Patocka wrote:

> With dm-writecache on emulated pmem (with the memmap argument), we get
> 
> With the original kernel:
> 8508 - 11378
> real    0m4.960s
> user    0m0.638s
> sys     0m4.312s
> 
> With dm-writecache hacked to use cached writes + clflushopt:
> 8505 - 11378
> real    0m4.151s
> user    0m0.560s
> sys     0m3.582s

I did some multithreaded tests: 
http://people.redhat.com/~mpatocka/testcases/pmem/microbenchmarks/pmem-multithreaded.txt

And it turns out that for singlethreaded access, write+clwb performs 
better, while for multithreaded access, non-temporal stores perform 
better.

1       sequential write-nt 8 bytes             1.3 GB/s
2       sequential write-nt 8 bytes             2.5 GB/s
3       sequential write-nt 8 bytes             2.8 GB/s
4       sequential write-nt 8 bytes             2.8 GB/s
5       sequential write-nt 8 bytes             2.5 GB/s

1       sequential write 8 bytes + clwb         1.6 GB/s
2       sequential write 8 bytes + clwb         2.4 GB/s
3       sequential write 8 bytes + clwb         1.7 GB/s
4       sequential write 8 bytes + clwb         1.2 GB/s
5       sequential write 8 bytes + clwb         0.8 GB/s

For one thread, we can see that write-nt 8 bytes has 1.3 GB/s and write 
8+clwb has 1.6 GB/s, but for multiple threads, write-nt has better 
throughput.

The dm-writecache target is singlethreaded (all the copying is done while 
holding the writecache lock), so it benefits from clwb.

Should memcpy_flushcache be changed to write+clwb? Or are there some 
multithreaded users of memcpy_flushcache that would be hurt by this 
change?

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

