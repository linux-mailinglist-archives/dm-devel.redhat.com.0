Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E95322DC61A
	for <lists+dm-devel@lfdr.de>; Wed, 16 Dec 2020 19:19:19 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-WYoT7XIvOwG_C7NkQTCvfg-1; Wed, 16 Dec 2020 13:19:15 -0500
X-MC-Unique: WYoT7XIvOwG_C7NkQTCvfg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B0976D538;
	Wed, 16 Dec 2020 18:19:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2E0FE717;
	Wed, 16 Dec 2020 18:19:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8E2F350032;
	Wed, 16 Dec 2020 18:19:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BGIIf1F018116 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 16 Dec 2020 13:18:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 22AEC2166B2C; Wed, 16 Dec 2020 18:18:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DC9C2166B27
	for <dm-devel@redhat.com>; Wed, 16 Dec 2020 18:18:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A346811E86
	for <dm-devel@redhat.com>; Wed, 16 Dec 2020 18:18:41 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-276-9NJKix91PgahWGaUFaD-Xw-1;
	Wed, 16 Dec 2020 13:18:35 -0500
X-MC-Unique: 9NJKix91PgahWGaUFaD-Xw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 59221AF57;
	Wed, 16 Dec 2020 18:18:34 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 16 Dec 2020 19:17:02 +0100
Message-Id: <20201216181708.22224-24-mwilck@suse.com>
In-Reply-To: <20201216181708.22224-1-mwilck@suse.com>
References: <20201216181708.22224-1-mwilck@suse.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0BGIIf1F018116
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v3 23/29] multipath-tools: mpath-tools.supp: file
	with valgrind suppressions
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

These leaks are caused by other libraries (libsystemd, glibc,
libgcrypt) and should be ignored when debugging with valgrind

Usage example:

valgrind --suppressions=mpath-tools.supp \
    --leak-check=full --show-leak-kinds=all $COMMAND

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 third-party/valgrind/mpath-tools.supp | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 third-party/valgrind/mpath-tools.supp

diff --git a/third-party/valgrind/mpath-tools.supp b/third-party/valgrind/mpath-tools.supp
new file mode 100644
index 0000000..0537fd5
--- /dev/null
+++ b/third-party/valgrind/mpath-tools.supp
@@ -0,0 +1,32 @@
+{
+   glibc _dlerror_run leak: https://stackoverflow.com/questions/1542457/memory-leak-reported-by-valgrind-in-dlopen
+   Memcheck:Leak
+   match-leak-kinds: reachable
+   fun:calloc
+   fun:_dlerror_run
+   fun:dlopen*
+}
+
+{
+   systemd mempools are never freed: https://bugzilla.redhat.com/show_bug.cgi?id=1215670
+   Memcheck:Leak
+   match-leak-kinds: reachable
+   fun:malloc
+   fun:mempool_alloc_tile
+   fun:mempool_alloc0_tile
+   fun:hashmap_base_new
+   fun:hashmap_base_ensure_allocated
+}
+
+{
+   libgcrypt library initialization
+   Memcheck:Leak
+   match-leak-kinds: reachable
+   fun:malloc
+   ...
+   fun:_gcry_xmalloc
+   ...
+   fun:global_init.*
+   ...
+   fun:_dl_init
+}
-- 
2.29.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

