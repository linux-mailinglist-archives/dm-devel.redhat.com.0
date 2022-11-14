Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3F7627C5C
	for <lists+dm-devel@lfdr.de>; Mon, 14 Nov 2022 12:31:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668425504;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/rkDnT6JEmf9s8JZNLJe94A+wu9o7Jsvi1S5DPUK9Tg=;
	b=DADD4T2YUicLGEO58rmbUVk4exesNCexXSVbwlqAo0qIMnpNv0oYu8Qrr2uaCmgBXH0HsH
	LA9EVd1w16sm8b7vOATAVUHRRUv4rA/wAoMiYSFoItSidHjDKEPSZjBtH5cCeN9kzUgAZ2
	29Zgh1ZXpKro1U9v3tDVOqr8ZvwRZ1s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-gmKIz2HlM6e732XAHFAi7Q-1; Mon, 14 Nov 2022 06:31:42 -0500
X-MC-Unique: gmKIz2HlM6e732XAHFAi7Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0371882826;
	Mon, 14 Nov 2022 11:31:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 81C77111F3D9;
	Mon, 14 Nov 2022 11:31:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 03D0319465B7;
	Mon, 14 Nov 2022 11:31:39 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A68651946589
 for <dm-devel@listman.corp.redhat.com>; Mon, 14 Nov 2022 11:31:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 66750477F5D; Mon, 14 Nov 2022 11:31:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2895C477F55;
 Mon, 14 Nov 2022 11:31:37 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 2AEBVb7h028036; Mon, 14 Nov 2022 06:31:37 -0500
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 2AEBVa9L028032; Mon, 14 Nov 2022 06:31:36 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Mon, 14 Nov 2022 06:31:36 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Keith Busch <kbusch@kernel.org>
In-Reply-To: <Y26U91eH7NcXTlbj@kbusch-mbp.dhcp.thefacebook.com>
Message-ID: <alpine.LRH.2.21.2211140627080.25281@file01.intranet.prod.int.rdu2.redhat.com>
References: <20221110184501.2451620-1-kbusch@meta.com>
 <Y26PSYu2nY/AE5Xh@redhat.com>
 <Y26U91eH7NcXTlbj@kbusch-mbp.dhcp.thefacebook.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [dm-devel] [PATCHv2 0/5] fix direct io device mapper errors
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: axboe@kernel.dk, ebiggers@kernel.org, Mike Snitzer <snitzer@redhat.com>,
 Keith Busch <kbusch@meta.com>, linux-block@vger.kernel.org,
 dm-devel@redhat.com, stefanha@redhat.com, me@demsh.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Fri, 11 Nov 2022, Keith Busch wrote:

> > There are other DM targets that override logical_block_size in their
> > .io_hints hook (writecache, ebs, zoned). Have you reasoned through why
> > those do _not_ need updating too?
> 
> Yeah, that's a good question. The ones that have a problem all make
> assumptions about a bio's bv_offset being logical block size aligned,
> and each of those is accounted for here. Everything else looks fine with
> respect to handling offsets.

Unaligned bv_offset should work - because XFS is sending such bios. If you 
compile the kernel with memory debugging, kmalloc returns unaligned 
memory. XFS will allocate a buffer with kmalloc, test if it crosses a page 
boundary, if not, use the buffer, if yes, free the buffer and allocate a 
full page.

There have been device mapper problems about unaligned bv_offset in the 
past and I have fixed them.

Unaligned bv_length is a problem for the affected targets.

Mikulas
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

