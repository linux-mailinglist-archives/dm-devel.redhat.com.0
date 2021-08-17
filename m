Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B12373EF394
	for <lists+dm-devel@lfdr.de>; Tue, 17 Aug 2021 22:43:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629232994;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=98/eKWN0arLE3hWVVi9ekv7o9TSlrc7pIwp7Ubt0IRw=;
	b=T0Vv4YxVVjXGqnQiPX2b2Tb6ARkgYtuLRzSo+FmCIA1lCGEx0cObnIJ0iyynCxbN9J6v8Z
	yqv0qWphrwd7gZhvoHk+LGGnmdCd/kGzi30g17WYwBfWij8nThb/7icPcCbbrApoTsn08q
	fylnnvK23G1WwW3WeDzlkQj5leERsUs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-v9XU7DIFPBG7HWWs0oYytA-1; Tue, 17 Aug 2021 16:43:13 -0400
X-MC-Unique: v9XU7DIFPBG7HWWs0oYytA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 274FB107B7C4;
	Tue, 17 Aug 2021 20:43:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AD0160BF4;
	Tue, 17 Aug 2021 20:43:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 865E9181A6E2;
	Tue, 17 Aug 2021 20:43:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17HKfht6017877 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 17 Aug 2021 16:41:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CF08060C81; Tue, 17 Aug 2021 20:41:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3995E60BF4;
	Tue, 17 Aug 2021 20:41:36 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 17HKfZQS031822; Tue, 17 Aug 2021 16:41:35 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 17HKfZrZ031818; Tue, 17 Aug 2021 16:41:35 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 17 Aug 2021 16:41:35 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <ad3561b9-775d-dd4d-0d92-6343440b1f8f@acm.org>
Message-ID: <alpine.LRH.2.02.2108171630120.30363@file01.intranet.prod.int.rdu2.redhat.com>
References: <20210817101423.12367-1-selvakuma.s1@samsung.com>
	<CGME20210817101758epcas5p1ec353b3838d64654e69488229256d9eb@epcas5p1.samsung.com>
	<20210817101423.12367-4-selvakuma.s1@samsung.com>
	<ad3561b9-775d-dd4d-0d92-6343440b1f8f@acm.org>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	djwong@kernel.org, linux-nvme@lists.infradead.org,
	dm-devel@redhat.com, hch@lst.de, agk@redhat.com,
	linux-scsi@vger.kernel.org, nitheshshetty@gmail.com,
	willy@infradead.org, nj.shetty@samsung.com, kch@kernel.org,
	SelvaKumar S <selvakuma.s1@samsung.com>, selvajove@gmail.com,
	linux-block@vger.kernel.org, javier.gonz@samsung.com,
	kbusch@kernel.org, axboe@kernel.dk, damien.lemoal@wdc.com,
	joshi.k@samsung.com, "Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-api@vger.kernel.org, johannes.thumshirn@wdc.com,
	linux-fsdevel@vger.kernel.org, joshiiitr@gmail.com, asml.silence@gmail.com
Subject: Re: [dm-devel] [PATCH 3/7] block: copy offload support
	infrastructure
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Tue, 17 Aug 2021, Bart Van Assche wrote:

> On 8/17/21 3:14 AM, SelvaKumar S wrote:
> > Introduce REQ_OP_COPY, a no-merge copy offload operation. Create
> > bio with control information as payload and submit to the device.
> > Larger copy operation may be divided if necessary by looking at device
> > limits. REQ_OP_COPY(19) is a write op and takes zone_write_lock when
> > submitted to zoned device.
> > Native copy offload is not supported for stacked devices.
> 
> Using a single operation for copy-offloading instead of separate operations
> for reading and writing is fundamentally incompatible with the device mapper.
> I think we need a copy-offloading implementation that is compatible with the
> device mapper.

I once wrote a copy offload implementation that is compatible with device 
mapper. The copy operation creates two bios (one for reading and one for 
writing), passes them independently through device mapper and pairs them 
at the physical device driver.

It's here: http://people.redhat.com/~mpatocka/patches/kernel/xcopy/current

I verified that it works with iSCSI. Would you be interested in continuing 
this work?

Mikulas

> Storing the parameters of the copy operation in the bio payload is
> incompatible with the current implementation of bio_split().
> 
> In other words, I think there are fundamental problems with this patch series.
> 
> Bart.
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

