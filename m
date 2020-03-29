Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 5684D196FE8
	for <lists+dm-devel@lfdr.de>; Sun, 29 Mar 2020 22:26:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585513575;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tZMJjQUCZmuY84dy8VOGP+elXc0y3zwBGPBTdA6oKws=;
	b=Zyi20hTGj7maB1aD8+Xdg5mF+y0fc6xmtdfHN4DUohvooAd0woibUKX9RszWPiLltrHCFr
	IHWq+y/odsl6lMcMPOGps5x/oCQXIqS9DINMoNNstm2NCQEHBywQyLEaUT+CvU0mDadcdC
	GS349sbDoRFlJeX5ouBPKv7wWRAXlXo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-3pZtmNsDNvK95HLUG_6E8w-1; Sun, 29 Mar 2020 16:26:12 -0400
X-MC-Unique: 3pZtmNsDNvK95HLUG_6E8w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75109107ACCA;
	Sun, 29 Mar 2020 20:26:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CA9C19925;
	Sun, 29 Mar 2020 20:26:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8D23D1809567;
	Sun, 29 Mar 2020 20:25:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02TKPZsd024778 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 29 Mar 2020 16:25:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4C61697AE9; Sun, 29 Mar 2020 20:25:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DB4597B02;
	Sun, 29 Mar 2020 20:25:32 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 02TKPVed032162; Sun, 29 Mar 2020 16:25:31 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 02TKPV0b032159; Sun, 29 Mar 2020 16:25:31 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Sun, 29 Mar 2020 16:25:30 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Dan Williams <dan.j.williams@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>,
	Mike Snitzer <msnitzer@redhat.com>
Message-ID: <alpine.LRH.2.02.2003291116490.9236@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, linux-nvdimm@lists.01.org
Subject: [dm-devel] Optane nvdimm performance
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

I performed some microbenchmarks on a system with real Optane-based nvdimm 
and I found out that the fastest method how to write to persistent memory 
is to fill a cacheline with 8 8-byte writes and then issue clwb or 
clflushopt on the cacheline. With this method, we can achieve 1.6 GB/s 
throughput for linear writes. On the other hand, non-temporal writes 
achieve only 1.3 GB/s.

The results are here:
http://people.redhat.com/~mpatocka/testcases/pmem/microbenchmarks/pmem.txt

The benchmarks here:
http://people.redhat.com/~mpatocka/testcases/pmem/microbenchmarks/

The winning benchmark is this:
http://people.redhat.com/~mpatocka/testcases/pmem/microbenchmarks/thrp-write-8-clwb.c


However, the kernel is not using this fastest method, it is using 
non-temporal stores instead.


I took the novafs filesystem (see git clone 
https://github.com/NVSL/linux-nova), it uses 
__copy_from_user_inatomic_nocache, which calls __copy_user_nocache which 
performs non-temporal stores. I hacked __copy_user_nocache to use clwb 
instead of non-temporal stores and it improved filesystem performance 
significantly.

This is the patch
http://people.redhat.com/~mpatocka/testcases/pmem/benchmarks/copy-nocache.patch 
(for the kernel 5.1 because novafs needs this version) and these are 
benchmark results:
http://people.redhat.com/~mpatocka/testcases/pmem/benchmarks/fs-bench.txt

- you can see that "test2" has twice the write throughput of "test1"


I took the dm-writecache driver, it uses memcpy_flushcache to write data 
to persistent memory. I hacked memcpy_flushcache to use clwb instead of 
non-temporal stores.

The result is - for 512-byte writes, non-temporal stores perform better 
than cache flushing. For 1024-byte and larger writes, cache flushing 
performs better than non-temporal stores. (I also tried to use cached 
writes + clwb for dm-writecache metadata updates, but it had bad 
performance)


Do you have some explanation why nontemporal stores are better for 
512-byte copies and worse for 1024-byte copies? (like filling up some 
buffers inside the CPU)?

In the next email, I'm sending a patch that makes memcpy_flushcache use 
clflushopt for transfers larger than 768 bytes.


Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

