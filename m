Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D336C29035F
	for <lists+dm-devel@lfdr.de>; Fri, 16 Oct 2020 12:45:43 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-wK7avGkEMayINwGFlYtdgQ-1; Fri, 16 Oct 2020 06:45:40 -0400
X-MC-Unique: wK7avGkEMayINwGFlYtdgQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CFFB1084D84;
	Fri, 16 Oct 2020 10:45:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9DF05C230;
	Fri, 16 Oct 2020 10:45:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A3A171826D39;
	Fri, 16 Oct 2020 10:45:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09GAjLKf020778 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Oct 2020 06:45:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A31C12156A38; Fri, 16 Oct 2020 10:45:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E2922166B28
	for <dm-devel@redhat.com>; Fri, 16 Oct 2020 10:45:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7698E101A569
	for <dm-devel@redhat.com>; Fri, 16 Oct 2020 10:45:21 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-46-Pl0lzPvjMNKWwhZ4knHoow-1;
	Fri, 16 Oct 2020 06:45:18 -0400
X-MC-Unique: Pl0lzPvjMNKWwhZ4knHoow-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id EDB9AB2CC;
	Fri, 16 Oct 2020 10:45:16 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri, 16 Oct 2020 12:44:55 +0200
Message-Id: <20201016104501.8700-24-mwilck@suse.com>
In-Reply-To: <20201016104501.8700-1-mwilck@suse.com>
References: <20201016104501.8700-1-mwilck@suse.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 09GAjLKf020778
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 23/29] multipath-tools: mpath-tools.supp: file
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

