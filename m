Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7940E79AA2E
	for <lists+dm-devel@lfdr.de>; Mon, 11 Sep 2023 18:39:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694450384;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yEHgkoO+OvIjhEk2USPc44d0XLLXuV32bIoWrF8qLdk=;
	b=aqhHbFlugtnEVGlxHptrg5x6CZQYjrSjZOw8Rnb/LE3Yr4njuzEmb6OvY3GDbgNXYQCt1R
	FpSJudXHxBoBlkm1qCChU7YvWDqe9kfY8h5FJQ/xQAdh1pFxlox0g5szRqeA8OmUxdohPu
	pj0tXiaRN1jJiAju7YBFbE/TuwCygT4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-h4pHtzh5PRijJPOdr9XpJA-1; Mon, 11 Sep 2023 12:39:30 -0400
X-MC-Unique: h4pHtzh5PRijJPOdr9XpJA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7841A101FABD;
	Mon, 11 Sep 2023 16:39:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CEC28215671F;
	Mon, 11 Sep 2023 16:39:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 817E819465BA;
	Mon, 11 Sep 2023 16:39:21 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AEBF71946A48
 for <dm-devel@listman.corp.redhat.com>; Mon, 11 Sep 2023 16:39:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9B98F2027046; Mon, 11 Sep 2023 16:39:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 938972027045
 for <dm-devel@redhat.com>; Mon, 11 Sep 2023 16:39:19 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7661C3C02B64
 for <dm-devel@redhat.com>; Mon, 11 Sep 2023 16:39:19 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-192-vMusTPKIMeWT3FY_uc6BIg-1; Mon,
 11 Sep 2023 12:39:16 -0400
X-MC-Unique: vMusTPKIMeWT3FY_uc6BIg-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 95C491F8A6;
 Mon, 11 Sep 2023 16:39:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5FB54139CC;
 Mon, 11 Sep 2023 16:39:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aKq+FbNC/2RzEAAAMHmgww
 (envelope-from <mwilck@suse.com>); Mon, 11 Sep 2023 16:39:15 +0000
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
 Benjamin Marzinski <bmarzins@redhat.com>
Date: Mon, 11 Sep 2023 18:38:13 +0200
Message-ID: <20230911163846.27197-5-mwilck@suse.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [dm-devel] [PATCH v2 04/37] libmultipath: never allocate an alias
 that's already taken
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
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>,
 David Bond <dbond@suse.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: suse.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

If the bindings file is changed in a way that multipathd can't handle
(e.g. by swapping the aliases of two maps), multipathd must not try
to re-use an alias that is already used by another map. Creating
or renaming a map with such an alias will fail. We already avoid
this for some cases, but not for all. Fix it.

Signed-off-by: Martin Wilck <mwilck@suse.com>
Cc: David Bond <dbond@suse.com>
---
 libmultipath/alias.c | 33 ++++++++++++++++++++++++---------
 tests/alias.c        |  2 +-
 2 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/libmultipath/alias.c b/libmultipath/alias.c
index 68f5d84..b5248f2 100644
--- a/libmultipath/alias.c
+++ b/libmultipath/alias.c
@@ -120,7 +120,7 @@ static bool alias_already_taken(const char *alias, const char *map_wwid)
 		if (dm_get_uuid(alias, wwid, sizeof(wwid)) == 0 &&
 		    strncmp(map_wwid, wwid, sizeof(wwid)) == 0)
 			return false;
-		condlog(3, "%s: alias '%s' already taken, but not in bindings file. reselecting alias",
+		condlog(3, "%s: alias '%s' already taken, reselecting alias",
 			map_wwid, alias);
 		return true;
 	}
@@ -359,32 +359,47 @@ char *get_user_friendly_alias(const char *wwid, const char *file, const char *al
 	rlookup_binding(f, buff, alias_old);
 
 	if (strlen(buff) > 0) {
-		/* if buff is our wwid, it's already
-		 * allocated correctly
-		 */
+		/* If buff is our wwid, it's already allocated correctly. */
 		if (strcmp(buff, wwid) == 0) {
 			alias = strdup(alias_old);
 			goto out;
+
 		} else {
 			condlog(0, "alias %s already bound to wwid %s, cannot reuse",
 				alias_old, buff);
-			goto new_alias;
+			goto new_alias;		     ;
 		}
 	}
 
-	id = lookup_binding(f, wwid, &alias, NULL, 0);
+	/*
+	 * Look for an existing alias in the bindings file.
+	 * Pass prefix = NULL, so lookup_binding() won't try to allocate a new id.
+	 */
+	lookup_binding(f, wwid, &alias, NULL, 0);
 	if (alias) {
-		condlog(3, "Use existing binding [%s] for WWID [%s]",
-			alias, wwid);
+		if (alias_already_taken(alias, wwid)) {
+			free(alias);
+			alias = NULL;
+		} else
+			condlog(3, "Use existing binding [%s] for WWID [%s]",
+				alias, wwid);
 		goto out;
 	}
 
-	/* allocate the existing alias in the bindings file */
+	/* alias_old is already taken by our WWID, update bindings file. */
 	id = scan_devname(alias_old, prefix);
 
 new_alias:
 	if (id <= 0) {
+		/*
+		 * no existing alias was provided, or allocating it
+		 * failed. Try a new one.
+		 */
 		id = lookup_binding(f, wwid, &alias, prefix, 1);
+		if (id == 0 && alias_already_taken(alias, wwid)) {
+			free(alias);
+			alias = NULL;
+		}
 		if (id <= 0)
 			goto out;
 		else
diff --git a/tests/alias.c b/tests/alias.c
index 3ca6c28..11f209e 100644
--- a/tests/alias.c
+++ b/tests/alias.c
@@ -398,7 +398,7 @@ static void mock_self_alias(const char *alias, const char *wwid)
 	will_return(__wrap_dm_get_uuid, wwid);
 }
 
-#define USED_STR(alias_str, wwid_str) wwid_str ": alias '" alias_str "' already taken, but not in bindings file. reselecting alias\n"
+#define USED_STR(alias_str, wwid_str) wwid_str ": alias '" alias_str "' already taken, reselecting alias\n"
 
 static void mock_failed_alias(const char *alias, char *msg)
 {
-- 
2.42.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

