Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 67E7A219D92
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:20:33 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-gb05fDvAM4mnwLzxjTatiA-1; Thu, 09 Jul 2020 06:20:30 -0400
X-MC-Unique: gb05fDvAM4mnwLzxjTatiA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2557F19253C9;
	Thu,  9 Jul 2020 10:20:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 019D11002382;
	Thu,  9 Jul 2020 10:20:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AEC431809547;
	Thu,  9 Jul 2020 10:20:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AKGan030213 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:20:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 514FF2157F25; Thu,  9 Jul 2020 10:20:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CDA82166BA4
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:20:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 233EA856A54
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:20:14 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-380-pVfIaqkOMxS30hPs-EJ4ow-1;
	Thu, 09 Jul 2020 06:20:09 -0400
X-MC-Unique: pVfIaqkOMxS30hPs-EJ4ow-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id DB4C0B07D;
	Thu,  9 Jul 2020 10:20:07 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:19:51 +0200
Message-Id: <20200709101952.7285-4-mwilck@suse.com>
In-Reply-To: <20200709101952.7285-1-mwilck@suse.com>
References: <20200709101952.7285-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AKGan030213
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 38/39] libmultipath: print message if setting
	dev_loss_tmo is unsupported
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

If dev_loss_tmo can't be set because it's not supported for the
protocol at hand, let the user know.

Fixme: we could implement this for other protocols such as NVMe.
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/discovery.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index e2aea81..c00af7e 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -33,6 +33,8 @@
 #include "unaligned.h"
 #include "prioritizers/alua_rtpg.h"
 #include "foreign.h"
+#include "configure.h"
+#include "print.h"
 
 struct vpd_vendor_page vpd_vendor_pages[VPD_VP_ARRAY_SIZE] = {
 	[VPD_VP_UNDEF]	= { 0x00, "undef" },
@@ -765,6 +767,7 @@ sysfs_set_scsi_tmo (struct multipath *mpp, unsigned int checkint)
 	struct path *pp;
 	int i;
 	unsigned int dev_loss_tmo = mpp->dev_loss;
+	struct path *err_path = NULL;
 
 	if (mpp->no_path_retry > 0) {
 		uint64_t no_path_retry_tmo =
@@ -795,12 +798,34 @@ sysfs_set_scsi_tmo (struct multipath *mpp, unsigned int checkint)
 		return 0;
 
 	vector_foreach_slot(mpp->paths, pp, i) {
-		if (pp->sg_id.proto_id == SCSI_PROTOCOL_FCP)
+		if (pp->bus != SYSFS_BUS_SCSI) {
+			if (!err_path)
+				err_path = pp;
+			continue;
+		}
+
+		switch (pp->sg_id.proto_id) {
+		case SCSI_PROTOCOL_FCP:
 			sysfs_set_rport_tmo(mpp, pp);
-		if (pp->sg_id.proto_id == SCSI_PROTOCOL_ISCSI)
+			continue;
+		case SCSI_PROTOCOL_ISCSI:
 			sysfs_set_session_tmo(mpp, pp);
-		if (pp->sg_id.proto_id == SCSI_PROTOCOL_SAS)
+			continue;
+		case SCSI_PROTOCOL_SAS:
 			sysfs_set_nexus_loss_tmo(mpp, pp);
+			continue;
+		default:
+			if (!err_path)
+				err_path = pp;
+		}
+	}
+
+	if (err_path) {
+		char proto_buf[32];
+
+		snprint_path_protocol(proto_buf, sizeof(proto_buf), err_path);
+		condlog(2, "%s: setting dev_loss_tmo is unsupported for protocol %s",
+			mpp->alias, proto_buf);
 	}
 	return 0;
 }
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

