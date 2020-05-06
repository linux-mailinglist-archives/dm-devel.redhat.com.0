Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id BC2EC1C6A26
	for <lists+dm-devel@lfdr.de>; Wed,  6 May 2020 09:37:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588750629;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=A+aqjq8BIRG6FUxHC2NFqa4yPnLDG9AiLjSDKjNU7aw=;
	b=FUZkUD9Vm/XVQp1xP9o4SZHkrn7G8HTdxwqIm4gItTgHMYdluLwoc1f4C+cNXY9ahj6L0+
	PYGkEUEAnVhwsR+RmgMwGxCOMsuduSyKwIjRNEu8NLVwf6hRJaomC2wznpkmP8zKyLY1gF
	DnsaPlV9k2+q0VV4RIP13jamIdabEgk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-MO5g_ELRNSSZd6Ku4_L-nA-1; Wed, 06 May 2020 03:37:06 -0400
X-MC-Unique: MO5g_ELRNSSZd6Ku4_L-nA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91835464;
	Wed,  6 May 2020 07:37:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EAC95C1BD;
	Wed,  6 May 2020 07:36:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8CE404CAA0;
	Wed,  6 May 2020 07:36:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0467aau7007004 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 6 May 2020 03:36:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 92CAC2166BA2; Wed,  6 May 2020 07:36:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E9DD2166B27
	for <dm-devel@redhat.com>; Wed,  6 May 2020 07:36:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7432880CDAE
	for <dm-devel@redhat.com>; Wed,  6 May 2020 07:36:36 +0000 (UTC)
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [195.201.174.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-298-KHhTmQ9DNmCz9fQ0gDoGyA-1; Wed, 06 May 2020 03:36:33 -0400
X-MC-Unique: KHhTmQ9DNmCz9fQ0gDoGyA-1
Received: from leda.eworm.de (p54B7927E.dip0.t-ipconnect.de [84.183.146.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits)
	server-digest SHA256) (No client certificate requested)
	by mx.mylinuxtime.de (Postfix) with ESMTPSA id D0F69100938;
	Wed,  6 May 2020 09:36:30 +0200 (CEST)
Received: by leda.eworm.de (Postfix, from userid 1000)
	id 83008120301; Wed,  6 May 2020 09:36:00 +0200 (CEST)
From: Christian Hesse <list@eworm.de>
To: dm-devel@redhat.com
Date: Wed,  6 May 2020 09:35:48 +0200
Message-Id: <20200506073548.41756-2-list@eworm.de>
In-Reply-To: <20200506073548.41756-1-list@eworm.de>
References: <20200506073548.41756-1-list@eworm.de>
MIME-Version: 1.0
X-Spam-Status: No, score=2.22
X-Spamd-Bar: ++
X-Rspamd-Server: mx
X-Spam-Level: **
X-Stat-Signature: 78i8ydni64qt9axqnpiygcibsuk6pa4z
X-Rspamd-Queue-Id: D0F69100938
X-Spamd-Result: default: False [2.22 / 15.00]; ARC_NA(0.00)[];
	GENERIC_REPUTATION(0.00)[-0.39562970825397];
	FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
	R_MISSING_CHARSET(2.50)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_GOOD(-0.10)[text/plain]; BROKEN_CONTENT_TYPE(1.50)[];
	NEURAL_HAM_LONG(-2.83)[-0.945]; DKIM_SIGNED(0.00)[];
	NEURAL_HAM_SHORT(-0.15)[-0.148]; RCPT_COUNT_TWO(0.00)[2];
	MID_CONTAINS_FROM(1.00)[];
	FORGED_SENDER(0.30)[list@eworm.de,eworm@leda.eworm.de];
	RCVD_COUNT_ZERO(0.00)[0]; MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:3320, ipnet:84.128.0.0/10, country:DE];
	FROM_NEQ_ENVFROM(0.00)[list@eworm.de,eworm@leda.eworm.de]
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0467aau7007004
X-loop: dm-devel@redhat.com
Cc: Christian Hesse <mail@eworm.de>
Subject: [dm-devel] [PATCH 2/2] libmultipath: create libdir on install
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Christian Hesse <mail@eworm.de>

Without this installation fails with:

install: target '$DESTDIR/usr/lib/multipath' is not a directory
Signed-off-by: Christian Hesse <mail@eworm.de>
---
 libmultipath/prioritizers/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/libmultipath/prioritizers/Makefile b/libmultipath/prioritizers/Makefile
index 9d0fe03c..11da5be2 100644
--- a/libmultipath/prioritizers/Makefile
+++ b/libmultipath/prioritizers/Makefile
@@ -35,6 +35,7 @@ libprio%.so: %.o
 	$(CC) $(LDFLAGS) $(SHARED_FLAGS) -o $@ $^
 
 install: $(LIBS)
+	$(INSTALL_PROGRAM) -d $(DESTDIR)$(libdir)
 	$(INSTALL_PROGRAM) -m 755 libprio*.so $(DESTDIR)$(libdir)
 
 uninstall:


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

