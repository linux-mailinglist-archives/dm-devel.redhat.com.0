Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E0DAD19D5BE
	for <lists+dm-devel@lfdr.de>; Fri,  3 Apr 2020 13:23:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585912993;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0s1cBLTaoG3bV+ymaFBBGWVitgaM20QZT+f/R4CQSNs=;
	b=FeInxzfzLZq8EWmG0NOQb1Qz4vS69hIuH2J7b+FptvTcd1uWsejaUa0HogE9Pro0VL5O4d
	sEM1bBuDkrtejEmnbaFmUbjt8HCOzFKz/KkmkEdca8RCgFk2k24xyUmiD9W+Y4Ncwdg0tm
	ew6ojff/h3pXGj9ELztr9L0bqZTBRu8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-SP0cQ5v3NMKdfMM3w2VdSw-1; Fri, 03 Apr 2020 07:23:07 -0400
X-MC-Unique: SP0cQ5v3NMKdfMM3w2VdSw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 543DE8017F4;
	Fri,  3 Apr 2020 11:23:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23998A63DE;
	Fri,  3 Apr 2020 11:23:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9A19D4E444;
	Fri,  3 Apr 2020 11:23:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 033BKDWx011365 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 3 Apr 2020 07:20:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8967510EE98F; Fri,  3 Apr 2020 11:20:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 83FCC1059132
	for <dm-devel@redhat.com>; Fri,  3 Apr 2020 11:20:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B81A1185A78E
	for <dm-devel@redhat.com>; Fri,  3 Apr 2020 11:20:09 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-431-Ljlt19yxN86lsNS03WfrcQ-1;
	Fri, 03 Apr 2020 07:20:07 -0400
X-MC-Unique: Ljlt19yxN86lsNS03WfrcQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 029A9AC19;
	Fri,  3 Apr 2020 11:20:04 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri,  3 Apr 2020 13:19:14 +0200
Message-Id: <20200403111914.30717-3-mwilck@suse.com>
In-Reply-To: <20200403111914.30717-1-mwilck@suse.com>
References: <20200403111914.30717-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 033BKDWx011365
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>, vliaskovitis@suse.com
Subject: [dm-devel] [PATCH v2 2/2] kpartx.rules: check for skip_kpartx on
	synthetic uevents
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

From: Martin Wilck <mwilck@suse.com>

The current test to detect "spurious" uevents, and thus whether to
import DM_SUBSYSTEM_UDEV_FLAG1 (the flag for the "skip_kpartx" option)
from the udev db is wrong. In 10-dm.rules, DM_UDEV_PRIMARY_SOURCE_FLAG
is imported from the db if it isn't set, meaning that it's always 1
for active maps. The only events for which DM_SUBSYSTEM_UDEV_FLAG1
must not be loaded from the db are the real "primary" events, which
are "change" events with DM_ACTIVATION=="1".

11-dm-mpath.rules resets DM_ACTIVATION to 0 if nothing should change in upper
layers. In this case importing DM_SUBSYSTEM_UDEV_FLAG1 is correct, too. kpartx
will not be called anyway, because 11-dm-mpath.rules also sets MPATH_UNCHANGED=1.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 kpartx/kpartx.rules | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/kpartx/kpartx.rules b/kpartx/kpartx.rules
index f1bf31ca..d7527d7d 100644
--- a/kpartx/kpartx.rules
+++ b/kpartx/kpartx.rules
@@ -13,8 +13,11 @@ ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}=="1", GOTO="kpartx_end"
 ENV{DM_UUID}!="mpath-?*", GOTO="mpath_kpartx_end"
 
 # DM_SUBSYSTEM_UDEV_FLAG1 is the "skip_kpartx" flag.
-# For events not generated by libdevmapper, we need to fetch it from db.
-ENV{DM_UDEV_PRIMARY_SOURCE_FLAG}!="1", IMPORT{db}="DM_SUBSYSTEM_UDEV_FLAG1"
+# For events not generated by libdevmapper, we need to fetch it from db:
+# - "change" events with DM_ACTIVATION!="1" (e.g. partition table changes)
+# - "add" events for which rules are not disabled ("coldplug" case)
+ENV{DM_ACTIVATION}!="1", IMPORT{db}="DM_SUBSYSTEM_UDEV_FLAG1"
+ACTION=="add", IMPORT{db}="DM_SUBSYSTEM_UDEV_FLAG1"
 ENV{DM_SUBSYSTEM_UDEV_FLAG1}=="1", GOTO="mpath_kpartx_end"
 
 # 11-dm-mpath.rules sets MPATH_UNCHANGED for events that can be ignored.
-- 
2.25.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

