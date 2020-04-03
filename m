Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id A5C7819D5BD
	for <lists+dm-devel@lfdr.de>; Fri,  3 Apr 2020 13:23:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585912984;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QSlrKypNtm9pVXHX8wLLEH4icq2i6RARaBwlITio9N8=;
	b=fKl4nSyQ4SO1Fot8O/lXaMX//kYhdfkiHf32L8Ei/dZUcjnAuPh5h07h5rX3fXxAaHaRq8
	UMVugQ6Yb/Vvt5YKcBdNQ4FN82N/Wn2ALo+VuIKMWMMsm7yL5isWwEFXyuZwGuK/R5ZPnh
	1pxvIjKrm6Mu6UYmB6Gy4FbaFIwVhDY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-sDVrD-6_M9Cah4oLVO_cTg-1; Fri, 03 Apr 2020 07:23:01 -0400
X-MC-Unique: sDVrD-6_M9Cah4oLVO_cTg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A81113F8;
	Fri,  3 Apr 2020 11:22:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE6701001B30;
	Fri,  3 Apr 2020 11:22:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A0D3418089CD;
	Fri,  3 Apr 2020 11:22:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 033BKCb1011358 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 3 Apr 2020 07:20:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EECA82166B2E; Fri,  3 Apr 2020 11:20:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB4372166B2C
	for <dm-devel@redhat.com>; Fri,  3 Apr 2020 11:20:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E13E80028B
	for <dm-devel@redhat.com>; Fri,  3 Apr 2020 11:20:09 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-371-tiSKY8XIMe-0knRUu_UO6A-1;
	Fri, 03 Apr 2020 07:20:06 -0400
X-MC-Unique: tiSKY8XIMe-0knRUu_UO6A-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 034E1AC44;
	Fri,  3 Apr 2020 11:20:04 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri,  3 Apr 2020 13:19:13 +0200
Message-Id: <20200403111914.30717-2-mwilck@suse.com>
In-Reply-To: <20200403111914.30717-1-mwilck@suse.com>
References: <20200403111914.30717-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 033BKCb1011358
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>, vliaskovitis@suse.com
Subject: [dm-devel] [PATCH v2 1/2] kpartx.rules: honor
	DM_UDEV_DISABLE_OTHER_RULES_FLAG
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

From: Martin Wilck <mwilck@suse.com>

10-dm.rules sets DM_UDEV_DISABLE_OTHER_RULES_FLAG for spurious
events that should be ignored by other layers. This means devices
with DISK_RO set, and devices that have never been set up properly
by device-mapper before. This flag should be respected by kpartx.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 kpartx/kpartx.rules | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kpartx/kpartx.rules b/kpartx/kpartx.rules
index 8f990494..f1bf31ca 100644
--- a/kpartx/kpartx.rules
+++ b/kpartx/kpartx.rules
@@ -7,6 +7,7 @@
 KERNEL!="dm-*", GOTO="kpartx_end"
 ACTION!="add|change", GOTO="kpartx_end"
 ENV{DM_UUID}!="?*", GOTO="kpartx_end"
+ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}=="1", GOTO="kpartx_end"
 
 # Create dm tables for partitions on multipath devices.
 ENV{DM_UUID}!="mpath-?*", GOTO="mpath_kpartx_end"
-- 
2.25.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

