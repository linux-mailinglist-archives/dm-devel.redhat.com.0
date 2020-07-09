Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C5A23219E4F
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:52:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-MPgpOghyPUmFMG0N8i6Nog-1; Thu, 09 Jul 2020 06:52:45 -0400
X-MC-Unique: MPgpOghyPUmFMG0N8i6Nog-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D337C108C;
	Thu,  9 Jul 2020 10:52:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4A585D9F3;
	Thu,  9 Jul 2020 10:52:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 71A2493F8E;
	Thu,  9 Jul 2020 10:52:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AqKXr000639 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:52:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8ABAA5F259; Thu,  9 Jul 2020 10:52:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 85A665F255
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:52:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2ECF100E7C7
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:52:18 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-19-Axzu-47pMtuEeRzsmuGyqw-1;
	Thu, 09 Jul 2020 06:52:16 -0400
X-MC-Unique: Axzu-47pMtuEeRzsmuGyqw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 84F4BAE78;
	Thu,  9 Jul 2020 10:52:14 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:51:38 +0200
Message-Id: <20200709105145.9211-15-mwilck@suse.com>
In-Reply-To: <20200709105145.9211-1-mwilck@suse.com>
References: <20200709105145.9211-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AqKXr000639
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 67/74] libmultipath: disassemble_map(): always
	search paths by dev_t
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

There's no point in searching for the devname first. dev_t is the primary
device property for both device mapper and udev.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/dmparser.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
index 27581cd..7fcd76e 100644
--- a/libmultipath/dmparser.c
+++ b/libmultipath/dmparser.c
@@ -295,12 +295,8 @@ int disassemble_map(vector pathvec, char *params, struct multipath *mpp,
 				devname[0] = '\0';
 			}
 
-			if (pathvec) {
-				if (strlen(devname))
-					pp = find_path_by_dev(pathvec, devname);
-				else
-					pp = find_path_by_devt(pathvec, word);
-			}
+			if (pathvec)
+				pp = find_path_by_devt(pathvec, word);
 
 			if (!pp) {
 				pp = alloc_path();
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

