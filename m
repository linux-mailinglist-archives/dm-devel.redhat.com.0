Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C85A01EBF76
	for <lists+dm-devel@lfdr.de>; Tue,  2 Jun 2020 17:55:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591113345;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=X+lF0irzlEwLZm4HOOzm1wHzLONE2Ib2cICv4rH7MMs=;
	b=YI5H6GTSkJTs0dGL2rnM8uVYhf+7Po7GyqsQ4zCccViwKghbkYSSXzUJmytcJbmxGjtJN7
	XKDI2zfM3228O85bSdI1HLgXwcNlUfDW7G/lCQ3Iyj/Pfra/BWwPJFif1d5olgKyXE5iU3
	7crJ/vaeAraorVuvACMkxZIod59ZIws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-3c16_WiWOG6Hs6CX_u3sNQ-1; Tue, 02 Jun 2020 11:55:40 -0400
X-MC-Unique: 3c16_WiWOG6Hs6CX_u3sNQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EE4383DE6B;
	Tue,  2 Jun 2020 15:55:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A03F9768C6;
	Tue,  2 Jun 2020 15:55:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF86697018;
	Tue,  2 Jun 2020 15:55:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 052Ft1qW022173 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Jun 2020 11:55:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A3FAADBAEA; Tue,  2 Jun 2020 15:55:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E621D95EF
	for <dm-devel@redhat.com>; Tue,  2 Jun 2020 15:54:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D567833B44
	for <dm-devel@redhat.com>; Tue,  2 Jun 2020 15:54:58 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-317-FU1B7adLPiGTUBimUrQ_hg-1;
	Tue, 02 Jun 2020 11:54:53 -0400
X-MC-Unique: FU1B7adLPiGTUBimUrQ_hg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id B5A5CAB7D;
	Tue,  2 Jun 2020 15:54:54 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue,  2 Jun 2020 17:54:43 +0200
Message-Id: <20200602155443.14072-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 052Ft1qW022173
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH] 11-dm-mpath.rules: Fix udev rule processing
	during coldplug
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

DM_SUBSYSTEM_UDEV_FLAG0 is used to indicate that upper layer
udev rules don't need to be processed for multipath maps, e.g.
for map reloads.

However, this can fail if maps were created during initrd processing,
but udev processing for the change events of these maps didn't
complete because udevd was killed to switch root. So, in the coldplug
case, play safe and process the rules once more.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipath/11-dm-mpath.rules | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/multipath/11-dm-mpath.rules b/multipath/11-dm-mpath.rules
index cd522e8c..34c21fd1 100644
--- a/multipath/11-dm-mpath.rules
+++ b/multipath/11-dm-mpath.rules
@@ -52,8 +52,13 @@ LABEL="mpath_action"
 # something that should be reacted upon since it would be useless extra work.
 # It's exactly mpath's job to provide *seamless* device access to any of the
 # paths that are available underneath.
+# Exception: On cold-plug, if the map had already been set up before,
+# do process upper layers, because rule processing may not necessarily have
+# completed during initrd processing.
+ACTION=="add", ENV{.MPATH_DEVICE_READY_OLD}=="1", GOTO="process_reload"
 ENV{DM_SUBSYSTEM_UDEV_FLAG0}=="1", \
 	ENV{DM_ACTIVATION}="0", ENV{MPATH_UNCHANGED}="1"
+LABEL="process_reload"
 
 # For path failed or reinstated events, unset DM_ACTIVATION.
 # This is similar to the DM_SUBSYSTEM_UDEV_FLAG0 case above.
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

