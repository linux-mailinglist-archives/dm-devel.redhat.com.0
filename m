Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 826B31EBD4E
	for <lists+dm-devel@lfdr.de>; Tue,  2 Jun 2020 15:48:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591105716;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uEBV22ynuw0sc33HOwWCXHcESUhdp3uJR/v5LR/3oRI=;
	b=QsP5K4+7gMa5gUIOtGiiranjyjdV+Y0G7u4UILOYJsvvNe2JPFk54DrBY+CwMAL8gBn7r9
	GekxMExjaID4g+w2tB2RdRA6u/ZTtlVvoiYROZ+wU9wLo0x68RtvGC7Kbrck95e+5gTWx4
	nsJzwFjiaIyEjR6KceWaFVe3wMC/mbk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-LJ4ac0W2OQq2Zl6UsWfArA-1; Tue, 02 Jun 2020 09:48:34 -0400
X-MC-Unique: LJ4ac0W2OQq2Zl6UsWfArA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACCC1107ACCA;
	Tue,  2 Jun 2020 13:48:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 771847F0BE;
	Tue,  2 Jun 2020 13:48:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2991F1809547;
	Tue,  2 Jun 2020 13:48:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 052DmEBc009473 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Jun 2020 09:48:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6899F7F0AC; Tue,  2 Jun 2020 13:48:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 712807E7F1;
	Tue,  2 Jun 2020 13:48:11 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 052DmA2Y002863; Tue, 2 Jun 2020 09:48:10 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 052DmAu1002859; Tue, 2 Jun 2020 09:48:10 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 2 Jun 2020 09:48:10 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>
Message-ID: <alpine.LRH.2.02.2006020946520.826@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Milan Broz <mbroz@redhat.com>
Subject: [dm-devel] [PATCH] dm-integrity: add status line documentation
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch adds status line documentation.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 Documentation/admin-guide/device-mapper/dm-integrity.rst |    8 ++++++++
 1 file changed, 8 insertions(+)

Index: linux-2.6/Documentation/admin-guide/device-mapper/dm-integrity.rst
===================================================================
--- linux-2.6.orig/Documentation/admin-guide/device-mapper/dm-integrity.rst	2020-06-02 13:15:58.000000000 +0200
+++ linux-2.6/Documentation/admin-guide/device-mapper/dm-integrity.rst	2020-06-02 15:46:42.000000000 +0200
@@ -193,6 +193,14 @@ should not be changed when reloading the
 data depend on them and the reloaded target would be non-functional.
 
 
+Status line:
+
+1. the number of integrity mismatches
+2. provided data sectors - that is the number of sectors that the user
+   could use
+3. the current recalculating position (or '-' if we didn't recalculate)
+
+
 The layout of the formatted block device:
 
 * reserved sectors

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

