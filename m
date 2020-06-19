Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 3422C2008DC
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 14:39:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592570369;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/ruLNI473V+nrAqvjHbJfSTyZTEzBBhLMqleTp4c11g=;
	b=BrktBSH3cNuYoQI+qqSCSUkA9B/py39heRB+v7arjanMupzdp6AyJivGc5OYvJMWZQWz4W
	VlN99hzl23QNrOjDvESZg08IhHomJw+u2PBI537HMsCK6z0gRjQIuDCr1l1iqasAQYvK01
	QvRgm7DkBPfZ131jdCKxOALJ/+cpg5w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-gEG1ExzuNtC9qDE2j6fVIA-1; Fri, 19 Jun 2020 08:39:26 -0400
X-MC-Unique: gEG1ExzuNtC9qDE2j6fVIA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2ABC8801503;
	Fri, 19 Jun 2020 12:39:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B01F7C1F3;
	Fri, 19 Jun 2020 12:39:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BCB25833D7;
	Fri, 19 Jun 2020 12:39:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JCbGTd027949 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 08:37:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D7876103CD0; Fri, 19 Jun 2020 12:37:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D36A5103CCA
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 12:37:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B88088007CD
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 12:37:16 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-379-uv6TY4hCNRmAiLSOuoKw7g-1; Fri, 19 Jun 2020 08:37:12 -0400
X-MC-Unique: uv6TY4hCNRmAiLSOuoKw7g-1
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id C25D09898D9776FD93FF;
	Fri, 19 Jun 2020 20:37:04 +0800 (CST)
Received: from code-website.localdomain (10.175.127.227) by
	DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server
	id 14.3.487.0; Fri, 19 Jun 2020 20:36:53 +0800
From: yangerkun <yangerkun@huawei.com>
To: <snitzer@redhat.com>, <bgurney@redhat.com>, <agk@redhat.com>,
	<bmr@redhat.com>
Date: Fri, 19 Jun 2020 20:38:03 +0800
Message-ID: <20200619123803.1441373-5-yangerkun@huawei.com>
In-Reply-To: <20200619123803.1441373-1-yangerkun@huawei.com>
References: <20200619123803.1441373-1-yangerkun@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05JCbGTd027949
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 19 Jun 2020 08:38:54 -0400
Cc: dm-devel@redhat.com, yangerkun@huawei.com
Subject: [dm-devel] [PATCH v3 4/4] dm dust: introduce listbadblocks in the
	rst
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since we support the listbadblocks command, introduce the detail in the
doc.

Signed-off-by: yangerkun <yangerkun@huawei.com>
---
 .../admin-guide/device-mapper/dm-dust.rst        | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/admin-guide/device-mapper/dm-dust.rst b/Documentation/admin-guide/device-mapper/dm-dust.rst
index 84149c08b68f..5c66a71e3442 100644
--- a/Documentation/admin-guide/device-mapper/dm-dust.rst
+++ b/Documentation/admin-guide/device-mapper/dm-dust.rst
@@ -205,6 +205,21 @@ If there were no bad blocks to clear, the following message will
 appear::
 
         no badblocks found
+Listing the bad block list
+--------------------------
+
+To list all bad blocks in the bad block list(using an example device
+with blocks 1 and 2 in the bad block list),run the following message
+command::
+
+        $ sudo dmsetup message dust1 0 listbadblocks
+        1
+        2
+
+No bad block exists, same message will get following report::
+
+        $ sudo dmsetup message dust1 0 listbadblocks
+        null
 
 Message commands list
 ---------------------
@@ -224,6 +239,7 @@ Single argument message commands::
 
         countbadblocks
         clearbadblocks
+        listbadblocks
         disable
         enable
         quiet
-- 
2.25.4


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

