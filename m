Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0D4D4173D14
	for <lists+dm-devel@lfdr.de>; Fri, 28 Feb 2020 17:35:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582907735;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ina/NA3YD98SZYDRpgDOkWUbmfhb9SObYL3YFvvIF40=;
	b=NcdHrlK4pCqsAncQbTO/9OGMqCgSEDIwohvAMgLTDey276wQ+PnLp9rsmaafiTaiMPqj+6
	9Ll2IS1HMOrhRZXDB9eTQit/xCku/bumtvVVQ1pYQL/orG2MlxLIcu3yNkUFe0yBDaKsnP
	BnR8L81iKKMEqZ1o8kUBwQRhBXDk/jM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-F6KArHNSP3aaVi8m0EGdLw-1; Fri, 28 Feb 2020 11:35:32 -0500
X-MC-Unique: F6KArHNSP3aaVi8m0EGdLw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE9B318C35A7;
	Fri, 28 Feb 2020 16:35:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 459C692995;
	Fri, 28 Feb 2020 16:35:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CF8BE8448D;
	Fri, 28 Feb 2020 16:35:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01SGZEsB005207 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 28 Feb 2020 11:35:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 105FA9299B; Fri, 28 Feb 2020 16:35:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B48A90F5B;
	Fri, 28 Feb 2020 16:35:11 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id BED052257D2; Fri, 28 Feb 2020 11:35:10 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: linux-fsdevel@vger.kernel.org, linux-nvdimm@lists.01.org,
	hch@infradead.org, dan.j.williams@intel.com
Date: Fri, 28 Feb 2020 11:34:50 -0500
Message-Id: <20200228163456.1587-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: jmoyer@redhat.com, david@fromorbit.com, dm-devel@redhat.com,
	vgoyal@redhat.com
Subject: [dm-devel] [PATCH v6 0/6] dax/pmem: Provide a dax operation to zero
	page range
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

This is V6 of patches. These patches are also available at.

Changes since V5:

- Dan Williams preferred ->zero_page_range() to only accept PAGE_SIZE
  aligned request and clear poison only on page size aligned zeroing. So
  I changed it accordingly. 

- Dropped all the modifications which were required to support arbitrary
  range zeroing with-in a page.

- This patch series also fixes the issue where "truncate -s 512 foo.txt"
  will fail if first sector of file is poisoned. Currently it succeeds
  and filesystem expectes whole of the filesystem block to be free of
  poison at the end of the operation.

Christoph, I have dropped your Reviewed-by tag on 1-2 patches because
these patches changed substantially. Especially signature of of
dax zero_page_range() helper.

Thanks
Vivek

Vivek Goyal (6):
  pmem: Add functions for reading/writing page to/from pmem
  dax, pmem: Add a dax operation zero_page_range
  s390,dcssblk,dax: Add dax zero_page_range operation to dcssblk driver
  dm,dax: Add dax zero_page_range operation
  dax: Use new dax zero page method for zeroing a page
  dax,iomap: Add helper dax_iomap_zero() to zero a range

 drivers/dax/super.c           | 20 ++++++++
 drivers/md/dm-linear.c        | 18 +++++++
 drivers/md/dm-log-writes.c    | 17 ++++++
 drivers/md/dm-stripe.c        | 23 +++++++++
 drivers/md/dm.c               | 30 +++++++++++
 drivers/nvdimm/pmem.c         | 97 ++++++++++++++++++++++-------------
 drivers/s390/block/dcssblk.c  | 15 ++++++
 fs/dax.c                      | 59 ++++++++++-----------
 fs/iomap/buffered-io.c        |  9 +---
 include/linux/dax.h           | 21 +++-----
 include/linux/device-mapper.h |  3 ++
 11 files changed, 221 insertions(+), 91 deletions(-)

-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

