Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC42219EA2
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 13:04:15 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-uGTrBUXvOaGaanb__5cUtg-1; Thu, 09 Jul 2020 07:04:11 -0400
X-MC-Unique: uGTrBUXvOaGaanb__5cUtg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25F95186A8C5;
	Thu,  9 Jul 2020 11:04:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0269690E6B;
	Thu,  9 Jul 2020 11:04:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 52C811809547;
	Thu,  9 Jul 2020 11:04:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069B3vIO002104 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 07:03:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 885D7200BD8B; Thu,  9 Jul 2020 11:03:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DCC72166B28
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 11:03:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 923C718056A0
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 11:03:53 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-359-cFA1CuYSOuCWKobD5g700A-1;
	Thu, 09 Jul 2020 07:03:48 -0400
X-MC-Unique: cFA1CuYSOuCWKobD5g700A-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D3D7CAED9;
	Thu,  9 Jul 2020 11:03:46 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 13:03:25 +0200
Message-Id: <20200709110330.9917-2-mwilck@suse.com>
In-Reply-To: <20200709110330.9917-1-mwilck@suse.com>
References: <20200709110330.9917-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069B3vIO002104
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 75/80] multipathd: uev_trigger(): handle
	incomplete ADD events
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

From: Martin Wilck <mwilck@suse.com>

Udev may be killed after handling the ADD event for a multipath map,
but before handling the subsequent CHANGE event that populates the
udev data base with the device properties (e.g. during initrd processing).
If this happens, the ADD uevent sent during coldplug will only provide a
subset of the device properties. We need another CHANGE event to make the map
available to the system.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/main.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/multipathd/main.c b/multipathd/main.c
index 66ca4e3..29227cd 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -1508,6 +1508,31 @@ uev_trigger (struct uevent * uev, void * trigger_data)
 			uev_pathfail_check(uev, vecs);
 		} else if (!strncmp(uev->action, "remove", 6)) {
 			r = uev_remove_map(uev, vecs);
+		} else if (!strncmp(uev->action, "add", 3)) {
+			const char *ev_name;
+			char *dm_name;
+			int major = -1, minor = -1;
+
+			/*
+			 * If DM_NAME is not set for a valid map, trigger a
+			 * change event. This can happen during coldplug
+			 * if udev was killed between handling the 'add' and
+			 * 'change' events before.
+			 */
+			ev_name = uevent_get_dm_name(uev);
+			if (!ev_name) {
+				major = uevent_get_major(uev);
+				minor = uevent_get_minor(uev);
+				dm_name = dm_mapname(major, minor);
+				if (dm_name && *dm_name) {
+					condlog(2, "%s: received incomplete 'add' uevent, triggering change",
+						dm_name);
+					udev_device_set_sysattr_value(uev->udev,
+								      "uevent",
+								      "change");
+					free(dm_name);
+				}
+			}
 		}
 		goto out;
 	}
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

