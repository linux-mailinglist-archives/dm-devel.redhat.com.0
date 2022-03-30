Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E62E84ECDC4
	for <lists+dm-devel@lfdr.de>; Wed, 30 Mar 2022 22:15:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648671321;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zm5TUgU5VWRuJdrIds55W5WLhWyTVnM+dftW+lOrUeI=;
	b=Jcst/znwU1cLk7s2W5pomyPM2iDM0rdK4Admczb3UDehffJOk1NcwUfSfSDEfoNHZfBwLv
	65JCHHQ+qL89oKeL4pIKTPqYI79cp6nfgAuJZr7MEkj9San5d4kDQbY1yG3CViChtWeOb3
	GIXil3PvhX4md+itasZXfMW8UcmlZWg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-Vr4fO6skNPC610Jbhgd-ug-1; Wed, 30 Mar 2022 16:15:18 -0400
X-MC-Unique: Vr4fO6skNPC610Jbhgd-ug-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27E1D101A54C;
	Wed, 30 Mar 2022 20:15:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A336240D0160;
	Wed, 30 Mar 2022 20:15:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B145A194034C;
	Wed, 30 Mar 2022 20:14:59 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 60DB219451F3
 for <dm-devel@listman.corp.redhat.com>; Wed, 30 Mar 2022 20:14:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 13D6140147D; Wed, 30 Mar 2022 20:14:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F2978401E48;
 Wed, 30 Mar 2022 20:14:57 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 22UKEuYe001145;
 Wed, 30 Mar 2022 15:14:56 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 22UKEuKH001144;
 Wed, 30 Mar 2022 15:14:56 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 30 Mar 2022 15:14:56 -0500
Message-Id: <1648671296-1107-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: [dm-devel] [PATCH v2] multipath: return failure on an invalid
 remove command
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
Cc: device-mapper development <dm-devel@redhat.com>,
 Martin Wilck <Martin.Wilck@suse.com>
MIME-Version: 1.0
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When "multipath -f" is run on a device that doesn't exist or isn't a
multipath device, the command will not remove any device, but it will
still return success.  Multiple functions rely on _dm_flush_map()
returning success when called with name that doesn't match any
multipath device. So before calling _dm_flush_map(), call dm_is_mpath(),
to check if the device exists and is a multipath device, and return
failure if it's not.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---

changes since v1:
	- more meaningful error message. Suggested by mwilck

 multipath/main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/multipath/main.c b/multipath/main.c
index d09f62db..01eba9ae 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -1060,6 +1060,11 @@ main (int argc, char *argv[])
 	if (retries < 0)
 		retries = conf->remove_retries;
 	if (cmd == CMD_FLUSH_ONE) {
+		if (dm_is_mpath(dev) != 1) {
+			condlog(0, "%s is not a multipath device", dev);
+			r = RTVL_FAIL;
+			goto out;
+		}
 		r = dm_suspend_and_flush_map(dev, retries) ?
 		    RTVL_FAIL : RTVL_OK;
 		goto out;
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

