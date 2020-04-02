Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B887219C724
	for <lists+dm-devel@lfdr.de>; Thu,  2 Apr 2020 18:34:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585845257;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RqRi1FBNAwSh7APYZ6OG7NiOybmM2nvBczHCnGylhJs=;
	b=i0U8NhHBKtiA+7qcXA11l1UutnG1+9aafJch9QMXP6ivlq2ZGHrddPISuenADs6JckQV70
	57PywG/1H+RzxhKkSboYxojfbWMMOYenjP3EKIBJC1RYgMpLam01euLSpUm/fP1JaF71v/
	hYMyImZmtothgluNCDKRAM2aJxwDAhg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-J9hkRPPWPpqY4SF8o4UNqg-1; Thu, 02 Apr 2020 12:34:15 -0400
X-MC-Unique: J9hkRPPWPpqY4SF8o4UNqg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DA52149C0;
	Thu,  2 Apr 2020 16:34:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB7795C1C5;
	Thu,  2 Apr 2020 16:34:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 28A3218089CD;
	Thu,  2 Apr 2020 16:33:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 032GWAZO009433 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Apr 2020 12:32:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9C9A320292BF; Thu,  2 Apr 2020 16:32:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98C4D2093CC3
	for <dm-devel@redhat.com>; Thu,  2 Apr 2020 16:32:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A2DC185A791
	for <dm-devel@redhat.com>; Thu,  2 Apr 2020 16:32:08 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-480-t-kCZ4LuMUe85MRuWz_l0A-1;
	Thu, 02 Apr 2020 12:32:03 -0400
X-MC-Unique: t-kCZ4LuMUe85MRuWz_l0A-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 039FDAEA2;
	Thu,  2 Apr 2020 16:32:01 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  2 Apr 2020 18:31:46 +0200
Message-Id: <20200402163146.24881-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 032GWAZO009433
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH] kpartx.rules: check for skip_kpartx if
	DM_ACTIVATION is unset
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

The current test to detect "spurious" uevents, and thus whether to
import DM_SUBSYSTEM_UDEV_FLAG1 (the flag for the "skip_kpartx" option)
from the udev db is wrong. In 10-dm.rules, DM_UDEV_PRIMARY_SOURCE_FLAG
is imported from the db if it isn't set, meaning that it's always 1
for active maps. The only events for which DM_SUBSYSTEM_UDEV_FLAG1
must not be loaded from the db are the real "primary" events, which
have DM_ACTIVATION=="1".

11-dm-mpath.rules resets DM_ACTIVATION to 0 if nothing should change in upper
layers. In this case importing DM_SUBSYSTEM_UDEV_FLAG1 is correct, too. kpartx
will not be called anyway, because 11-dm-mpath.rules also sets MPATH_UNCHANGED=1.
---
 kpartx/kpartx.rules | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kpartx/kpartx.rules b/kpartx/kpartx.rules
index 8f990494..3c6be9f5 100644
--- a/kpartx/kpartx.rules
+++ b/kpartx/kpartx.rules
@@ -13,7 +13,9 @@ ENV{DM_UUID}!="mpath-?*", GOTO="mpath_kpartx_end"
 
 # DM_SUBSYSTEM_UDEV_FLAG1 is the "skip_kpartx" flag.
 # For events not generated by libdevmapper, we need to fetch it from db.
-ENV{DM_UDEV_PRIMARY_SOURCE_FLAG}!="1", IMPORT{db}="DM_SUBSYSTEM_UDEV_FLAG1"
+# Such events are identified by DM_ACTIVATION, not DM_UDEV_PRIMARY_SOURCE_FLAG,
+# because the latter is imported from the udev db (see 10-dm.rules)
+ENV{DM_ACTIVATION}!="1", IMPORT{db}="DM_SUBSYSTEM_UDEV_FLAG1"
 ENV{DM_SUBSYSTEM_UDEV_FLAG1}=="1", GOTO="mpath_kpartx_end"
 
 # 11-dm-mpath.rules sets MPATH_UNCHANGED for events that can be ignored.
-- 
2.25.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

