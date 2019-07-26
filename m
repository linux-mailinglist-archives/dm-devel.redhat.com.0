Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C8377208
	for <lists+dm-devel@lfdr.de>; Fri, 26 Jul 2019 21:20:26 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6DABA81120;
	Fri, 26 Jul 2019 19:20:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9BE6620CE;
	Fri, 26 Jul 2019 19:20:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 92D2C1800207;
	Fri, 26 Jul 2019 19:19:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6QJJf4T016743 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 26 Jul 2019 15:19:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9E7231001B23; Fri, 26 Jul 2019 19:19:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 989A21001B04
	for <dm-devel@redhat.com>; Fri, 26 Jul 2019 19:19:39 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8C50F307D84D
	for <dm-devel@redhat.com>; Fri, 26 Jul 2019 19:19:36 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id y4so55516098wrm.2
	for <dm-devel@redhat.com>; Fri, 26 Jul 2019 12:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=72xQmTObQWeIpZieXTHw3xj7h9Bx6v4iVqt1XHkJtsU=;
	b=D9mlijqdUuz+HpWurDWAJ2esIqtPc44TcV3LRkWyQ0nDvlGf2l/m1qeXvhirBncPlj
	wb+ugqSxXI5BNejMbJCoENJECfv4kyT5LS1hPyBSZwqNXuqEvqtSj3A6ofBxXRBVsk12
	5Sle3Ab7X05RWTVd4SaNhFlgjwiDH9aWardnfCYejvikw4Y8nbbvDLWuXjV/v2W6q+Hl
	80htdM2zmR6ZiCOS0wte6dIIDUrs341DyP+lA5mzoWuS5BVJH9iscA6nosrq5mg5gJEQ
	Ebg950zQjrCMdtoSE2FkWoIM5mWCCMSJMoK2tshF9k8I2OSVvxNV9zENmj7E4PSm7LMn
	WdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=72xQmTObQWeIpZieXTHw3xj7h9Bx6v4iVqt1XHkJtsU=;
	b=Ua6u/YjHm6phawTWkhg5mCuezDbUQmr4RlzPkxgRGoSm5YETQ5ZK2ALTnOVWciKXTp
	wWT1UdaXyK615V7Nyo8LrvfYquLcCq71YKhJOa7AyJ9exYecEMQq8G7wHpTscB5pDBc1
	WHHerlVZu9I+c51QquDsx6OmNJNQMUmXAgEV+OCV4ql8r8/XwfBdmiVx6Lg9r1GR7BCV
	taBWdHl6oBh/5DJqRXotCaxeUlNZpIHUqRz5XEFSzwG9ZqPI+mJiAfeGGCMuEePw5Drp
	kieXE+igOjAZrJL71JQ2FSxcXRppOJSxOpKp++lVMePxtBQmg9btXfPgxihTBzvaQtDd
	ijlw==
X-Gm-Message-State: APjAAAVgLQmcEADibEV50HL8t/SjKyD6vxosJ/pWHM57GeyMcwYJnHoZ
	ElGGYcnXszCpQRxRn1odwqTxQFc=
X-Google-Smtp-Source: APXvYqx6mGs74Xk17m1+LlFWAcwyQbMVrIlQYqHmN+t6Swf5J6mohbKsKTEG6AZimUj5JbE0KKUpaA==
X-Received: by 2002:adf:b64b:: with SMTP id
	i11mr102281219wre.205.1564168774829; 
	Fri, 26 Jul 2019 12:19:34 -0700 (PDT)
Received: from localhost (118.red-88-12-24.staticip.rima-tde.net.
	[88.12.24.118]) by smtp.gmail.com with ESMTPSA id
	p63sm5386138wmp.45.2019.07.26.12.19.33
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 26 Jul 2019 12:19:33 -0700 (PDT)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: 
Date: Fri, 26 Jul 2019 21:19:28 +0200
Message-Id: <20190726191930.23630-1-xose.vazquez@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Fri, 26 Jul 2019 19:19:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Fri, 26 Jul 2019 19:19:36 +0000 (UTC) for IP:'209.85.221.49'
	DOMAIN:'mail-wr1-f49.google.com' HELO:'mail-wr1-f49.google.com'
	FROM:'xose.vazquez@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.099  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.49 mail-wr1-f49.google.com 209.85.221.49
	mail-wr1-f49.google.com <xose.vazquez@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: DM-DEVEL ML <dm-devel@redhat.com>,
	Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: [dm-devel] [PATCH] multipath-tools: delete outdated comment at
	multipath/multipath.conf.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Fri, 26 Jul 2019 19:20:24 +0000 (UTC)

Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
Cc: DM-DEVEL ML <dm-devel@redhat.com>
Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
---
 multipath/multipath.conf.5 | 2 --
 1 file changed, 2 deletions(-)

diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
index f7d21b4..880947f 100644
--- a/multipath/multipath.conf.5
+++ b/multipath/multipath.conf.5
@@ -4,8 +4,6 @@
 .\" groff -z -wall -b -e -t multipath/multipath.conf.5
 .\" man --warnings -E UTF-8 -l -Tutf8 -Z multipath/multipath.conf.5 >/dev/null
 .\"
-.\" TODO: Look for XXX and ???
-.\"
 .\" ----------------------------------------------------------------------------
 .
 .TH MULTIPATH.CONF 5 2018-05-21 Linux
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
