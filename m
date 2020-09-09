Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 05EEC263F4E
	for <lists+dm-devel@lfdr.de>; Thu, 10 Sep 2020 10:07:22 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-CAW-dQ6RM6uFZceFzDqd0g-1; Thu, 10 Sep 2020 04:07:19 -0400
X-MC-Unique: CAW-dQ6RM6uFZceFzDqd0g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A3511DE01;
	Thu, 10 Sep 2020 08:07:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17D6183587;
	Thu, 10 Sep 2020 08:07:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C68A2180C5A2;
	Thu, 10 Sep 2020 08:07:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 089NiesH011505 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 9 Sep 2020 19:44:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4DEE02166BA4; Wed,  9 Sep 2020 23:44:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 481282166BA2
	for <dm-devel@redhat.com>; Wed,  9 Sep 2020 23:44:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7006C101A540
	for <dm-devel@redhat.com>; Wed,  9 Sep 2020 23:44:37 +0000 (UTC)
Received: from mail-qv1-f74.google.com (mail-qv1-f74.google.com
	[209.85.219.74]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-408-6_i9sS9LPNezaqRrdCql_A-1; Wed, 09 Sep 2020 19:44:35 -0400
X-MC-Unique: 6_i9sS9LPNezaqRrdCql_A-1
Received: by mail-qv1-f74.google.com with SMTP id f21so2370525qve.9
	for <dm-devel@redhat.com>; Wed, 09 Sep 2020 16:44:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
	:references:subject:from:to:cc;
	bh=1OQRbnpVQqbSHeNIDm4Hm9mK1gT2gj5RYSqpBEjn4gM=;
	b=t21k8UsRZEuIFJVXftsROBJIa5vomV7QYvuVxiQsT/UOa2MyoPJtb/bF1YaIZrcZk1
	AWKjbcNu8a+LlJnjAbMayH3Mbg3+PCxCZlYYz1roePP2Ja1DxwtXDPW82dQa3JnyQcH7
	zTDunLMaxnKDCzBL5gQOBf0CRu3q+6Y8YhAi4jtfUjqIjkMSiJn9IbhZbClFrKc9JQUj
	MUwUPoUJUAdKQe6xKmYDjvICP0liKq2D+VobS9JWAfZ1kxeOtQjwjpDqK2Qpn6+RQ5WE
	H+vVYY4eLIbLddZ6z3v9PWJn22dtmOc1iNhlL6EdivpmaXu8XstC66T+PFGKVdRZPyjc
	PPWA==
X-Gm-Message-State: AOAM532HD6XHamzjRlQccYH4FoC7wfc1ZigmM2ICWzYPjwlPRUuU6oUy
	RBYyX6UipDWf6IdFh/n7kuNfhRJMI6w=
X-Google-Smtp-Source: ABdhPJzRLKGMJkhtGLLHYN+CRFtSzCzysN6IpaLbffgbJgz/w24BGG12zL9AWcZQDiOos9PZsag2+r5yVUI=
X-Received: from satyaprateek.c.googlers.com
	([fda3:e722:ac3:10:24:72f4:c0a8:2d8e])
	(user=satyat job=sendgmr) by 2002:ad4:5565:: with SMTP id
	w5mr6354094qvy.24.1599695074759; 
	Wed, 09 Sep 2020 16:44:34 -0700 (PDT)
Date: Wed,  9 Sep 2020 23:44:22 +0000
In-Reply-To: <20200909234422.76194-1-satyat@google.com>
Message-Id: <20200909234422.76194-4-satyat@google.com>
Mime-Version: 1.0
References: <20200909234422.76194-1-satyat@google.com>
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
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 10 Sep 2020 04:06:55 -0400
Cc: Jens Axboe <axboe@kernel.dk>, Satya Tangirala <satyat@google.com>,
	Mike Snitzer <snitzer@redhat.com>, Alasdair Kergon <agk@redhat.com>,
	Eric Biggers <ebiggers@google.com>
Subject: [dm-devel] [PATCH 3/3] dm: enable may_passthrough_inline_crypto on
	some targets
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.502
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Eric Biggers <ebiggers@google.com>

dm-linear and dm-flakey obviously can pass through inline crypto support.

dm-zero should declare that it passes through inline crypto support, since
any reads from dm-zero should return zeroes, and blk-crypto should not
attempt to decrypt data returned from dm-zero.

Signed-off-by: Eric Biggers <ebiggers@google.com>
Co-developed-by: Satya Tangirala <satyat@google.com>
Signed-off-by: Satya Tangirala <satyat@google.com>
---
 drivers/md/dm-flakey.c | 1 +
 drivers/md/dm-linear.c | 1 +
 drivers/md/dm-zero.c   | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/md/dm-flakey.c b/drivers/md/dm-flakey.c
index a2cc9e45cbba..655286dacc35 100644
--- a/drivers/md/dm-flakey.c
+++ b/drivers/md/dm-flakey.c
@@ -253,6 +253,7 @@ static int flakey_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	ti->num_discard_bios = 1;
 	ti->per_io_data_size = sizeof(struct per_bio_data);
 	ti->private = fc;
+	ti->may_passthrough_inline_crypto = true;
 	return 0;
 
 bad:
diff --git a/drivers/md/dm-linear.c b/drivers/md/dm-linear.c
index e1db43446327..6d81878e2ca8 100644
--- a/drivers/md/dm-linear.c
+++ b/drivers/md/dm-linear.c
@@ -62,6 +62,7 @@ static int linear_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	ti->num_secure_erase_bios = 1;
 	ti->num_write_same_bios = 1;
 	ti->num_write_zeroes_bios = 1;
+	ti->may_passthrough_inline_crypto = true;
 	ti->private = lc;
 	return 0;
 
diff --git a/drivers/md/dm-zero.c b/drivers/md/dm-zero.c
index b65ca8dcfbdc..07e02f3a9cd1 100644
--- a/drivers/md/dm-zero.c
+++ b/drivers/md/dm-zero.c
@@ -26,6 +26,7 @@ static int zero_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	 * Silently drop discards, avoiding -EOPNOTSUPP.
 	 */
 	ti->num_discard_bios = 1;
+	ti->may_passthrough_inline_crypto = true;
 
 	return 0;
 }
-- 
2.28.0.618.gf4bc123cb7-goog

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

