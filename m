Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8F42902AC
	for <lists+dm-devel@lfdr.de>; Fri, 16 Oct 2020 12:20:18 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-ZFWJ2KMtP4OzzfAh-X_m8Q-1; Fri, 16 Oct 2020 06:20:15 -0400
X-MC-Unique: ZFWJ2KMtP4OzzfAh-X_m8Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA0E41006704;
	Fri, 16 Oct 2020 10:20:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3F5B6EF79;
	Fri, 16 Oct 2020 10:20:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 361EC180B658;
	Fri, 16 Oct 2020 10:20:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09FLklWU001477 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 15 Oct 2020 17:46:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 38B822011541; Thu, 15 Oct 2020 21:46:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33F742011540
	for <dm-devel@redhat.com>; Thu, 15 Oct 2020 21:46:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB771102F1E2
	for <dm-devel@redhat.com>; Thu, 15 Oct 2020 21:46:44 +0000 (UTC)
Received: from mail-qt1-f201.google.com (mail-qt1-f201.google.com
	[209.85.160.201]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-104-yfrVBDEdNRCKSZwUbtOIsw-1; Thu, 15 Oct 2020 17:46:42 -0400
X-MC-Unique: yfrVBDEdNRCKSZwUbtOIsw-1
Received: by mail-qt1-f201.google.com with SMTP id p2so153819qtw.16
	for <dm-devel@redhat.com>; Thu, 15 Oct 2020 14:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
	:references:subject:from:to:cc;
	bh=CuszbQJohiIvHkXMpAk7mXGLUK2ItD9Zlwxr1z+YlSA=;
	b=PJ69fBvTi14RrgTa+5UW12yCfwlrNXhonn91ha523Cr5kK0ol+hpFkMBz/kwjqIaPZ
	w9jd3gCEnBA6HLC90sBHqGd5Pc5c6/z3Z6Y1giDorN8WNPGsCJo60aq3lEnQcrzZpeYt
	OTdS6YHLKHwVRQ2rwbfUoc/lSojaOwtgylxiY/tXtQUXNb0sHp2zcRK2tNJAT67qDvrY
	wyDjl7dpq/91ETLL7bciDTXfWKs//z8SAEebiIQf0YHyq0SE8pg3Uujbp9eZTYoCp7i7
	4zx2SvZXVYjl8eiWWOzkbfuFhs+/MES8LgJmP2ImtSMV3y88j8pbTfA3JDbC9w95MS9c
	vA6g==
X-Gm-Message-State: AOAM532029YACENNAP+8JLJJegnFAOojfHGn+o3s9sTemxtSgYNSJ+MM
	UBAw2sXAyFh5a9qynMgeu1BKSqoJVpg=
X-Google-Smtp-Source: ABdhPJxDIXTV51KQvEl0aGhmJoIfbkr36Ss/aBbOvc7pJMXIifvVm6XNIb5m+VCXOc8ctnCHHV0RmeFKFEI=
X-Received: from satyaprateek.c.googlers.com
	([fda3:e722:ac3:10:24:72f4:c0a8:1092])
	(user=satyat job=sendgmr) by 2002:a0c:8246:: with SMTP id
	h64mr862689qva.54.1602798402108; 
	Thu, 15 Oct 2020 14:46:42 -0700 (PDT)
Date: Thu, 15 Oct 2020 21:46:30 +0000
In-Reply-To: <20201015214632.41951-1-satyat@google.com>
Message-Id: <20201015214632.41951-3-satyat@google.com>
Mime-Version: 1.0
References: <20201015214632.41951-1-satyat@google.com>
From: Satya Tangirala <satyat@google.com>
To: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	dm-devel@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 16 Oct 2020 06:18:44 -0400
Cc: Jens Axboe <axboe@kernel.dk>, Satya Tangirala <satyat@google.com>,
	Mike Snitzer <snitzer@redhat.com>, Alasdair Kergon <agk@redhat.com>,
	Eric Biggers <ebiggers@google.com>
Subject: [dm-devel] [PATCH v2 2/4] block: add private field to struct
	keyslot_manager
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a (void *) pointer to struct keyslot_manager that the owner of the
struct can use for any purpose it wants.

Right now, the struct keyslot_manager is expected to be embedded directly
into other structs (and the owner of the keyslot_manager would use
container_of() to access any other data the owner needs). However, this
might take up more space than is acceptable, and it would be better to be
able to add only a pointer to a struct keyslot_manager into other structs
rather than embed the entire struct directly. But container_of() can't be
used when only the pointer to the keyslot_manager is embded. The primary
motivation of this patch is to get around that issue.

Signed-off-by: Satya Tangirala <satyat@google.com>
---
 include/linux/keyslot-manager.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/keyslot-manager.h b/include/linux/keyslot-manager.h
index 323e15dd6fa7..37f1022b256f 100644
--- a/include/linux/keyslot-manager.h
+++ b/include/linux/keyslot-manager.h
@@ -59,6 +59,9 @@ struct blk_keyslot_manager {
 	/* Device for runtime power management (NULL if none) */
 	struct device *dev;
 
+	/* Private data for owner */
+	void *priv;
+
 	/* Here onwards are *private* fields for internal keyslot manager use */
 
 	unsigned int num_slots;
-- 
2.29.0.rc1.297.gfa9743e501-goog

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

