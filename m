Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 972A2219D72
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:17:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-pBP8kK55NKuRVVyQ1kqVhw-1; Thu, 09 Jul 2020 06:17:39 -0400
X-MC-Unique: pBP8kK55NKuRVVyQ1kqVhw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71835107ACF5;
	Thu,  9 Jul 2020 10:17:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E5D0561100;
	Thu,  9 Jul 2020 10:17:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 97BCF93F90;
	Thu,  9 Jul 2020 10:17:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AH0h3029420 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:17:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 35B80114B2FC; Thu,  9 Jul 2020 10:17:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3208F114B2F6
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:17:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 190CD858EE9
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:17:00 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-379-pxRuVTT0PvCXzXpq41hoLw-1;
	Thu, 09 Jul 2020 06:16:57 -0400
X-MC-Unique: pxRuVTT0PvCXzXpq41hoLw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A69CAB090;
	Thu,  9 Jul 2020 10:16:55 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:16:07 +0200
Message-Id: <20200709101620.6786-23-mwilck@suse.com>
In-Reply-To: <20200709101620.6786-1-mwilck@suse.com>
References: <20200709101620.6786-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AH0h3029420
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 22/35] libmultipath: get_uid(): improve log
	message on udev failure
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

If WWID determination by uid_attribute fails, and no fallback
is available, multipath(d) print two error messages:
"failed to get udev uid" and "failed to get unknown uid".
That's confusing and unnecessary. Print only the udev message.
If the fallback is available, this will result in only the
error message from the fallback being printed. But that's not
a big issue, because the udev error message will have been printed
before, and because failure of the fallback implies previous failure
of the udev method.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/discovery.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 81c78d3..5d4bf7d 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -2014,12 +2014,9 @@ get_uid (struct path * pp, int path_state, struct udev_device *udev,
 
 		if (udev_available) {
 			len = get_udev_uid(pp, pp->uid_attribute, udev);
-			if (len <= 0)
-				condlog(1,
-					"%s: failed to get udev uid: %s",
-					pp->dev, strerror(-len));
-			else
-				origin = "udev";
+			origin = "udev";
+			if (len == 0)
+				condlog(1, "%s: empty udev uid", pp->dev);
 		}
 		if ((!udev_available || (len <= 0 && allow_fallback))
 		    && has_uid_fallback(pp)) {
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

