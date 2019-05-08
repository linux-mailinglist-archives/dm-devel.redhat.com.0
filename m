Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B479917E70
	for <lists+dm-devel@lfdr.de>; Wed,  8 May 2019 18:47:29 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8440D89C38;
	Wed,  8 May 2019 16:47:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4CFA5DE6A;
	Wed,  8 May 2019 16:47:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1790E18089CA;
	Wed,  8 May 2019 16:46:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x48GkYtI023983 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 8 May 2019 12:46:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 90A2C608A6; Wed,  8 May 2019 16:46:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 44114608E4;
	Wed,  8 May 2019 16:46:30 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id x48GkTHH001260; Wed, 8 May 2019 12:46:29 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id x48GkT3I001250; Wed, 8 May 2019 12:46:29 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 8 May 2019 12:46:29 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <snitzer@redhat.com>
In-Reply-To: <20190507185154.GB24320@redhat.com>
Message-ID: <alpine.LRH.2.02.1905081228270.29650@file01.intranet.prod.int.rdu2.redhat.com>
References: <20190429125746.036036640@debian-a64.vm>
	<20190507185154.GB24320@redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Ondrej Kozina <okozina@redhat.com>, Heinz Mauelshagen <heinzm@redhat.com>,
	dm-devel@redhat.com, Alasdair G Kergon <agk@redhat.com>,
	Milan Broz <mbroz@redhat.com>
Subject: Re: [dm-devel] [PATCH 08/10] dm-integrity: add a bitmap mode
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Wed, 08 May 2019 16:47:28 +0000 (UTC)



On Tue, 7 May 2019, Mike Snitzer wrote:

> On Mon, Apr 29 2019 at  8:57am -0400,
> Mikulas Patocka <mpatocka@redhat.com> wrote:
> 
> > Add a new bitmap mode for dm-integrity.
> > 
> > Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> 
> This patch header needs much more detail.
> 
> Can you please be as informative and detailed as possible about what
> this new bitmap mode is (what constraints it has, where it is expected
> to be useful, etc)?  Also, if you have them, provide some benchmarks
> that showcase its benefits.
> 
> Thanks,
> Mike

The patch adds the documentation to the file 
"Documentation/device-mapper/dm-integrity.txt", so it can be also used as 
a patch header. For example:

"This patch introduces an alternative mode of operation whete dm-integrity 
uses bitmap instead of a journal. If a bit in the bitmap is 1, the 
corresponding region's data and integrity tags are not synchronized - if 
the machine crashes, the unsynchronized regions will be recalculated. The 
bitmap mode is faster than the journal mode, because we don't have to 
write the data twice, but it is also less reliable, because if data 
corruption happens when the machine crashes, it may not be detected."

Benchmark - on an SSD connected to a SATA300 port, when doing large linear 
writes with dd.

buffered I/O:
	raw device throughput - 245MB/s
	dm-integrity with journaling - 120MB/s
	dm-integrity with bitmap - 238MB/s

direct I/O with 1MB block size:
	raw device throughput - 248MB/s
	dm-integrity with journaling - 123MB/s
	dm-integrity with bitmap - 223MB/s

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
