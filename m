Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C6BA1115AE7
	for <lists+dm-devel@lfdr.de>; Sat,  7 Dec 2019 05:00:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575691228;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IlRncK/TEjltC8+MESOfMy6rsIvd5luunTqOYr+XMO4=;
	b=ciVzlg2qCLyE6NFnO0NPuEiVkezL58l99QcjqMiGetZthen1q4+EKHIOjU2S8zReFQf1Lp
	z3opIN1XjrjnTDFGp6IclMxU+qXjkwwqhIywEgErxMCKltKJ4H2iPoMM29LcWi3vPfqhY2
	MILB9JHlORNtHUom2u1uhJcdPJCkBIU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-rhNb6C3LMiOISRFsUcvCqQ-1; Fri, 06 Dec 2019 23:00:26 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A395C593A0;
	Sat,  7 Dec 2019 04:00:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3884019C58;
	Sat,  7 Dec 2019 04:00:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 599731809563;
	Sat,  7 Dec 2019 03:59:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB73xeaN001712 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 6 Dec 2019 22:59:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E484C1649E1; Sat,  7 Dec 2019 03:59:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF0A0113F7A
	for <dm-devel@redhat.com>; Sat,  7 Dec 2019 03:59:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BDEB51800622
	for <dm-devel@redhat.com>; Sat,  7 Dec 2019 03:59:37 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-65-5no4JnDRMqOObhAuNyiLOw-1; 
	Fri, 06 Dec 2019 22:59:34 -0500
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
	[24.5.143.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id D5D8E206D6;
	Sat,  7 Dec 2019 03:59:32 +0000 (UTC)
From: Eric Biggers <ebiggers@kernel.org>
To: dm-devel@redhat.com, Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>
Date: Fri,  6 Dec 2019 19:59:21 -0800
Message-Id: <20191207035921.94780-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-MC-Unique: 5no4JnDRMqOObhAuNyiLOw-1
X-MC-Unique: rhNb6C3LMiOISRFsUcvCqQ-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB73xeaN001712
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] docs: dm-integrity: remove reference to ARC4
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
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Eric Biggers <ebiggers@google.com>

ARC4 is no longer considered secure, so it shouldn't be used, even as
just an example.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 Documentation/admin-guide/device-mapper/dm-integrity.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/device-mapper/dm-integrity.rst b/Documentation/admin-guide/device-mapper/dm-integrity.rst
index 594095b54b29..c00f9f11e3f3 100644
--- a/Documentation/admin-guide/device-mapper/dm-integrity.rst
+++ b/Documentation/admin-guide/device-mapper/dm-integrity.rst
@@ -144,7 +144,7 @@ journal_crypt:algorithm(:key)	(the key is optional)
 	Encrypt the journal using given algorithm to make sure that the
 	attacker can't read the journal. You can use a block cipher here
 	(such as "cbc(aes)") or a stream cipher (for example "chacha20",
-	"salsa20", "ctr(aes)" or "ecb(arc4)").
+	"salsa20" or "ctr(aes)").
 
 	The journal contains history of last writes to the block device,
 	an attacker reading the journal could see the last sector nubmers
-- 
2.24.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

