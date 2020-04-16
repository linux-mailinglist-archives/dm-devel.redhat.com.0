Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 259B01ACFAF
	for <lists+dm-devel@lfdr.de>; Thu, 16 Apr 2020 20:31:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587061879;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PGecOFc4yfqeE1AZKd6oy8jTuSMvJADxG1xL1ZvXor0=;
	b=QFFG0YOwtht7HAjE3S1hkMWRRe0c6wXTH3dKQlL0F1y2JT56RGbQy4IP6pse89IN4PPxMX
	nQeT8KKVzXz7bilnroNATsNboO1UtzIoPI2OC6QVXKnrm5k5h+0KrhFcTJemvq04FQ6oky
	52hl20Ygzas6rAUz0O3dZi5QPloO1xY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-cGMxrH0UPMqJIXqVp0PK3g-1; Thu, 16 Apr 2020 14:31:16 -0400
X-MC-Unique: cGMxrH0UPMqJIXqVp0PK3g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4FE7107ACCA;
	Thu, 16 Apr 2020 18:31:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 259585C541;
	Thu, 16 Apr 2020 18:31:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1F52F18089CD;
	Thu, 16 Apr 2020 18:30:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03GISOEt022612 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Apr 2020 14:28:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9BC4F13AF50; Thu, 16 Apr 2020 18:28:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97DDE114CA9
	for <dm-devel@redhat.com>; Thu, 16 Apr 2020 18:28:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B979E101A55F
	for <dm-devel@redhat.com>; Thu, 16 Apr 2020 18:28:22 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
	[209.85.218.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-286-64MQ4-IVOc-F-f8J99NQQQ-1; Thu, 16 Apr 2020 14:28:20 -0400
X-MC-Unique: 64MQ4-IVOc-F-f8J99NQQQ-1
Received: by mail-ej1-f66.google.com with SMTP id n4so2016772ejs.11
	for <dm-devel@redhat.com>; Thu, 16 Apr 2020 11:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=o2C8tnZUkXvDOPI4LGiThjtqlJf5lF5YB6Qvi7NuNHc=;
	b=uERKo2p3moBHTqMMJjOZEOVMInaLcH4u9W5Ld3PjfeZRqxegDbDMzo3f+GmwbcTBOG
	0VEujuy937fMNYn8HelakTXXHGpEMay6EY6yZThL7YrAha1Qx4ZT5qAOLvilc5d4kAa9
	CzJ5VdmSINFH3bkRLt3QR2P+8YT5op5oxlMKszH3aqULFjbXFPuOVVzNKc8mkgJw878C
	ZDs4Y2cRbqFvkt40mutlgwjU4KWh8aFnauo1vTHZw1cH0/37OiKU508dTGJgPTNgCeaE
	6p17zTLAX507ysz/ETYf3YW0xH/oFcSAJAu4+kh8T0fvqJ+ZTa8F02ItBlnsPQ5gKI3i
	AtyA==
X-Gm-Message-State: AGi0Puatcp6vpP7cX0HAY0nce/UQ63jeUbnUlaofI4f/tfchy2UFSEIG
	8qxYtriSX7zvc6ih0vLyYzSbngyXhLBxyAjxqpDh7A==
X-Google-Smtp-Source: APiQypKg5p3UtDDDUAC5BeiqxcINJ4Q5ZLFEWimvcVbhxmgl2NSkS3aW+g4Sb0nCEKd7xDOZovcvge0jB7LET6eTihM=
X-Received: by 2002:a17:906:90cc:: with SMTP id
	v12mr10995580ejw.211.1587061699158; 
	Thu, 16 Apr 2020 11:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LRH.2.02.2004071029270.8662@file01.intranet.prod.int.rdu2.redhat.com>
	<CAPcyv4goJ2jbXNVZbMUKtRUominhuMhuTKrMh=fnhrfvC4jyjw@mail.gmail.com>
	<alpine.LRH.2.02.2004081439080.13932@file01.intranet.prod.int.rdu2.redhat.com>
	<CAPcyv4grNHvyYEc4W6PkymhEJvLb17tXbC3JZdqvtFxmMZ8DCQ@mail.gmail.com>
	<alpine.LRH.2.02.2004090612320.27517@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2004160411460.7833@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2004160411460.7833@file01.intranet.prod.int.rdu2.redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 16 Apr 2020 11:28:08 -0700
Message-ID: <CAPcyv4gpe8u=zNrRhvd9ioVNGbOJfRUXzFZuV--be6Hbj0xXtQ@mail.gmail.com>
To: Mikulas Patocka <mpatocka@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03GISOEt022612
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 16, 2020 at 1:24 AM Mikulas Patocka <mpatocka@redhat.com> wrote:
>
>
>
> On Thu, 9 Apr 2020, Mikulas Patocka wrote:
>
> > With dm-writecache on emulated pmem (with the memmap argument), we get
> >
> > With the original kernel:
> > 8508 - 11378
> > real    0m4.960s
> > user    0m0.638s
> > sys     0m4.312s
> >
> > With dm-writecache hacked to use cached writes + clflushopt:
> > 8505 - 11378
> > real    0m4.151s
> > user    0m0.560s
> > sys     0m3.582s
>
> I did some multithreaded tests:
> http://people.redhat.com/~mpatocka/testcases/pmem/microbenchmarks/pmem-multithreaded.txt
>
> And it turns out that for singlethreaded access, write+clwb performs
> better, while for multithreaded access, non-temporal stores perform
> better.
>
> 1       sequential write-nt 8 bytes             1.3 GB/s
> 2       sequential write-nt 8 bytes             2.5 GB/s
> 3       sequential write-nt 8 bytes             2.8 GB/s
> 4       sequential write-nt 8 bytes             2.8 GB/s
> 5       sequential write-nt 8 bytes             2.5 GB/s
>
> 1       sequential write 8 bytes + clwb         1.6 GB/s
> 2       sequential write 8 bytes + clwb         2.4 GB/s
> 3       sequential write 8 bytes + clwb         1.7 GB/s
> 4       sequential write 8 bytes + clwb         1.2 GB/s
> 5       sequential write 8 bytes + clwb         0.8 GB/s
>
> For one thread, we can see that write-nt 8 bytes has 1.3 GB/s and write
> 8+clwb has 1.6 GB/s, but for multiple threads, write-nt has better
> throughput.
>
> The dm-writecache target is singlethreaded (all the copying is done while
> holding the writecache lock), so it benefits from clwb.
>
> Should memcpy_flushcache be changed to write+clwb? Or are there some
> multithreaded users of memcpy_flushcache that would be hurt by this
> change?

Maybe this is asking for a specific memcpy_flushcache_inatomic()
implementation for your use case, but leave nt-writes for the general
case?


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

