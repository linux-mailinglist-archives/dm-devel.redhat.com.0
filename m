Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 91AE91F188A
	for <lists+dm-devel@lfdr.de>; Mon,  8 Jun 2020 14:12:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591618333;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/GNVLiXGuO9USeXxcf5qh/XqQaNzQh3hve1uLp85oqs=;
	b=MQPjPiISPjPn6+76oGcjNyz32iR4DSoJNry3BvK3E9BMFkVzN+euEirqK4RbZMpnQJNGv/
	r6/gvxs763E/xO2rUpPykRQzfQIe22qiIWXP8W2deW+3Qd45cPdwx05hWGWrx85fBT/HHs
	YYr6vRpPQ60/pLBrQGQRC+e6prWYcG8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-tHJw326CNOiRRgdUS0-H2A-1; Mon, 08 Jun 2020 08:12:11 -0400
X-MC-Unique: tHJw326CNOiRRgdUS0-H2A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E19C510C2E10;
	Mon,  8 Jun 2020 12:11:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E666D7BA10;
	Mon,  8 Jun 2020 12:11:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 49B3914CEA;
	Mon,  8 Jun 2020 12:11:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0588cXX6019779 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jun 2020 04:38:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 30BBD2029F77; Mon,  8 Jun 2020 08:38:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CBCE2029F61
	for <dm-devel@redhat.com>; Mon,  8 Jun 2020 08:38:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC6841859176
	for <dm-devel@redhat.com>; Mon,  8 Jun 2020 08:38:32 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-266-z22Dy3JwOSOYoD4CYwqrZA-1; Mon, 08 Jun 2020 04:38:26 -0400
X-MC-Unique: z22Dy3JwOSOYoD4CYwqrZA-1
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id B466C23E1279F7DD6BDD;
	Mon,  8 Jun 2020 16:38:21 +0800 (CST)
Received: from localhost.localdomain (10.90.53.225) by
	DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server
	id 14.3.487.0; Mon, 8 Jun 2020 16:38:11 +0800
From: yangerkun <yangerkun@huawei.com>
To: <bgurney@redhat.com>, <agk@redhat.com>, <snitzer@redhat.com>
Date: Mon, 8 Jun 2020 16:45:13 +0800
Message-ID: <20200608084513.115671-3-yangerkun@huawei.com>
In-Reply-To: <20200608084513.115671-1-yangerkun@huawei.com>
References: <20200608084513.115671-1-yangerkun@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0588cXX6019779
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 08 Jun 2020 08:11:03 -0400
Cc: dm-devel@redhat.com, yangerkun@huawei.com
Subject: [dm-devel] [PATCH 2/2] dm dust: introduce listbadblocks in the rst
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

Since we support the listbadblocks command, introduce the detail in the
doc.

Signed-off-by: yangerkun <yangerkun@huawei.com>
Reviewed-by: Bryan Gurney <bgurney@redhat.com>
---
 .../admin-guide/device-mapper/dm-dust.rst      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/admin-guide/device-mapper/dm-dust.rst b/Documentation/admin-guide/device-mapper/dm-dust.rst
index b6e7e7ead831..2c51a4acb8be 100644
--- a/Documentation/admin-guide/device-mapper/dm-dust.rst
+++ b/Documentation/admin-guide/device-mapper/dm-dust.rst
@@ -205,6 +205,23 @@ appear::
 
         kernel: device-mapper: dust: clearbadblocks: no badblocks found
 
+Listing the bad block list
+--------------------------
+
+To list all bad blocks in the bad block list, run the following message
+command::
+
+        $ sudo dmsetup message dust1 0 listbadblocks
+
+The following message will appear, listing one bad block number per
+line (using an example device with blocks 1 and 2 in the bad block
+list)::
+
+        device-mapper: dust: dust_list_badblocks: badblocks list below:
+        device-mapper: dust: bad block: 1
+        device-mapper: dust: bad block: 2
+        device-mapper: dust: dust_list_badblocks: badblocks list end.
+
 Message commands list
 ---------------------
 
@@ -223,6 +240,7 @@ Single argument message commands::
 
         countbadblocks
         clearbadblocks
+        listbadblocks
         disable
         enable
         quiet
-- 
2.23.0.rc2.8.gff66981f45


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

