Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC8115AE28
	for <lists+dm-devel@lfdr.de>; Wed, 12 Feb 2020 18:08:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581527292;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YeotxazyEvBbERcO4WhmUTvZy2OpxMoM3bHfzs6a5xU=;
	b=CudemEIoMfBuG8THe8acYMr8MqnNRWDBK6LqHXeXMGpPjhxdD22CRahRSQ3rmT2UpMDxi0
	+NiGxRZU7hCE7AROzq2/jtiKE36wRrK9iKLb6BFy83THN/Q23tYTrx8fRYoCWkPgGV8HFR
	ckp8OaeJqv7Ryl6Nr3B3M1Id4GD6XDk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-2bZUniTuPjK6XdrYntaJZA-1; Wed, 12 Feb 2020 12:08:09 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09FD3800D50;
	Wed, 12 Feb 2020 17:07:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C87090090;
	Wed, 12 Feb 2020 17:07:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E12708B2A5;
	Wed, 12 Feb 2020 17:07:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01CH7ngo001109 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Feb 2020 12:07:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B9B96863CC; Wed, 12 Feb 2020 17:07:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2445C89F30;
	Wed, 12 Feb 2020 17:07:47 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id AAF6C220A24; Wed, 12 Feb 2020 12:07:46 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: linux-fsdevel@vger.kernel.org, linux-nvdimm@lists.01.org,
	dan.j.williams@intel.com, hch@infradead.org
Date: Wed, 12 Feb 2020 12:07:27 -0500
Message-Id: <20200212170733.8092-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, jack@suse.cz, vgoyal@redhat.com
Subject: [dm-devel] [RFC PATCH 0/6] dax: Replace bdev_dax_pgoff() with
	dax_pgoff()
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
X-MC-Unique: 2bZUniTuPjK6XdrYntaJZA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently dax code assumes that there is always a block device
associated with it. And block device is passed around in few routines. I
am implementing DAX support for virtiofs and there is no block device
while we are using dax device. So I need dax code to move away from
this assumption that there is always a block device.

We seem to pass around block deivce only to calculate the partition
offset into dax device. bdev_dax_pgoff() does get_start_sect(bdev).

There are two proposed solutions to this problem.

- Get rid of kernel partition support for pmem devices.

- Caller stores offset into dax device and passes that in along with
  dax_device.

First solution was discussed recently in this thread.

https://lore.kernel.org/linux-fsdevel/20200107125159.GA15745@infradead.org/

I feel we already shipped partition support for dax block devices and
going back now will be painful and its easy to break users out there
which are using partitions.

Hence I thought of writing patches for second proposal and see how bad
it looks. To me patches are fairly small and don't break backward 
compatibility and seem like a good step in the direction of removing
dax assumptions about block device.

So I am posting this RFC patch series, which is just boot tested.

Any feedback or comments are welcome.

Thanks
Vivek
 

Vivek Goyal (6):
  dax: Define a helper dax_pgoff() which takes in dax_offset as argument
  dax,iomap,ext4,ext2,xfs: Save dax_offset in "struct iomap"
  fs/dax.c: Start using dax_pgoff() instead of bdev_dax_pgoff()
  dax, dm/md: Use dax_pgoff() instead of bdev_dax_pgoff()
  drivers/dax: Use dax_pgoff() instead of bdev_dax_pgoff()
  dax: Remove bdev_dax_pgoff() helper

 drivers/dax/super.c        | 11 +++++------
 drivers/md/dm-linear.c     |  9 ++++++---
 drivers/md/dm-log-writes.c |  9 ++++++---
 drivers/md/dm-stripe.c     |  8 +++++---
 fs/dax.c                   | 13 ++++++-------
 fs/ext2/inode.c            |  1 +
 fs/ext4/inode.c            |  1 +
 fs/xfs/xfs_iomap.c         |  2 ++
 include/linux/dax.h        |  2 +-
 include/linux/iomap.h      |  1 +
 10 files changed, 34 insertions(+), 23 deletions(-)

-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

