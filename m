Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 33EF31F03D1
	for <lists+dm-devel@lfdr.de>; Sat,  6 Jun 2020 02:22:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591402954;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WC3TC/1xODu+nBi/T2JT5VRLwdkA3HxUtOKn2mirev4=;
	b=ML9/s6DIJn5Z4Qo4LAQIv5hKDtU8CIiyGf/Z0moM0PauQmY6wyarIdlwGcFnR7C/LFmsnq
	PjXMGEQysUyN7+f8TSomE9iev7oNtV2L/qZm4haXU/gb9Gk3zCOsjf0upBV/UJ+6sNTeZ6
	J2rQUxJ1Kh8S6Fy7DmJXvb8uL+DJfLc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-t58PG_bAPV6ewvnUKNKENA-1; Fri, 05 Jun 2020 20:22:32 -0400
X-MC-Unique: t58PG_bAPV6ewvnUKNKENA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E18819057B9;
	Sat,  6 Jun 2020 00:22:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AB5610013D4;
	Sat,  6 Jun 2020 00:22:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 29633180530A;
	Sat,  6 Jun 2020 00:22:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0557muql006070 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 5 Jun 2020 03:48:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 35B07200C0FC; Fri,  5 Jun 2020 07:48:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23240202683D
	for <dm-devel@redhat.com>; Fri,  5 Jun 2020 07:48:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5532D18A6671
	for <dm-devel@redhat.com>; Fri,  5 Jun 2020 07:48:54 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-418-UZkj5KVBOYCpX_jnx1-g5w-1; Fri, 05 Jun 2020 03:48:49 -0400
X-MC-Unique: UZkj5KVBOYCpX_jnx1-g5w-1
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 5E57A3B4FDA59AD90264;
	Fri,  5 Jun 2020 15:32:35 +0800 (CST)
Received: from code-website.localdomain (10.175.104.175) by
	DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server
	id 14.3.487.0; Fri, 5 Jun 2020 15:32:27 +0800
From: yangerkun <yangerkun@huawei.com>
To: <bgurney@redhat.com>, <agk@redhat.com>, <snitzer@redhat.com>
Date: Fri, 5 Jun 2020 15:32:01 +0800
Message-ID: <20200605073201.1742675-3-yangerkun@huawei.com>
In-Reply-To: <20200605073201.1742675-1-yangerkun@huawei.com>
References: <20200605073201.1742675-1-yangerkun@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0557muql006070
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 05 Jun 2020 09:30:21 -0400
Cc: dm-devel@redhat.com, yangerkun@huawei.com
Subject: [dm-devel] [RFC 2/2] dm dust: introduce listbadblocks in the rst
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
index b6e7e7ead831..185b3ce6298b 100644
--- a/Documentation/admin-guide/device-mapper/dm-dust.rst
+++ b/Documentation/admin-guide/device-mapper/dm-dust.rst
@@ -205,6 +205,21 @@ appear::
 
         kernel: device-mapper: dust: clearbadblocks: no badblocks found
 
+Listling the bad block list
+---------------------------
+
+To list all bad block list, run the following message command::
+
+        $ sudo dmsetup message dust1 0 listbadblocks
+
+We will get following message(image that we have insert block 1/2, and
+we will list the block index in order)::
+
+        device-mapper: dust: dust_list_badblocks: badblocks list as below:
+        device-mapper: dust: bad block: 1
+        device-mapper: dust: bad block: 2
+        device-mapper: dust: dust_list_badblocks: badblocks list end.
+
 Message commands list
 ---------------------
 
@@ -223,6 +238,7 @@ Single argument message commands::
 
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

