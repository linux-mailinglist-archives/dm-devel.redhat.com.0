Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 71321155F98
	for <lists+dm-devel@lfdr.de>; Fri,  7 Feb 2020 21:27:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581107248;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KZ0UkBTVKeXP16OKIKNCz7ICbKUCZPr52sakFQXURiQ=;
	b=gJAY+vion0v7WHqjRCsTiLQ3Q4TwMWTdva/wb0QjE8ZFVd3+TzjH6bhV14V8drUp9gfA3m
	EZZDC7wVYvRkKpMOhFyZ9mgs9ll2tysJ1IBf9Zw6jNQIEijfB+mfpOwcR7F+43dyWh8qyg
	mRG6+5MJUCZfoB3EtduEMiR/hLj6vkk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-82a6pWW5M4GqnRywlqp20g-1; Fri, 07 Feb 2020 15:27:26 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DABC101FC65;
	Fri,  7 Feb 2020 20:27:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33E3F1FE07;
	Fri,  7 Feb 2020 20:27:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7B4F9866B3;
	Fri,  7 Feb 2020 20:27:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 017KR5TG019019 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 15:27:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B90891001B3F; Fri,  7 Feb 2020 20:27:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 087A9100164D;
	Fri,  7 Feb 2020 20:27:03 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id 89CE6220A24; Fri,  7 Feb 2020 15:27:02 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: linux-fsdevel@vger.kernel.org, linux-nvdimm@lists.01.org,
	hch@infradead.org, dan.j.williams@intel.com
Date: Fri,  7 Feb 2020 15:26:45 -0500
Message-Id: <20200207202652.1439-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: vishal.l.verma@intel.com, dm-devel@redhat.com, vgoyal@redhat.com
Subject: [dm-devel] [PATCH v3 0/7] dax,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 82a6pWW5M4GqnRywlqp20g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

This is V3 of patches. I have dropped RFC tag from the series as it
looks like there is agreement on the interface. These patches are also
available at.

https://github.com/rhvgoyal/linux/commits/dax-zero-range-v3

I posted previous versions here.

v2:
https://lore.kernel.org/linux-fsdevel/20200203200029.4592-1-vgoyal@redhat.com/
v1:
https://lore.kernel.org/linux-fsdevel/20200123165249.GA7664@redhat.com/

Changes since V2:

Primarily took care of comments from Christoph.

- Changed zero_copy_range() parameters to pass dax device offset as u64.
- Fixed comment which says current interface only supports zeroing
  with-in page.
- Refactored pmem_do_bvec() and reused write side of code in
  zero_page_range().
- Removed generic_dax_zero_page_range()
- Fixed s390 dcssblk.c compilation issue.

Please review. 

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
 drivers/md/dm.c               |  31 ++++++++++
 drivers/nvdimm/pmem.c         | 112 ++++++++++++++++++++++++----------
 drivers/s390/block/dcssblk.c  |  17 ++++++
 fs/dax.c                      |  53 ++++------------
 fs/iomap/buffered-io.c        |   9 +--
 include/linux/dax.h           |  20 ++----
 include/linux/device-mapper.h |   3 +
 11 files changed, 235 insertions(+), 95 deletions(-)

-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

