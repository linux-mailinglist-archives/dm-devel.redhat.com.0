Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id CCBA01EC46E
	for <lists+dm-devel@lfdr.de>; Tue,  2 Jun 2020 23:39:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591133996;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wvQTP5Y0TfiXRV2LOEOrvCUgsJyqunbYR5gjdoG8DJ0=;
	b=Myr/AHAqxKgDtqhZ7jTo6m9tHNaAIAl/eT326G4QJeYNd/oeVeVkgqt40DCW2cmqxDI5N+
	+rLJPzfI7lgn8ZLnjcLTxqGHLSC8swhuAnN7xsFJCrkDyzyqnzE95cvgp+xL6MoA0f90DW
	rhl0r3dxY6JOcYXbckZwDwaQ3TB7K8c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-7tJv4f4jOO-mdTs7pzoJ6g-1; Tue, 02 Jun 2020 17:39:54 -0400
X-MC-Unique: 7tJv4f4jOO-mdTs7pzoJ6g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72E96107ACCA;
	Tue,  2 Jun 2020 21:39:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 25560D0212;
	Tue,  2 Jun 2020 21:39:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AB06593902;
	Tue,  2 Jun 2020 21:39:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 052LdVJI018864 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Jun 2020 17:39:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9CF102026E04; Tue,  2 Jun 2020 21:39:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98B052026D67
	for <dm-devel@redhat.com>; Tue,  2 Jun 2020 21:39:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EEBDB186E3A1
	for <dm-devel@redhat.com>; Tue,  2 Jun 2020 21:39:28 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-43-hafYhlakP3Kvu18avukFBw-1; 
	Tue, 02 Jun 2020 17:39:24 -0400
X-MC-Unique: hafYhlakP3Kvu18avukFBw-1
Received: from gmail.com (unknown [104.132.1.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 3AF5720870;
	Tue,  2 Jun 2020 21:39:23 +0000 (UTC)
Date: Tue, 2 Jun 2020 14:39:21 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200602213921.GA229073@gmail.com>
References: <alpine.LRH.2.02.2001150833180.31494@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2001150833180.31494@file01.intranet.prod.int.rdu2.redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Mike Snitzer <msnitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH] block: fix an integer overflow in logical
	block size
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
Content-Disposition: inline

On Wed, Jan 15, 2020 at 08:35:25AM -0500, Mikulas Patocka wrote:
> Logical block size has type unsigned short. That means that it can be at
> most 32768. However, there are architectures that can run with 64k pages
> (for example arm64) and on these architectures, it may be possible to
> create block devices with 64k block size.
> 
> For exmaple (run this on an architecture with 64k pages):
> # modprobe brd rd_size=1048576
> # dmsetup create cache --table "0 `blockdev --getsize /dev/ram0` writecache s /dev/ram0 /dev/ram1 65536 0"
> # mkfs.ext4 -b 65536 /dev/mapper/cache
> # mount -t ext4 /dev/mapper/cache /mnt/test
> 
> Mount will fail with this error because it tries to read the superblock using 2-sector
> access:
>   device-mapper: writecache: I/O is not aligned, sector 2, size 1024, block size 65536
>   EXT4-fs (dm-0): unable to read superblock
> 
> This patch changes the logical block size from unsigned short to unsigned
> int to avoid the overflow.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

Mikulas, a question about this patch.  In crypt_io_hints() in
drivers/md/dm-crypt.c there is:

       limits->logical_block_size =
                max_t(unsigned short, limits->logical_block_size, cc->sector_size);

Shouldn't that have been changed to 'unsigned int', now that
limits->logical_block_size is 'unsigned int' rather than 'unsigned short'?

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

