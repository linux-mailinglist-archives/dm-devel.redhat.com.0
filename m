Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 2A4591CB857
	for <lists+dm-devel@lfdr.de>; Fri,  8 May 2020 21:34:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588966449;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5Dk56AduXHWPMGwIS0kDY7CHaFt7soPZ6UgP3e2c2iw=;
	b=eL1MsKSdlMRpI1xQ2Y8Eq2Zq29KibX2pz9djUfU9NfFH6yyjOljkRURtu+hZQ9cJJZionO
	p+aNSw7pL3xrw24FrBAU16ovw7k1UKEcv2p+cm1/Y3tcumiF/waU4NJj9t8mSE5MR2H86q
	PIt/FDRLwgRoJ+4e6IAKsm2EHlezf+k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-UC3VQsrnPSyhUsFAJE1bDg-1; Fri, 08 May 2020 15:34:06 -0400
X-MC-Unique: UC3VQsrnPSyhUsFAJE1bDg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7BEA8018A5;
	Fri,  8 May 2020 19:34:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A2AC75D9CD;
	Fri,  8 May 2020 19:34:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4976C4CAA8;
	Fri,  8 May 2020 19:34:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 048JXjfH011965 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 May 2020 15:33:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A5DD12029F61; Fri,  8 May 2020 19:33:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0E9B2029F70
	for <dm-devel@redhat.com>; Fri,  8 May 2020 19:33:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BDF180CDB2
	for <dm-devel@redhat.com>; Fri,  8 May 2020 19:33:43 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-110-5iMsdRhjNJm04xUrVk1jhw-1;
	Fri, 08 May 2020 15:33:40 -0400
X-MC-Unique: 5iMsdRhjNJm04xUrVk1jhw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 8FCDDAD48;
	Fri,  8 May 2020 19:33:41 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri,  8 May 2020 21:33:01 +0200
Message-Id: <20200508193302.11401-2-mwilck@suse.com>
In-Reply-To: <20200508193302.11401-1-mwilck@suse.com>
References: <20200508193302.11401-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 048JXjfH011965
X-loop: dm-devel@redhat.com
Cc: "George, Martin" <Martin.George@netapp.com>, dm-devel@redhat.com,
	Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 1/2] libmultipath: set "enable_foreign" to NONE
	by default
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

This has been requested by NetApp.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/defaults.h    | 4 ++--
 multipath/multipath.conf.5 | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/libmultipath/defaults.h b/libmultipath/defaults.h
index e5ee6afe..01a501bd 100644
--- a/libmultipath/defaults.h
+++ b/libmultipath/defaults.h
@@ -50,8 +50,8 @@
 #define DEFAULT_FIND_MULTIPATHS_TIMEOUT -10
 #define DEFAULT_UNKNOWN_FIND_MULTIPATHS_TIMEOUT 1
 #define DEFAULT_ALL_TG_PT ALL_TG_PT_OFF
-/* Enable all foreign libraries by default */
-#define DEFAULT_ENABLE_FOREIGN ""
+/* Enable no foreign libraries by default */
+#define DEFAULT_ENABLE_FOREIGN "NONE"
 
 #define CHECKINT_UNDEF		UINT_MAX
 #define DEFAULT_CHECKINT	5
diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
index 05a5e8ff..28cea88c 100644
--- a/multipath/multipath.conf.5
+++ b/multipath/multipath.conf.5
@@ -1228,10 +1228,11 @@ Enables or disables foreign libraries (see section
 .I FOREIGN MULTIPATH SUPPORT
 below). The value is a regular expression; foreign libraries are loaded
 if their name (e.g. \(dqnvme\(dq) matches the expression. By default,
-all foreign libraries are enabled.
+no foreign libraries are enabled. Set this to \(dqnvme\(dq to enable NVMe native
+multipath support, or \(dq.*\(dq to enable all foreign libraries.
 .RS
 .TP
-The default is: \fB\(dq\(dq\fR (the empty regular expression)
+The default is: \fB\(dqNONE\(dq\fR
 .RE
 .
 .
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

