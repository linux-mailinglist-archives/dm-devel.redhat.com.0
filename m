Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 572F3161999
	for <lists+dm-devel@lfdr.de>; Mon, 17 Feb 2020 19:17:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581963449;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kfskjfF+UugdWT5sIyNi3I5IFsCTAxBZZ7lDVIv4TRY=;
	b=DNFKklZEjadjqdb0M7kiqhnVefldzv7jodHwx2NAf1pBGASyiU6hG+WkRxw2rvspIH0m3C
	ntWPNnInFIz+zjSiuaEAzUiBrsl1g/4+wmTOEoYJznZSHsQ04YCpqq0vzdDmj659DTa/rd
	1OAZu7kec22BuN0zqwRJoNAKLNd1RIw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-EusbnoHBNIK3viQdXZPI5Q-1; Mon, 17 Feb 2020 13:17:26 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDE1C189F767;
	Mon, 17 Feb 2020 18:17:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C34E887056;
	Mon, 17 Feb 2020 18:17:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E9E1B18089C8;
	Mon, 17 Feb 2020 18:17:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01HIHBf5022256 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Feb 2020 13:17:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4B5DE60C81; Mon, 17 Feb 2020 18:17:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5919E60BFB;
	Mon, 17 Feb 2020 18:17:08 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id F04EB2257D2; Mon, 17 Feb 2020 13:17:07 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: linux-fsdevel@vger.kernel.org, linux-nvdimm@lists.01.org,
	hch@infradead.org, dan.j.williams@intel.com
Date: Mon, 17 Feb 2020 13:16:46 -0500
Message-Id: <20200217181653.4706-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: vishal.l.verma@intel.com, dm-devel@redhat.com, vgoyal@redhat.com
Subject: [dm-devel] [PATCH v4 0/7] dax/pmem: Provide a dax operation to zero
	range of memory
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: EusbnoHBNIK3viQdXZPI5Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

This is V4 of patches. These patches are also available at.

https://github.com/rhvgoyal/linux/commits/dax-zero-range-v4

Changes since V3.

- Rebased patches on top of 5.6-rc1
- Took care of some of the comments from Christoph.
- Captured some Reviewed-by tags in some of the patches.  

Previous version of patches are here.
v3:
https://lore.kernel.org/linux-fsdevel/20200214125717.GA18654@redhat.com/T/#t
v2:
https://lore.kernel.org/linux-fsdevel/20200203200029.4592-1-vgoyal@redhat.com/
v1:
https://lore.kernel.org/linux-fsdevel/20200123165249.GA7664@redhat.com/

Thanks
Vivek

Vivek Goyal (7):
  pmem: Add functions for reading/writing page to/from pmem
  pmem: Enable pmem_do_write() to deal with arbitrary ranges
  dax, pmem: Add a dax operation zero_page_range
  s390,dcssblk,dax: Add dax zero_page_range operation to dcssblk driver
  dm,dax: Add dax zero_page_range operation
  dax,iomap: Start using dax native zero_page_range()
  dax,iomap: Add helper dax_iomap_zero() to zero a range

 drivers/dax/super.c           |  19 ++++++
 drivers/md/dm-linear.c        |  21 +++++++
 drivers/md/dm-log-writes.c    |  19 ++++++
 drivers/md/dm-stripe.c        |  26 ++++++++
 drivers/md/dm.c               |  31 +++++++++
 drivers/nvdimm/pmem.c         | 115 +++++++++++++++++++++++-----------
 drivers/s390/block/dcssblk.c  |  17 +++++
 fs/dax.c                      |  53 ++++------------
 fs/iomap/buffered-io.c        |   9 +--
 include/linux/dax.h           |  20 ++----
 include/linux/device-mapper.h |   3 +
 11 files changed, 233 insertions(+), 100 deletions(-)

-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

