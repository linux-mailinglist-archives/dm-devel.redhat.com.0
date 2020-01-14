Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 91C7213B4CE
	for <lists+dm-devel@lfdr.de>; Tue, 14 Jan 2020 22:53:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579038818;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9AtnaBIHETme1xb7LubLf+PSy8WA4iaQr6VjHDMnv8k=;
	b=BEMSGD+EWSVV8t2p0EjS8SVgL0REQlePTWfWe/iQdtq1niM79RGjthHIqh1gd91WPA9N1a
	J8ZhGCqP868g11PTV2iqUH/OHwCyfYhL6TQ6g83iMxsm5pGFFSd54b/nWeNoEo40e4U6BP
	3yEU0u2EMPf1iSbSVfoQcHdKnms155M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-ezJYSJBGMPK-kNXewtjtgA-1; Tue, 14 Jan 2020 16:53:35 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80475801E7B;
	Tue, 14 Jan 2020 21:53:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8748D80617;
	Tue, 14 Jan 2020 21:53:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B29A01809567;
	Tue, 14 Jan 2020 21:53:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00ELr1KH008691 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 14 Jan 2020 16:53:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 999AC2166B2B; Tue, 14 Jan 2020 21:53:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95C792166B2C
	for <dm-devel@redhat.com>; Tue, 14 Jan 2020 21:52:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 595578007C9
	for <dm-devel@redhat.com>; Tue, 14 Jan 2020 21:52:58 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-268-OfS-AGa_P3Kx25hHKN4vMg-1;
	Tue, 14 Jan 2020 16:52:54 -0500
Received: from gmail.com (unknown [104.132.1.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 683F524658;
	Tue, 14 Jan 2020 21:52:50 +0000 (UTC)
Date: Tue, 14 Jan 2020 13:52:48 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20200114215248.GK41220@gmail.com>
References: <alpine.LRH.2.11.1909251814220.15810@mx.ewheeler.net>
	<alpine.LRH.2.11.1912201829300.26683@mx.ewheeler.net>
	<alpine.LRH.2.11.1912270137420.26683@mx.ewheeler.net>
	<alpine.LRH.2.11.1912271946380.26683@mx.ewheeler.net>
	<20200107103546.asf4tmlfdmk6xsub@reti>
	<20200107104627.plviq37qhok2igt4@reti>
	<20200107122825.qr7o5d6dpwa6kv62@reti>
MIME-Version: 1.0
In-Reply-To: <20200107122825.qr7o5d6dpwa6kv62@reti>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-MC-Unique: OfS-AGa_P3Kx25hHKN4vMg-1
X-MC-Unique: ezJYSJBGMPK-kNXewtjtgA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00ELr1KH008691
X-loop: dm-devel@redhat.com
Cc: dm-devel@lists.ewheeler.net, markus.schade@gmail.com, dm-devel@redhat.com,
	LVM2 development <lvm-devel@redhat.com>,
	linux-block@vger.kernel.org, ejt@redhat.com, joe.thornber@gmail.com
Subject: Re: [dm-devel] kernel BUG at
	drivers/md/persistent-data/dm-space-map-disk.c:178
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jan 07, 2020 at 12:28:25PM +0000, Joe Thornber wrote:
> On Tue, Jan 07, 2020 at 10:46:27AM +0000, Joe Thornber wrote:
> > I'll get a patch to you later today.
> 
> Eric,
> 
> Patch below.  I've run it through a bunch of tests in the dm test suite.  But
> obviously I have never hit your issue.  Will do more testing today.
> 
> - Joe
> 
> 
> 
> Author: Joe Thornber <ejt@redhat.com>
> Date:   Tue Jan 7 11:58:42 2020 +0000
> 
>     [dm-thin, dm-cache] Fix bug in space-maps.
>     
>     The space-maps track the reference counts for disk blocks.  There are variants
>     for tracking metadata blocks, and data blocks.
>     
>     We implement transactionality by never touching blocks from the previous
>     transaction, so we can rollback in the event of a crash.
>     
>     When allocating a new block we need to ensure the block is free (has reference
>     count of 0) in both the current and previous transaction.  Prior to this patch we
>     were doing this by searching for a free block in the previous transaction, and
>     relying on a 'begin' counter to track where the last allocation in the current
>     transaction was.  This 'begin' field was not being updated in all code paths (eg,
>     increment of a data block reference count due to breaking sharing of a neighbour
>     block in the same btree leaf).
>     
>     This patch keeps the 'begin' field, but now it's just a hint to speed up the search.
>     Instead we search the current transaction for a free block, and then double check
>     it's free in the old transaction.  Much simpler.
> 

I happened to notice this patch is on the linux-dm/for-next branch
(https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=for-next&id=2137c0dcc04b24efb4c38d4b46b7194575718dd5)
and it has:

	Reported-by: Eric Biggers <ebiggers@google.com>

This is wrong, I didn't report this.  I think you meant to put:

	Reported-by: Eric Wheeler <dm-devel@lists.ewheeler.net>

- Eric (the other one)


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

