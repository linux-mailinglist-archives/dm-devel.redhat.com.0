Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8A3AF219E5D
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:53:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-SPFBbOu5NPuBhq4GCRhNeg-1; Thu, 09 Jul 2020 06:52:49 -0400
X-MC-Unique: SPFBbOu5NPuBhq4GCRhNeg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57DB3107ACCA;
	Thu,  9 Jul 2020 10:52:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34C722B6E2;
	Thu,  9 Jul 2020 10:52:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E83001806B0B;
	Thu,  9 Jul 2020 10:52:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AqLGu000687 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:52:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7C67B2026D67; Thu,  9 Jul 2020 10:52:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77FE5208BDDF
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:52:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72B97856A59
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:52:19 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-392-kOT0AfMIPgebMa3DOSUEGg-1;
	Thu, 09 Jul 2020 06:52:16 -0400
X-MC-Unique: kOT0AfMIPgebMa3DOSUEGg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D866EAEF6;
	Thu,  9 Jul 2020 10:52:13 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:51:35 +0200
Message-Id: <20200709105145.9211-12-mwilck@suse.com>
In-Reply-To: <20200709105145.9211-1-mwilck@suse.com>
References: <20200709105145.9211-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AqLGu000687
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 64/74] multipathd: check_path(): set
	retrigger_delay if necessary
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

In a follow up patch, we will set INIT_MISSING_UDEV and set tick=1
(minimal) at the same time. In this case, which is new, check_path()
must reset the delay when it first triggers an uevent.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/multipathd/main.c b/multipathd/main.c
index 7b2d320..0cd0ee6 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -2019,6 +2019,7 @@ check_path (struct vectors * vecs, struct path * pp, unsigned int ticks)
 	int disable_reinstate = 0;
 	int oldchkrstate = pp->chkrstate;
 	int retrigger_tries, verbosity;
+	unsigned int retrigger_delay;
 	unsigned int checkint, max_checkint;
 	struct config *conf;
 	int marginal_pathgroups, marginal_changed = 0;
@@ -2036,6 +2037,7 @@ check_path (struct vectors * vecs, struct path * pp, unsigned int ticks)
 
 	conf = get_multipath_config();
 	retrigger_tries = conf->retrigger_tries;
+	retrigger_delay = conf->retrigger_delay;
 	checkint = conf->checkint;
 	max_checkint = conf->max_checkint;
 	verbosity = conf->verbosity;
@@ -2048,6 +2050,8 @@ check_path (struct vectors * vecs, struct path * pp, unsigned int ticks)
 	};
 
 	if (!pp->mpp && pp->initialized == INIT_MISSING_UDEV) {
+		if (pp->tick != retrigger_delay)
+			pp->tick = conf->retrigger_delay;
 		if (pp->retriggers < retrigger_tries) {
 			condlog(2, "%s: triggering change event to reinitialize",
 				pp->dev);
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

