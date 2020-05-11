Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 55F421CE844
	for <lists+dm-devel@lfdr.de>; Tue, 12 May 2020 00:40:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589236833;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=A4uC/pYTtNNCZWVeT+qTWan2PjVZsc/w1tbMamUCaK0=;
	b=WI2OEtAMKAxTgg1OKoyZwLinejBYw/yQYvtvtEzXNIx1AU7tgHweqXfrPwF3W+NoWljLky
	6gKxUBja3HieNBhc1eKoIoPE7KZyoe1c0Kp0rTfse29hND/bBR5lx1s/5H/fxc5A8EXFSK
	Z6Mg6Ryuea7ZPD41NHJ6SRkPZPzbg/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-Wsl2YLBmPv6ZBIoEeV_EtA-1; Mon, 11 May 2020 18:40:30 -0400
X-MC-Unique: Wsl2YLBmPv6ZBIoEeV_EtA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8135F1009445;
	Mon, 11 May 2020 22:40:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A65061993;
	Mon, 11 May 2020 22:40:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1682A4E564;
	Mon, 11 May 2020 22:40:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04BMdx2m016071 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 18:40:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CF7612026E1C; Mon, 11 May 2020 22:39:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CBCA22026FFE
	for <dm-devel@redhat.com>; Mon, 11 May 2020 22:39:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B485D101A526
	for <dm-devel@redhat.com>; Mon, 11 May 2020 22:39:56 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-305-rxTfxQzyMSuw0GkK__K7wQ-1;
	Mon, 11 May 2020 18:39:53 -0400
X-MC-Unique: rxTfxQzyMSuw0GkK__K7wQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 1BDC8ADFF;
	Mon, 11 May 2020 22:39:55 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue, 12 May 2020 00:39:21 +0200
Message-Id: <20200511223931.18261-2-mwilck@suse.com>
In-Reply-To: <20200511223931.18261-1-mwilck@suse.com>
References: <20200511223931.18261-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04BMdx2m016071
X-loop: dm-devel@redhat.com
Cc: Christian Hesse <mail@eworm.de>, dm-devel@redhat.com,
	Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 01/11] multipath-tools: Makefile: more dependency
	fixes for parallel build
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Extend the late fixes from Christian.

Cc: Christian Hesse <mail@eworm.de>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index ba1d73ba..fec3b73b 100644
--- a/Makefile
+++ b/Makefile
@@ -28,8 +28,9 @@ all:	$(BUILDDIRS)
 $(BUILDDIRS):
 	$(MAKE) -C $@
 
-libmpathpersist multipath multipathd mpathpersist: libmultipath
-mpathpersist:  libmpathpersist
+libmultipath libdmmp: libmpathcmd
+libmpathpersist multipath multipathd: libmultipath
+mpathpersist multipathd:  libmpathpersist
 
 $(BUILDDIRS.clean):
 	$(MAKE) -C ${@:.clean=} clean
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

