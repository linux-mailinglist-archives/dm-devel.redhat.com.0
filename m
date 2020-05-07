Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id CBF2C1C8CAB
	for <lists+dm-devel@lfdr.de>; Thu,  7 May 2020 15:40:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588858845;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zGrd2kRR6UwxuEDxVVU6/YQrApt0vtUTb/o8lVll0WU=;
	b=QwIBIm/Gl9n/FoWD5ye3jcIGnN/mHOoWgPB2vLhw08uOi62ymBXF6UcGMm9D5fUj5hagZG
	bevjJdDD+GFdUcQvNmTGO6L5mo73098LB4gSfnQFDJcYGgAZgyQugN9dsXKCd0rBhKZuRI
	N/OLipnodHUaV9zHAHmmQtObNd8hxSY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-alnuSFUTP22uB3Gr6w3Asw-1; Thu, 07 May 2020 09:40:43 -0400
X-MC-Unique: alnuSFUTP22uB3Gr6w3Asw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCF81100AA38;
	Thu,  7 May 2020 13:40:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C47D60C81;
	Thu,  7 May 2020 13:40:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1265B1809561;
	Thu,  7 May 2020 13:40:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 047CLG0e017364 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 May 2020 08:21:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 90CC210BC29B; Thu,  7 May 2020 12:21:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CB2F10BC29A
	for <dm-devel@redhat.com>; Thu,  7 May 2020 12:21:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A01DA811E7A
	for <dm-devel@redhat.com>; Thu,  7 May 2020 12:21:14 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-25-GVM8Z1yaNBiW66Xu1IjvaQ-1; Thu, 07 May 2020 08:21:11 -0400
X-MC-Unique: GVM8Z1yaNBiW66Xu1IjvaQ-1
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 7BAAD1B3ABE06615F60E;
	Thu,  7 May 2020 20:21:07 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
	DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server
	id 14.3.487.0; Thu, 7 May 2020 20:20:57 +0800
From: Samuel Zou <zou_wei@huawei.com>
To: <agk@redhat.com>, <snitzer@redhat.com>, <dm-devel@redhat.com>
Date: Thu, 7 May 2020 20:26:52 +0800
Message-ID: <1588854412-19301-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 047CLG0e017364
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 07 May 2020 09:40:06 -0400
Cc: Samuel Zou <zou_wei@huawei.com>, linux-kernel@vger.kernel.org
Subject: [dm-devel] [PATCH -next] dm mpath: Remove unused variable ret
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch fixes below warning reported by coccicheck:

drivers/md/dm-historical-service-time.c:240:14-16: Unneeded variable: "sz". Return "0" on line 261

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Samuel Zou <zou_wei@huawei.com>
---
 drivers/md/dm-historical-service-time.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/md/dm-historical-service-time.c b/drivers/md/dm-historical-service-time.c
index 186f91e..3c8acb9 100644
--- a/drivers/md/dm-historical-service-time.c
+++ b/drivers/md/dm-historical-service-time.c
@@ -237,7 +237,6 @@ static void hst_destroy(struct path_selector *ps)
 static int hst_status(struct path_selector *ps, struct dm_path *path,
 		     status_type_t type, char *result, unsigned int maxlen)
 {
-	unsigned int sz = 0;
 	struct path_info *pi;
 
 	if (!path) {
@@ -258,7 +257,7 @@ static int hst_status(struct path_selector *ps, struct dm_path *path,
 		}
 	}
 
-	return sz;
+	return 0;
 }
 
 static int hst_add_path(struct path_selector *ps, struct dm_path *path,
-- 
2.6.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

