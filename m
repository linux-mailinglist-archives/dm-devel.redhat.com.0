Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D09962902FD
	for <lists+dm-devel@lfdr.de>; Fri, 16 Oct 2020 12:43:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-_8x7BkuMN6aTQCsJ9Y_7iQ-1; Fri, 16 Oct 2020 06:43:39 -0400
X-MC-Unique: _8x7BkuMN6aTQCsJ9Y_7iQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19DC71074669;
	Fri, 16 Oct 2020 10:43:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC6295D9CC;
	Fri, 16 Oct 2020 10:43:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A980644A66;
	Fri, 16 Oct 2020 10:43:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09GAhDmJ019957 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Oct 2020 06:43:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B92EF2156A37; Fri, 16 Oct 2020 10:43:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B37832156A39
	for <dm-devel@redhat.com>; Fri, 16 Oct 2020 10:43:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71CFD811E79
	for <dm-devel@redhat.com>; Fri, 16 Oct 2020 10:43:11 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-300-b8iQWN5iN9S09pdLuwhSkg-1;
	Fri, 16 Oct 2020 06:43:06 -0400
X-MC-Unique: b8iQWN5iN9S09pdLuwhSkg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C5360B2B0;
	Fri, 16 Oct 2020 10:43:04 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri, 16 Oct 2020 12:42:31 +0200
Message-Id: <20201016104239.8217-5-mwilck@suse.com>
In-Reply-To: <20201016104239.8217-1-mwilck@suse.com>
References: <20201016104239.8217-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 09GAhDmJ019957
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 04/12] libdmmp tests: fix compilation
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

These tests don't compile with -Werror=unused-parameter. Fix it.
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libdmmp/test/libdmmp_speed_test.c | 2 +-
 libdmmp/test/libdmmp_test.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/libdmmp/test/libdmmp_speed_test.c b/libdmmp/test/libdmmp_speed_test.c
index 372cd39..d91ba50 100644
--- a/libdmmp/test/libdmmp_speed_test.c
+++ b/libdmmp/test/libdmmp_speed_test.c
@@ -27,7 +27,7 @@
 
 #include <libdmmp/libdmmp.h>
 
-int main(int argc, char *argv[])
+int main(void)
 {
 	struct dmmp_context *ctx = NULL;
 	struct dmmp_mpath **dmmp_mps = NULL;
diff --git a/libdmmp/test/libdmmp_test.c b/libdmmp/test/libdmmp_test.c
index d944e1e..a940b57 100644
--- a/libdmmp/test/libdmmp_test.c
+++ b/libdmmp/test/libdmmp_test.c
@@ -102,7 +102,7 @@ out:
 	return rc;
 }
 
-int main(int argc, char *argv[])
+int main(void)
 {
 	struct dmmp_context *ctx = NULL;
 	struct dmmp_mpath **dmmp_mps = NULL;
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

