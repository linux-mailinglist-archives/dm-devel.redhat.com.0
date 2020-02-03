Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 973E81510B2
	for <lists+dm-devel@lfdr.de>; Mon,  3 Feb 2020 21:01:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580760085;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GQ61p9zAdW7Gs2ytLmrfT7i2bGOa+FAOyBM4W2D1Mpg=;
	b=OtE2lvgTFtlCbvtF8TacaXeteuDCtB088ygLh57Zg4oFvCC+4n4/CtiK+kQpES/S8MZgKL
	/gBC7jr4DIhQj8+TEc/rmGm+zL8abPndYw+jDGO6KGY49t4lSSSnMQAZyhKEFjepr3T3j4
	IwsU4Z+IbjlUGhzjCRg/RtZe3QrYtCQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-a3w6Ai7nO2a3NTvyzhx9cg-1; Mon, 03 Feb 2020 15:01:19 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41F418017DF;
	Mon,  3 Feb 2020 20:01:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1B4E5C1D8;
	Mon,  3 Feb 2020 20:01:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5C09581737;
	Mon,  3 Feb 2020 20:01:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 013K0noV021352 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 3 Feb 2020 15:00:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F3F0E1001B0B; Mon,  3 Feb 2020 20:00:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 701831001B09;
	Mon,  3 Feb 2020 20:00:46 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id 058A92202E9; Mon,  3 Feb 2020 15:00:45 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: linux-fsdevel@vger.kernel.org, linux-nvdimm@lists.01.org,
	dan.j.williams@intel.com, hch@infradead.org
Date: Mon,  3 Feb 2020 15:00:24 -0500
Message-Id: <20200203200029.4592-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: vishal.l.verma@intel.com, dm-devel@redhat.com, vgoyal@redhat.com
Subject: [dm-devel] [RFC PATCH 0/5][V2] dax,
	pmem: Provide a dax operation to zero range of memory
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
X-MC-Unique: a3w6Ai7nO2a3NTvyzhx9cg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

This is V2 of patches. I posted V1 here.

https://lore.kernel.org/linux-fsdevel/20200123165249.GA7664@redhat.com/

Changes since V1.
- Took care of feedback from Christoph.
- Made ->zero_page_range() mandatory operation.
- Provided a generic helper to zero range for non-pmem drivers.
- Merged __dax_zero_page_range() and iomap_dax_zero()
- Made changes to dm drivers.
- Limited range zeroing to with-in single page.
- Tested patches with real hardware.  

description
-----------
This is an RFC patch series to provide a dax operation to zero a range of
memory. It will also clear poison in the process.

Motivation from this patch comes from Christoph's feedback that he will
rather prefer a dax way to zero a range instead of relying on having to
call blkdev_issue_zeroout() in __dax_zero_page_range().

https://lkml.org/lkml/2019/8/26/361

My motivation for this change is virtiofs DAX support. There we use DAX
but we don't have a block device. So any dax code which has the assumption
that there is always a block device associated is a problem. So this
is more of a cleanup of one of the places where dax has this dependency
on block device and if we add a dax operation for zeroing a range, it
can help with not having to call blkdev_issue_zeroout() in dax path.

Thanks
Vivek

Vivek Goyal (5):
  dax, pmem: Add a dax operation zero_page_range
  s390,dax: Add dax zero_page_range operation to dcssblk driver
  dm,dax: Add dax zero_page_range operation
  dax,iomap: Start using dax native zero_page_range()
  dax,iomap: Add helper dax_iomap_zero() to zero a range

 drivers/dax/super.c           | 20 ++++++++++++
 drivers/md/dm-linear.c        | 18 +++++++++++
 drivers/md/dm-log-writes.c    | 17 ++++++++++
 drivers/md/dm-stripe.c        | 23 ++++++++++++++
 drivers/md/dm.c               | 30 ++++++++++++++++++
 drivers/nvdimm/pmem.c         | 50 +++++++++++++++++++++++++++++
 drivers/s390/block/dcssblk.c  |  7 ++++
 fs/dax.c                      | 60 ++++++++++++++---------------------
 fs/iomap/buffered-io.c        |  9 +-----
 include/linux/dax.h           | 17 ++++++----
 include/linux/device-mapper.h |  3 ++
 11 files changed, 204 insertions(+), 50 deletions(-)

-- 
2.18.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

