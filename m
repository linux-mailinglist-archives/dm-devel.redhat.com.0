Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8B879AA3D
	for <lists+dm-devel@lfdr.de>; Mon, 11 Sep 2023 18:39:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694450389;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EwTjGY/U+OCBufnZK71y9R30vYDvN+w4uLAaji8+dug=;
	b=CCEHf08mb3S/yH6shXjt5VUuarz3UTFHFIZ58btg8b62T2wcajXzUFPSmn3jr03fJVM5sb
	IDZTYuEFS3yXOlSIDhhPmb+Vu6uNxa1rWcYqfZC+Xuldjq2enutFQxN5wmT3324WHm1x0I
	0itxVM8yMsJnGBSpQ9CM/Y6oPizPE4Q=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-irNQoDbUO_uCdFsYEre7uw-1; Mon, 11 Sep 2023 12:39:42 -0400
X-MC-Unique: irNQoDbUO_uCdFsYEre7uw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B24C41C06921;
	Mon, 11 Sep 2023 16:39:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9A4C91054FC3;
	Mon, 11 Sep 2023 16:39:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7DFE319465BC;
	Mon, 11 Sep 2023 16:39:29 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 88A5319465A2
 for <dm-devel@listman.corp.redhat.com>; Mon, 11 Sep 2023 16:39:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 655C240C6ECA; Mon, 11 Sep 2023 16:39:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E93B40C6ECD
 for <dm-devel@redhat.com>; Mon, 11 Sep 2023 16:39:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B34B928BB1
 for <dm-devel@redhat.com>; Mon, 11 Sep 2023 16:39:27 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-686-juO_gLT9ONqdWbIBN1kKeA-1; Mon,
 11 Sep 2023 12:39:25 -0400
X-MC-Unique: juO_gLT9ONqdWbIBN1kKeA-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D7CE41F8A6;
 Mon, 11 Sep 2023 16:39:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A80B213AD1;
 Mon, 11 Sep 2023 16:39:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wBFwJ7tC/2RzEAAAMHmgww
 (envelope-from <mwilck@suse.com>); Mon, 11 Sep 2023 16:39:23 +0000
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
 Benjamin Marzinski <bmarzins@redhat.com>
Date: Mon, 11 Sep 2023 18:38:45 +0200
Message-ID: <20230911163846.27197-37-mwilck@suse.com>
In-Reply-To: <20230911163846.27197-1-mwilck@suse.com>
References: <20230911163846.27197-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [dm-devel] [PATCH v2 36/37] multipath-tools: allow prefixes with
 and w/o trailing slash
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: suse.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Add some logic to Makefile.inc that leads to the same result
for "prefix=" and "prefix=/", or "prefix=/usr" and "prefix=/usr/".
The logic does not work for multiple trailing slashes. It applies
to all XYZ_prefix variables in Makefile.inc.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 Makefile.inc | 35 ++++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/Makefile.inc b/Makefile.inc
index 79e521e..6e384e6 100644
--- a/Makefile.inc
+++ b/Makefile.inc
@@ -43,22 +43,31 @@ etc_prefix	:= $(prefix)
 # Note: some systemd installations use separate "prefix" and "rootprefix".
 # In this case, override only unitdir to use systemd's "rootprefix" instead of $(systemd_prefix)
 systemd_prefix  := /usr
-unitdir		:= $(systemd_prefix)/lib/systemd/system
-tmpfilesdir	:= $(systemd_prefix)/lib/tmpfiles.d
-modulesloaddir	:= $(systemd_prefix)/lib/modules-load.d
-libudevdir	:= $(systemd_prefix)/lib/udev
+
+# Make sure all prefix variables end in "/"
+append-slash = $(1)$(if $(filter %/,$(1)),,/)
+override prefix          := $(call append-slash,$(prefix))
+override exec_prefix     := $(call append-slash,$(exec_prefix))
+override usr_prefix      := $(call append-slash,$(usr_prefix))
+override etc_prefix      := $(call append-slash,$(etc_prefix))
+override systemd_prefix  := $(call append-slash,$(systemd_prefix))
+
+unitdir		:= $(systemd_prefix)lib/systemd/system
+tmpfilesdir	:= $(systemd_prefix)lib/tmpfiles.d
+modulesloaddir	:= $(systemd_prefix)lib/modules-load.d
+libudevdir	:= $(systemd_prefix)lib/udev
 udevrulesdir	:= $(libudevdir)/rules.d
-bindir		:= $(exec_prefix)/sbin
-mandir		:= $(usr_prefix)/share/man
+bindir		:= $(exec_prefix)sbin
+mandir		:= $(usr_prefix)share/man
 LIB		:= $(if $(shell test -d /lib64 && echo 1),lib64,lib)
-syslibdir	:= $(prefix)/$(LIB)
-usrlibdir	:= $(usr_prefix)/$(LIB)
-includedir	:= $(usr_prefix)/include
+syslibdir	:= $(prefix)$(LIB)
+usrlibdir	:= $(usr_prefix)$(LIB)
+includedir	:= $(usr_prefix)include
 pkgconfdir	:= $(usrlibdir)/pkgconfig
-plugindir       := $(prefix)/$(LIB)/multipath
-configdir       := $(etc_prefix)/etc/multipath/conf.d
-configfile      := $(etc_prefix)/etc/multipath.conf
-statedir        := $(etc_prefix)/etc/multipath
+plugindir       := $(prefix)$(LIB)/multipath
+configdir       := $(etc_prefix)etc/multipath/conf.d
+configfile      := $(etc_prefix)etc/multipath.conf
+statedir        := $(etc_prefix)etc/multipath
 runtimedir      := $(if $(shell test -L /var/run -o ! -d /var/run && echo 1),/run,/var/run)
 devmapper_incdir := $(or $(shell $(PKG_CONFIG) --variable=includedir devmapper),/usr/include)
 libudev_incdir	:= $(or $(shell $(PKG_CONFIG) --variable=includedir libudev),/usr/include)
-- 
2.42.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

