Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id DB18C16357A
	for <lists+dm-devel@lfdr.de>; Tue, 18 Feb 2020 22:50:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582062616;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YBGMC7eUnncynWKSPUeyFvBdQpoFD3sdbdr4avEOuzo=;
	b=L1zxpC78LWwO0bKX2uhyY4JCOvWUVjbyATHzNQzsokHg/XQSThwGU8+e8anXeYREyN5CCd
	/gx0z+aJbgmA/9mfFwGeD/FcAXzWFhmsmOwSZlYseq4/XYFdPqiNNWdV/8fR9xB0ToGLzN
	NAKXQZ1AlxuqbnNGuqS2lcnYLYT7Eak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-wVlATetnPO20QyBaMuEpnw-1; Tue, 18 Feb 2020 16:49:19 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98131801E70;
	Tue, 18 Feb 2020 21:49:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A6001BC6D;
	Tue, 18 Feb 2020 21:49:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ECBD818089CD;
	Tue, 18 Feb 2020 21:49:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01ILmtL0020610 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 16:48:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D880590526; Tue, 18 Feb 2020 21:48:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 08AC790534;
	Tue, 18 Feb 2020 21:48:53 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id 8A4B52257D2; Tue, 18 Feb 2020 16:48:52 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: linux-fsdevel@vger.kernel.org, linux-nvdimm@lists.01.org,
	hch@infradead.org, dan.j.williams@intel.com
Date: Tue, 18 Feb 2020 16:48:33 -0500
Message-Id: <20200218214841.10076-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: vishal.l.verma@intel.com, dm-devel@redhat.com, vgoyal@redhat.com
Subject: [dm-devel] [PATCH v5 0/8] dax/pmem: Provide a dax operation to zero
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
X-MC-Unique: wVlATetnPO20QyBaMuEpnw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi, 

This is V5 of patches. These patches are also available at.

https://github.com/rhvgoyal/linux/commits/dax-zero-range-v5

Changes since V4:

- Rebased on top of 5.6-rc2
- Added a separate patch so that pmem_clear_poison() accepts arbitrary
  offset and len and aligns these as needed. This takes away the burden
  of aligning from callers.

Previous versions of patches are here.
v4:
https://lore.kernel.org/linux-fsdevel/20200217181653.4706-1-vgoyal@redhat.com/
v3:
https://lore.kernel.org/linux-fsdevel/20200214125717.GA18654@redhat.com/T/#t
v2:
https://lore.kernel.org/linux-fsdevel/20200203200029.4592-1-vgoyal@redhat.com/
v1:
https://lore.kernel.org/linux-fsdevel/20200123165249.GA7664@redhat.com/

Thanks
Vivek

Vivek Goyal (8):
  pmem: Add functions for reading/writing page to/from pmem
  drivers/pmem: Allow pmem_clear_poison() to accept arbitrary offset and
    len
  pmem: Enable pmem_do_write() to deal with arbitrary ranges
  dax, pmem: Add a dax operation zero_page_range
  s390,dcssblk,dax: Add dax zero_page_range operation to dcssblk driver
  dm,dax: Add dax zero_page_range operation
  dax,iomap: Start using dax native zero_page_range()
  dax,iomap: Add helper dax_iomap_zero() to zero a range

 drivers/dax/super.c           |  19 +++++
 drivers/md/dm-linear.c        |  21 ++++++
 drivers/md/dm-log-writes.c    |  19 +++++
 drivers/md/dm-stripe.c        |  26 +++++++
 drivers/md/dm.c               |  31 ++++++++
 drivers/nvdimm/pmem.c         | 134 +++++++++++++++++++++++-----------
 drivers/s390/block/dcssblk.c  |  17 +++++
 fs/dax.c                      |  53 ++++----------
 fs/iomap/buffered-io.c        |   9 +--
 include/linux/dax.h           |  20 ++---
 include/linux/device-mapper.h |   3 +
 11 files changed, 246 insertions(+), 106 deletions(-)

-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

