Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id BA833173D13
	for <lists+dm-devel@lfdr.de>; Fri, 28 Feb 2020 17:35:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582907733;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=msgzQ21kSGLTsnzWy0TC08Zai98M5tacJKqgbdRkUyE=;
	b=HVv4zvcSKusMKGzGrlHLxAlJMBzO2Qy4pdO/CSTOlz+yezA/mr0jYRBIZ1SEZinznEfWwx
	mSHi45VpKXJRfXLs8YTNpLzP+0Uk7+tb/ffj1pXC2idwjGmfCDNZPqbJnv/fzCvnXFPOWy
	0j4/yqc9H7LiFUSZw2Lxv2F0S012W+8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-ULMELf_sNV6necBg4mDA4Q-1; Fri, 28 Feb 2020 11:35:29 -0500
X-MC-Unique: ULMELf_sNV6necBg4mDA4Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3D621034B35;
	Fri, 28 Feb 2020 16:35:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4641E5D9CD;
	Fri, 28 Feb 2020 16:35:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 528FB18089C8;
	Fri, 28 Feb 2020 16:35:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01SGZDAs005202 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 28 Feb 2020 11:35:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EAC6C5DA81; Fri, 28 Feb 2020 16:35:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4A5775D9CD;
	Fri, 28 Feb 2020 16:35:11 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id CB59C2257D5; Fri, 28 Feb 2020 11:35:10 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: linux-fsdevel@vger.kernel.org, linux-nvdimm@lists.01.org,
	hch@infradead.org, dan.j.williams@intel.com
Date: Fri, 28 Feb 2020 11:34:53 -0500
Message-Id: <20200228163456.1587-4-vgoyal@redhat.com>
In-Reply-To: <20200228163456.1587-1-vgoyal@redhat.com>
References: <20200228163456.1587-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: linux-s390@vger.kernel.org, david@fromorbit.com, dm-devel@redhat.com,
	jmoyer@redhat.com, vgoyal@redhat.com,
	Gerald Schaefer <gerald.schaefer@de.ibm.com>
Subject: [dm-devel] [PATCH v6 3/6] s390, dcssblk,
	dax: Add dax zero_page_range operation to dcssblk driver
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add dax operation zero_page_range for dcssblk driver.

CC: linux-s390@vger.kernel.org
Suggested-by: Christoph Hellwig <hch@infradead.org>
Reviewed-by: Gerald Schaefer <gerald.schaefer@de.ibm.com>
Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 drivers/s390/block/dcssblk.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/s390/block/dcssblk.c b/drivers/s390/block/dcssblk.c
index 63502ca537eb..ab3e2898816c 100644
--- a/drivers/s390/block/dcssblk.c
+++ b/drivers/s390/block/dcssblk.c
@@ -57,11 +57,26 @@ static size_t dcssblk_dax_copy_to_iter(struct dax_device *dax_dev,
 	return copy_to_iter(addr, bytes, i);
 }
 
+static int dcssblk_dax_zero_page_range(struct dax_device *dax_dev,
+				       pgoff_t pgoff, size_t nr_pages)
+{
+	long rc;
+	void *kaddr;
+
+	rc = dax_direct_access(dax_dev, pgoff, nr_pages, &kaddr, NULL);
+	if (rc < 0)
+		return rc;
+	memset(kaddr, 0, nr_pages << PAGE_SHIFT);
+	dax_flush(dax_dev, kaddr, nr_pages << PAGE_SHIFT);
+	return 0;
+}
+
 static const struct dax_operations dcssblk_dax_ops = {
 	.direct_access = dcssblk_dax_direct_access,
 	.dax_supported = generic_fsdax_supported,
 	.copy_from_iter = dcssblk_dax_copy_from_iter,
 	.copy_to_iter = dcssblk_dax_copy_to_iter,
+	.zero_page_range = dcssblk_dax_zero_page_range,
 };
 
 struct dcssblk_dev_info {
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

