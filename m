Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id AD66C1B111C
	for <lists+dm-devel@lfdr.de>; Mon, 20 Apr 2020 18:07:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587398821;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1fsT71epIAcUiQKXp1Q8h314VrlX0aND2ggDGs2qIUY=;
	b=PMGcq1xqSPFAqydEq+M3iSHn/XbVTJjf807Z/qcCaxoSWlDooUNcZWpVLeidnNRDBe90ZI
	37PWGcgkUKG2wvfP/bC/6eV4iifFhpjjPbI6N0JmYcf7KrR7xu6hTCxEds0fcSmaiva1v9
	pQ53GLuy8WpoAVYYlB2pwy6BNww9oe8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-Vjy2T0hlOeWDDjkpAzd-1g-1; Mon, 20 Apr 2020 12:06:36 -0400
X-MC-Unique: Vjy2T0hlOeWDDjkpAzd-1g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3325190680E;
	Mon, 20 Apr 2020 16:06:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EAD1627BD8;
	Mon, 20 Apr 2020 16:06:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E60FE1809567;
	Mon, 20 Apr 2020 16:06:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03KDlCeo025271 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Apr 2020 09:47:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EF9381004041; Mon, 20 Apr 2020 13:47:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB89610F1BEC
	for <dm-devel@redhat.com>; Mon, 20 Apr 2020 13:47:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C05791017E42
	for <dm-devel@redhat.com>; Mon, 20 Apr 2020 13:47:09 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-467-IZ8JhqxPMHmgWIRttXEOag-1; Mon, 20 Apr 2020 09:47:05 -0400
X-MC-Unique: IZ8JhqxPMHmgWIRttXEOag-1
Received: by mail-lj1-f194.google.com with SMTP id y4so9963525ljn.7;
	Mon, 20 Apr 2020 06:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5DBbt76W4m71Q/7AnQuK/Wi87RICmAD5+Tgf2efzGiw=;
	b=G24YuYTy4KBbg/qRaVaUbpnDddVSLVuoue5S1UCs6CeBMu6IqlXOVl9gd6f26Du7oW
	hD5Uj7RrPjLQGiP/fucPPzkgrpqw3nSKoyMOvdNSJcwbntlRQuhZHb6fl6gdh7Eq/2rQ
	DZhiO7vCWlMt0szpjXAZTNQzabcSPV7zZqwdZH3TAuQYY36jYglZCQR0fTlJB8+bo1hP
	gZllrezJ9jTtc5sYa6KMTGp2C1TzDet1scxk6HJWWKNPC1NlMKRQPVLmF65xW0QBbDkI
	1ewva/Tj4A0Kb40MqRaZx6uAJtcH3bNKdkYWlJ3bx/6Gpek00KwFBeR5T1l0/B7kG9/V
	fAow==
X-Gm-Message-State: AGi0PuY3sVZAGhCsUrz2Do3mfugYvWpHXNL+3MkDjUXTuV72AmJpM/8v
	hTwwnKIovUxpZW/TBD6tQL18xrAWeBA=
X-Google-Smtp-Source: APiQypKcmBE80WaH3NsIwlylWpzRtw8GpJrguQnG746v1spHtpyg76umqynu0lUdJDuvV+QmqmeYZQ==
X-Received: by 2002:a2e:920f:: with SMTP id k15mr8324756ljg.131.1587390422473; 
	Mon, 20 Apr 2020 06:47:02 -0700 (PDT)
Received: from lothlann.lan ([94.25.228.182])
	by smtp.gmail.com with ESMTPSA id j23sm953768ljh.60.2020.04.20.06.47.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Apr 2020 06:47:01 -0700 (PDT)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: dm-devel@redhat.com
Date: Mon, 20 Apr 2020 16:46:59 +0300
Message-Id: <20200420134659.1640089-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03KDlCeo025271
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 20 Apr 2020 12:05:34 -0400
Cc: Dmitry Baryshkov <dmitry_baryshkov@mentor.com>,
	Mike Snitzer <snitzer@redhat.com>, Alasdair Kergon <agk@redhat.com>
Subject: [dm-devel] [PATCH] dm-crypt: support using encrypted keys
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Dmitry Baryshkov <dmitry_baryshkov@mentor.com>

Allow one to use encrypted in addition to user and login key types for
device encryption.

Signed-off-by: Dmitry Baryshkov <dmitry_baryshkov@mentor.com>
---
 drivers/md/dm-crypt.c | 66 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 50 insertions(+), 16 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 3df90daba89e..7056ab54d7dd 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -34,7 +34,9 @@
 #include <crypto/aead.h>
 #include <crypto/authenc.h>
 #include <linux/rtnetlink.h> /* for struct rtattr and RTA macros only */
+#include <linux/key-type.h>
 #include <keys/user-type.h>
+#include <keys/encrypted-type.h>
 
 #include <linux/device-mapper.h>
 
@@ -2215,12 +2217,44 @@ static bool contains_whitespace(const char *str)
 	return false;
 }
 
+static int set_key_user(struct crypt_config *cc, struct key *key)
+{
+	const struct user_key_payload *ukp;
+
+	ukp = user_key_payload_locked(key);
+	if (!ukp)
+		return -EKEYREVOKED;
+
+	if (cc->key_size != ukp->datalen)
+		return -EINVAL;
+
+	memcpy(cc->key, ukp->data, cc->key_size);
+
+	return 0;
+}
+
+static int set_key_encrypted(struct crypt_config *cc, struct key *key)
+{
+	struct encrypted_key_payload *ekp = key->payload.data[0];
+
+	if (!ekp)
+		return -EKEYREVOKED;
+
+	if (cc->key_size != ekp->decrypted_datalen)
+		return -EINVAL;
+
+	memcpy(cc->key, ekp->decrypted_data, cc->key_size);
+
+	return 0;
+}
+
 static int crypt_set_keyring_key(struct crypt_config *cc, const char *key_string)
 {
 	char *new_key_string, *key_desc;
 	int ret;
+	struct key_type *type;
 	struct key *key;
-	const struct user_key_payload *ukp;
+	int (*set_key)(struct crypt_config *cc, struct key *key);
 
 	/*
 	 * Reject key_string with whitespace. dm core currently lacks code for
@@ -2236,15 +2270,24 @@ static int crypt_set_keyring_key(struct crypt_config *cc, const char *key_string
 	if (!key_desc || key_desc == key_string || !strlen(key_desc + 1))
 		return -EINVAL;
 
-	if (strncmp(key_string, "logon:", key_desc - key_string + 1) &&
-	    strncmp(key_string, "user:", key_desc - key_string + 1))
+	if (!strncmp(key_string, "logon:", key_desc - key_string + 1)) {
+		type = &key_type_logon;
+		set_key = &set_key_user;
+	} else if (!strncmp(key_string, "user:", key_desc - key_string + 1)) {
+		type = &key_type_user;
+		set_key = &set_key_user;
+	} else if (!strncmp(key_string, "encrypted:", key_desc - key_string + 1)) {
+		type = &key_type_encrypted;
+		set_key = set_key_encrypted;
+	} else {
 		return -EINVAL;
+	}
 
 	new_key_string = kstrdup(key_string, GFP_KERNEL);
 	if (!new_key_string)
 		return -ENOMEM;
 
-	key = request_key(key_string[0] == 'l' ? &key_type_logon : &key_type_user,
+	key = request_key(type,
 			  key_desc + 1, NULL);
 	if (IS_ERR(key)) {
 		kzfree(new_key_string);
@@ -2253,23 +2296,14 @@ static int crypt_set_keyring_key(struct crypt_config *cc, const char *key_string
 
 	down_read(&key->sem);
 
-	ukp = user_key_payload_locked(key);
-	if (!ukp) {
-		up_read(&key->sem);
-		key_put(key);
-		kzfree(new_key_string);
-		return -EKEYREVOKED;
-	}
-
-	if (cc->key_size != ukp->datalen) {
+	ret = set_key(cc, key);
+	if (ret < 0) {
 		up_read(&key->sem);
 		key_put(key);
 		kzfree(new_key_string);
-		return -EINVAL;
+		return ret;
 	}
 
-	memcpy(cc->key, ukp->data, cc->key_size);
-
 	up_read(&key->sem);
 	key_put(key);
 
-- 
2.25.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

