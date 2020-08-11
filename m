Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id BB34A242236
	for <lists+dm-devel@lfdr.de>; Wed, 12 Aug 2020 00:00:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597183258;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=u3YlVikdd7ygMqxO5PKAg575FB0Y60TnE+VDp4BFuaM=;
	b=RLQ3nC4e9HLN/xYI7drQOhvc/WTf01LuSLep/wFj5hNYdE9nbWyiXSgYBgQg9DtKs3Yjsj
	giP04dqAOTW1s5XfmK3RymIko1UaJs/E7bAnOaLVXvz1EOlT3ShCGlRLIHUCk3dB+4VtmZ
	5vh3M+O0G8vKGS/rzpasQ0UAIDXhFk8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-VCLkuEmlNtmkg3EvgCMPMw-1; Tue, 11 Aug 2020 18:00:56 -0400
X-MC-Unique: VCLkuEmlNtmkg3EvgCMPMw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 081BD800479;
	Tue, 11 Aug 2020 22:00:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A68698BA27;
	Tue, 11 Aug 2020 22:00:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4FF02A554A;
	Tue, 11 Aug 2020 22:00:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07BLwnWx009100 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Aug 2020 17:58:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2DD071009880; Tue, 11 Aug 2020 21:58:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4513710016E8;
	Tue, 11 Aug 2020 21:58:47 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07BLwjNf015839; 
	Tue, 11 Aug 2020 16:58:45 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07BLwjGZ015838;
	Tue, 11 Aug 2020 16:58:45 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue, 11 Aug 2020 16:58:36 -0500
Message-Id: <1597183123-15797-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1597183123-15797-1-git-send-email-bmarzins@redhat.com>
References: <1597183123-15797-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 1/8] Makefile.inc: trim extra information from
	systemd version
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Some systemd versions print extra information in the
"pkg-config --modversion" output, which confuses make. Trim this
off.

Reviewed-by: Martin Wilck <mwilck@suse.com>
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 Makefile.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile.inc b/Makefile.inc
index e7256e3a..8ea3352d 100644
--- a/Makefile.inc
+++ b/Makefile.inc
@@ -37,7 +37,7 @@ endif
 
 ifndef SYSTEMD
 	ifeq ($(shell pkg-config --modversion libsystemd >/dev/null 2>&1 && echo 1), 1)
-		SYSTEMD = $(shell pkg-config --modversion libsystemd)
+		SYSTEMD = $(shell pkg-config --modversion libsystemd | awk '{print $$1}')
 	else
 		ifeq ($(shell systemctl --version >/dev/null 2>&1 && echo 1), 1)
 			SYSTEMD = $(shell systemctl --version 2> /dev/null | \
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

